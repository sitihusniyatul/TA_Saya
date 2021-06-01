%GENETIC ALGORITHM%
%Pembangkitan Populasi dan Parameter

%% Bersihkan
close all;
clear;
clc;

%% Variabel awal
global uo;
Dimension = 2; % dimensi diganti sesuai dengan jumlah variabel yang dioptimasi
UB = [80 210]; % Upper Bounds diganti sesuai dengan constraint fungsi objektif
LB = [60 190]; % Lower Bounds diganti sesuai dengan constraint fungsi objektif
Npop = 500; %populasi
Maxit = 400; %iterasi
el = 0.95; %elatism
Pc = 0.8; %probabilitas crossover
Pm = 0.001; %probabilitas mutasi
Nbit = 18; %jumlah bit

%% Constrain
eBangkit = [];
Individu = [];
eIndividu = [];
david = [];
Dadatfit = [];
Datfit = [];
summary = [];
eDadatfit = [];
efitnessmax = [];
eIndividuMax = [];
Bangkit = round(rand(Npop,Nbit*Dimension));
popsize = size(Bangkit,1);

%% Pembangkitan populasi loop

for i = 1:Dimension
    batas(i) = UB(i)-LB(i);
end
for i =1:Npop
    for j = 1:Dimension
        Desimal(i,j) = bi2de(Bangkit(i,((j*Nbit)-(Nbit-1)):(j*Nbit)),'left-msb');
        Individu(i,j) = (Desimal(i,j)*batas(:,j)-batas(:,j)+LB(:,j)*(2^Nbit-1))/(2^Nbit-1);
    end
end

%% Data Fit pertama
Datfit = [];
variabel = [];
for i = 1:size(Individu,1)
    fitness = OF_HE(Individu(i,:));
    Datfit = [Datfit;fitness];
    [fitemax,nmax]=max(Datfit);
end