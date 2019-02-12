classdef dataConvert < handle
    properties
        figD;
        buttonA;
    end
    
    methods
      function obj = dataConvert()
            import uiextras.jTree.*
            obj.figD = figure('Name','Data Convert',...
                'MenuBar','none',...
                'Position',[400 400 300 100],...
                'Resize','off');
           obj.buttonA = uicontrol('Style','pushbutton',...
               'Position',[50 50 80 25],...
               'String','Browse file',...
               'Callback',@obj.browse);
      end   
      function browse(obj,varargin)
            [stmfile, stmpath] = uigetfile('*.txt', 'Select data file'); %select file to import
            delimiterIn = ' '; %specify delimiter
            headerlinesIn = 6; %Specify headerlines 
            filename = fullfile(stmpath, stmfile); %creating new file data
            DataIn = importdata(filename,delimiterIn,headerlinesIn); %Import the data
   
            %-- Code to filter Headerlines needed, for loop?
            [rownum,colnum]=size(DataIn.data);
            DataIn.colheaders = strsplit(DataIn.textdata{6,1}, ']')%not perfect yet but it grabs the headerlines and splits them up the correct way
             
            [filename, pathname] = uiputfile('*.mat','Save Workspace Variables As'); %select save name
            newfilename = fullfile(pathname, filename); %creating new file data
            save(newfilename, 'DataIn'); %saving file 
           
            close all;
      end
    end
end
