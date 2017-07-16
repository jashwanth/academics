Ra = 0.5      %(ohm)        Terminal Resistance
La = 1.5e-3   %(H) 	        Terminal Inductance 
Kt = 0.01     %(Nm/A)       Torque Constant 	
Jeq = 0.025   %(Nm/rad/s^2) Motor and load Inertia
Beq = 0.0001  %(Nm/rad/s)   Friction coefficient
Kb = 0.05     %(V/rad/s)    Speed Constant

K  = (Kt/Ra)*(1/(Kb+Beq))  % Gain
K1 = (1/(Kb+Beq))          % Gain1
T  = (Jeq/(Kb+Beq))        % Time Constant