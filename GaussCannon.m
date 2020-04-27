e = 2.7183; %Euler

%Ecuaciones de circuito RC
Vc = input("Ingrese el voltaje inicial en voltios: "); %Voltaje del capacitor
R = input("Ingrese la resistencia de la bobina en ohmios: "); %Resistencia de la bobina
C = input("Ingrese la capacitancia en nano faradios: ");%Capacitancia 
C = C*10^(-9);

t1 = 5*R*C; %Tiempo de descarga del capacitor
disp("Tiempo de descarga del capacitor:");
disp(t1);

I = (Vc/R)*e^(-t1/(R*C)); %Corriente del circuito RC
disp("Corriente:");
disp(I);

%Variables de Solenoide
u = 4*pi*10^(-7); %Permeabilidad magnética
N = input("Ingrese el numero de espiras: "); %Numero de espiras
A = input("Ingrese el area del solenoide en metros: "); % Area del soleniode
L = input("Ingrese la longitud del soleniode en metros: "); %Longitud del solenoide
M = input("Ingrese la masa del proyectil en kilogramos: "); %Masa del proyectil

%Ecuacion general de la velocidad inicial en función del circuito y el solenoide 
v0 = (u*N^(2)*I^(2)*A)/(2*L^(2)*M);

disp("Velocidad inicial: ");
disp(v0);

%Ecuaciones cinemáticas
theta = input("Ingrese el angulo de inclinación: ");
x0 = input("Ingrese la posicion inicial en x: ");
y0 = input("Ingrese la posicion inicial en y: ");

%velocidad
vx = v0*cosd(theta); %En x
vy = v0*sind(theta); %En y


tmax = 2*v0/9.8;%Tiempo de vuelo

xmax = v0^(2)*sind(2*theta)/9.8;%Recorrido maximo horizontal

%Posicion
%x = x0 + vx*t; %En x
%y = y0 + vy*t - 4.9*t.^(2); %En y

%Gráfico x vs t
for i = 0: 0.05: tmax
    hold on;
    x = x0 + vx*i;
    figure(1), plot(i,x,'r*'), title('Grafica x vs t'), xlabel('t[s]'), ylabel('x[m]');
end

pause(5);

%Gráfico y vs t
for i = 0: 0.05: tmax
    hold on;
    y = y0 + vy*i - 4.9*i^(2);
    figure(2), plot(i,y,'k*'), ylim([0 5]), title('Grafica y vs t'), xlabel('t[s]'), ylabel('y[m]');
    if(y < 0)
        break;
    end
end

pause(5);


%Gráfico x vs y
for i = 0: 0.1:xmax
    y2 = y0 + vy*((i-x0)/vx) - 4.9*(((i-x0)/vx)).^(2);
    hold on;
    pause(0.01);
    figure(3), plot(i,y2,'r*'), ylim([0 xmax]), title('Grafica x vs y'), xlabel('x[m]'), ylabel('y[m]');
    
end