% Initial poistion and velocity
x = 0;
v = 0;

t    = 0; % start time
dt   = 1; % time step
F    = 1; % force
m    = 1; % mass
nt   = 100; % total steps
vave = 0; % average velocity
tau  = 20;
ps   = 0.05;
% ps   = 1-exp(-dt/tau); % scattering probability formula

% Trial and error 
% x    = zeros(1,nt);
% v    = zeros(1,nt);
% vave = zeros(1,nt);
% t    = zeros(1,nt);


for i = 2:nt % start at 2 cause we have the first points for x and v
    
    % if it is less than or equal to the probablilty of scattering
    % make the velocity go to zero
    % else keep accelrating the electron
    if rand(1) <= ps
        v(i) = 0;
    else
        v(i) = (F/m)*dt + v(i-1);
    end
    vave(i) = mean(v);
    x(i)= (F/(2*m))*dt^2 + v(i-1)*dt + x(i-1);
    t(i) = t(i-1) + dt;
    
    subplot(3,1,1);
    hold on;
    plot(t,v,'b');
    plot(t,vave,'go');
    title(sprintf('Average v: %0.5f', vave(i)));
    xlabel('t');
    ylabel('v');

    subplot(3,1,2);
    hold on;
    plot(x,v,'r');
    plot(x,vave,'go');
    xlabel('x');
    ylabel('v');

    subplot(3,1,3);
    hold on;
    plot(t,x);
    xlabel('t');
    ylabel('x');
    
    pause(0.001)
end