
function PPC=PPCfunction(lowfrequencydata,highfrequencydata,n,m)

phase_low=angle(hilbert(lowfrequencydata)); 
phase_high=angle(hilbert(highfrequencydata)); 
phasediff=m*phase_low-n*phase_high; 
PPC=abs(mean(exp(1i*phasediff))); 

end