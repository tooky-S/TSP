
function J=CalJ(nStops,d,w)
%5nStops=2
%d=zeros(nStops,nStops);
%w=1
J=zeros(nStops*nStops,nStops*nStops);
for i =1:1:nStops
    for j=1:1:nStops
        I=(i-1)*nStops+j;
        for ip=1:1:nStops
            for jp=1:1:nStops
                Ip=(ip-1)*nStops+jp;
                J(I,Ip)=(i==ip);
                J(I,Ip)= J(I,Ip)+(j==jp);
              if (jp==j-1)||(jp==nStops&&j==1)
                 J(I,Ip)=J(I,Ip)+0.5*w*d(i,ip)/4;
              elseif (jp==j+1)||(jp==1&&j==nStops)
                 J(I,Ip)=J(I,Ip)+0.5*w*d(ip,i)/4;
              end
              end
            end
        end
    end
end
