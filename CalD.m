function d=CalD(data) 
stopsLon=data(:,2)';
stopsLat=data(:,3)';
nStops=length(stopsLon);
for i = 1:1:nStops
    for j=1:1:nStops
    d(i,j) = hypot(stopsLat(i) - stopsLat(j), stopsLon(i) - stopsLon(j));
    end
end
%d=[d d(:,1)];
%d=[d; d(1,:)];
end
