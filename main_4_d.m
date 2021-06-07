clear;
load TspDataLib.mat   % burma14; ulysses16
rng(1)
nstop=9;
data=burma14(1:nstop,:,:); %choose TSP dataset
stopsLon=data(:,2)';
stopsLat=data(:,3)';


%nstop=length(stopsLon);
%d=zeros(nstop,nstop);
d=CalD(data);
w=0.75;
J = CalJ(nstop,d,w);
J = J + eye(nstop*nstop)*(-5);


for i=1:nstop*nstop
h(i,1) = -4*(2-nstop)+0.5*w*sum(d(ceil(i/nstop),:));
end

temp= 2;

nstep = 10001;
spin = zeros(nstop*nstop, nstep);
%spin(:,1) = [ 1 -1 1 1 -1 1 1 1 1]';
spin(:,1)=rand(nstop*nstop,1);

for ii=2:nstep
   II = (2*J*spin(:,ii-1) + h)/temp;
   for n=1:nstop*nstop
       spin(n, ii) = fun_update(II(n));
   end
   [HA(1,ii),HB(1,ii),H(1,ii)]=CalEne(spin(:,ii),nstop,d,w);
end

%plot(spin(1,nstep-1000:nstep), 'r-o'); hold on;
%plot(spin(2,nstep-1000:nstep), 'b-*'); hold on;
%plot(spin(3,nstep-1000:nstep), 'k-^'); hold on;
%plot(spin(4,nstep-1000:nstep), 'y-'); hold on;
%plot(spin(5,nstep-1000:nstep), 'r-o'); hold on;
%plot(spin(6,nstep-1000:nstep), 'b-*'); hold on;
%plot(spin(7,nstep-1000:nstep), 'k-^'); hold on;
%plot(spin(8,nstep-1000:nstep), 'y-'); hold on;
%plot(spin(9,nstep-1000:nstep), 'y-'); hold on;
%axis([0 1000 -1.2 1.2])
figure(1)
ind=find(HA==0);
plot(HA(ind)),hold on
plot(HB(ind))
figure(2)
plot(HA),hold on
plot(HB),hold on
