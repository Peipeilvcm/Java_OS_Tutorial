// 头文件mem_util.h,定义内存管理模块相关的数值，变量和接口
#define MEMMAN_FREES 4096

// 可用内存的起始地址和大小
struct FREEINFO
{
    unsigned int addr, size;
};

// 内存管理器
struct MEMMAN
{
    // frees表示当前内存对应FREEINFO有多少个
    // maxfrees 最多容纳多少个可用内存片FREEINFO
    // lostsize释放后无法重新加入管理器的内存块的放弃数
    // losts是记录碎片数量
    int frees, maxfrees, lostsize, losts;
    struct FREEINFO free[MEMMAN_FREES];
};

// 初始化内存管理器结构体
void memman_init(struct MEMMAN *man);

// 计算一个内存管理区存储着多少可用的内存
unsigned int memman_total(struct MEMMAN *man);

// 指定的内存管理器对象中获取可用内存
unsigned int memman_alloc(struct MEMMAN *man, unsigned int size);

// 释放不再需要的内存片
int memman_free(struct MEMMAN *man, unsigned int addr, unsigned int size);
