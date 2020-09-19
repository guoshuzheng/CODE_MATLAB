function demoDisplay
clear
clc
close all;
[x,y,z] = hear;
bottomZ = min(z(:));
radius = abs(bottomZ);
axis vis3d
axis off
daspect([1.6, 1, 1.875]);
hold on;
markerColor = [0.5, 0.5, 0.5];
lineColor = [0.7, 0.7, 0.7];
figWidth = 800
figHeight = 600;
screenSize = get(0, 'ScreenSize');
X0 = (screenSize(3)-figWidth)/2;
Y0 = (screenSize(4)-figHeight)/2;
set(gcf, 'Position', [X0,Y0, figWidth, figHeight]);
camtarget([0, 0, 0]);
set(gcf,'Renderer','zbuffer');
set(gcf,'DoubleBuffer','on');
% RGB(255 105 180) is for pink color
set(gcf, 'color', [255 105 180]/255);
startAZ = 30;
satrtEL = 20;
view(startAZ, satrtEL);
% draw points
for iLoop = 1:size(x, 1)
plot3(x(iLoop, :), y(iLoop,:), z(iLoop, :), 'Marker', '.', 'MarkerEdgeColor', markerColor, 'LineStyle', 'none');
pause(0.2);
end
% draw wire frames
for iLoop = 1:size(x, 1)
plot3(x(iLoop, :), y(iLoop,:), z(iLoop, :), 'color', lineColor, 'LineStyle', '-');
pause(0.1);
end
for iLoop = 1:size(x, 2)
plot3(x(:, iLoop), y(:, iLoop), z(:, iLoop), 'color', lineColor, 'LineStyle', '-');
pause(0.1);
end
% rotate wire frame
for i=1:36
camorbit(10,0,'data');
pause(0.1);
end
% clean the curent axes
delete(get(gca, 'Children'));
camlight left;
newLineColor = [0.7, 0.4, 0.4];
% re-draw the whole heart with surf function
h = surf(x,y,z, 'EdgeColor', newLineColor, 'FaceColor', 'r');
for i=1:36
camorbit(10,0,'data');
pause(0.1);
end
mediumColor = [0.8, 0.3, 0.3];
set(h, 'EdgeColor', mediumColor,'FaceLighting','gouraud');
for i=1:36
camorbit(10,0,'data');
drawnow;
end
set(h, 'EdgeColor', 'none');
drawnow;
% define the Z-path for heart re-shape
deltaZ = linspace(-.3, 0, 5);
deltaZ = [fliplr(deltaZ), deltaZ];
deltaZ = repmat(deltaZ, 1, 3);
zlim('manual');
for iLoop = 1:length(deltaZ)
% draw the bouncing heart
curDeltaZ = deltaZ(mod(iLoop,length(deltaZ))+1);
ratio = (radius+curDeltaZ)*radius;
newZ = z*ratio + curDeltaZ;
if exist('h', 'var')&& ishandle(h), delete(h);end;
h = surf(x,y, newZ, 'EdgeColor', 'none', 'FaceColor', 'r','FaceLighting','gouraud');
camorbit(-1, 0, 'data');
drawnow;
end
% draw the bouncing heart
deltaZ = generateSimulatedBouncingPath;
zlim([-1, 3]);
for iLoop = 1:length(deltaZ)
if exist('h', 'var')&& ishandle(h), delete(h);end;
curDeltaZ = deltaZ(iLoop);
if curDeltaZ < 0
% when deltaZ is under the zero bar, it's hitting the ground
ratio = (radius+curDeltaZ)*radius;
newZ = z*ratio + curDeltaZ;
else
% when deltaZ is bigger than zero, it's a free object
newZ = z + curDeltaZ;
end
h = surf(x, y, newZ, 'EdgeColor', 'none', 'FaceColor', 'r','FaceLighting','gouraud');
% zoom in and out for more vivid effect
if iLoop <= length(deltaZ)/2
camzoom(0.99);
else
camzoom(1.005);
end
camorbit(390/length(deltaZ), 0, 'data');
drawnow;
end
text(0.3,2.4, 'love','FontSize',25,'FontName','Times New Roman')%%%%%%%
text(0.3,1.8, 'you','FontSize',30,'FontName','Times New Roman')%%%%%%%
end
function z = generateSimulatedBouncingPath(iterationNum, roundTimes)
% define the z path of the center of ball for rountTimes of bouncing along z-axis
if nargin < 2
roundTimes = 3;
end
if nargin < 1
iterationNum = 40;
end
radius = 1;
deltaH = 1.5; % the highest point comapred with radius
deltaL = -0.3;% the lowest point comapred with radius
rangeY = [-2, 1];
% gravity accelerator constant
% Note: this is smaller to the real 9.8 value, but this makes the bouncing slower
g = 5;
% define the accelerator for the z < 0
% k is similar to spring coefficient, but it's more complicated than that.
% k just needs to satisfy one condition here, i.e. it will stop at location defined by
% deltaL*radius
k = g * deltaH/(-deltaL);
% start point
startZ = deltaH*radius;
% speed when z =0
V0 = sqrt(2*startZ*g);
% calcualte the total time for rountTimes of bouncing
% time for z > 0
plusZtime = sqrt(2*deltaH*radius/g);
% time for z < 0
minusZtime = sqrt(-2*deltaL*radius/k);
% half period
qPeriod = plusZtime + minusZtime;
% define totalTime
qPeriodTime = linspace(0, qPeriod, iterationNum);
% z path when z > 0
zPlus = startZ - 0.5 * g * qPeriodTime(qPeriodTime<plusZtime).^2;
% z path when z < 0
zMinus = -V0 * (qPeriodTime(qPeriodTime >=plusZtime)-plusZtime) + 0.5 * k* (qPeriodTime(qPeriodTime >=plusZtime)-plusZtime).^2;
z = [zPlus, zMinus, fliplr(zMinus), fliplr(zPlus)];
% the last zPlus is for the stop action
z = [repmat(z, 1, roundTimes), zPlus];
y = linspace(rangeY(1), rangeY(2), numel(z));
end
function [cordX, cordY, cordZ] = hear(sizeTheta, sizeFai)
if nargin ==0
sizeTheta = 30;
sizeFai = 40;
elseif nargin < 2
error('heart:NotEnoughArugments', 'Please give at least two input arugments');
end;
theta = linspace(0, pi, sizeTheta)';
nudge = 0.0001; % used to avoid the operlapping
fai = linspace(0 + nudge, pi/2 - nudge, round(sizeFai/4));
a = 9/4;
b = 9/80;
A = 1+(a-1)*(sin(theta).^2) * (sin(fai).^2);
B = (sin(theta).^2.*cos(theta).^3) * (1 + (b-1)*(sin(fai).^2));
rou = zeros(size(A));
for iLoop = 1:numel(A);
curA = A(iLoop);
curB = B(iLoop);
% this is the polar coordinates version of the sextic equation found on
% http://mathworld.wolfram.com/HeartSurface.html
polyFactors = [curA^3, -curB, -3*curA^2, 0, 3*curA, 0, -1];
solutions = roots(polyFactors);
realRou = real(solutions(abs(imag(solutions))< 1e-9));
rou(iLoop) = realRou(realRou>0);
end
% x,y,z for the quater of whole heart
x = rou .* (sin(theta) * cos(fai));
y = rou .* (sin(theta) * sin(fai));
z = rou .* (cos(theta) * ones(size(fai)));
% x,y,z for the whole heart
cordX = [x, -fliplr(x) , -x, fliplr(x)];
cordY = [y, fliplr(y) , -y, -fliplr(y)];
cordZ = [z, fliplr(z), z, fliplr(z)];
end