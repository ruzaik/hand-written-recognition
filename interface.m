

function varargout = interface(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface_OpeningFcn, ...
                   'gui_OutputFcn',  @interface_OutputFcn, ...
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


function interface_OpeningFcn(hObject, ~, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);







function varargout = interface_OutputFcn(hObject, ~, handles) 
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)


 

% --- Executes on button press in pushbutton2.
function pushbutton11_Callback(hObject, eventdata, handles)

imagen=getimage;
%Imag_seg_ex_2(x);
%% Image segmentation and extraction
%% Read Image
%imagen=imread('test1.jpg');
%% Show image
figure(1)
imshow(imagen);
title('INPUT IMAGE WITH NOISE')
%% Convert to gray scale
if size(imagen,3)==3 % RGB image
    imagen=rgb2gray(imagen);
end
%% Convert to binary image
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);

imagen =bwareaopen(imagen,15);
pause(1)
%% Show image binary image
figure(2)
imshow(imagen);
title('INPUT IMAGE WITHOUT NOISE')
%% Edge detection
Iedge = edge(uint8(imagen));
imshow(~Iedge)
%% Morphology
% * *Image Dilation*
se = strel('square',3);
Iedge2 = imdilate(Iedge, se); 
figure(3)
imshow(~Iedge2);
title('IMAGE DILATION')
% * *Image Filling*

Ifill= imfill(Iedge2,'holes');

figure(4)

imshow(~Ifill)
title('IMAGE FILLING')
Ifill=Ifill & imagen;
figure(5)
imshow(~Ifill);

re=Ifill;


while 1
    %Fcn 'lines' separate lines in text
    [fl re]=lines(re);
    imgn=fl;
    
    % Label and count connected components
    [L Ne] = bwlabel(imgn);    
  




set(handles.text11, 'String',Ne);


axes(handles.axes5);
for n=1:Ne
    [r,c] = find(L==n);
    n1=imgn(min(r):max(r),min(c):max(c));
   %imshow(~n1);
    BW2 = bwmorph(n1,'thin',Inf);
    imrotate(BW2,0);
    imshow(~BW2);
    z=imresize(BW2,[50 50]);
    contents = get(handles.popupmenu5,'String'); 
  popupmenu5value = contents{get(handles.popupmenu5,'Value')};
  switch popupmenu5value
      case 'Train using Gradient Technique'
        z=feature_extract(z);
      case 'Train using Geometric Feature Extraction'
        z=feature_extract(z);
   end
    load ('D:\HCR\featureout.mat');
    featureout=z;
    %disp(z);
    save ('D:\HCR\featureout.mat','featureout');
    test
    
    pause(0.5);
end
if isempty(re)  
        break
    end    
end
clear all
winopen('D:\HCR\output.txt');

interface




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)




% --------------------------------------------------------------------
function Menu_Callback(hObject, eventdata, handles)


% --- Executes on button press in pushbutton6.
function pushbutton12_Callback(hObject, eventdata, handles)


%% reading the image from the user

[filename, pathname] = ...
     uigetfile({'*.jpg';'*.jpeg';'*.png';'*.*'},'Select Image File');
 I=strcat(pathname,filename); 

   
  %  figure(1);
 %imshow(I);
axes(handles.axes6);
imshow(I);
set(handles.pushbutton13,'Enable','on')

helpdlg('Image has been Loaded Successfully. Choose an algorithm and train the network  ',...
        'Load Image');


 




% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)

axis on





% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)

axis on



function edit2_Callback(hObject, eventdata, handles)

disp(Ne);

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text8_CreateFcn(hObject, eventdata, handles)


% --- Executes on button press in pushbutton10.
function pushbutton13_Callback(hObject, eventdata, handles)


contents = get(handles.popupmenu5,'String'); 
  popupmenu5value = contents{get(handles.popupmenu5,'Value')};
  switch popupmenu5value
      case 'Train using Gradient Technique'
        train
        helpdlg('Network has been trained using Gradient technique. Click on "Extract Text" to process the image',...
        'Training Successfull');
      case 'Train using Geometric Feature Extraction'
        geo_train
        helpdlg('Network has been trained using Geometric Feature Extraction. Click on "Extract Text" to process the image',...
        'Training Successfull');
  end
    set(handles.pushbutton11,'Enable','on')



% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)

conf=questdlg('Are you sure you want to Exit','Exit Image','Yes','No','No');
switch conf
    case 'Yes'
        close(gcf)
    case 'No'
        return
end



% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open ReadMe.pdf


% --------------------------------------------------------------------
function About_us_Callback(hObject, eventdata, handles)
% hObject    handle to About_us (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open aboutus.fig





% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when uipanel6 is resized.
function uipanel6_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to uipanel6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
