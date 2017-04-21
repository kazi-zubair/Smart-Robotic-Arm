function varargout = dataCreatorC(varargin)
% DATACREATORC MATLAB code for dataCreatorC.fig
%      DATACREATORC, by itself, creates a new DATACREATORC or raises the existing
%      singleton*.
%
%      H = DATACREATORC returns the handle to a new DATACREATORC or the handle to
%      the existing singleton*.
%
%      DATACREATORC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATACREATORC.M with the given input arguments.
%
%      DATACREATORC('Property','Value',...) creates a new DATACREATORC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dataCreatorC_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dataCreatorC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dataCreatorC

% Last Modified by GUIDE v2.5 30-Jul-2015 13:20:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dataCreatorC_OpeningFcn, ...
                   'gui_OutputFcn',  @dataCreatorC_OutputFcn, ...
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


% --- Executes just before dataCreatorC is made visible.
function dataCreatorC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dataCreatorC (see VARARGIN)

% Choose default command line output for dataCreatorC
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dataCreatorC wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dataCreatorC_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
x=1;
y=1;
height=65;
weight=65;
handles.height=height;
handles.weight=weight;
handles.x=x;
handles.y=y;
handles.data=uint8(zeros(20,20,3));
handles.croped=uint8(zeros(20,20,3));
handles.data=handles.data(:);
handles.result=0;
pic=imread('mixed.jpg');

handles.pic=pic;
handles.pic_b=pic;
guidata(hObject, handles);

imshow(pic);

% --- Executes on button press in scan.
function scan_Callback(hObject, eventdata, handles)
% hObject    handle to scan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.x=handles.x+handles.height*0.1;

height=handles.height;
weight=handles.weight;
axes(handles.axes2);
pic=handles.pic;
s=size(pic);
x=handles.x;
y=handles.y;

        croped=imcrop(pic,[x,y,height,weight]);
        RGB=zeros(20,20,3);
        RGB(:,:,1)=imresize(croped(:,:,1),[20 20]);
        RGB(:,:,2)=imresize(croped(:,:,2),[20 20]);
        RGB(:,:,3)=imresize(croped(:,:,3),[20 20]);
        RGB=uint8(RGB);
%        croped=imresize(croped,[40 40]);
        imshow(RGB)
        handles.croped=RGB;
%        handles.data=[handles.data croped(:)];
%        data=handles.data;
       

%        handles.result=[handles.result num];
%        result=handles.result;
    %    set(handles.value,'String',0);
        

if(x>s(2)-weight) 
    
        handles.x=0;
        handles.y=handles.y+handles.height*0.1;
    
end
if (y>s(1)-height)
    
        handles.x=0;
        handles.y=0;
        handles.height=handles.height+10;
        handles.weight=handles.weight+10;
    
end
shapeInserter = vision.ShapeInserter;
rectangle = int32([x y height weight]);
pic = step(shapeInserter, handles.pic, rectangle);
axes(handles.axes1);
imshow(pic);
guidata(hObject, handles);
set(handles.x_text,'String',handles.x);

function x_text_Callback(hObject, eventdata, handles)
% hObject    handle to x_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_text as text
%        str2double(get(hObject,'String')) returns contents of x_text as a double


% --- Executes during object creation, after setting all properties.
function x_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y_text_Callback(hObject, eventdata, handles)
% hObject    handle to y_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_text as text
%        str2double(get(hObject,'String')) returns contents of y_text as a double


% --- Executes during object creation, after setting all properties.
function y_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function value_Callback(hObject, eventdata, handles)
% hObject    handle to value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of value as text
%        str2double(get(hObject,'String')) returns contents of value as a double


% --- Executes during object creation, after setting all properties.
function value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.result=[handles.result(2:end)];
result=handles.result;
result=[result;~result];
data=handles.data;
data=data(:,(2:end));
save 'training_set.mat' data result;


