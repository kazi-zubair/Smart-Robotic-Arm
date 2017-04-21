function varargout = final(varargin)
% FINAL MATLAB code for final.fig
%      FINAL, by itself, creates a new FINAL or raises the existing
%      singleton*.
%
%      H = FINAL returns the handle to a new FINAL or the handle to
%      the existing singleton*.
%
%      FINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL.M with the given input arguments.
%
%      FINAL('Property','Value',...) creates a new FINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final

% Last Modified by GUIDE v2.5 31-Jul-2015 01:58:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_OpeningFcn, ...
                   'gui_OutputFcn',  @final_OutputFcn, ...
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


% --- Executes just before final is made visible.
function final_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final (see VARARGIN)

% Choose default command line output for final
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes final wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = final_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in up.
function up_Callback(hObject, eventdata, handles)
% hObject    handle to up (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.y=handles.y-5;

axes(handles.axes1);
img=drawCircle(handles.pic,handles.x,handles.y,10);
imshow(img);
guidata(hObject, handles);
% --- Executes on button press in left.
function left_Callback(hObject, eventdata, handles)
% hObject    handle to left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.x=handles.x-5;

axes(handles.axes1);
img=drawCircle(handles.pic,handles.x,handles.y,10);
imshow(img);
guidata(hObject, handles);
% --- Executes on button press in right.
function right_Callback(hObject, eventdata, handles)
% hObject    handle to right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.x=handles.x+5;

axes(handles.axes1);
img=drawCircle(handles.pic,handles.x,handles.y,10);
imshow(img);
guidata(hObject, handles);
% --- Executes on button press in down.
function down_Callback(hObject, eventdata, handles)
% hObject    handle to down (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.y=handles.y+5;

axes(handles.axes1);
img=drawCircle(handles.pic,handles.x,handles.y,10);
imshow(img);
guidata(hObject, handles);

% --- Executes on button press in set.
function set_Callback(hObject, eventdata, handles)
% hObject    handle to set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.pic=snapshot(handles.cam);
handles.x=0;
handles.y=0;
axes(handles.axes1);
imshow(handles.pic);
guidata(hObject, handles);


% --- Executes on button press in ps1.
function p1_Callback(hObject, eventdata, handles)
% hObject    handle to ps1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.p1x=handles.x;
handles.p1y=handles.y;
guidata(hObject, handles);

% --- Executes on button press in ps2.
function p2_Callback(hObject, eventdata, handles)
% hObject    handle to ps2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.p2x=handles.x;
handles.p2y=handles.y;
guidata(hObject, handles);

% --- Executes on button press in ps3.
function p3_Callback(hObject, eventdata, handles)
% hObject    handle to ps3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.p3x=handles.x;
handles.p3y=handles.y;
guidata(hObject, handles);

% --- Executes on button press in ps4.
function p4_Callback(hObject, eventdata, handles)
% hObject    handle to ps4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.p4x=handles.x;
handles.p4y=handles.y;
guidata(hObject, handles);


% --- Executes on button press in Ok.
function Ok_Callback(hObject, eventdata, handles)
% hObject    handle to Ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.reshaped=Reshape(handles.pic,[handles.p1x handles.p2x handles.p3x handles.p4x],[handles.p1y handles.p2y handles.p3y handles.p4y])
axes(handles.axes2);
imshow((handles.reshaped));
imwrite(handles.reshaped,'test1.jpg','jpg');
guidata(hObject, handles);


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.cam=webcam(1);
guidata(hObject, handles);


% --- Executes on button press in s_object.
function s_object_Callback(hObject, eventdata, handles)
% hObject    handle to s_object (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('net.mat')
pic=imread('test1.jpg');

[o,o1,o2,o3,o4,o5]=searchObject(pic,net)

if(o(2)==1)
    set(handles.o1,'String','yes');
    for(i=1:size(o1,1))
    pic = insertShape(pic, 'FilledCircle', [o1(i,:) 10], 'Color', [10 10 255]);
    pos=getPosition(o1(i,:));
    set(handles.ps1,'String',strcat('x= ',num2str(pos(1)),', y= ',num2str(pos(2))));
    end
else
    set(handles.o1,'String','no');
    set(handles.ps1,'String','--');
end

if(o(3)==1)
    set(handles.o2,'String','yes');
    for(i=1:size(o2,1))
    pic = insertShape(pic, 'FilledCircle', [o2(i,:) 20], 'Color', [20 0 255]);
    pos=getPosition(o2(i,:));
    s=strcat('x= ',num2str(pos(1)),', y= ',num2str(pos(2)))
    set(handles.ps2,'String',s);
    end
    else
    set(handles.o2,'String','no');
    set(handles.ps2,'String','--');
end
if(o(4)==1)
    set(handles.o3,'String','yes');
    for(i=1:size(o3,1))
    pic = insertShape(pic, 'FilledCircle', [o3(i,:) 15], 'Color', [255 102 00]);
    pos=getPosition(o3(i,:));
    set(handles.ps3,'String',strcat('x= ',num2str(pos(1)),', y= ',num2str(pos(2))));
    end
    else
    set(handles.o3,'String','no');
    set(handles.ps3,'String','--');
end
if(o(5)==1)
    set(handles.o4,'String','yes');
    for(i=1:size(o4,1))
    pic = insertShape(pic, 'FilledCircle', [o4(i,:) 15], 'Color', [0 255 0]);
    pos=getPosition(o4(i,:));
    set(handles.ps4,'String',strcat('x= ',num2str(pos(1)),', y= ',num2str(pos(2))));
    end
    else
    set(handles.o4,'String','no');
    set(handles.ps4,'String','--');
end
if(o(6)==1)
   set(handles.o5,'String','yes');
   for(i=1:size(o5,1))
    pic = insertShape(pic, 'FilledCircle', [o5(i,:) 15], 'Color', [39 22 42]);
   pos=getPosition(o5(i,:));
    set(handles.ps5,'String',strcat('x= ',num2str(pos(1)),', y= ',num2str(pos(2))));
   end
   else
    set(handles.o5,'String','no');
    set(handles.ps5,'String','--');
end
axes(handles.axes2);
imshow(pic);

% --- Executes on button press in load_nn.
function load_nn_Callback(hObject, eventdata, handles)
% hObject    handle to load_nn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('net.mat')
handles.net=net;
guidata(hObject, handles);


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
