#include "win_sheet.h"
#include "mem_util.h"

struct SHTCTL *shtctl_init(struct MEMMAN *memman,unsigned char *vram,int xsize,int ysize)
{
    struct SHTCTL *ctl;
    int i;
    ctl = (struct SHTCTL *)memman_allock_4k(memman,SZIE_OF_SHTCTL);//分配一个4K大小内存返回其首地址给图层控制器
    if(ctl == 0)
    {
        return 0; //申请内存失败
    }

    ctl->vram = vram;
    ctl->xsize = xsize;
    ctl->ysize = ysize;
    ctl->top = -1;
    for(i=0;i<MAX_SHEETS;i++)
    {
        ctl->sheets0[i].flags = 0; //给所有图层的标志位置0表示现在没有在使用的图层
    }

    return ctl;


}

#define SHEET_USE 1 //图层正在被使用的标志位

struct SHEET *sheet_alloc(struct SHTCTL *ctl)
{
    struct SHEET *sht;
    int i;
    for(i=0;i<MAX_SHEETS;i++)
    {
        if(ctl->sheets0[i].flags == 0)
        {
            sht = &ctl->sheets0[i]; //有可用的图层，分配给图层的数据结构
            ctl->sheets[i] = sht; //指针变量赋值，把分配好的图层放回图层控制器中
            sht->flags = SHEET_USE;
            sht->height = -1; //窗口最小化
            return sht; //返回这个图层
        }
    }

    //没找到可用分配的图层
    return 0;
}

//设置图层对应的像素
void sheet_setbuf(struct SHEET *sht,unsigned char *buf,int xsize,int ysize,int col_inv)
{
    sht->buf = buf;  //设置显示形状
    sht->bxsize = xsize; 
    sht->bysize = ysize; //设置显示位置
    sht->col_inv = col_inv; //不显示形状
    return;
}

//*图层的上下移动
void sheet_updown(struct SHTCTL *ctl,struct SHEET *sht,int height)
{
    int h,old = sht->height;//当前要改变的图层的高度
    if(height > ctl->top+1) //如果要改变高度大于最高的图层的高度
    {
        height = ctl->top + 1; //把当前最高的高度设置为要改变的高度
    }

    if(height < -1)  //要改变的高度<-1
    {
        height = -1; //就设置为-1
    }

    sht->height = height; //设置该图层的高度（最顶端或者最小化）

    if(old > height)   //*要把图层向下移动
    {
        if(height >= 0)  // 不是最小化
        {
            for(h=old;h>height;h--) //原始图层的高度比要改变的高度要高，h递减到和height一样
            {
                ctl->sheets[h] = ctl->sheets[h-1]; //把要改变的高度以上的图层位置都移动上去一格
                ctl->sheets[h]->height = h;   //在要改变的高度那里设置新图层的高度
            }
            ctl->sheets[height] = sht; //把图层的信息给新改变的图层
        }
        else  //如果是要窗口最小化
        {
            if(ctl->top > old) //如果窗口不是在最上面
            {
                for(h=old;h<ctl->top;h++)
                {
                    ctl->sheets[h] = ctl->sheets[h+1]; //图层向上移动到顶
                    ctl->sheets[h]->height = h; //相当于删除图层数组中的这个图层
                }
            }
            ctl->top--;
        }

        sheet_refresh(ctl); //重新绘制图层  
    }
    else if(old < height) //*图层向上移动
    {
        if(old >=0 ) //原始窗口不在最底层
        {
            for(h=old;h<height;h++)
            {
                ctl->sheets[h] = ctl->sheets[h+1];//图层不断向上移动
                ctl->sheets[h]->height = h;
            }
            ctl->sheets[height] = sht;
        }
        else //原始图层是最小化
        {
            for(h = ctl->top;h>=height;h--) //从最顶的图层开始递减
            {
                ctl->sheets[h+1] = ctl->sheets[h];//设定位置以上的图层向上移动留出设定的位置给新图层
                ctl->sheets[h+1]->height = h+1;
            }
            ctl->sheets[height] = sht;
            ctl->top++; //桌面显示的最大图层数+1
        }

        sheet_refresh(ctl);
    }

}

//刷新图层
int sheet_refresh(struct SHTCTL *ctl)
{
    int h,bx,by,vx,vy;
    unsigned char *buf,c,*vram = ctl->vram;
    struct SHEET *sht;
    for(h=0;h<=ctl->top;h++) //遍历图层数组，按顺序绘制图层
    {
        sht = ctl->sheets[h]; //输入新绘制的图层信息
        buf = sht->buf;
        for(by=0;by<sht->bysize;by++)
        {
            vy = sht->vy0 + by;//窗口的左上角坐标高度+窗口的高度
            for(bx=0;bx<sht->bxsize;bx++) 
            {
                vx = sht->vx0 + bx;//窗口的宽度绘制
                c = buf[by * sht->bxsize + bx];//*遍历这个二维数组
                if(c!=sht->col_inv)
                {
                    vram[vy * ctl->xsize + vx] = c;
                }
            }

        }
    }
    return 0;
}

//图层的移动
void sheet_slide(struct SHTCTL *ctl,struct SHEET *sht,int vx0,int vy0)
{
    sht->vx0 = vx0;
    sht->vy0 = vy0;
    if(sht->height >= 0)
    {
        sheet_refresh(ctl);
    }
}