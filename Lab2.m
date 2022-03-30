% Relaxed
n=3;
 
% find a random representative section of your data
front_cut1 = 0*(dataend(n)-datastart(n));
% 10 seconds worth of data
duration = 6000;
 
bi_raw1 = data(datastart(n)+front_cut1:datastart(n)+front_cut1+duration);
ptime = [0:duration]/samplerate(ch,bl);
 
% Squeezing
% relation to the subplots that LabChart outputs
n=3;
 
% find a random representative section of your data
front_cut2 = 1*(dataend(n)-datastart(n))/4;
% 10 seconds worth of data
duration = 6000;
 
bi_raw2 = data(datastart(n)+front_cut2:datastart(n)+front_cut2+duration);
ptime = [0:duration]/samplerate(ch,bl);
 
figure
plot(ptime, bi_raw1,'b')
hold on
plot(ptime, bi_raw2,'r')
xlabel("Time (s)")
ylabel("Voltage (mV)")
xlim([0,6])
ylim([-0.5e-3,0.5e-3])
legend("Marta Relaxed", "Marta Squeezing")



%% FIGURE 2
 
n = 3;
% 10 seconds worth of data
duration = 4000;

%% Daloria's Lying Down Data 
% representative section of data
frontcutD = 2*(dataend(n) - datastart(n))/3;
lyingdownD = data(datastart(n) + frontcutD:datastart(n) + frontcutD + duration);
ptimeD = (0:duration)/samplerate(ch,bl);
%% Marta's Lying Down Data
% representative section of data
frontcutM = 2*(dataend(n) - datastart(n))/3;
lyingdownM = data(datastart(n) + frontcutM:datastart(n) + frontcutM + duration);
ptimeM = (0:duration)/samplerate(ch,bl);
%% Sarah's Lying Down Data
% representative section of data
frontcutS = 2*(dataend(n) - datastart(n))/3;
lyingdownS = data(datastart(n) + frontcutS:datastart(n) + frontcutS + duration);
ptimeS = (0:duration)/samplerate(ch,bl);
 
%% Plot the Lying Down Data
figure(2)
plot(ptimeD,lyingdownD)
hold on 
plot(ptimeM,lyingdownM)
hold on
plot(ptimeS,lyingdownS)
xlabel('Time (s)')
ylabel('Voltage (mV)')
legend('Daloria',  'Marta',  'Sarah')
hold on
%End of Fig 2


%% ECG resting position
n=3;
duration = 10000;
%% Sitting D
front_cutD = 2*(dataend(n)-datastart(n))/3;
SittingD = data(datastart(n)+front_cutD:datastart(n)+front_cutD+duration);
ptimeD = [0:duration]/samplerate(ch,bl);
 
%% Sitting M
front_cutM = 2*(dataend(n)-datastart(n))/3;
SittingM = data(datastart(n)+front_cutM:datastart(n)+front_cutM+duration);
ptimeM = [0:duration]/samplerate(ch,bl);
 
%% Sitting S
front_cutS = 2*(dataend(n)-datastart(n))/3;
SittingS = data(datastart(n)+front_cutS:datastart(n)+front_cutS+duration);
ptimeS = [0:duration]/samplerate(ch,bl);
 
%% Plotting
 
figure
plot(ptimeD, SittingD,'b')
hold on
plot(ptimeM, SittingM,'r')
hold on
plot(ptimeS, SittingS,'k')
hold on
xlim([0,10])
ylim([-0.4e-3,1e-3])
xlabel("Time (s)")
ylabel("Voltage (mV)")
legend("Daloria", "Marta", "Sarah")



%% FIGURE 4
 
%% Daloria's Sitting Data 
% representative section of data
frontcutD2 = 2*(dataend(n) - datastart(n))/3;
sittingD = data(datastart(n) + frontcutD2:datastart(n) + frontcutD2 + duration);
ptimeD2 = (0:duration)/samplerate(ch,bl);
%% Daloria's Standing Data 
% representative section of data
frontcutD3 = 2*(dataend(n) - datastart(n))/3;
standingD = data(datastart(n) + frontcutD3:datastart(n) + frontcutD3 + duration);
ptimeD3 = (0:duration)/samplerate(ch,bl);
 
