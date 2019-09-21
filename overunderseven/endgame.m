function varargout = endgame(varargin)
% ENDGAME MATLAB code for endgame.fig
%      ENDGAME, by itself, creates a new ENDGAME or raises the existing
%      singleton*.
%
%      H = ENDGAME returns the handle to a new ENDGAME or the handle to
%      the existing singleton*.
%
%      ENDGAME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENDGAME.M with the given input arguments.
%
%      ENDGAME('Property','Value',...) creates a new ENDGAME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before endgame_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to endgame_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help endgame

% Last Modified by GUIDE v2.5 26-Nov-2018 21:56:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @endgame_OpeningFcn, ...
                   'gui_OutputFcn',  @endgame_OutputFcn, ...
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


% --- Executes just before endgame is made visible.
function endgame_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to endgame (see VARARGIN)

% Choose default command line output for endgame
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes endgame wait for user response (see UIRESUME)
% uiwait(handles.playAgain);

global output; % call the global output varaible 

handles.result.String = output + " Would you like to Play Again?"; % set 'result' String value to the value of output AND " Would you like to play again?"


% --- Outputs from this function are returned to the command line.
function varargout = endgame_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in yesButton.
function yesButton_Callback(hObject, eventdata, handles)
% hObject    handle to yesButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% if yesButton is clicked

close(handles.playAgain); % close this window
overunderseven; % call overunderseven() function



% --- Executes on button press in noButton.
function noButton_Callback(hObject, eventdata, handles)
% hObject    handle to noButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% if noButton is clicked
close(handles.playAgain); % close this window
