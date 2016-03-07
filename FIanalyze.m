function FI=FIanalyze(data,timerange,threshold)

%first find voltages that exceed a certain threshold (here 0 mV)
%what is returned is indices where that is true (time points)


apthresh=find(data(timerange)>threshold);
%create two dummy variables findap1 and 2 that are 1 timepoint
%longer the the data so one can be shifted in time relative to
%the other
findap1=NaN(length(apthresh)+1,1);
findap2=NaN(length(apthresh)+1,1);
%put the data staggered by 1 data point in findap1 and 2
findap1(1:length(apthresh),1)=apthresh;
findap2(2:length(apthresh)+1,1)=apthresh;
%subtract findap1 and 2 to find timepoints that are
%discontinuous (i.e. where the subtraction is greater than 1
apdetect=findap1-findap2;
spikefind=find(apdetect>1);
%the number of discontinuitities should reflect the number of
%APs but we have to add 1 because this method always misses the
%first AP
FI=length(spikefind)+1;


end