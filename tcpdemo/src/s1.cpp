#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <netdb.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <arpa/inet.h>
#include <pthread.h>

#define PORT 5002
void *thread(void *fd);
void *threadsend(void *fd);
void *threadrecv(void *fd);

int main()
{
    //建立监听套接字
    int listenfd = socket(AF_INET, SOCK_STREAM, 0);     
    if (listenfd < 0)
    {
        perror("socket");
        exit(1);
    }    
    //设置服务器本机地址
    struct sockaddr_in serveraddr;      
    bzero((char *)&serveraddr, sizeof(serveraddr));
    serveraddr.sin_family = AF_INET;
    serveraddr.sin_addr.s_addr = htonl(INADDR_ANY);
    serveraddr.sin_port = htons(PORT);  //端口号15636
    //绑定监听套接字与服务器地址
    if (bind(listenfd, (struct sockaddr *)&serveraddr, sizeof(serveraddr)) < 0)
    {
        perror("connect");  
        exit(1);
    }
    //设置监听队列1024
    if (listen(listenfd, 1024) < 0)
    {
        perror("listen error");
        exit(1);
    }
    //其他变量初始化
    struct sockaddr_in clientaddr;
    int *connfdp;
    socklen_t clientlen = sizeof(clientaddr);
    //主程序
    //循环建立accept连接，同时将连接描述符传入子线程
    while (1)
    {
        connfdp = (int *)malloc(sizeof(int));
        *connfdp = accept(listenfd, (struct sockaddr *)&clientaddr, &clientlen);
        pthread_t tid;      //子线程的线程标识符
        printf("Accepted!\n");
        pthread_create(&tid, NULL, thread, connfdp);
    }
    EXIT_SUCCESS;
}

//该线程传入连接套接字随后创建两个子线程负责该连接的收发
void *thread(void *fd)
{
    pthread_t tid1, tid2;
    int connfd = *((int *)fd);
    int idata;
    char temp[100];
    pthread_create(&tid1, NULL, threadsend, fd);
    pthread_create(&tid2, NULL, threadrecv, fd);
    return NULL;
}
void *threadsend(void *fd)
{
    int connfd = *((int *)fd);
    int idata;
    char temp[100];
    while (1)
    {
        //从标准输入流中读取100个字符到temp
        fgets(temp, 100, stdin);
        send(connfd, temp, 100, 0);
        printf("server send OK\n");
    }
    return NULL;
}


void *threadrecv(void *fd)
{
    char temp[100];
    int connfd = *((int *)fd);
    while (1)
    {
        int idata = 0;
        //tcp可以不需要客户端的地址端口，直接使用文件描述付和recv直接进行数据接收
        idata = recv(connfd, temp, 100, 0);
        if (idata > 0)
        {
            printf("client :\n%s\n", temp);
        }
    }
    return NULL;
}