%% Plotting Daloria's Data from the 3 Rest Positions
figure(4)
plot(ptimeD, lyingdownD)
hold on 
plot(ptimeD, sittingD)
hold on
plot(ptimeD, standingD)
xlabel('Time (s)')
ylabel('Voltage (mV)')
legend('Lying Down', 'Sitting', 'Standing')
%End of Fig 4


%% TABLE 1 
 
%% Daloria
% check to see what min value her peaks actually occur at
% plot(ptimeD, lyingdownD)
% hold on
[peaksD,timePeaksD] = findpeaks(lyingdownD, ptimeD, 'MinPeakHeight', 2.5*(10^-4));
 
% create an array of zeros to store our peak heights and times
peaksDreal = zeros(1,11);
timePeaksDreal = zeros(1,11);
j = 0;
 
% finding the actual peaks of the QRS (since she has a high T wave as well) 
for i = 1:2:length(peaksD)    
    j = j + 1;
    peaksDreal(j) = peaksD(i);
    timePeaksDreal(j) = timePeaksD(i); 
end

% check that we got the right peaks
% plot(timePeaksDreal, peaksDreal, 'o')
 
% array of zeros to store our RR intervals
RRspacingD = zeros(1,10);
 
% iterate over the length of time of peaks starting at 2 to calc RR intervals
for i = 1:length(timePeaksDreal) - 1
    RRspacingD(i) = timePeaksDreal(i+1) - timePeaksDreal(i);
end
 
% avg RR interval length (in seconds)
RRspacingDavg = mean(RRspacingD);
% avg bpm
bpmDavg = 60/RRspacingDavg;
 
% max RR interval
RRspacingDmax = max(RRspacingD);
% min bpm
bpmDmin = 60/RRspacingDmax;
 
 
% min RR interval
RRspacingDmin = min(RRspacingD);
% max bpm
bpmDmax = 60/RRspacingDmin;
 
% stdev RR interval (in seconds)
RRspacingDstdev = std(RRspacingD);
% stdev bpm
bpmDstdev = 60 * RRspacingDstdev;
 
Daloria = [bpmDavg; bpmDmin; bpmDmax; bpmDstdev];

%% Marta
% check to see what min value her peaks actually occur at
% plot(ptimeM, lyingdownM)
[peaksM,timePeaksM] = findpeaks(lyingdownM, ptimeM, 'MinPeakHeight', 3.5*(10^-4));
 
% array of zeros to store our RR intervals
RRspacingM = zeros(1,9);
 
% iterate over the length of peaktime starting at 2 to calc RR intervals
for i = 1:length(timePeaksM) - 1
    RRspacingM(i) = timePeaksM(i+1) - timePeaksM(i);
end
 
% avg RR interval length (in seconds)
RRspacingMavg = mean(RRspacingM);
% avg bpm
bpmMavg = 60/RRspacingMavg;
 
% max RR interval
RRspacingMmax = max(RRspacingM);
% min bpm
bpmMmin = 60/RRspacingMmax;
 
% min RR interval
RRspacingMmin = min(RRspacingM);
% max bpm
bpmMmax = 60/RRspacingMmin;
 
% stdev RR interval (in seconds)
RRspacingMstdev = std(RRspacingM);
% stdev bpm
bpmMstdev = 60 * RRspacingMstdev;
 
Marta = [bpmMavg; bpmMmin; bpmMmax; bpmMstdev];

%% Sarah
% check to see what min value her peaks actually occur at
% plot(ptimeS, lyingdownS)
[peaksS,timePeaksS] = findpeaks(lyingdownS, ptimeS, 'MinPeakHeight', 1.5*(10^-4), 'MinPeakDistance',.5);
 
% array of zeros to store our RR intervals
RRspacingS = zeros(1,13);
 
% iterate over the length of peaktime starting at 2 to calc RR intervals
for i = 1:length(timePeaksS) - 1
    RRspacingS(i) = timePeaksS(i+1) - timePeaksS(i);
end
 
% avg RR interval length (in seconds)
RRspacingSavg = mean(RRspacingS);
% avg bpm
bpmSavg = 60/RRspacingSavg;
 
