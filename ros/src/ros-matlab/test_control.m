function varargout = test_control(varargin)
% TEST_CONTROL MATLAB code for test_control.fig
%      TEST_CONTROL, by itself, creates a new TEST_CONTROL or raises the existing
%      singleton*.
%
%      H = TEST_CONTROL returns the handle to a new TEST_CONTROL or the handle to
%      the existing singleton*.
%
%      TEST_CONTROL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST_CONTROL.M with the given input arguments.
%
%      TEST_CONTROL('Property','Value',...) creates a new TEST_CONTROL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test_control_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test_control_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test_control

% Last Modified by GUIDE v2.5 11-May-2018 17:08:58
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test_control_OpeningFcn, ...
                   'gui_OutputFcn',  @test_control_OutputFcn, ...
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


% --- Executes just before test_control is made visible.
function test_control_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test_control (see VARARGIN)
global speed;
speed = 0;
% Choose default command line output for test_control
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test_control wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test_control_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in up.
function up_Callback(hObject, eventdata, handles)
global speed;
uppub=rospublisher('/cmd_vel', rostype.geometry_msgs_Twist);
pause(0.5);
upmsg=rosmessage(uppub);
upmsg.Linear.X=speed;
send(uppub,upmsg)
fprintf('hexapod goes forward, speed=%f\n',speed);


% --- Executes on button press in down.
function down_Callback(hObject, eventdata, handles)
global speed;
downpub=rospublisher('/cmd_vel', rostype.geometry_msgs_Twist);
pause(0.5);
downmsg=rosmessage(downpub);
downmsg.Linear.X=-speed;
send(downpub,downmsg)
fprintf('hexapod goes backward, speed=%f\n',speed);


% --- Executes on button press in left.
function left_Callback(hObject, eventdata, handles)
global speed;
leftpub=rospublisher('/cmd_vel', rostype.geometry_msgs_Twist);
pause(0.5);
leftmsg=rosmessage(leftpub);
leftmsg.Linear.Y=speed;
send(leftpub,leftmsg)
fprintf('hexapod goes to the left, speed=%f\n',speed);


% --- Executes on button press in right.
function right_Callback(hObject, eventdata, handles)
global speed;
rightpub=rospublisher('/cmd_vel', rostype.geometry_msgs_Twist);
pause(0.5);
rightmsg=rosmessage(rightpub);
rightmsg.Linear.Y=-speed;
send(rightpub,rightmsg);
fprintf('hexapod goes to the right, speed=%f\n',speed);

% --- Executes on button press in rotate_p.
function rotate_p_Callback(hObject, eventdata, handles)
global speed;
rotate_p_pub=rospublisher('/cmd_vel', rostype.geometry_msgs_Twist);
pause(0.5);
rotate_p_pubmsg=rosmessage(rotate_p_pub);
rotate_p_pubmsg.Angular.Z=speed;
send(rotate_p_pub,rotate_p_pubmsg);
fprintf('hexapod turns left, speed=%f\n',speed);


% --- Executes on button press in rotate_n.
function rotate_n_Callback(hObject, eventdata, handles)
global speed;
rotate_n_pub=rospublisher('/cmd_vel', rostype.geometry_msgs_Twist);
pause(0.5);
rotate_n_pubmsg=rosmessage(rotate_n_pub);
rotate_n_pubmsg.Angular.Z=-speed;
send(rotate_n_pub,rotate_n_pubmsg);
fprintf('hexapod turns right, speed=%f\n',speed);


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
stoppub=rospublisher('/cmd_vel', rostype.geometry_msgs_Twist);
pause(0.5);
stopmsg=rosmessage(stoppub);
stopmsg.Linear.X=0;
send(stoppub,stopmsg);
fprintf('hexapod stops.\n');


% --- Executes on button press in connect.
function connect_Callback(hObject, eventdata, handles)
setenv('ROS_MASTER_URI','http://192.168.0.110:11311');
rosinit();


% --- Executes on button press in disconnect.
function disconnect_Callback(hObject, eventdata, handles)
rosshutdown;



% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global speed;
speed = get(hObject, 'value');
fprintf('…Ë÷√≤Ω∑˘£∫%f\n',speed)



% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
