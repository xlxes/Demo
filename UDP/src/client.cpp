#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <iostream>
#include <unistd.h>

using namespace std;

const int MAX_LEN = 4096;                //缓存区长度
const char serverip[] = "192.168.124.2"; //设置服务器地址 此处为本机地址
const int servercom = 8080;              //设置服务器监听端口
const int localcom = 8081;               //设置本机端口

int main()
{
    int fd;                                    //通信描述符
    int count;                                 //接收字节数
    char recvbuff[MAX_LEN], sendbuff[MAX_LEN]; //定义接收缓存区和发送缓存区
    struct sockaddr_in localaddr;
    struct sockaddr_in serveraddr;

    socklen_t locallen = sizeof(localaddr);
    socklen_t serverlen = sizeof(serveraddr);

    //建立UDP的通信文件描述符
    if ((fd = socket(AF_INET, SOCK_DGRAM, 0)) < 0)
    {
        cout << "creat fd error" << endl;
        return -1;
    }

    //填写服务器地址信息
    memset(&serveraddr, 0, sizeof(serveraddr));
    serveraddr.sin_family = AF_INET;
    serveraddr.sin_port = htons(servercom); //此处转换为网络字节序
    //填入服务器的IP并转换为网络字节序
    if (inet_pton(AF_INET, serverip, &serveraddr.sin_addr) <= 0)
    {
        cout << "transf  serverip error!" << endl;
        return -1;
    }

    //设定本客户端的地址信息
    memset(&localaddr, 0, sizeof(localaddr));
    localaddr.sin_family = AF_INET;
    localaddr.sin_port = htons(localcom);          //此处转换为网络字节序
    localaddr.sin_addr.s_addr = htonl(INADDR_ANY); //设置本地IP

    //绑定通信描述符和本地地址端口
    if ((bind(fd, (struct sockaddr *)&localaddr, locallen)) < 0)
    {
        cout << "bind fail" << endl;
        return -1;
    }

    cout << "client init successed" << endl;
    cout << "port:" << ntohs(localaddr.sin_port)
         << "  ip:" << inet_ntoa(localaddr.sin_addr) << endl;

    while (1)
    {
        cout << "input:" << endl;
        memset(sendbuff, 0, sizeof(sendbuff)); //清零
        cin.getline(sendbuff, MAX_LEN);        //等待写入
        //向服务器发送数据 从localaddr发到serveraddr
        if (sendto(fd, sendbuff, sizeof(sendbuff), 0, (struct sockaddr *)&serveraddr, serverlen) < 0)
        {
            cout << "send fail!" << endl;
            return -1;
        }
        //从服务器接受消息
        count = recvfrom(fd, recvbuff, sizeof(recvbuff), 0, (struct sockaddr *)&serveraddr, &serverlen);
        if (count == -1)
        {
            cout << "receive fail" << endl;
            return -1;
        }
        else
            cout << "receive message: " << recvbuff << endl; //显示接收的字符
        cout << "clien port:" << ntohs(localaddr.sin_port)
             << "  ip:" << inet_ntoa(localaddr.sin_addr) << endl;
        cout << "server port:" << ntohs(serveraddr.sin_port)
             << "  ip:" << inet_ntoa(serveraddr.sin_addr) << endl;
    }
    close(fd);
    return 0;
}
