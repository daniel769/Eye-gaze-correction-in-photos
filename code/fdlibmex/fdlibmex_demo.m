% ---------------------------------------------------------------------
% fdlibmex_demo.m
%
% illustrates the usage of the fdlibmex face detection library by
% two examples
%

clear all
close all

% set mex file path for this platform ..
addpath(lower(computer));

% call without arguments to display help text ...
fprintf('\n--- fdlibmex help text ---\n');
fdlibmex

% load an example image
%imgfilename = 'judybats.jpg';
%imgfilename = 'angelina_jolie.jpg';
imgfilename = 'frontal_view_model.jpg';
img = imread(imgfilename);
img = rgb2gray(img);

% run the detector
pos = fdlibmex(img);

% display the image
imagesc(img)
colormap gray
axis image
axis off

% draw red boxes around the detected faces
hold on
for i=1:size(pos,1)
    r = [pos(i,1)-pos(i,3)/2,pos(i,2)-pos(i,3)/2,pos(i,3),pos(i,3)];
    rectangle('Position', r, 'EdgeColor', [1,0,0], 'linewidth', 2);
end
hold off

% show stats
fprintf('\n--- fdlibmex example ---\n');
fprintf('\n\t%d faces detected in \''%s\'' (see figure 1)\n\n', ...
    size(pos,1), imgfilename);
