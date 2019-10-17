#include <iostream>
#include <string>
#include <vector>
#include <iterator>
#include <algorithm>

using namespace std;

//https://blog.csdn.net/qq_37969433/article/details/82947411
//next[j]就是子串第j个元素前j-1个元素首尾重合部分个数加1
void get_next(vector<int> &next, string &T);
void get_nextval(vector<int> &next, string &T);
int KMP(string &S, string &T, vector<int> &next);

int main()
{
    string S("abcabffcefgf"); //主串
    string T("abc");          //子串
    vector<int> next(T.size() + 1);
    get_nextval(next, T);
    for (auto num : next)
        cout << num << endl;
    int result;
    result = KMP(S, T, next);
    cout << "res:" << result << endl;
    return 0;
}

void get_next(vector<int> &next, string &T)
{
    int i = 1;          //前缀
    int j = 0;          //后缀
    next[0] = T.size(); //存储子串长度
    next[1] = 0;
    while (i <= next[0])
    {
        if (j == 0 || T[j - 1] == T[i - 1]) //注意此处，字符串第一个字母从0开始 故此处需要减1
            next[++i] = ++j;
        else
            j = next[j];
    }
}

void get_nextval(vector<int> &next, string &T)
{
    int i = 1;          //前缀
    int j = 0;          //后缀
    next[0] = T.size(); //存储子串长度
    next[1] = 0;
    while (i <= next[0])
    {
        if (j == 0 || T[j - 1] == T[i - 1]) //注意此处，字符串第一个字母从0开始 故此处需要减1
        {
            ++i;
            ++j;
            if (T[i] != T[j])
                next[i] = j;    //如果当前字符与前缀字符不同，则next[i]为位置j的值
            else
                next[i] = next[j];  //如果与前缀字符相同，可直接使用前缀字符的next值
        }
        else
            j = next[j];
    }
}

//返回子串T在主串S之后的位置，或者返回-1
int KMP(string &S, string &T, vector<int> &next)
{
    int i = 0; //S下标
    int j = 0; //T下标
    while (i <= S.size() && j <= T.size())
    {
        if (j == 0 || S[i - 1] == T[j - 1])
        {
            ++i;
            ++j;
        }
        else
        {
            j = next[j];
        }
    }
    if (j > T.size())
        return (i - j);
    else
        return -1;
}