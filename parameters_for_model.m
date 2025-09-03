%% Machine Parameters
%DELTA ECMA-KA1320SS
Pmax = 2000;       % Maximum power                      [W]
Tmax = 28.65;      % Maximum torque                     [N*m]
Ld   = 0.00024368; % Stator d-axis inductance           [H]?
Lq   = 0.00029758; % Stator q-axis inductance           [H]?
L0   = 0.00829;    % Stator zero-sequence inductance    [H]
Rs   = 0.57;       % Stator resistance per phase        [Ohm]
psim = 0.04366;    % Permanent magnet flux linkage      [Wb]?
p    = 10;         % Number of pole pairs                   ?
Jm   = 0.001459;   % Rotor inertia                      [Kg*m^2]
Imax = 19.98;      % Maximum current                    [A]
Wmax = 3000;       % Maximum speed                      [r/min]

%% High-Voltage System Parameters
Cdc  = 0.001;      % DC-link capacitor      [F]
Vnom = 220;        % Nominal DC voltage on bat [V]
V1   = 170;        % Voltage V1(< Vnom) 220-50 [V]
AH0  = 280;        % Initial battery charge [hr*A]

%% Control Parameters
Ts   = 5e-6;       % Fundamental sample time            [s]
fsw  = 10e3;       % PMSM drive switching frequency     [Hz]
Tsi  = 1e-4;       % Sample time for inner control loop [s]
Tso  = 1e-3;       % Sample time for outer control loop [s]

Kp_id = 0.6;     % Proportional gain id controller
Ki_id = 1300;     % Integrator gain id controller
Kp_iq = 0.6;     % Proportional gain iq controller
Ki_iq = 1050;     % Integrator gain iq controller

Kp_omega = 2.0;     % Proportional gain velocity controller
Ki_omega = 150;      % Integrator gain velocity controller

Kp_pos = 1.2;       % Proportional gain position controller
Ki_pos = 0;         % Integrator gain position controller
Kd_pos = 0;         % Derivative gain position controller
Kn_pos = 100;       % Filter coefficient

%% Zero-Cancellation Transfer Functions
numd_id = Tsi/(Kp_id/Ki_id);
dend_id = [1 (Tsi-(Kp_id/Ki_id))/(Kp_id/Ki_id)];
numd_iq = Tsi/(Kp_iq/Ki_iq);
dend_iq = [1 (Tsi-(Kp_iq/Ki_iq))/(Kp_iq/Ki_iq)];

numd_omega = Tso/(Kp_omega/Ki_omega);
dend_omega = [1 (Tso-(Kp_omega/Ki_omega))/(Kp_omega/Ki_omega)];