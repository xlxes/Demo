#include <iostream>
#include <string>
#include <vector>
#include <iterator>
#include <algorithm>
 
using namespace std;
 
//http://www.ruanyifeng.com/blog/2013/05/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm.html
//next[j]就是子串第j个元素前j-1个元素首尾重合部分个数加1
void get_next(vector<int> &next, string &T);
void get_nextval(vector<int> &next, string &T);
int KMP(string &S, string &T, vector<int> &next);
 
int main()
{
	string S("asdfghabcdabababaaabacdejklqwertyuiop"); //主串
	string T("ababaaaba");          //子串
	vector<int> next(T.size());	//建立与子串长度相等的next
	get_nextval(next, T);
	for (auto num : next)
		cout << num; 
	cout << endl;
	int result;
	result = KMP(S, T, next);
	cout << "res:" << result << endl;
	return 0;
}
 
 
///实际上每求一个next值
//不匹配需要循环两遍甚至多遍 直至求到正确的j值或者j==-1
//匹配只要循环一遍
void get_next(vector<int> &next, string &T)
{
	int i = 0;          //后缀的最后一个字符
	int j = -1;          //前缀最后一个字符
	auto size = T.size(); //存储子串长度
	next[0] = -1;	//表示初始
	while (i < size-1)
	{
		if (j == -1 || T[i] == T[j])	//前后匹配 或者 回到初始开始
		{
			next[++i] = ++j;	//初始化进过这里j会为0 导致下一次为T[i]与T[0]比较
		}
		else j = next[j];
	}
}
 
void get_nextval(vector<int> &next, string &T)
{
	int i = 0;          //后缀的最后一个字符
	int j = -1;          //前缀最后一个字符
	auto size = T.size(); //存储子串长度
	next[0] = -1;
	while (i < size-1)
	{
		if (j == -1 || T[j] == T[i])	//比较的是j与i 得到的是next[i+1]的值
		{
			if (T[++i] != T[++j])
				next[i] = j;		//如果当前字符与前缀字符不同，即j=-1进入的，则next[++i]为位置++j的值0
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
	int s_size = S.size();
	int t_size = T.size();
	while (i < s_size && j < t_size)
	{
		if (j == -1 || S[i] == T[j])
		{
			++i;
			++j;
		}
		else
			j = next[j];
	}
	if (j == T.size())
		return (i - j);
	else
		return -1;
}