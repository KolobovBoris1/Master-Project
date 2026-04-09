%% High-Voltage System Parameters
Cdc  = 0.001;      % DC-link capacitor      [F]
Vnom = 300;        % Nominal DC voltage on bat [V]
V1   = 250;        % Voltage V1(< Vnom)        [V]
AH0  = 280;        % Initial battery charge [hr*A]

%% Machine Parameters
%Inn MS1H2-40C30CD-A334Z-S4-INT
Pmax = 2111;
% Pmax = 4000;      % Maximum power                      [W]
Tmax = 33.6;
% Tmax = 37.8;      % Maximum torque                     [N*m]
Ld   = 0.00595;   % Stator d-axis inductance           [H]
Lq   = 0.00595;   % Stator q-axis inductance           [H]
% Ld = 0.0050;      % Stator d-axis inductance           [H]?
% Lq = 0.0075;      % Stator q-axis inductance           [H]?
L0   = 0;         % Stator zero-sequence inductance    [H]?
Rs   = 1.02;      % Stator resistance per phase        [Ohm]
p = 4;
% p    = 10;        % Number of pole pairs                   
Jm = 0.001368;
% Jm   = 0.00146;   % Rotor inertia                      [Kg*m^2]
Imax = 27.5;
Inom = 9.15;
% Imax = 40.8;      % Maximum current                    [A]
% Inom = 13.6;      % Nominal current                    [A]
Wmax = 7000;
% Wmax = 5000;      % Maximum speed                      [rpm]
Wnom = 1800;
% Wnom = 3000;      % Nominal speed                      [rpm]
Red = 34.68;      % Reducer ratio
RedTrq = 4.910;   % Reducer torque ratio               [Nm]

fn = (Wmax * p)/60;    % frequency for engine operation at rated speed [Hz]
psim = 0.180694733685904;
% psim = 1.1*((Vnom*sqrt(2))/(2*3.14*fn));  % Permanent magnet flux linkage  [Wb]

%% Control Parameters
Ts   = 5e-5;           % Fundamental sample time                [s]
fsw = 1 / (Ts * 20);   % PMSM drive switching frequency         [Hz]
Tsi = Ts * 20;         % Sample time for inner control loop     [s]
Tso = Ts * 200;        % Sample time for outer control loop     [s]
Clock_fcn = Ts / 0.1;  % Clock for Time managment               [s]
RT_Time = Ts / 0.05;   % Rate Transition Time                   [s]

Kp_id = 0.01;           % Proportional gain id controller 0.01
Ki_id = 3;              % Integrator gain id controller 3
Kaw_id = 100; %1000
Kp_iq = 1.8;              % Proportional gain iq controller 2
Ki_iq = 20;             % Integrator gain iq controller 80
Kaw_iq = 1; %90

Kp_omega = 0.6;        % Proportional gain velocity controller 0.8
Ki_omega = 2.2;        % Integrator gain velocity controller 2.2
Kaw_omega = 1;         % Integral anti-windup gain 100
P_omega = 1.1;         % P controller proportional gain 

deg = 10;              % Degrees for link                       [deg]
% Vref = 5;              % Velocity PTP                           [deg/s]
% Tpos = deg / Vref;     % Time to move                           [s]
% Vrpm_ref = Vref / 6;   % Velocity PTP                           [rpm]

Kp_pos = 0.8;          % Proportional gain position controller 1.2
% Убрано, так как регулятор является пропорциональным
% Ki_pos = 0.01;         % Integrator gain position controller 0.01
% Kd_pos = 0;            % Derivative gain position controller 0
% Kn_pos = 100;            % Filter coefficient 1

%% Timers for autotune
Tiq_start = 0.02;
Tiq_stop = Tiq_start + 0.06;

Tid_start = Tiq_stop + 0.02;
Tid_stop = Tid_start + 0.04;

Tomega_start = Tid_stop + 0.02;
Tomega_stop = Tomega_start + 0.06;

Tpos_start = Tomega_stop + 0.02;
Tpos_stop = Tpos_start + 0.06;

%% Limits
% Limits of joints
LimA2down = -80;      % Minimum limit for joint 2                [deg] 
LimA2up = 64;         % Maximum limit for joint 2                [deg]

% %% Zero-Cancellation Transfer Functions
% numd_id = Tsi/(Kp_id/Ki_id);
% dend_id = [1 (Tsi-(Kp_id/Ki_id))/(Kp_id/Ki_id)];
% numd_iq = Tsi/(Kp_iq/Ki_iq);
% dend_iq = [1 (Tsi-(Kp_iq/Ki_iq))/(Kp_iq/Ki_iq)];

[Link2, ArmInfo] = importrobot ('Link2');