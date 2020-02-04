#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <iostream>

using namespace std;

const int MAX_LEN = 4096;   //缓存区长度
const int servercom = 8080; //服务器端口

int main()
{
    int listenfd;
    struct sockaddr_in servaddr; //服务器监听信息
    struct sockaddr_in clieaddr; //获取客户端地址信息
    socklen_t serverlen = sizeof(servaddr);
    socklen_t clienlen = sizeof(clieaddr);

    char buff[MAX_LEN];
    int recv_count = 0;

    //建立监听文件描述符
    if ((listenfd = socket(AF_INET, SOCK_DGRAM, 0)) == -1)
    {
        cout << "creat fd error!" << endl;
        return -1;
    }

    //填入服务器通信地址信息
    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_addr.s_addr = htonl(INADDR_ANY); //地址为任意本机地址
    servaddr.sin_port = htons(servercom);

    //将地址信息与描述符绑定
    if (bind(listenfd, (struct sockaddr *)&servaddr, serverlen) < 0)
    {
        cout << "bind error!" << endl;
        return -1;
    }

    //必要信息输出
    cout << "server init successed!" << endl;
    cout << "port:" << ntohs(servaddr.sin_port)
         << "  ip:" << inet_ntoa(servaddr.sin_addr) << endl;
    cout << "wait for connect!" << endl;
    while (1)
    {
        //等待从clieaddr地址接收数据，监听数据端口为servaddr，同时把客户端信息放在clieaddr中
        recv_count = recvfrom(listenfd, buff, MAX_LEN, 0, (struct sockaddr *)&clieaddr, &clienlen);
        if (recv_count == -1)
        {
            cout << "receive data error!" << endl;
            return -1;
        }
        buff[recv_count] = '\0';                          //在收到的数据后添加结束符号
        cout << "recv msg from client: " << buff << endl; //输出接收的字符
        //将原数据发给客户端clieaddr
        sendto(listenfd, buff, sizeof(buff), 0, (struct sockaddr *)&clieaddr, clienlen);
        //显示客户端的地址和服务端的地址
        cout << "clien port:" << ntohs(clieaddr.sin_port)
             << "  ip:" << inet_ntoa(clieaddr.sin_addr) << endl;
        cout << "server port:" << ntohs(servaddr.sin_port)
             << "  ip:" << inet_ntoa(servaddr.sin_addr) << endl;
    }
    close(listenfd);
    return 0;
}