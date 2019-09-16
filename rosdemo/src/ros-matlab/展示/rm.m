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
% �����޸ģ�

% ��������ִ�к���
function rm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% Choose default command line output for rm
set(handles.s_para,'Enable','Off');
%״̬�ı���ʾ
set(handles.Islink,'String','����״̬ : Off');  
set(handles.Ismove,'String','�ƶ�״̬ : Off');       
%Ĭ��IP
set(handles.ip_ros,'String','192.168.0.103');  
set(handles.ip_mat,'String','192.168.0.114');
%��ʼ����Ϊ���Ѳ�̬
set(handles.para_A,'String',1);
set(handles.para_K,'String',2.3);
set(handles.para_R,'String',0);
%����ȫ�ֱ���
global sk_a;       %��̬����                               
global sk_k;
global sk_r;
sk_a = 1;        %��ʼΪ���Ѳ�̬����
sk_k = 2.3;
sk_r = 0;
global Islink;      %���ӱ�־λ
global Ismove;      %�����־λ
Islink = false;
Ismove = false;
handles.output = hObject;       %ˢ�¾��
guidata(hObject, handles);

% �����˳�ʱִ�к������ɺ���
function varargout = rm_OutputFcn(hObject, eventdata, handles) 
rosshutdown;
varargout{1} = handles.output;
% ip_ros�ɱ༭�ı��򴴽��������ɺ���
function ip_ros_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% ip_mat�ɱ༭�ı��򴴽��������ɺ��� 
function ip_mat_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% ip_ros�ɱ༭�ı���ص��������ɺ���
function ip_ros_Callback(hObject, eventdata, handles)
% ip_mat�ɱ༭�ı���ص��������ɺ���
function ip_mat_Callback(hObject, eventdata, handles)


% link��ť�ص�����
function link_Callback(hObject, eventdata, handles)
global Islink;
ip_ros = get(handles.ip_ros,'String');     %��ȡƴ��IP
ip_ros = strcat('http://',ip_ros,':11311');
ip_mat = get(handles.ip_mat,'String');
if Islink == false
    set(handles.Islink,'String','����״̬ : On');
    setenv('ROS_MASTER_URI',ip_ros);       %����ROS
    setenv('ROS_IP',ip_mat);
    rosinit;
    set(handles.link,'String',"�Ͽ�");      %�����ı����Ϊ�Ͽ�
    Islink = true;
else
    rosshutdown;                               
    set(handles.Islink,'String','����״̬ : Off');  
    Islink= false;
    set(handles.link,'String',"����");
end

% AKR�ɱ��ı��򴴽����ɺ���
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
% AKR�����ı���ص����ɺ���
function para_A_Callback(hObject, eventdata, handles)
function para_K_Callback(hObject, eventdata, handles)
function para_R_Callback(hObject, eventdata, handles)
% ��̬ѡ��˵���ʼ����
function gait_chose_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% ���Ͳ����ص�����
function s_para_Callback(hObject, eventdata, handles)
global sk_a;                                   
global sk_k;
global sk_r;
global Islink;
global Ismove;
if Islink == true
    %��ȡ��̬����  
    sk_a=str2double(get(handles.para_A,'String'));  
    sk_k=str2double(get(handles.para_K,'String'));
    sk_r=str2double(get(handles.para_R,'String'));
    %��ȡ��̬
    gait = get(handles.gait_chose,'Value');
    %���Ͳ����벽̬
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
   helpdlg('��������ros','��ʾ');
end

% ��̬ѡ��˵��ص�����
function gait_chose_Callback(hObject, eventdata, handles)
global sk_a;                                   
global sk_k;
global sk_r;
%��ȡ��̬��־
%1Ϊ���� 2U�� 3Ϊ����
gait = get(handles.gait_chose,'Value');     
%��̬�ı�ʱ���ı���Ӧ��ʼ����
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

% ��ʼ/��ͣ��ť�ص�����
function start_Callback(hObject, eventdata, handles)
global sk_a;                                   
global sk_k;
global sk_r;
global Ismove;
%����ڵ�
para_pub = rospublisher('/para',rostype.geometry_msgs_Twist);
pause(0.5);
para_msg = rosmessage(para_pub);
if Ismove == false
    Ismove = true;
    para_msg.Angular.Y = 1;
    set(handles.Ismove,'String','�ƶ�״̬ : On');
    set(handles.start,'String','��ͣ����');
    set(handles.s_para,'Enable','On');
else
    Ismove = false;
    para_msg.Angular.Y = 0;
    set(handles.Ismove,'String','�ƶ�״̬ : Off');
    set(handles.start,'String','��ʼ����');
    set(handles.s_para,'Enable','Off');
end
gait = get(handles.gait_chose,'Value');
para_msg.Angular.X = gait;
para_msg.Linear.X = sk_a;
para_msg.Linear.Y = sk_k;
para_msg.Linear.Z = sk_r;
send(para_pub,para_msg);
    

%����΢��
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

