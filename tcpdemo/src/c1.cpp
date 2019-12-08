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
#define MAXLINE 100;
void *threadsend(void *vargp);
void *threadrecv(void *vargp);

int main()
{

        //设置本机客户端地址
        int *clientfdp;
        clientfdp = (int *)malloc(sizeof(int));
        *clientfdp = socket(AF_INET, SOCK_STREAM, 0);

        //设置服务器地址
        struct sockaddr_in serveraddr;
        bzero((char *)&serveraddr, sizeof(serveraddr));
        serveraddr.sin_family = AF_INET;
        serveraddr.sin_port = htons(PORT);
        serveraddr.sin_addr.s_addr = inet_addr("127.0.0.1");

        //使用客户端套接字与服务端进行连接
        if (connect(*clientfdp, (struct sockaddr *)&serveraddr, sizeof(serveraddr)) < 0)
        {
                printf("connect error\n");
                exit(1);
        }
        pthread_t tid1, tid2;
        printf("connected\n");

        //主程序循环控制两个线程
        //两个线程分别负责数据的接收
        while (1)
        {
                pthread_create(&tid1, NULL, threadsend, clientfdp);
                pthread_create(&tid2, NULL, threadrecv, clientfdp);
        }
        return EXIT_SUCCESS;
}
void *threadsend(void *vargp)
{
        int connfd = *((int *)vargp);
        int idata;
        char temp[100];
        while (1)
        {
                fgets(temp, 100, stdin);
                send(connfd, temp, 100, 0);
                printf("client send OK\n");
        }
        printf("client send\n");
        return NULL;
}


void *threadrecv(void *vargp)
{
        char temp[100];
        int connfd = *((int *)vargp);
        while (1)
        {
                int idata = 0;
                idata = recv(connfd, temp, 100, 0);
                if (idata > 0)
                {
                        printf("server :\n%s\n", temp);
                }
        }
        return NULL;
}
