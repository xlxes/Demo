#include <iostream>
#include <string>
#include <vector>

using namespace std;

void bubblesort(vector<int> &a);
void Insertsort(vector<int> &a);

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

    //bubblesort(a);        //冒泡排序
    Insertsort(a);

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

//插入排序 从小到大
void Insertsort(vector<int> &a)
{
    int i, j, temp;
    for (i = 1; i < a.size(); i++)
    {
        temp = a[i];    //从该数开始依次判断是否要插入
        j = i - 1;      
        while (j >= 0 && a[j] > temp)   //大于0保证不会溢出 a[j]>temp代表需要进行插入
        {
            a[j + 1] = a[j];
            j--;
        }
        a[j + 1] = temp;    //将temp插入合适位置
    }
}