% --- Executes on button press in take.
function take_Callback(hObject, eventdata, handles)
% hObject    handle to take (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        handles.data=[handles.data handles.croped(:)];
        data=handles.data;
         num=str2num(get(handles.value,'String'));
        handles.result=[handles.result num];
        result=handles.result
        axes(handles.axes1);
        guidata(hObject, handles);
        

% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.x=handles.x-handles.height*0.1;

height=handles.height;
weight=handles.weight;
axes(handles.axes2);
pic=handles.pic;
s=size(pic);
x=handles.x;
y=handles.y;

        croped=imcrop(pic,[x,y,height,weight]);
        RGB=zeros(20,20,3);
        RGB(:,:,1)=imresize(croped(:,:,1),[20 20]);
        RGB(:,:,2)=imresize(croped(:,:,2),[20 20]);
        RGB(:,:,3)=imresize(croped(:,:,3),[20 20]);
        RGB=uint8(RGB);
%        croped=imresize(croped,[40 40]);
        imshow(RGB)
        handles.croped=RGB;
%        handles.data=[handles.data croped(:)];
%        data=handles.data;
       

%        handles.result=[handles.result num];
%        result=handles.result;
%        set(handles.value,'String',0);
        

if(x>s(2)-weight) 
    
        handles.x=0;
        handles.y=handles.y+handles.height*0.1;
    
end
if (y>s(1)-height)
    
        handles.x=0;
        handles.y=0;
        handles.height=handles.height+10;
        handles.weight=handles.weight+10;
    
end
shapeInserter = vision.ShapeInserter;
rectangle = int32([x y height weight]);
pic = step(shapeInserter, handles.pic, rectangle);
axes(handles.axes1);
imshow(pic);
guidata(hObject, handles);
%set(handles.x_text,'String',handles.x);


% --- Executes on button press in set_pos.
function set_pos_Callback(hObject, eventdata, handles)
% hObject    handle to set_pos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[x y]=getpts(handles.axes1)
x(1,:)=[];
axes(handles.axes1);
y(1,:)=[];
handles.x=x;
handles.y=y;
guidata(hObject, handles);


% --- Executes on button press in up.
function up_Callback(hObject, eventdata, handles)
% hObject    handle to up (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.y=handles.y-handles.height*0.1;
height=handles.height;
weight=handles.weight;
axes(handles.axes2);
pic=handles.pic;
s=size(pic);
x=handles.x;
y=handles.y;

        croped=imcrop(pic,[x,y,height,weight]);
        RGB=zeros(20,20,3);
        RGB(:,:,1)=imresize(croped(:,:,1),[20 20]);
        RGB(:,:,2)=imresize(croped(:,:,2),[20 20]);
        RGB(:,:,3)=imresize(croped(:,:,3),[20 20]);
        RGB=uint8(RGB);
%        croped=imresize(croped,[40 40]);
        imshow(RGB)
        handles.croped=RGB;
%        handles.data=[handles.data croped(:)];
%        data=handles.data;
       

%        handles.result=[handles.result num];
%        result=handles.result;
%        set(handles.value,'String',0);
        


if(x>s(2)-weight) 
    
        handles.x=0;
        handles.y=handles.y+handles.height*0.1;
    
end
if (y>s(1)-height)
    
        handles.x=0;
        handles.y=0;
        handles.height=handles.height+10;
        handles.weight=handles.weight+10;
    
end
shapeInserter = vision.ShapeInserter;
rectangle = int32([x y height weight]);
pic = step(shapeInserter, handles.pic, rectangle);
axes(handles.axes1);
imshow(pic);
guidata(hObject, handles);
%set(handles.x_text,'String',handles.x);



% --- Executes on button press in down.
function down_Callback(hObject, eventdata, handles)
% hObject    handle to down (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.y=handles.y+handles.height*0.1;

height=handles.height;
weight=handles.weight;
axes(handles.axes2);
pic=handles.pic;
s=size(pic);
x=handles.x;
y=handles.y;

        croped=imcrop(pic,[x,y,height,weight]);
        RGB=zeros(20,20,3);
        RGB(:,:,1)=imresize(croped(:,:,1),[20 20]);
        RGB(:,:,2)=imresize(croped(:,:,2),[20 20]);
        RGB(:,:,3)=imresize(croped(:,:,3),[20 20]);
        RGB=uint8(RGB);
%        croped=imresize(croped,[40 40]);
        imshow(RGB)
        handles.croped=RGB;
%        handles.data=[handles.data croped(:)];
%        data=handles.data;
       

%        handles.result=[handles.result num];
%        result=handles.result;
%        set(handles.value,'String',0);
        

if(x>s(2)-weight) 
    
        handles.x=0;
        handles.y=handles.y+handles.height*0.1;
    
end
if (y>s(1)-height)
    
        handles.x=0;
        handles.y=0;
        handles.height=handles.height+10;
        handles.weight=handles.weight+10;
    
end
shapeInserter = vision.ShapeInserter;
rectangle = int32([x y height weight]);
pic = step(shapeInserter, handles.pic, rectangle);
axes(handles.axes1);
imshow(pic);
guidata(hObject, handles);
%set(handles.x_text,'String',handles.x);
