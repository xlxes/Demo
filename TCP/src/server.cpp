#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <iostream>
#include <vector>
#include <thread>
#include <unistd.h>
#include <netdb.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <arpa/inet.h>
#include <pthread.h>

using namespace std;

const int servercom = 8080; //设置服务器监听端口

void *threadcreat(void *fd);
void *threadrecv(void *fd);
void *threadsend(void *fd);

int main()
{
    struct sockaddr_in serveraddr;
    struct sockaddr_in clientaddr;
    socklen_t serverlen = sizeof(serveraddr);
    socklen_t clientlen = sizeof(clientaddr);
    int listenfd;
    vector<int> connectfd(10, -1); //连接符
    int connectnumber = 0;

    //填写服务器信息
    memset(&serveraddr, 0, serverlen);
    serveraddr.sin_family = AF_INET;                //IPV4协议
    serveraddr.sin_port = htons(servercom);         //设置端口
    serveraddr.sin_addr.s_addr = htonl(INADDR_ANY); //设置任意本机IP
    //创建文件描述符
    if ((listenfd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
    {
        cout << "creat fd fail" << endl;
        return -1;
    }
    //绑定fd与地址信息
    if ((bind(listenfd, (sockaddr *)&serveraddr, serverlen)) < 0)
    {
        cout << "bind fd fail" << endl;
        return -1;
    }
    //设置监听队列
    if (listen(listenfd, 1024) < 0)
    {
        cout << "listen fd fail" << endl;
        return -1;
    }
    cout << "server init ok" << endl;
    while (1)
    {
        //每来一个连接请求都会进行一次连接,客户端信息存放在clientaddr中
        if ((connectfd[connectnumber] = accept(listenfd, (struct sockaddr *)&clientaddr, &clientlen)) < 0)
        {
            cout << "connect error!" << endl;
            return -1;
        }
        pthread_t tid; //生成子线程标识符号
        pthread_create(&tid, NULL, threadcreat, &connectfd[connectnumber]);
        connectnumber++;
        cout << "client num:" << connectnumber << endl;
    }
    return 0;
}

//发送线程
void *threadsend(void *fd)
{
    int sendfd = *((int *)fd);
    char temp[100];
    while (1)
    {
        memset(temp, 0, sizeof(temp));
        cout << "Input" << endl;
        cin.getline(temp, 100); //等待写入
        if ((send(sendfd, temp, 100, 0)) < 0)
        {
            cout << "send fail" << endl;
        }
    }
    close(sendfd);
    return 0;
}

//接收线程
void *threadrecv(void *fd)
{
    int recvfd = *((int *)fd);
    int count;
    char temp[100];
    while (1)
    {
        count = 0;
        count = recv(recvfd, temp, 100, 0);
        if (count < 0)
        {
            cout << "recv fail" << endl;
        }
        else if (count == 0)
        {
            cout << "client close" << endl;
            break;
        }
        else if (count > 0)
        {
            temp[count] = 0; //在接收信息后面加终止符
            cout << "recv :" << temp << endl;
        }
    }
    close(recvfd);
    return 0;
}

void *threadcreat(void *fd)
{
    pthread_t t_send, t_recv;
    pthread_create(&t_send, NULL, threadsend, fd);
    pthread_create(&t_recv, NULL, threadrecv, fd);
    return 0;
}