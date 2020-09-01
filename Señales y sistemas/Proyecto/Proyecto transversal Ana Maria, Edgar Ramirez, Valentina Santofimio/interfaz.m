function varargout = interfaz(varargin)

% INTERFAZ MATLAB code for interfaz.fig
%      INTERFAZ, by itself, creates a new INTERFAZ or raises the existing
%      singleton*.
%
%      H = INTERFAZ returns the handle to a new INTERFAZ or the handle to
%      the existing singleton*.
%
%      INTERFAZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZ.M with the given input arguments.
%
%      INTERFAZ('Property','Value',...) creates a new INTERFAZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interfaz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interfaz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfaz

% Last Modified by GUIDE v2.5 11-Jul-2017 00:33:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfaz_OpeningFcn, ...
                   'gui_OutputFcn',  @interfaz_OutputFcn, ...
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


% --- Executes just before interfaz is made visible.
function interfaz_OpeningFcn(hObject, eventdata, handles, varargin)
set(handles.STOP,'enable','off');
set(handles.IN,'visible','off');
set(handles.OUT,'visible','off');
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interfaz (see VARARGIN)

% Choose default command line output for interfaz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfaz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interfaz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in open.
function open_Callback(hObject, eventdata, handles)
global s fs
set(handles.STOP,'enable','off');
set(handles.s1,'enable','on');
set(handles.s2,'enable','on');
set(handles.s3,'enable','on');
set(handles.s4,'enable','on');
set(handles.s5,'enable','on');
set(handles.s6,'enable','on');
set(handles.IN,'visible','off');
set(handles.OUT,'visible','off');

[filename, pathname] = uigetfile('.wav','cargar archivo de audio');
[s fs] = audioread(strcat(pathname,'/',filename));
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in STOP.
function STOP_Callback(hObject, eventdata, handles) 
global player 
set(handles.open,'enable','on');
%stop(player1);
stop(player)
% hObject    handle to STOP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in playin.
function playin_Callback(hObject, eventdata, handles)
global s fs player Y
set(handles.STOP,'enable','on');
set(handles.open,'enable','on');
% set(handles.IN,'enable','on'); 
% set(handles.OUT,'enable','on');
% set(handles.sub_graves,'enable','on');
% set(handles.graves,'enable','on');
% set(handles.medias_bajas,'enable','on');
% set(handles.medias_altas,'enable','on');
% set(handles.presencia,'enable','on');
% set(handles.brillo,'enable','on'); 
set(handles.open,'enable','off'); 
set(handles.IN,'visible','on');
set(handles.OUT,'visible','on');
player=audioplayer(s,fs);
FS=fs/2;
L=length(s)/2;
NFFT=2^nextpow2(L);
Y=fft(s,NFFT)/L;
f=FS/2*linspace(0,1,NFFT/2+1);
axes(handles.IN);
plot(f,2*abs(Y(1:NFFT/2+1)));
grid on
xlabel('frecuencia');
ylabel('magnitud');
title('ESPECTRO DE ENTRADA');
play(player);
% hObject    handle to playin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function s1_Callback(hObject, eventdata, handles)
global s1
s1=get(hObject,'Value');
set(handles.t1,'string',fix(s1));
% hObject    handle to s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function s1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function s2_Callback(hObject, eventdata, handles)
global s2
s2=get(hObject,'Value');
set(handles.t2,'string',fix(s2));

% hObject    handle to s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function s2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function s3_Callback(hObject, eventdata, handles)
global s3
s3=get(hObject,'Value');
set(handles.t3,'string',fix(s3));
% hObject    handle to s3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function s3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function s4_Callback(hObject, eventdata, handles)
global s4
s4=get(hObject,'Value');
set(handles.t4,'string',fix(s4));
% hObject    handle to s4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function s4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function s6_Callback(hObject, eventdata, handles)
global s6
s6=get(hObject,'Value');
set(handles.t6,'string',fix(s6));
% hObject    handle to s6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function s6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in playout.
function playout_Callback(hObject, eventdata, handles)
global s fs player s1 s2 s3 s4 s5 s6 Yf 
set(handles.STOP,'enable','on');
set(handles.open,'enable','off');
s1=get(handles.s1,'value');
s2=get(handles.s2,'value');
s3=get(handles.s3,'value');
s4=get(handles.s4,'value');
s5=get(handles.s5,'value');
s6=get(handles.s6,'value');
A0=10^(s1/20);
A1=10^(s2/20);
A2=10^(s3/20);
A3=10^(s4/20);
A4=10^(s5/20);
A5=10^(s6/20);

%filtros
f1=A0*filter(sub_graves,s);
f2=A1*filter(graves,s);
f3=A2*filter(medias_bajas,s);
f4=A3*filter(medias_altas,s);
f5=A4*filter(presencia,s);
f6=A5*filter(brillo,s);
%SEÑAL RECONSTRUIDA
Yf=f1+f2+f3+f4+f5+f6;
FS=fs/2;
L=length(s)/2;
NFFT=2^nextpow2(L);
YN=fft(Yf,NFFT)/L;
f=FS/2*linspace(0,1,NFFT/2+1);
axes(handles.OUT);
plot(f,2*abs(YN(1:NFFT/2+1)));
grid on
xlabel('frecuencia');
ylabel('magnitud');
title('ESPECTRO DE SALIDA');
player=audioplayer(Yf,fs);
play(player)
% hObject    handle to playout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function s5_Callback(hObject, eventdata, handles)
global s5
s5=get(hObject,'Value');
set(handles.t5,'string',fix(s5));
% hObject    handle to s5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function s5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
