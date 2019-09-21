
function varargout = overunderseven(varargin)
% OVERUNDERSEVEN MATLAB code for overunderseven.fig
%      OVERUNDERSEVEN, by itself, creates a new OVERUNDERSEVEN or raises the existing
%      singleton*.
%
%      H = OVERUNDERSEVEN returns the handle to a new OVERUNDERSEVEN or the handle to
%      the existing singleton*.
%
%      OVERUNDERSEVEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OVERUNDERSEVEN.M with the given input arguments.
%
%      OVERUNDERSEVEN('Property','Value',...) creates a new OVERUNDERSEVEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before overunderseven_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to overunderseven_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help overunderseven

% Last Modified by GUIDE v2.5 26-Nov-2018 21:41:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @overunderseven_OpeningFcn, ...
                   'gui_OutputFcn',  @overunderseven_OutputFcn, ...
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


% --- Executes just before overunderseven is made visible.
function overunderseven_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to overunderseven (see VARARGIN)

% Choose default command line output for overunderseven
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes overunderseven wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = overunderseven_OutputFcn(hObject, eventdata, handles) 
%   varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% once the 'Roll' button (a.k.a pusbutton1) has been clicked 
% show the 'quit' button (a.k.a pushbutton4)
handles.pushbutton4.Visible = 1;
handles.pushbutton4.Enable = 'on';

%load Dice.mat
load Dice;

% set variable 'betAmount' to the value of edit1
% convert from String to double to store the value
betAmount = str2double(handles.edit1.String);

% set variable 'money' to the value of text2
% convert from String to double to stroe the value
money = str2double(handles.text2.String);

% if edit1 has a string value of "" or the betAmount value is less than 0
if(handles.edit1.String == "" | betAmount <= 0)
    % if betAmount is less than 0
    if betAmount <= 0
        errordlg('Bet has to be positive!'); % display error message, that "the bet has be positive!"
    else
        errordlg('You have to bet something!');% display error message, that "you have to bet something"
    end

else
    % if the betAmount value is more than the value of money 
    % AND money is not equal to 0
    if((betAmount > money) & (money ~= 0))
        errordlg('You do not have that much money!'); % present an error through error dialog saying : "You do not have that much money!"
    else
    % Set text2 String value to the value of money    
    handles.text2.String = money

    % roll 2 dice randomly
    roll = randi([1 6], [1 2]);

    % sum both dice
    total = roll(1) + roll(2);

    % set 'betAmount' to the String value of edit1
    betAmount = str2double(handles.edit1.String);

    % if total value is less than 7
    if(total < 7)
    handles.text3.String = "Under"; % Set text3 value to "Under"
    % if total value is equal to 7
    elseif(total == 7)
    handles.text3.String = "Sevens"; % Set text3 value to "Sevens"
    % if total value is greater than 7
    else
    handles.text3.String = "Over"; % Set text3 value to "Over"
    end
    
    % if text3 String value is equal to popupmenu1 String value
    % by using the strcmp() function (string compare function)
    if(strcmp(handles.text3.String, handles.popupmenu1.String(handles.popupmenu1.Value)) == 1)
    handles.text5.String = "Win!"; % set text5 String value to "Win!"
    % if text3 String value is "Sevens"
    if handles.text3.String == "Sevens"
        money = money + (4 * betAmount); % set money to 4 times the 'betAmount' + money
    % else if text3 String value is "Over" or "Under"
    else
        money = money + betAmount; % set money to the value of betAmount + money
    end
    % else
    else
    handles.text5.String = "Lose!"; % set text5 String to lose
    money = money - betAmount; % subtract betAmount from money
    end
    
    
    % show what the two dice are
    imshow([Dice{roll}])
    
    % if money is equal to 0
    if money == 0
        handles.text2.String = "" + money; % set text2 String value to money
        pushbutton4_Callback(hObject, eventdata, handles) % call pushbutton4_Callback() to simulate the 'quit' button being pressed
    end

    handles.text2.String = "" + money; % set text2 String value to the value of money
    end
end


    function edit1_Callback(hObject, eventdata, handles)
    % hObject    handle to edit1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of edit1 as text
    %        str2double(get(hObject,'String')) returns contents of edit1 as a double


    % --- Executes during object creation, after setting all properties.
    function edit1_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to edit1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton1.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global output; % create a global variable called output
money = str2double(handles.text2.String); % set variable 'money' to String value of text2 (by converting String to double)
% if money is equal to 0
if money == 0
    output = "You ran out of money" % set output to "You ran out of money"
else
    output = "You quit with $" + handles.text2.String + " Left"; % set output to display the amount of money the user had left when they quit
end

close(handles.figure1); % close this window

endgame; % call the endgame() function







% function edit1_Callback(hObject, eventdata, handles)
% % hObject    handle to edit1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of edit1 as text
% %        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
% function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% 
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end
