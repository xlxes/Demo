#include <iostream>
#include <string>
#include <vector>
#include <iterator>
#include <algorithm>

using namespace std;

void bubblesort(vector<int> &a);
void Insertsort(vector<int> &a);
void Selectsort(vector<int> &a);
void Shellsort(vector<int> &a);

int Partition(vector<int> &a, int low, int high);
void Quicksort(vector<int> &a, int low, int high);
void Quicksort2(vector<int> &a, int low, int high);

void merge(vector<int> &a, int low, int mid, int high);
void mergesort(vector<int> &a, int low, int high);
void mergesort2(vector<int> &a);




int main()
{
    cout << "输入数字：" << endl;
    vector<float> a;
    float temp;
    char c;
    while ((c = getchar()) != '\n') //循环读入
    {
        if (c != ',') //这里可以改为空格或者，输入
        {
            ungetc(c, stdin); //将该字符退回到字符流中
            cin >> temp;
            a.push_back(temp);
        }
    }

    //bubblesort(a);
    //Selectsort(a);
    //Insertsort(a);
    //Shellsort(a);
    //Quicksort(a, 0, a.size() - 1);
    //Quicksort2(a, 0, a.size() - 1);
    //mergesort(a, 0, a.size() - 1);
    //mergesort2(a);
}

//冒泡排序
void bubblesort(vector<int> &a)
{
    int temp;
    bool exchange = false;
    for (int i = 0; i < a.size(); i++)
    {
        exchange = false;
        for (int j = a.size() - 1; j > i; j--)
        {
            if (a[j] < a[j - 1]) //从小到大排序
            {
                swap(a[j], a[j - 1]);
                exchange = true;
            }
        }
        if (exchange == false)
            break;
    }
}

//选择排序 从小到大
void Selectsort(vector<int> &a)
{
    int min;
    for (int i = 0; i < a.size() - 1; i++)
    {
        min = i; //设定最小的为i
        for (int j = i + 1; j < a.size(); j++)
        {
            if (a[min] > a[j]) //从小到大排序
                min = j;
        }
        if (min != i)
            swap(a[min], a[i]);
    }
}

//插入排序 从小到大
void Insertsort(vector<int> &a)
{
    int i, j, temp;
    for (i = 1; i < a.size(); i++)
    {
        temp = a[i]; //从该数开始依次判断是否要插入
        j = i - 1;
        while (j >= 0 && a[j] > temp) //从小到大排序，大于0保证不会溢出 a[j]>temp代表需要进行插入
        {
            a[j + 1] = a[j];
            j--;
        }
        a[j + 1] = temp; //将temp插入合适位置
    }
}

//希尔排序 从小到大
void Shellsort(vector<int> &a)
{
    int temp, j;
    int l = a.size();
    while (l > 1)
    {
        l = l / 3 + 1;                        //增量序列
        for (int i = l; i < a.size(); i += l) //该部分即为增量为l的插入排序
        {

            temp = a[i];
            j = i - l;
            while (j >= 0 && a[j] > temp) //从小到大排序
            {
                a[j + l] = a[j];
                j -= l;
            }
            a[j + l] = temp;
        }
    }
}

int Partition(vector<int> &a, int low, int high)
{
    int temp;
    temp = a[low]; //此处可以使用三数取中 或者九数取中法;
    while (low < high)
    {
        while (low < high && a[high] >= temp) //从小到大 与下一段顺序不可调换
            high--;
        swap(a[low], a[high]);
        while (low < high && a[low] <= temp) //从小到大
            low++;
        swap(a[high], a[low]);
    }
    //a[low] = temp; //中轴位置赋值temp  如果采用交换的方式上述的方式可以不变 但是采用赋值的方式 必须先判断a[high]后判断a[low]
    return low;
}

//快速排序
void Quicksort(vector<int> &a, int low, int high)
{
    int pivot;
    // if (low < high)     //小数值时候的排序可使用插入排序
    // {
    //     pivot = Partition(a, low, high);
    //     Quicksort(a, low, pivot - 1);
    //     Quicksort(a, pivot + 1, high);
    // }

    while (low < high)
    {
        pivot = Partition(a, low, high);
        Quicksort(a, low, pivot - 1);
        low = pivot + 1; //尾递归优化
    }

    //可以根据high-low来优化小数组时候的排序方法
    //当个数小于常数值时候采用插入排序往往性能更好
}

//快排的非递归实现
void Quicksort2(vector<int> &a, int low, int high)
{
    int sort_stack[2000]; //假设递归不超过1000层
    //栈中保存下次需要排序的左右位置
    int top = 0;
    sort_stack[top++] = 0;
    sort_stack[top] = a.size() - 1;
    while (top > 0)
    {
        int high = sort_stack[top];
        top--;
        int low = sort_stack[top];
        top--;                                //top始终指向栈顶
        int middle = Partition(a, low, high); //获得中值
        if (middle + 1 < high)                //右数组个数未到1
        {
            sort_stack[++top] = middle + 1;
            sort_stack[++top] = high;
        }
        if (low < middle - 1) //左数组个数未到1
        {
            sort_stack[++top] = low;
            sort_stack[++top] = middle - 1;
        }
    }
}

//a[low]到a[mid]有序 a[mid+1]到a[high]有序
//该函数将这两个有序数组重新组合至有序
//使用临时数组存放左右子数组，再排序填入a数组中
void merge(vector<int> &arr, int l, int mid, int r)
{
    vector<int> help(r - l + 1); //辅助数组
    int i = 0;
    int lIndex = l;
    int rIndex = mid + 1;
    while (lIndex <= mid && rIndex <= r)
    {
        if (arr[lIndex] < arr[rIndex]) //从小到大排序
            help[i++] = arr[lIndex++];
        else
            help[i++] = arr[rIndex++];
    }
    //左边和右边肯定有一边到头了，不可能同时，因为每次只移动一边
    while (lIndex <= mid)
    {
        help[i++] = arr[lIndex++];
    }
    while (rIndex <= r)
    {
        help[i++] = arr[rIndex++];
    }
    //将排好序的辅助数组赋值给原始数组，不需要返回值
    for (i = 0; i < r - l + 1; i++)
    {
        arr[l + i] = help[i];
    }
}

void mergesort(vector<int> &a, int low, int high)
{
    if (low < high)
    {
        int mid = (high + low) / 2;
        mergesort(a, low, mid);
        mergesort(a, mid + 1, high);
        merge(a, low, mid, high);
    }
}

//非递归实现
//主要思想 按照1\2\4\8的间隔，将数组按照该间隔大小依次组合起来
void mergesort2(vector<int> &a)
{
    if (a.empty())
        return;
    int size = 1;
    while (size < a.size())
    {
        for (int begin = 0; begin < a.size(); begin += 2 * size) //begin为归并时第一个子序列的起始下标
        {
            int mid = begin + size - 1;
            int end = min(begin + 2 * size - 1, (int)a.size() - 1);
            merge(a, begin, mid, end);
        }
        size = 2 * size; //按照1\2\4\8\16的顺序变动，子序列的个数扩大一倍
    }
}

