e=-1:0.01:1;
ne=2200;
% i1=input('i1=');
% i2=input('i2=');
% k1=input('k1=');
% k2=input('k2=');
% k3=input('k3=');
% k4=input('k4=');
i1=0.62;
i2=1;
k1=1.8;
k2=1.6;
k3=1.65;
k4=1.65;
% i3=1;
% nm=0:10:6000;
s1=(e.*ne)./(i1*i2*(1+k2));%Һѹģʽ
s2=((k1*e*ne)+k2*i1*i2*(1+k1)*ne)/((1+k2)*i1*i2*k1);%��Һģʽ
% s3=((e*ne)/(i1*i2)+k2*(((1+k1)*ne+nm/i3)/k1))/(1+k2);%ת�����ģʽ
x1=1;%C3�պϣ�����ɭ�����ٱ�
x2=(k4*(1+k3))/((1+k4)*k3-(1+k3));%B3�պϣ�����ɭ�����ٱȣ�ǰ��1
x3=-k4;%B4�պϣ�����ɭ�����ٱ�,���˻�Һ��ǰ��2
h1=s1/x1;
h2=s1/x2;
h3=s1/x3;
hm1=s2./x1;
hm2=s2./x2;
hm3=s2/x3;
% me1=s3/x1;
% me2=s3/x2;
% me3=s3/x3;
plot(e,h1);
hold on;
plot(e,h2);
hold on;
plot(e,h3);
hold on;
plot(e,hm1);
hold on;
plot(e,hm2);
hold on;
plot(e,hm3);
% hold on;
% plot(nm,me1);
% hold on;
% plot(nm,me2);
% hold on;
% plot(nm,me3);