% max RR interval
RRspacingSmax = max(RRspacingS);
% min bpm
bpmSmin = 60/RRspacingSmax;
 
 
% min RR interval
RRspacingSmin = min(RRspacingS);
% max bpm
bpmSmax = 60/RRspacingSmin;
 
% stdev RR interval (in seconds)
RRspacingSstdev = std(RRspacingS);
% stdev bpm
bpmSstdev = 60 * RRspacingSstdev;
 
Sarah = [bpmSavg; bpmSmin; bpmSmax; bpmSstdev];

%%
% table for the data values
T = table(Daloria, Marta, Sarah)
T.Properties.RowNames = {'Average BPM', 'Min BPM', 'Max BPM', 'STDEV BPM'}
%End of Table 1
%% Table 2
%% Finding peaks standing
n=3;
duration = 10000;
%% Daloria standing
front_cutD = 2*(dataend(n)-datastart(n))/3;
StandingD = data(datastart(n)+front_cutD:datastart(n)+front_cutD+duration);
ptimeD = [0:duration]/samplerate(ch,bl);
 
%% Marta standing
front_cutM = 2*(dataend(n)-datastart(n))/3;
StandingM = data(datastart(n)+front_cutM:datastart(n)+front_cutM+duration);
ptimeM = [0:duration]/samplerate(ch,bl);
 
%% Sarah standing
front_cutS = 2*(dataend(n)-datastart(n))/3;
StandingS = data(datastart(n)+front_cutS:datastart(n)+front_cutS+duration);
ptimeS = [0:duration]/samplerate(ch,bl);
 
%% Daloria standing peaks
plot(ptimeD, StandingD)
hold on
[PeaksD, timePeaksD] = findpeaks(StandingD, ptimeD, 'MinPeakHeight',2.5e-4);
plot(timePeaksD, PeaksD,'o')
 
%Finding right peaks for Daloria
PeaksDright = zeros(1,14);
timePeaksDright = zeros(1,14);
j = 0;
 
