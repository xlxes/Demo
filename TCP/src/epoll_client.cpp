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
#include <signal.h>
#include <csignal>

using namespace std;

const int servercom = 8080;              //设置服务器监听端口
const char serverip[] = "192.168.124.3"; //设置服务器IP

bool flag = true; //开关变量

void *threadsend(void *fd);
void *threadrecv(void *fd);

int main(int argc, const char *argv[]) //传入1个参数，为客户端端口
{
    //argv[0]指向输入的程序路径及名称。
    if (argc < 2)
    {
        cout << "请输入端口号" << endl;
        exit(0);
    }
    int clientcom = atoi(argv[1]);  //获取端口
    struct sockaddr_in serveraddr;
    struct sockaddr_in clientaddr;
    socklen_t serverlen = sizeof(serveraddr);
    socklen_t clientlen = sizeof(clientaddr);
    int clientfd; //连接文件描述符
    //填写服务器信息
    memset(&serveraddr, 0, serverlen);
    serveraddr.sin_family = AF_INET;                  //IPV4协议
    serveraddr.sin_port = htons(servercom);           //设置服务器端口
    serveraddr.sin_addr.s_addr = inet_addr(serverip); //服务器IP

    //填写客户端（本机）信息
    memset(&clientaddr, 0, clientlen);
    clientaddr.sin_family = AF_INET;        //IPV4协议
    clientaddr.sin_port = htons(clientcom); //设置端口
    clientaddr.sin_addr.s_addr = htonl(INADDR_ANY);

    //创建文件描述符
    if ((clientfd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
    {
        cout << "creat fd fail" << endl;
        return -1;
    }
    //绑定fd与客户端(本机)地址信息
    if ((bind(clientfd, (sockaddr *)&clientaddr, clientlen)) < 0)
    {
        cout << "bind fd fail" << endl;
        return -1;
    }
    //与服务器连接
    if (connect(clientfd, (struct sockaddr *)&serveraddr, serverlen) < 0)
    {
        cout << "connect fail" << endl;
        return -1;
    }
    //连接成功，创建两个线程进行读写操作
    pthread_t t_send;
    pthread_t t_recv;

    pthread_create(&t_send, NULL, threadsend, &clientfd);
    pthread_create(&t_recv, NULL, threadrecv, &clientfd);
    //阻塞，等待返回
    pthread_join(t_send, NULL);
    pthread_join(t_recv, NULL);
    close(clientfd);
    return 0;
}

//写线程
void *threadsend(void *fd)
{
    char sendbuff[100];
    int sendfd = *((int *)fd); //强制转换为int
    while (flag)
    {
        cout << "Input" << endl;
        cin.getline(sendbuff, 100); //等待写入
        if ((send(sendfd, sendbuff, 100, 0)) < 0)
        {
            cout << "send fail" << endl;
        }
    }
    return 0;
}

//读线程
void *threadrecv(void *fd)
{
    int count;
    int recvfd = *((int *)fd); //强制转换为int
    char recvbuff[100];
    while (flag)
    {
        count = 0;
        count = recv(recvfd, recvbuff, 100, 0);
        if (count < 0)
        {
            cout << "recv fail" << endl;
        }
        else if (count > 0)
        {
            recvbuff[count] = 0; //在接收信息后面加终止符
            cout << "recv :" << recvbuff << endl;
        }
    }
    return 0;
}