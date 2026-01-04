clear;clc
K1=0.5; K2=8;
Dmin=0.01;Dmax=500;
D2 = 0; D1 = Dmin * ((Dmax/Dmin).^(1/47)) .^(0:47);
load Ini_node10000_beta=0_K2=8_step=0.01.mat
K1flag=-1:0.1:5;
xIni(:)=xFFend(K1*10+11,:);
%%
for j=1:100
    for ii=1:length(D1)
        [r_mean(j,ii),r_evo(j,ii,:),~]=trail(K1,K2,D1(ii),D2,xIni,j);
        ii
    end
    toc

end
