function varargout = CIrcuito(varargin)
% CIRCUITO MATLAB code for CIrcuito.fig
%      CIRCUITO, by itself, creates a new CIRCUITO or raises the existing
%      singleton*.
%
%      H = CIRCUITO returns the handle to a new CIRCUITO or the handle to
%      the existing singleton*.
%
%      CIRCUITO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CIRCUITO.M with the given input arguments.
%
%      CIRCUITO('Property','Value',...) creates a new CIRCUITO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CIrcuito_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CIrcuito_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CIrcuito

% Last Modified by GUIDE v2.5 24-Jun-2017 14:28:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CIrcuito_OpeningFcn, ...
                   'gui_OutputFcn',  @CIrcuito_OutputFcn, ...
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


% --- Executes just before CIrcuito is made visible.
function CIrcuito_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CIrcuito (see VARARGIN)

% Choose default command line output for CIrcuito
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CIrcuito wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CIrcuito_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
function popupmenu1_Callback(hObject, eventdata, handles)
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function popupmenu2_Callback(hObject, eventdata, handles)

function popupmenu3_Callback(hObject, eventdata, handles)

function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function pushbutton1_Callback(hObject, eventdata, handles)

function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
%Se selecciona el valor de Ohmios
a = get(handles.popupmenu1,'String');
b = str2double(a(get(handles.popupmenu1,'Value'),1:end));

%Se selecciona el valor de Prefijo
c = get(handles.popupmenu4,'String');
d = str2double(c(get(handles.popupmenu4,'Value'),1:end));

%Se opera el valor de ohmios y el prefijo
R = b*d;
f = num2str(R);
set(handles.text5,'String',strcat('R = ',f,' ?'))

function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
%Se selecciona el valor de microfaradios (uF)
a = get(handles.popupmenu2,'String');
b = str2double(a(get(handles.popupmenu2,'Value'),1:end));

%Se selecciona el valor de Prefijo
c = get(handles.popupmenu6,'String');
d = str2double(c(get(handles.popupmenu6,'Value'),1:end));

%Se opera el valor de ohmios y el prefijo
C = b*d;
f = num2str(C);
set(handles.text6,'String',strcat('C = ',f,' uF'))

function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
%Se selecciona el valor de Ohmios
a = get(handles.popupmenu1,'String');
b = str2double(a(get(handles.popupmenu1,'Value'),1:end));

%Se selecciona el valor de Prefijo
c = get(handles.popupmenu4,'String');
d = str2double(c(get(handles.popupmenu4,'Value'),1:end));

%Se opera el valor de ohmios y el prefijo
R = b*d;

%Se selecciona el valor de microfaradios (uF)
e = get(handles.popupmenu2,'String');
f = str2double(e(get(handles.popupmenu2,'Value'),1:end));

%Se selecciona el valor de Prefijo
g = get(handles.popupmenu6,'String');
h = str2double(g(get(handles.popupmenu6,'Value'),1:end));

%Se opera el valor de ohmios y el prefijo
C = f*h*(10^-6);

%Se Opera Resistencia (R) y Capacitancia (C) Para Calcular T
T = R*C;

%Se selecciona Voltaje Vs(t)
k = get(handles.popupmenu3,'String');
Vs = str2double(k(get(handles.popupmenu3,'Value'),1:end));

%Se crea el vetor tiempo(t), el paso se eligio dependiendo
%de los valores minimos de R y C, ya que son los que definen
%el valor de la constante de tiempo T
t = 0:5*T/50:5*T;

%Aplican las Funciones calculadas para i(t) y Vc(t)
Imax = (Vs/R);
i = Imax.*exp((-1/T).*t);
Vc = Vs.*(1-exp((-1/T).*t));

%Se realiza la grafica en los axes(axes2 corriente y axes3 Voltaje) de la GUIDE
plot(handles.axes2,t,i)
plot(handles.axes3,t,Vc)
