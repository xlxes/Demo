#include <iostream>
#include <vector>

using namespace std;

//求下界函数
//如果存在target则返回第一个target
//如果不存在则返回第一个大于target的数字下标
int search(vector<int> &num, int target)
{
    int l = 0;
    int r = num.size() - 1;
    int mid;
    while (l < r)
    {
        mid = l + (r - l) / 2;  //向下取中位数
        if (num[mid] < target)
            l = mid + 1;
        else
            r = mid;
    }
    return num[l] == target ? l : -1; //修改此处即可
}

//求上界，反向
int search2(vector<int> &num, int target)
{
    int l = 0;
    int r = num.size() - 1;
    int mid;
    while (l < r)
    {
        mid = r - (r - l) / 2;  //向上取中位数
        if (num[mid] > target)
            r = mid-1;
        else
            l = mid;
    }
    return num[l] == target ? l : -1; //修改此处即可
}

int main()
{
    vector<int> a = {1, 2, 2, 2, 4, 5, 6, 7, 8};
    cout << "vector is:" << endl;
    for (auto s : a)
        cout << s << " ";
    while (1)
    {
        int target;
        cout << endl
             << "input target:";
        cin >> target;
        int index = search2(a, target);
        cout << "find " << target << " index is:" << index << endl;
    }
    return 0;
}