%finding the actual peaks of the QRS (since she has double peaks :( bad heart) 
for i = 1:2:length(PeaksD)    
    j = j + 1;
    PeaksDright(j) = PeaksD(i);
    timePeaksDright(j) = timePeaksD(i); 
end
 
%plot(timePeaksDright,peaksDright,'o')
 
%array of zeros to store our RR intervals
RRspacingD = zeros(1,13);
%first value in the array is peaktime(1) - 0
%RRspacingD(1) = timePeaksDright(1);
 
%iterate over the length of peaktime starting at 2 to calc RR intervals
for i = 1:length(timePeaksDright)-1
    RRspacingD(i) = timePeaksDright(i+1) - timePeaksDright(i);
end
 
%avg RR interval length (in seconds)
RRspacingDavg = mean(RRspacingD)
%bpm mean RR interval
DbpmAvg = 60/RRspacingDavg
 
% max RR interval
RRspacingDmax = max(RRspacingD)
% max RR interval bpm
DbpmMax = 60/RRspacingDmax
 
% min RR interval
RRspacingDmin = min(RRspacingD)
% bpm min RR interval
DbpmMin = 60/RRspacingDmin
% std RR interval
DRRspacingDstd = std(RRspacingD)
% bpm std RR interval
Dbpmstd = 60* RRspacingDstd;
 
Daloria = [DbpmAvg; DbpmMax; DbpmMin; Dbpmstd]
 
%% Marta standing peaks
[PeaksM, timePeaksM] = findpeaks(StandingM, ptimeM, 'MinPeakHeight',3e-4);
figure
plot(ptimeM, StandingM)
 
 
%array of zeros to store our RR intervals
RRspacingM = zeros(1,13);
%first value in the array is peaktime(1) - 0
%RRspacingM(1) = timePeaksM;
 
%iterate over the length of peaktime starting at 2 to calc RR intervals
for i = 1:length(timePeaksM)-1
    RRspacingM(i) = timePeaksM(i+1) - timePeaksM(i);
end
 
%avg RR interval length (in seconds)
RRspacingMavg = mean(RRspacingM);
%bpm mean RR interval
MbpmAvg = 60/RRspacingMavg;
 
% max RR interval
RRspacingMmax = max(RRspacingM);
% max RR interval bpm
MbpmMax = 60/RRspacingMmax;
 
% min RR interval
RRspacingMmin = min(RRspacingM);
% bpm min RR interval
MbpmMin = 60/RRspacingMmin;
% std RR interval
RRspacingMstd = std(RRspacingM);
% bpm std RR interval
Mbpmstd = 60* RRspacingMstd;
 
Marta = [MbpmAvg; MbpmMax; MbpmMin; Mbpmstd]
 
 
%% Sarah standing peaks
[PeaksS, timePeaksS] =findpeaks(StandingS, ptimeS, 'MinPeakHeight',1.3e-4, 'MinPeakDistance',.5);
 
%array of zeros to store our RR intervals
RRspacingS = zeros(1,13);
%first value in the array is peaktime(1) - 0
%RRspacingM(1) = timePeaksM;
 
%iterate over the length of peaktime starting at 2 to calc RR intervals
for i = 1:length(timePeaksS)-1
    RRspacingS(i) = timePeaksS(i+1) - timePeaksS(i);
end
 
%avg RR interval length (in seconds)
RRspacingSavg = mean(RRspacingS);
%bpm mean RR interval
SbpmAvg = 60/RRspacingSavg;
 
% max RR interval
RRspacingSmax = max(RRspacingS);
% max RR interval bpm
SbpmMax = 60/RRspacingSmax;
 
% min RR interval
RRspacingSmin = min(RRspacingS);
% bpm min RR interval
SbpmMin = 60/RRspacingSmin;
% std RR interval
RRspacingSstd = std(RRspacingS);
% bpm std RR interval
Sbpmstd = 60* RRspacingSstd;
 
Sarah = [SbpmAvg; SbpmMin; SbpmMax; Sbpmstd]
 
%% Table for data values
T = table(Daloria, Marta, Sarah)
T.Properties.RowNames = {'Average BPM', 'Min BPM', 'Max BPM', 'STD BPM'}
%% TABLE 3
 
%% DATA IMPORT
%% Daloria sitting
sittingD = data(datastart(n) + frontcutD:datastart(n) + frontcutD + duration);
%% Daloria standing
standingD = data(datastart(n) + frontcutD:datastart(n) + frontcutD + duration);
%% Marta sitting
sittingM = data(datastart(n) + frontcutM:datastart(n) + frontcutM + duration);
%% Marta standing
standingM = data(datastart(n) + frontcutM:datastart(n) + frontcutM + duration);
%% Sarah sitting
sittingS = data(datastart(n) + frontcutS:datastart(n) + frontcutS + duration);
%% Sarah standing
standingS = data(datastart(n) + frontcutS:datastart(n) + frontcutS + duration);

%% FINDING PEAKS
%% Daloria sitting
peaksD2fake = findpeaks(sittingD, ptimeD, 'MinPeakHeight', 1.5*(10^-4), 'MinPeakDistance', .1);
 
peaksD2real = zeros(1,17);
j = 0;
 
for i = 1:2:length(peaksD2fake)    
    j = j + 1;
    peaksD2real(j) = peaksD2fake(i);
end
%% Daloria standing
peaksD3fake = findpeaks(standingD, ptimeD, 'MinPeakHeight', 2.5*(10^-4), 'MinPeakDistance', .1);
 
peaksD3real = zeros(1,17);
j = 0;
 
for i = 1:2:length(peaksD3fake)    
    j = j + 1;
    peaksD3real(j) = peaksD3fake(i);
end
 
%% Marta sitting
peaksM2 = findpeaks(sittingM, ptimeM, 'MinPeakHeight', 2.7*(10^-4));
%% Marta standing
peaksM3 = findpeaks(standingM, ptimeM, 'MinPeakHeight', 2.7*(10^-4));

%% Sarah sitting
peaksS2 = findpeaks(sittingS, ptimeS, 'MinPeakHeight', 2.0*(10^-4), 'MinPeakDistance', .1);
%% Sarah standing
peaksS3fake = findpeaks(standingS, ptimeS, 'MinPeakHeight', 1.2*(10^-4), 'MinPeakDistance', .1);
 
peaksS3real = zeros(1,16);
j = 0;
 
for i = 1:2:length(peaksS3fake)    
    j = j + 1;
    peaksS3real(j) = peaksS3fake(i);
end

%%
avgPeakslyingD = mean(peaksDreal);
avgPeakssittingD = mean(peaksD2real);
avgPeaksstandingD = mean(peaksD3real);
Daloria_All = [avgPeakslyingD; avgPeakssittingD; avgPeaksstandingD];
 
avgPeakslyingM = mean(peaksM);
avgPeakssittingM = mean(peaksM2);
avgPeaksstandingM = mean(peaksM3);
Marta_All = [avgPeakslyingM; avgPeakssittingM; avgPeaksstandingM];
 
avgPeakslyingS = mean(peaksS)
avgPeakssittingS = mean(peaksS2)
avgPeaksstandingS = mean(peaksS3real)
Sarah_All = [avgPeakslyingS; avgPeakssittingS; avgPeaksstandingS];

%% table for the data values
T3 = table(Daloria_All, Marta_All, Sarah_All);
T3.Properties.RowNames = {'Avg R-wave Amplitude Lying Down', 'Avg R-wave Amplitude Sitting', 'Avg R-wave Amplitude Standing'};
% The r-wave amplitudes when standing up were typically in the highest for all three subjects. On the other end, the amplitudes when sitting were generally the lowest and lying down fell somewhere in between the two. Marta’s r-wave amplitude was the highest, Sarah’s was the lowest, and Daloria’s fell in the middle of the two. 
%End of Table 3
%%
% File Name: EMG_Figures_Lab2
% Author: Sandra Moon
% Created: Oct 7, 2019
% Description: Creates figures required in Lab2's Post Lab
%% Exercise 3
% Figure 5
% run Exercise 3 data on LabChart2
 
%% Person A, 3a
% extract data
n=1;
 
% best 10 seconds of data
front_cutAb = 2*(dataend(n)-datastart(n))/3;
durationAb = 4000;
 
bi_rawAb = data(datastart(n)+front_cutAb:datastart(n)+front_cutAb+durationAb);
ptimeAb = [0:durationAb]/samplerate(ch,bl);
 
%figure
%plot(ptimeAa, bi_rawAa)
%xlim([0,3])
%ylim([0,5e-4])
%hold on
%% Person A, 3b
k=1;
 
% best 10 seconds of data
front_cutAb = 2*(dataend(k)-datastart(k))/3
durationAb = 4000;
 
bi_rawAb = data(datastart(k)+front_cutAb:datastart(k)+front_cutAb+durationAb);
ptimeAb = [0:durationAb]/samplerate(ch,bl);
 
%% Person B, 3a
m=1;
 
% best 10 seconds of data
front_cutBa = 2*(dataend(m)-datastart(m))/3
durationBa = 4000;
 
bi_rawBa = data(datastart(m)+front_cutBa:datastart(m)+front_cutBa+durationBa);
ptimeBa = [0:durationBa]/samplerate(ch,bl);
 
%% Person B, 3b
p=1;
 
% best 10 seconds of data
front_cutBb = 2*(dataend(p)-datastart(p))/3
durationBb = 4000;
 
bi_rawBb = data(datastart(p)+front_cutBb:datastart(p)+front_cutBb+durationBb);
ptimeBb = [0:durationBb]/samplerate(ch,bl);
%% Person C, 3a
q=1;
 
% best 10 seconds of data
front_cutCa = 2*(dataend(q)-datastart(q))/3
durationCa = 4000;
 
bi_rawCa = data(datastart(q)+front_cutCa:datastart(q)+front_cutCa+durationCa);
ptimeCa = [0:durationCa]/samplerate(ch,bl);
 
%% Person C, 3b
s=1;
 
% best 10 seconds of data
front_cutCb = 2*(dataend(s)-datastart(s))/3
durationCb = 4000;
 
bi_rawCb = data(datastart(s)+front_cutCb:datastart(s)+front_cutCb+durationCb);
ptimeCb = [0:durationCb]/samplerate(ch,bl);
 
%% Graphs
figure
 
subplot(1,3,1)
plot(ptime_1,fatigue_1,'k')
 
hold on
 
subplot(1,3,2)
plot(ptime_2,fatigue_2,'r')
 
subplot(1,3,1)
plot(ptime_3,fatigue_3,'b')
 
 
xlabel('Time (s)')
ylabel('% Force')
legend('Sandra','Cecil','Naphtal')




