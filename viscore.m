function gui = viscore()
%% Visualizer Core for LRAM.
%
% The following function loads a simple GUI 
% that allows multiple programs to modify a 
% GUI at a given time.
%
% To have another gui 'listen' to the core, 
% do stuff.

name = 'lram viscore';
if (isempty(findall(0,'Name',name)))
    gui = viscore_init(name)
else
    % Put in extra stuff.
    msg = 'It appears that there is already a visualizer core running.';
    msgbox(msg);
end

end

function gui = viscore_init(name)
%% Creates the GUI Figure.

fh = figure(...
    'Name',name,...
    'Units','Pixels',...
    'Color',[0.4 0.4 0.5],...
    'Position',[0,500,100,50]);

handles = guidata(fh);

set(fh, 'MenuBar','none');
handles.label = uicontrol(...
    'FontName','Impact',...
    'BackgroundColor',[0.4 0.3 0.5],...
    'Parent',fh,...
    'Style','Text',...
    'Position',[0,25,100,20],...
    'Units','Pixels',...
    'String','Visualizer Core'...
    );

core = VisualizerCore(name);
set(fh,'UserData',core);

handles.filemenu = uimenu(fh,'Label','File');
handles.loadmenu = uimenu(handles.filemenu,'Label','Load Settings','Callback',@LoadMenuFcn);
handles.savemenu = uimenu(handles.filemenu,'Label','Save Settings','Callback',@SaveMenuFcn);
guidata(fh,handles);
gui = fh;

LoadSettings(fh,'vis_settings.mat');

end

function LoadMenuFcn(hObject, eventdata)
menu = get(hObject,'Parent');
figure = get(menu,'Parent');
filename = uigetfile('.mat');
LoadSettings(figure, filename);

end

function SaveMenuFcn(hObject, eventdata)
disp('Hello');
end

function LoadSettings(figure, filename)
core = get(figure,'UserData');
disp(core);
core.settings = load(filename);
%notify(core,'Update');
notify(core,'TestMessage');
end
