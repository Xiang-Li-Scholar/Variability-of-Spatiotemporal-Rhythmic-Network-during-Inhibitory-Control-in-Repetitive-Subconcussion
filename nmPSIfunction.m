
function nmPSI=nmPSIfunction(lowfrequencydata,highfrequencydata,n,m)

phase_low=angle(hilbert(lowfrequencydata)); 
phase_high=angle(hilbert(highfrequencydata)); 
phasediff=m*phase_low-n*phase_high; 
nmPSI =abs(mean(exp(1i*phasediff))); 

end