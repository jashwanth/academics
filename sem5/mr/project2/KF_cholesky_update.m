function [x,P]= KF_cholesky_update(x,P,v,R,H)
%function [x,P]= KF_cholesky_update(x,P,v,R,H)
% x = 3*1,P=3*3 v = 2*1;R=2*2;H=2*3; 
% Calculate the KF (or EKF) update given the prior state [x,P]
% the innovation [v,R]( v is measurment error mean) and the (linearised) observation model H.
% The result is calculated using Cholesky factorisation, which
% is more numerically stable than a naive implementation.
%
% Tim Bailey 2003
% Developed by Jose Guivant 

PHt= P*H'; % 3*2
S= H*PHt + R; % R = Q measurement noise 2*2

S= (S+S')*0.5; % make symmetric 2*2
SChol= chol(S);  % 2*2

SCholInv= inv(SChol); % triangular matrix
W1= PHt * SCholInv; % 3*2
W= W1 * SCholInv'; %kalman gain 3*2

x= x + W*v; % update  3*1
P= P - W1*W1';
%bel^ update to bel state