#include <iostream>
#include <string>
#include <vector>

using namespace std;

void bubblesort(vector<int> &a);
void Insertsort(vector<int> &a);
void Selectsort(vector<int> &a);
void Shellsort(vector<int> &a);
int Partition(vector<int> &a, int low, int high);
void Quicksort(vector<int> &a, int low, int high);

int main()
{
    cout << "输入数字：" << endl;
    vector<int> a;
    int temp;
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
    //Insertsort(a);
    //Selectsort(a);
    //Shellsort(a);
    Quicksort(a, 0, a.size() - 1);

    for (int j = 0; j < a.size(); j++)
    {
        cout << "a[" << j << "]:" << a[j] << endl;
    }
    return 0;
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
            if (a[j] > a[j - 1]) //从小到大排序
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
            if (a[min] > a[j])
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
        while (j >= 0 && a[j] > temp) //大于0保证不会溢出 a[j]>temp代表需要进行插入
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
        l = l / 3 + 1;                     //增量序列
        for (int i = l; i < a.size(); i++) //该部分即为增量为l的插入排序
        {

            temp = a[i];
            j = i - l;
            while (j >= 0 && a[j] > temp)
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
    temp = a[low]; //此处可以使用三数取中 或者九数取中法
    while (low < high)
    {
        while (low < high && a[high] >= temp)
            high--;
        a[low] = a[high];
        while (low < high && a[low] <= temp)
            low++;
        a[high] = a[low];
    }
    a[low] = temp; //中轴位置赋值temp
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
        low = pivot + 1;        //尾递归优化
    }
}