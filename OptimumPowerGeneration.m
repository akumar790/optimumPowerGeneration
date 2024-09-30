close all
clear all
clc
%Economic dispatch with quadratic costs 
%Quadprog needs min0.5*x'*H*x + f'x
f = [7; 8];
Aeq = [1 1;0 0];
beq = [0.8;0];
% 
% %use lower and upper bounds 
lb = [0.1 0.06]';
ub = [0.7 0.6]';
% 
[x fvalx, existflag, output, lambda] = linprog(f, [], [], Aeq, beq, lb, ub);
%https://www.sciencedirect.com/topics/mathematics/trace-of-a-matrix
x
%PLOT
P1=0:0.1:1;
P2=P1;
[X Y]=meshgrid(P1,P2);
% Z=7.*X+8.*Y;
% contour(X,Y,Z,80)
% xlim([0:0.1:2])
hold on 
P1(1:length(X),1)=0.7; %p1=0.7
plot(P1(:,1),Y(:,1))
hold on 
P1_2(1:length(X),1)=0.1; %p1=0.1
plot(P1_2(:,1),Y(:,1))
hold on 
P2(1:length(X),1)=0.6; %p2=0.6
plot(X(1,:),P2(:,1))
hold on 
P2_2(1:length(X),1)=0.06; %p1=0.06
plot(X(1,:),P2_2(:,1))
hold on 
XXX=-Y+0.8;
plot(XXX,Y(:,1))
%contour(X,Y,zzz)
% ylim([0 2])
xlim([0 1])
xlabel('P1')
ylabel('P2')
hold off