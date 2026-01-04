function [r_mean,r,x_history]=trail(K1,K2,D1,D2,xIni,jjj)
rng(jjj,'twister');

N_nod=10000;

T_sim=10000; T0=10000; T_tot=T_sim+T0; step=0.01;
time=step:step:T_tot;  Nt=round(T_tot/step);

x_history=0;

w0=0; [w]=Lorentzian_distribution(w0,N_nod);
r(1:Nt)=0;

x0=xIni;


for i=1:Nt

    ran=rand(1,4);
    xi1=sqrt(-4.0*D1*step.*log(ran(1))).*cos(2.0*pi.*ran(2));
    xi2=sqrt(-4.0*D2*step.*log(ran(3))).*cos(2.0*pi.*ran(4));

    z1=mean(exp(1i*x0)); z1c=conj(z1); z2=mean(exp(2i*x0));

    x=x0 + step*( w + K1*imag(z1.*exp(-1i*x0)) + K2*imag(z2*z1c*exp(-1i*x0)) )...
        + xi1* imag(z1*exp(-1i*x0)) + xi2*imag(z2*z1c*exp(-1i*x0));
    x0=x;

    
    r(i)=abs(mean(exp(1i*x)));
end
r_mean=mean(r(round(T0/step):end));

