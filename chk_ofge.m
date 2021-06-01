%% Check OF_GE

clear;
clc;
close all;

zdps = [];
%ha = x(1); %helix angle
ha = 75.0922;
%bs = x(2); %baffle spacing
bs = 192.2498;

%% shell side fluid input
mhs = 234;
mts = 0.065; %mass velocity
tsin = 30.22;
tsout = 42.3;
dens = 0.02; %densitas
viss = 0.00927; %viscositas
kinviss = 0.0005106; %kinematic viscosity
cps = 6.842; %specific heat
ks = 0.019; %thermal conductivity
prs = 0.28700389; %prandtl number
rfs = 0.00035; %shell fouling factor

%% tube side fluid input
mht = 146.6;
mtt = 0.040722222; %mass velocity
ttin = 60.46;
ttout = 52.18;
dent = 980.1; %densitas
vist = 0.4599; %viscositas
kinvist = 0.00000046; %kinematic viscosity
cpt = 15.875; %specific heat
kt = 0.654; %thermal conductivity
prt = 0.01116347; %prandtl number
rft = 0.00018; %tube fouling factor

%% tube mechanical data
np = 2; %number of pass
nt = 6; %number of tubes
tle = 859; %tube effective length
do = 25.4; %tube outside diameter
dct = 20; %tube center diameter
ltw = 1; %tube thickness
di = 20; %tube inside diameter
tp = 45; %tube pitch

%% shell mechanical data
ds = 155; %shell inside diameter
dotl = 8.2; %outer tube bundle diameter
dctl = -17.2; %shell tube bundle diameter
nb = (tle/bs)-1;
sp = 6.4;
lts = 0.1*ds; %tubesheet thickness

%% shell side heat transfer coeffcient
acs = 0.5*(1-dct/ds)*bs*ds*(1-do/tp);
%ms = mts/(acs*10^-6);
ms = 10^6*mts/acs;
us = mts/(dens*(acs*10^-6));
reys = (us*(do/1000))/kinviss;
nus = 0.2*reys^0.6*prs^0.4;
hs = nus*ks/(do/1000);
ht = 54.80757043;
ktube = 38;
rw = 0.000026;
f = 0.226*reys^-0.206;
dps = 10^-3*(f*dens*cosd(ha)*(nb+1)*(us^2)*(ds/1000))/(2*(do/1000));
zdps = dps;

uo = 1/(1/hs+1/ht*(do/di)+rfs+rft*(do/di));