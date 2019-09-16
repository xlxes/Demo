function varargout = rm(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rm_OpeningFcn, ...
                   'gui_OutputFcn',  @rm_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
% 不可修改！

% 界面启动执行函数
function rm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% Choose default command line output for rm
set(handles.s_para,'Enable','Off');
%状态文本显示
set(handles.Islink,'String','连接状态 : Off');  
set(handles.Ismove,'String','移动状态 : Off');       
%默认IP
set(handles.ip_ros,'String','192.168.0.103');  
set(handles.ip_mat,'String','192.168.0.114');
%初始参数为蜿蜒步态
set(handles.para_A,'String',1);
set(handles.para_K,'String',2.3);
set(handles.para_R,'String',0);
%定义全局变量
global sk_a;       %步态参数                               
global sk_k;
global sk_r;
sk_a = 1;        %初始为蜿蜒步态参数
sk_k = 2.3;
sk_r = 0;
global Islink;      %连接标志位
global Ismove;      %仿真标志位
Islink = false;
Ismove = false;
handles.output = hObject;       %刷新句柄
guidata(hObject, handles);

% 界面退出时执行函数，可忽略
function varargout = rm_OutputFcn(hObject, eventdata, handles) 
rosshutdown;
varargout{1} = handles.output;
% ip_ros可编辑文本框创建函数，可忽略
function ip_ros_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% ip_mat可编辑文本框创建函数，可忽略 
function ip_mat_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% ip_ros可编辑文本框回调函数，可忽略
function ip_ros_Callback(hObject, eventdata, handles)
% ip_mat可编辑文本框回调函数，可忽略
function ip_mat_Callback(hObject, eventdata, handles)


% link按钮回调函数
function link_Callback(hObject, eventdata, handles)
global Islink;
ip_ros = get(handles.ip_ros,'String');     %提取拼接IP
ip_ros = strcat('http://',ip_ros,':11311');
ip_mat = get(handles.ip_mat,'String');
if Islink == false
    set(handles.Islink,'String','连接状态 : On');
    setenv('ROS_MASTER_URI',ip_ros);       %连接ROS
    setenv('ROS_IP',ip_mat);
    rosinit;
    set(handles.link,'String',"断开");      %连接文本框变为断开
    Islink = true;
else
    rosshutdown;                               
    set(handles.Islink,'String','连接状态 : Off');  
    Islink= false;
    set(handles.link,'String',"连接");
end

% AKR可变文本框创建，可忽略
function para_A_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function para_K_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function para_R_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% AKR输入文本框回调，可忽略
function para_A_Callback(hObject, eventdata, handles)
function para_K_Callback(hObject, eventdata, handles)
function para_R_Callback(hObject, eventdata, handles)
% 步态选择菜单初始函数
function gait_chose_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% 发送参数回调函数
function s_para_Callback(hObject, eventdata, handles)
global sk_a;                                   
global sk_k;
global sk_r;
global Islink;
global Ismove;
if Islink == true
    %获取步态参数  
    sk_a=str2double(get(handles.para_A,'String'));  
    sk_k=str2double(get(handles.para_K,'String'));
    sk_r=str2double(get(handles.para_R,'String'));
    %获取步态
    gait = get(handles.gait_chose,'Value');
    %发送参数与步态
    para_pub = rospublisher('/para',rostype.geometry_msgs_Twist);
    pause(0.5);
    para_msg = rosmessage(para_pub);
    para_msg.Angular.X = gait;
    if Ismove == false
        para_msg.Angular.Y = 0;
    else
        para_msg.Angular.Y = 1;
    end
    para_msg.Linear.X = sk_a;
    para_msg.Linear.Y = sk_k;
    para_msg.Linear.Z = sk_r;
    send(para_pub,para_msg);
else
   helpdlg('请先连接ros','提示');
end

% 步态选择菜单回调函数
function gait_chose_Callback(hObject, eventdata, handles)
global sk_a;                                   
global sk_k;
global sk_r;
%获取步态标志
%1为蜿蜒 2U型 3为攀爬
gait = get(handles.gait_chose,'Value');     
%步态改变时，改变相应初始参数
switch gait                  
    case 1
        set(handles.para_A,'String',1);
        set(handles.para_K,'String',2.3);
        set(handles.para_R,'String',0);
        set(handles.para_K,'Enable','on');
        set(handles.Kup,'Enable','on');
        set(handles.Kdown,'Enable','on');
    case 2
        set(handles.para_A,'String',1.2);
        set(handles.para_K,'String',1.57);
        set(handles.para_K,'Enable','off');
        set(handles.Kup,'Enable','off');
        set(handles.Kdown,'Enable','off');
        set(handles.para_R,'String',0);
    case 3
        set(handles.para_A,'String',1.2);
        set(handles.para_K,'String',1.57);
        set(handles.para_R,'String',0);
        set(handles.para_K,'Enable','on');
        set(handles.Kup,'Enable','on');
        set(handles.Kdown,'Enable','on');
end
sk_a=str2double(get(handles.para_A,'String'));  
sk_k=str2double(get(handles.para_K,'String'));
sk_r=str2double(get(handles.para_R,'String'));

% 开始/暂停按钮回调函数
function start_Callback(hObject, eventdata, handles)
global sk_a;                                   
global sk_k;
global sk_r;
global Ismove;
%定义节点
para_pub = rospublisher('/para',rostype.geometry_msgs_Twist);
pause(0.5);
para_msg = rosmessage(para_pub);
if Ismove == false
    Ismove = true;
    para_msg.Angular.Y = 1;
    set(handles.Ismove,'String','移动状态 : On');
    set(handles.start,'String','暂停仿真');
    set(handles.s_para,'Enable','On');
else
    Ismove = false;
    para_msg.Angular.Y = 0;
    set(handles.Ismove,'String','移动状态 : Off');
    set(handles.start,'String','开始仿真');
    set(handles.s_para,'Enable','Off');
end
gait = get(handles.gait_chose,'Value');
para_msg.Angular.X = gait;
para_msg.Linear.X = sk_a;
para_msg.Linear.Y = sk_k;
para_msg.Linear.Z = sk_r;
send(para_pub,para_msg);
    

%参数微调
%Aup
function Aup_Callback(hObject, eventdata, handles)
global sk_a;   
global sk_k;
global sk_r;
para_pub = rospublisher('/para',rostype.geometry_msgs_Twist);
pause(0.5);
para_msg = rosmessage(para_pub);
sk_a = sk_a+0.05;
set(handles.para_A,'String',num2str(sk_a));
gait = get(handles.gait_chose,'Value');
para_msg.Angular.X = gait;
para_msg.Linear.X = sk_a;
para_msg.Linear.Y = sk_k;
para_msg.Linear.Z = sk_r;
para_msg.Angular.Y = 1;
send(para_pub,para_msg);
%Adown
function Adown_Callback(hObject, eventdata, handles)
global sk_a;   
global sk_k;
global sk_r;
para_pub = rospublisher('/para',rostype.geometry_msgs_Twist);
pause(0.5);
para_msg = rosmessage(para_pub);
sk_a = sk_a-0.05;
set(handles.para_A,'String',num2str(sk_a));
gait = get(handles.gait_chose,'Value');
para_msg.Angular.X = gait;
para_msg.Linear.X = sk_a;
para_msg.Linear.Y = sk_k;
para_msg.Linear.Z = sk_r;
para_msg.Angular.Y = 1;
send(para_pub,para_msg);
%Kdown
function Kdown_Callback(hObject, eventdata, handles)
global sk_a;   
global sk_k;
global sk_r;
para_pub = rospublisher('/para',rostype.geometry_msgs_Twist);
pause(0.5);
para_msg = rosmessage(para_pub);
sk_k = sk_k-0.05;
set(handles.para_K,'String',num2str(sk_k));
gait = get(handles.gait_chose,'Value');
para_msg.Angular.X = gait;
para_msg.Linear.X = sk_a;
para_msg.Linear.Y = sk_k;
para_msg.Linear.Z = sk_r;
para_msg.Angular.Y = 1;
send(para_pub,para_msg);
%Kup
function Kup_Callback(hObject, eventdata, handles)
global sk_a;   
global sk_k;
global sk_r;
para_pub = rospublisher('/para',rostype.geometry_msgs_Twist);
pause(0.5);
para_msg = rosmessage(para_pub);
sk_k = sk_k+0.05;
set(handles.para_K,'String',num2str(sk_k));
gait = get(handles.gait_chose,'Value');
para_msg.Angular.X = gait;
para_msg.Linear.X = sk_a;
para_msg.Linear.Y = sk_k;
para_msg.Linear.Z = sk_r;
para_msg.Angular.Y = 1;
send(para_pub,para_msg);

