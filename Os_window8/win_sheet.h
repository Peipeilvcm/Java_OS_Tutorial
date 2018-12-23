//*图层和图层管理器的一些数据结构和函数实现
#ifndef _WIN_SHEET_H
#define _WIN_SHEET_H 
#include "mem_util.h"
struct SHEET //图层的数据结构
{
    unsigned char *buf; //图层的形状
    int bxsize,bysize,vx0,vy0,col_inv,height,flags; ///bxsize, bysize 是窗口的长和高，vx0, vy0是窗口移动后的左上角坐标，col_inv 用来表示窗口中不显示的部分，height表示图层的高度，flags用来表示图层状态。
};

#define MAX_SHEETS 256 //窗口图层的数量

struct SHTCTL  //图层控制器
{
    unsigned char *vram;
    int xsize,ysize,top;//窗口的大小和界面上显示的图层的数量
    struct SHEET *sheets[MAX_SHEETS]; //用来修改图层的数组指针
    struct SHEET sheets0[MAX_SHEETS];//图层数组
};

#define SIZE_OF_SHEET 32   //图层的大小
#define SZIE_OF_SHTCTL 9232 //图层控制器的大小

struct SHEET *sheet_alloc(struct SHTCTL *ctl); //分配一个窗口
struct SHTCTL *shtctl_init(struct MEMMAN *memman,unsigned char *vram,int xsize,int ysize);//初始化图层管理器

void sheet_setbuf(struct SHEET *sht,unsigned char *buf,int xsize,int ysize,int col_inv);//给图层要显示的数据

void sheet_updown(struct SHTCTL *ctl,struct SHEET *sht,int height);//*让图层向上或者向下移动

int sheet_refresh(struct SHTCTL *ctl); //刷新所有图层并绘制

void sheet_slide(struct SHTCTL *ctl,struct SHEET *sht,int vx0,int vy0);//窗口移动后重新绘制这个窗口
#endif