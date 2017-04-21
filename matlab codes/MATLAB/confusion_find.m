function varargout = confusion_find(varargin)
% CONFUSION_FIND MATLAB code for confusion_find.fig
%      CONFUSION_FIND, by itself, creates a new CONFUSION_FIND or raises the existing
%      singleton*.
%
%      H = CONFUSION_FIND returns the handle to a new CONFUSION_FIND or the handle to
%      the existing singleton*.
%
%      CONFUSION_FIND('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONFUSION_FIND.M with the given input arguments.
%
%      CONFUSION_FIND('Property','Value',...) creates a new CONFUSION_FIND or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before confusion_find_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to confusion_find_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help confusion_find

% Last Modified by GUIDE v2.5 26-Jul-2015 13:23:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @confusion_find_OpeningFcn, ...
                   'gui_OutputFcn',  @confusion_find_OutputFcn, ...
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


% --- Executes just before confusion_find is made visible.
function confusion_find_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to confusion_find (see VARARGIN)

% Choose default command line output for confusion_find
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes confusion_find wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = confusion_find_OutputFcn(hObject, eventdata, handles) 
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
load 'net.mat';
[fn,pn]=uigetfile('*.mat','load mat data');
load([pn fn]);
x=data;
t=result;
x=double(x);
t=double(t);
t_data=[];
real=[];
confusion=[];
handles.net=net;
handles.x=x;
handles.t=t;
for(i=1:size(x,2))
    c=net(x(:,i));
    c=(c==max(c));
    dif=sum(abs(c-t(:,i)));
    if(dif~=0)
        t_data=[t_data x(:,i)];
        real=[real t(:,i)];
        confusion=[confusion c];
    end
end
save 'real_data.mat' t_data real;
save 'confusion_data.mat' t_data confusion;

guidata(hObject, handles);


% --- Executes on button press in data.
function data_Callback(hObject, eventdata, handles)
% hObject    handle to data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
