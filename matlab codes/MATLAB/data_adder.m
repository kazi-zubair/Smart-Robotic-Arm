function varargout = data_adder(varargin)
% DATA_ADDER MATLAB code for data_adder.fig
%      DATA_ADDER, by itself, creates a new DATA_ADDER or raises the existing
%      singleton*.
%
%      H = DATA_ADDER returns the handle to a new DATA_ADDER or the handle to
%      the existing singleton*.
%
%      DATA_ADDER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATA_ADDER.M with the given input arguments.
%
%      DATA_ADDER('Property','Value',...) creates a new DATA_ADDER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before data_adder_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to data_adder_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help data_adder

% Last Modified by GUIDE v2.5 29-Jul-2015 09:02:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @data_adder_OpeningFcn, ...
                   'gui_OutputFcn',  @data_adder_OutputFcn, ...
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


% --- Executes just before data_adder is made visible.
function data_adder_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to data_adder (see VARARGIN)

% Choose default command line output for data_adder
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes data_adder wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = data_adder_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in loadp.
function loadp_Callback(hObject, eventdata, handles)
% hObject    handle to loadp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fn,pn]=uigetfile('*.mat','load mat data');
load([pn fn]);
x=data;
t=result;
handles.data1=x;
handles.result1=t;
guidata(hObject, handles);



% --- Executes on button press in loadn.
function loadn_Callback(hObject, eventdata, handles)
% hObject    handle to loadn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fn,pn]=uigetfile('*.mat','load mat data');
load([pn fn]);
x=data;
t=result;
handles.data2=x;
handles.result2=t;
guidata(hObject, handles);

% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=[handles.data1 handles.data2];
result=[handles.result1 handles.result2];
save 'added_data' data result;
