function Projectile()
%Input 
yi = input('The initial height of the projectile above the ground in meters (m): ');
v = input('The magnitude of the velocity in m/s: ');
A = input('The angle in degrees with respect to the +x-axis at which the projectile is fired: ');
ax = input('The acceleration in the x-component in m/s^2: ');
ay = input('The acceleration in the y-component in m/s^2: ');

if ay == 0
    error('Your acceleration in the y-component is invalid')
elseif A > 180 || A < 0
    error('Angle must be between 0 to 180 degrees')
else
    
%%%%%%%%%%%%%%CALCULATIONS

%FOR NON-IDEAL MOTION

%Velocity in x
vxi = v*cosd(A);
%Velocity in y
vyi = v*sind(A); 

%Time based on y
%Using y = vyi*t -(1/2)*ay*(t^2)where y = -yi
%Use quadratic formula to get the time 
a = -(1/2)*ay; %changed: negative
b = vyi;
c = yi;
%Get its roots
tfinal = roots([a, b, c]);
%Get only the positive time
tf = max(tfinal); 

%Create a time interval 0 - tf
t = linspace(0, tf,1000);

%x and y for plotting
x = vxi.*t+(1/2)*ax.*t.^2;
y = yi + vyi.*t-(1/2)*ay.*t.^2;%changed negative


%FOR IDEAL MOTION
%Same vxi and vyi
%Acceleration of y component is 9.8 and no acceleration for x component

%Time based on y
%Using y = vyi*t - (1/2)*g*(t^2) where y = -yi
%Use quadratic formula to get the time
aid = -4.9;
bid = vyi;
cid = yi;
%Get its roots
tfinalid = roots([aid, bid, cid]);
%Get only the positive time
tfid = max(tfinalid);

%Create a time interval 0 - tfied
tid = linspace(0,tfid,1000);

%xid and yid for plotting
xid = vxi.*tid;
yid = yi + vyi.*tid-4.9.*tid.^2;

%plotting for non ideal
subplot(1,2,1)
plot(x,y)
grid on
xlabel 'x distance (m)';
ylabel 'y distance (m)';
title 'For non-ideal projectile'
axis equal

%plotting for ideal
subplot(1,2,2)
plot(xid,yid)
grid on
xlabel 'x distance (m)';
ylabel 'y distance (m)';
title 'For ideal projectile'
axis equal

end