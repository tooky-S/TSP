function [HA,HB,H]=CalEne(spin,nStops,d,w)
HB=0;
for i=1:nStops
    for j=1:nStops
    s(i,j)=spin((i-1)*nStops+j);
    end
end
for i=1:1:nStops   
       Ha_1(i)=(sum(s(i,:))+nStops-2).^2;
end
for a=1:1:nStops
       Ha_2(a)=(sum(s(:,a))+nStops-2).^2;
end
HA= sum(Ha_1)+sum(Ha_2);
for a =1:1:nStops 
    for i = 1:1:nStops  % return to first city
       % for i=1:1:nStops-1 %do not return to first city
        s(i,nStops+1)=s(i,1);  
       for ip=1:1:nStops
        HB= HB+d(i,ip)*(s(i,a)+1)*(s(ip,a+1)+1)/4;
    end
end
H=HA+w*HB;
end