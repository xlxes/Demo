#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <iostream>

#define PORT 5002 //监听端口
#define BACKLOG 2 //队列长度

using namespace std;

void process_conn_server(int s)
{
    ssize_t size = 0;
    char buffer[1024];
    while (1)
    {
        size = read(s, buffer, 1024);
        if (size == 0)
            return;
        cout << buffer << endl;
        cout <<"receive: " << size << "bytes" << endl;
        cout <<"sizeof buffer: "<< sizeof(buffer) <<endl;
        write(s,buffer,strlen(buffer)+1);   //发回给客户端
    }
}

int main()
{
    int ss, sc; //ss为服务器socket描述符 sc为客户端描述符
    struct sockaddr_in server_addr;
    struct sockaddr_in client_addr;
    int err;   //返回值
    pid_t pid; //分叉进行的ID

    /*建立流式套接字*/
    ss = socket(AF_INET, SOCK_STREAM, 0);
    if (ss < 0)
    {
        cout << "socket error!" << endl;
        return -1;
    }
    /*设置服务器地址*/
    bzero(&server_addr, sizeof(server_addr)); //清零
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(PORT);              //htons用于规范大小端的字节存储顺序
    server_addr.sin_addr.s_addr = htons(INADDR_ANY); //本地地址 INADDR_ANY就是指定地址为0.0.0.0的地址，表>示不确定地址或所有地址
    /*绑定地址结构到套接字描述符*/
    err = bind(ss, (struct sockaddr *)&server_addr, sizeof(server_addr));
    if (err < 0)
    {
        cout << "bind error" << endl;
        return -1;
    }
    /*设置监听队列*/
    err = listen(ss, BACKLOG);
    if (err < 0)
    {
        cout << "listen error" << endl;
        return -1;
    }

    while (1)
    {
        socklen_t addrlen = sizeof(struct sockaddr);
        /*接收客户端的连接*/
        sc = accept(ss, (struct sockaddr *)&client_addr, &addrlen);
        if (sc < 0)
        {
            continue;
        }
        /*建立一个新的进程处理到来的连接*/
        pid = fork();
        if (pid == 0)
        {
            close(ss); //子进程中关闭服务器的监听
            process_conn_server(sc);
        }
        else
            close(sc); //父进程中关闭客户端的连接
    }
}

