function varargout = corrector(varargin)
% CORRECTOR MATLAB code for corrector.fig
%      CORRECTOR, by itself, creates a new CORRECTOR or raises the existing
%      singleton*.
%
%      H = CORRECTOR returns the handle to a new CORRECTOR or the handle to
%      the existing singleton*.
%
%      CORRECTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CORRECTOR.M with the given input arguments.
%
%      CORRECTOR('Property','Value',...) creates a new CORRECTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before corrector_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to corrector_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help corrector

% Last Modified by GUIDE v2.5 26-Jul-2015 14:29:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @corrector_OpeningFcn, ...
                   'gui_OutputFcn',  @corrector_OutputFcn, ...
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


% --- Executes just before corrector is made visible.
function corrector_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to corrector (see VARARGIN)

% Choose default command line output for corrector
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes corrector wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = corrector_OutputFcn(hObject, eventdata, handles) 
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
[fn,pn]=uigetfile('*.mat','load mat data');
load([pn fn]);
x=data;
t=result;
handles.x=x;
handles.t=t;
handles.count=1;
guidata(hObject, handles);

% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=reshape(handles.x(:,handles.count),[20 20 3]);
imshow(img);
set(handles.value,'String',handles.t(1,handles.count));
set(handles.t_count,'String',handles.count);

handles.count=handles.count+1;

guidata(hObject, handles);
% --- Executes on button press in prev.
function prev_Callback(hObject, eventdata, handles)
% hObject    handle to prev (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=reshape(handles.x(:,handles.count),[20 20 3]);
imshow(img);
set(handles.value,'String',handles.t(1,handles.count));
set(handles.t_count,'String',handles.count);

handles.count=handles.count-1;

guidata(hObject, handles);
% --- Executes on button press in remove.
function remove_Callback(hObject, eventdata, handles)
% hObject    handle to remove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=handles.count-1;
handles.x(:,c)=[];
handles.t(:,c)=[];
guidata(hObject, handles);



function t_count_Callback(hObject, eventdata, handles)
% hObject    handle to t_count (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t_count as text
%        str2double(get(hObject,'String')) returns contents of t_count as a double


% --- Executes during object creation, after setting all properties.
function t_count_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_count (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in set_c.
function set_c_Callback(hObject, eventdata, handles)
% hObject    handle to set_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.count=str2num(get(handles.t_count,'String'));
guidata(hObject, handles);


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=handles.x;
result=handles.t;
save 'edited_set.mat' data result;
