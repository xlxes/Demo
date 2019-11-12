#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <iostream>
#include <signal.h>

#define PORT 5002 //监听端口

using namespace std;

const char IP_server[] = "202.38.214.51"; //设置服务器地址

void sig_pipe(int sign)
{
    cout << "catch a sigpipe signal" << endl;
}

void process_conn_client(int s)
{
    ssize_t size = 0;
    char buffer_read[1024];
    char buffer_send[1024];
    while (1)
    {
        memset(buffer_send, '\0', sizeof(buffer_send)); //清空发送缓存区
        memset(buffer_read, '\0', sizeof(buffer_read)); //清空读取缓存区
        cin >> buffer_send;                             //输入字符串
        size = strlen(buffer_send);
        cout << "send msg:" << size << " bytes" << endl;
        if (size > 0)
        {
            write(s, buffer_send, strlen(buffer_send) + 1); //发送到服务器 此处+1是为了加入'\0'表示字符串
            size = read(s, buffer_read, 1024);              //从服务器读取数据
            cout << buffer_read << endl;
        }
    }
}

int main()
{
    int s;
    struct sockaddr_in server_addr;
    /*建立客户端的套接字*/
    s = socket(AF_INET, SOCK_STREAM, 0);
    if (s < 0)
    {
        cout << "socket error" << endl;
        return -1;
    }
    /*设置服务器地址*/
    bzero(&server_addr, sizeof(server_addr)); //清零
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(PORT);              //htons用于规范大小端的字节存储顺序
    server_addr.sin_addr.s_addr = htons(INADDR_ANY); //本地地址 INADDR_ANY就是指定地址为0.0.0.0的地址，表示不确定地址或所有地址
    /*设置服务器的IP地址*/
    inet_pton(AF_INET, IP_server, &server_addr.sin_addr);
    /*连接到指定服务器，并与套接字连接*/
    connect(s, (struct sockaddr *)&server_addr, sizeof(struct sockaddr));
    signal(SIGPIPE, sig_pipe); //设立SIGPIPE信号，当服务器关闭时，调用回调函数
    process_conn_client(s);
    close(s);
    return 0;
}
