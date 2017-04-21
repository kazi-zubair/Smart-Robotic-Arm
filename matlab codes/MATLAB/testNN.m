function varargout = testNN(varargin)
% TESTNN MATLAB code for testNN.fig
%      TESTNN, by itself, creates a new TESTNN or raises the existing
%      singleton*.
%
%      H = TESTNN returns the handle to a new TESTNN or the handle to
%      the existing singleton*.
%
%      TESTNN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TESTNN.M with the given input arguments.
%
%      TESTNN('Property','Value',...) creates a new TESTNN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before testNN_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to testNN_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help testNN

% Last Modified by GUIDE v2.5 28-Jun-2015 06:23:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @testNN_OpeningFcn, ...
                   'gui_OutputFcn',  @testNN_OutputFcn, ...
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


% --- Executes just before testNN is made visible.
function testNN_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to testNN (see VARARGIN)

% Choose default command line output for testNN
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes testNN wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = testNN_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pic=imread('pink_object_actual.jpg');
handles.pic=pic;
axes(handles.axes1);
imshow(pic);
guidata(hObject, handles);


% --- Executes on button press in scan.
function scan_Callback(hObject, eventdata, handles)
% hObject    handle to scan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pic=handles.pic;
s=size(handles.pic)
RGB=zeros(20,20,3);
net=handles.net;
picB=pic;
no_of_ocr=0;
length=90;
    for x=1:20:s(2)-length
        for y=1:20:s(1)-length
            croped=imcrop(pic,[x,y,length,length]);
            RGB(:,:,1)=imresize(croped(:,:,1),[20 20]);
            RGB(:,:,2)=imresize(croped(:,:,2),[20 20]);
            RGB(:,:,3)=imresize(croped(:,:,3),[20 20]);
            n=net(RGB(:));
            if (n(1)>0.9)
            picB(y:(y+length),x:(x+length),:)=picB(y:(y+length),x:(x+length),:)-150;
            no_of_ocr=no_of_ocr+1;
            set(handles.text3,'String',num2str(no_of_ocr));
            end
        end
    end


imshow(picB);
            

% --- Executes on button press in train.
function train_Callback(hObject, eventdata, handles)
% hObject    handle to train (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fn,pn]=uigetfile('*.mat','load mat data');
load([pn fn]);
x=data;
t=result;
x=double(x);
t=double(t);
net=patternnet(150);
net.divideParam.trainRatio=70/100;
net.divideParam.valRatio=15/100;
net.divideParam.testRatio=15/100;
[net tr]=train(net,x,t);
handles.net=net;
handles.tr=tr;
save 'net.mat' net;
guidata(hObject, handles);