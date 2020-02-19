#ifndef _STRING_SPLIT_H
#define _STRING_SPLIT_H

#include <string>
#include <vector>

using std::string;
using std::vector;

class StringSplit
{
private:
    StringSplit() = delete;
    ~StringSplit() = delete;
    StringSplit(const StringSplit &rhs) = delete;
    StringSplit &operator=(const StringSplit &rhs) = delete;

public:
    static void Split(const string &str, vector<string> &v, const char *delimiter = "|");
};

#endif
