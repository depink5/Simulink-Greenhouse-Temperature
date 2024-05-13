%   THERMAL_MODEL_OF_A_GREENHOUSE_DATA
%   This script runs in conjunction with the "greenhouse" file

% -------------------------------
% Problem constant
% -------------------------------
% -------------------------------
% Define the greenhouse geometry
% -------------------------------
% 
%Lower part in meters
long_sides = 7.5 ; %there are 4 long_sides
short_sides1 = 2.25; %there are 2 short sides with this length
short_sides2 = 2.25; %there are 2 short sides with this length
door_len = 1.5;
door_sides_len = 3;
% House height = 3.375 m
htHouse = 3.375;
brick_ht = 1.125;
% Roof
%Triangular prism 1
base1 = 7.5;
len1 = 12;
height1 = 1.875;
side1 = 4.2;
%Triangular prism 2
base2 = 7.5;
len2 = 12;
height2 = 1.875; 
side2 = 4.2;
%Piramid
base3 = 7.5;
h = 1.875;

%Greenhouse volume
Volume_base=(htHouse*long_sides^2+4*long_sides*short_sides1*htHouse);
Volume_roof=((base1*height1/2)*len1 + (base2*height2/2)*len2 - ((base3^2 * h)/3));
Volume=Volume_base+Volume_roof;
% Areas
PCArea = (3*long_sides*(htHouse-brick_ht)+8*short_sides2*(htHouse-brick_ht)+ ...
    2*door_sides_len*(htHouse-brick_ht)+door_len*htHouse+2*long_sides*height1+ ...
    4*(short_sides2+(len1/2))*side1);
brickArea = (3*long_sides*brick_ht+2*door_sides_len*brick_ht+8*short_sides2*brick_ht);
    
% -------------------------------
% Define the type of insulation used
% -------------------------------
% Retak Brick  in the walls, 0.2624 m thick
% k is in units of KW/m/K
kBrick = 0.00012;   % hour is the time unit
LBrick = 0.2624;
RBrick = LBrick/(kBrick*brickArea);
% Polycarbonate walls, 0.06 m thick
kPC = 0.00021;  % hour is the time unit
LPC = .06;
RPC = LPC/(kPC*PCArea);
% -------------------------------
% Determine the equivalent thermal resistance for the whole building
% -------------------------------
Req = RBrick*RPC/(RBrick + RPC);
% c = cp of air (273 K) = 0.000279277778 kW*h/kg-K
%c = 1005.4; J/kg-K
c=0.000279277778;
% -------------------------------
% Enter the temperature of the heated air
% -------------------------------
% The air exiting the heater has a constant temperature which is a heater
% property. THeater = 47 deg C
THeater = 47;
%The air exiting the refrigeration system has a constant temperature which
%is a refrigerator
% property. TRefrigerator = 10 deg C
TRefrigerator = 10;
% Air flow rate Mdot = 1 kg/sec = 3600 kg/hr
Mdot = 3600;  % hour is the time unit
% -------------------------------
% Determine total internal air mass = M
% -------------------------------
% Density of air at sea level = 1.2250 kg/m^3
densAir = 1.2250;
M = Volume*densAir;
% -------------------------------
% Enter the cost of electricity and initial internal temperature
% -------------------------------
% Assume the cost of electricity is €0.12 per kilowatt/hour
% Assume all electric energy is transformed to heat energy
% cost = €0.12 kilowatt/hour
cost = 0.12;
% TinIC = initial indoor temperature = 20 deg C

