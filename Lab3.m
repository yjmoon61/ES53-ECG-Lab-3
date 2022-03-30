%% FIGURE 1
%% Esther's resting ECG and Volume Pulse signal 
% Smooth the ECG data
restingECG_E = smooth(data(datastart(3,1):dataend(3,1)));
volpulse_E = data(datastart(2,1):dataend(2,1));
timeE = ptime;
%% Mythri's resting ECG signal
 % Smooth the ECG data
restingECG_M = smooth(data(datastart(3,1):dataend(3,1)));
volpulse_M = data(datastart(2,1):dataend(2,1));
timeM = ptime;
%% Salena's resting ECG signal 
% Smooth the ECG data
restingECG_S = smooth(data(datastart(3,1):dataend(3,1)));
volpulse_S = data(datastart(2,1):dataend(2,1));
timeS = ptime;

%% Plotting
figure(1)
% ECG data for all three subjects
subplot(2,1,1)
plot(timeE(100:15100), -restingECG_E(100:15100))
hold on
plot(timeS(100:15100), restingECG_S(100:15100))
hold on
plot(timeM(100:15100), restingECG_M(100:15100))
legend('Esther resting ECG ,'Salena resting ECG','Mythri resting ECG')
xlabel('Time (s)')
xlim([0,15])
ylabel('Voltage (mV)')
hold off
% Blood volume pulse data for all three subjects
subplot(2,1,2)
plot(timeE(100:15100), volpulse_E(100:15100))
hold on
plot(timeS(100:15100), volpulse_S(100:15100))
hold on
plot(timeM(100:15100), volpulse_M(100:15100))
legend('Esther resting BVP,'Salena resting BVP','Mythri resting BVP')
xlabel('Time (s)')
xlim([0,15])
ylabel('Voltage (mV)')
hold off

%% Plotting ECG and BVP for Esther, Mythri and Salena just after they had finished exercising
% Finished exercising
duration = 15000;
%% Esther ECG
front_cutE = 2*(dataend(6)-datastart(6))/3;
RecoveryE = (data(datastart(6)+front_cutE:datastart(6)+front_cutE+duration));
ptimeE = [0:duration]/samplerate(ch,bl);
%% Esther Volume pulse
front_cutE = 2*(dataend(5)-datastart(5))/3;
Volume_pulseE = data(datastart(5)+front_cutE:datastart(5)+front_cutE+duration);
ptimeE = [0:duration]/samplerate(ch,bl);
%% Mythri ECG
front_cutM = 2*(dataend(6)-datastart(6))/3;
RecoveryM = data(datastart(6)+front_cutM:datastart(6)+front_cutM+duration);
ptimeM = [0:duration]/samplerate(ch,bl);
 
%% Mythri Volume pulse
front_cutM = 2*(dataend(5)-datastart(5))/3;
Volume_pulseM = data(datastart(5)+front_cutM:datastart(5)+front_cutM+duration);
ptimeM = [0:duration]/samplerate(ch,bl);
 
%% Salena ECG
front_cutS = 2*(dataend(6)-datastart(6))/3;
RecoveryS = data(datastart(6)+front_cutS:datastart(6)+front_cutS+duration);
ptimeS = [0:duration]/samplerate(ch,bl);
 
%% Salena Volume pulse
front_cutS = 2*(dataend(5)-datastart(5))/3;
Volume_pulseS = data(datastart(5)+front_cutS:datastart(5)+front_cutS+duration);
ptimeS = [0:duration]/samplerate(ch,bl);
 
%%
figure
subplot(2,1,1)
plot(ptimeE, -(RecoveryE), 'k')
hold on
plot(ptimeM, RecoveryM, 'r')
hold on
plot(ptimeS, RecoveryS, 'b')
xlabel('Time(s)')
ylabel('Voltage(mV)')
legend('Esther', 'Mythri', 'Salena')
 
subplot(2,1,2)
plot(ptimeE, Volume_pulseE, 'k')
hold on
plot(ptimeM, Volume_pulseM, 'r')
hold on
plot(ptimeS, Volume_pulseS, 'b')
xlabel('Time(s)')
ylabel('Volume Pulse(mV)')
legend('Esther', 'Mythri', 'Salena')

%% Redo for Figure 3
%% Esther's hand raised Volume Pulse signal 
volpulse_E = data(datastart(2,1):dataend(2,1));
volpulse_E(1:420)=[];
timeE = ptime;
%% Esther's hand lowered Volume Pulse signal 
volpulse_Eh = data(datastart(2,2):dataend(2,2));
volpulse_Eh(1:350)=[];
timeEh = ptime;
%% Mythri's hand raised Volume Pulse signal 
volpulse_M = data(datastart(2,3):dataend(2,3));
volpulse_M(1:170)=[];
timeM = ptime;
%% Mythri's hand lowered Volume Pulse signal 
volpulse_Mh = data(datastart(2,4):dataend(2,4));
volpulse_Mh(1:5490)=[];
timeMh = ptime;
%% Salena's hand raised Volume Pulse signal 
volpulse_S = data(datastart(2,5):dataend(2,5));
volpulse_S(1:340)=[];
timeS = ptime;
%% Salena's hand lowered Volume Pulse signal 
volpulse_Sh = data(datastart(2,6):dataend(2,6));
%volpulse_Sh(1:340)=[];
timeSh = ptime;
%% plots
figure
 
subplot(2,1,1)
plot(timeE,volpulse_E)
hold on
plot(timeM,volpulse_M)
plot(timeS,volpulse_S)
xlim([0 15])
xlabel('Time (s)')
ylabel('Volume Pulse (V.s)')
legend('Esther','Mythri','Salena')
hold off
 
subplot(2,1,2)
plot(timeEh,volpulse_Eh)
hold on
plot(timeMh,volpulse_Mh)
plot(timeSh,volpulse_Sh)
xlim([0 15])
xlabel('Time (s)')
ylabel('Volume Pulse (V.s)')
legend('Esther','Mythri','Salena')
hold off
%% table 2
 
%% Esther's resting ECG and Volume Pulse signal 
% Smooth the ECG data
restingECG_E = smooth(data(datastart(3,1):dataend(3,1)));
volpulse_E = data(datastart(2,1):dataend(2,1));
timeE = ptime;
%% Mythri's resting ECG signal
 % Smooth the ECG data
restingECG_M = smooth(data(datastart(3,1):dataend(3,1)));
volpulse_M = data(datastart(2,1):dataend(2,1));
timeM = ptime;
%% Salena's resting ECG signal 
% Smooth the ECG data
restingECG_S = smooth(data(datastart(3,1):dataend(3,1)));
volpulse_S = data(datastart(2,1):dataend(2,1));
timeS = ptime;
 
%% Plotting
figure(1)
% ECG data for all three subjects
subplot(2,1,1)
plot(timeE(100:15100), -restingECG_E(100:15100))
hold on
plot(timeS(100:15100), restingECG_S(100:15100))
hold on
plot(timeM(100:15100), restingECG_M(100:15100))
legend('Esther at rest','Salena at rest','Mythri at rest')
xlabel('Time (s)')
xlim([0,15])
ylabel('Voltage (mV)')
hold off
% Volume pulse data for all three subjects
subplot(2,1,2)
plot(timeE(100:15100), volpulse_E(100:15100))
hold on
plot(timeS(100:15100), volpulse_S(100:15100))
hold on
plot(timeM(100:15100), volpulse_M(100:15100))
legend('Esther at rest','Salena at rest','Mythri at rest')
xlabel('Time (s)')
xlim([0,15])
ylabel('Volume (L)')
hold off
%% Table 1 (REST)
% Peaks in ECG and Volume Pulse Data
% Esther's peaks
[peaksECG_E, timePeaksECG_E] = findpeaks(-restingECG_E(100:15100), ...
    timeE(100:15100), 'MinPeakHeight', 2.5*(10^-4));
[peaksvp_E, timePeaksvp_E] = findpeaks(volpulse_E(100:15100), ...
    timeE(100:15100), 'MinPeakHeight', 3.9*(10^-3),'MinPeakDistance', .7);
% Mythri's peaks
[peaksECG_M, timePeaksECG_M] = findpeaks(restingECG_M(100:15100), ...
    timeM(100:15100), 'MinPeakHeight', -9.5*(10^-5),’MinPeakDistance',.54);
[peaksvp_M, timePeaksvp_M] = findpeaks(volpulse_M(100:15100), ...
    timeM(100:15100), 'MinPeakHeight', 6.5*(10^-4),'MinPeakDistance',.5);
% Salena's peaks
[peaksECG_S, timePeaksECG_S] = findpeaks(restingECG_S(100:15100), ...
    timeS(100:15100), 'MinPeakHeight', 4.5*(10^-4));
[peaksvp_S, timePeaksvp_S] = findpeaks(volpulse_S(100:15100), ...
    timeS(100:15100), 'MinPeakHeight', .0095);
 
% R-R time intervals and Heart rates
% Esther
for i = 2:length(timePeaksECG_E)
    RRinterval_E(i-1) = timePeaksECG_E(i) - timePeaksECG_E(i-1);
end
avgRR_E = mean(RRinterval_E);
stdRR_E = std(RRinterval_E);
HR_E = 60/avgRR_E;
% Mythri
for i = 2:length(timePeaksECG_M)
    RRinterval_M(i-1) = timePeaksECG_M(i) - timePeaksECG_M(i-1);
end
avgRR_M = mean(RRinterval_M);
stdRR_M = std(RRinterval_M);
HR_M = 60/avgRR_M;
% Salena
for i = 2:length(timePeaksECG_S)
    RRinterval_S(i-1) = timePeaksECG_S(i) - timePeaksECG_S(i-1);
end
avgRR_S = mean(RRinterval_S);
stdRR_S = std(RRinterval_S);
HR_S = 60/avgRR_S;
 
% Pulse intervals and Pulse rates
% Esther
for i = 2:length(timePeaksvp_E)
    pulseinterval_E(i-1) = timePeaksvp_E(i) - timePeaksvp_E(i-1);
end
avgPI_E = mean(pulseinterval_E);
PR_E = 60/avgPI_E;
% Mythri
for i = 2:length(timePeaksvp_M)
    pulseinterval_M(i-1) = timePeaksvp_M(i) - timePeaksvp_M(i-1);
end
avgPI_M = mean(pulseinterval_M);
PR_M = 60/avgPI_M;
% Salena
for i = 2:length(timePeaksvp_S)
    pulseinterval_S(i-1) = timePeaksvp_S(i) - timePeaksvp_S(i-1);
end
avgPI_S = mean(pulseinterval_S);
PR_S = 60/avgPI_S;
 
% Data Columns
Rest_Esther = [avgRR_E; stdRR_E; HR_E; avgPI_E; PR_E];
Rest_Mythri = [avgRR_M; stdRR_M; HR_M; avgPI_M; PR_M];
Rest_Salena = [avgRR_S; stdRR_S; HR_S; avgPI_S; PR_S];
 
% EVERYONE AT REST DATA
T1_Rest = table(Rest_Esther, Rest_Mythri, Rest_Salena);
T1_Rest.Properties.RowNames = {'R-R Time Intervals (s)', 'Heart Rate (bpm)',...
    'Pulse Interval (s)', 'Pulse Rate (bpm)'}
 
%%
% Exercise Data Loading
%% Esther's post-exercise ECG and Volume Pulse signal 
% Smooth the ECG data
peECG_E = smooth(data(datastart(3,2):dataend(3,2)));
peVP_E = data(datastart(2,2):dataend(2,2));
petimeE = ptime;
%% Mythri's post-exercise ECG and Volume Pulse signal
 % Smooth the ECG data
peECG_M = smooth(data(datastart(3,2):dataend(3,2)));
peVP_M = data(datastart(2,2):dataend(2,2));
petimeM = ptime;
%% Salena's post-exercise ECG and Volume Pulse  signal 
% Smooth the ECG data
peECG_S = smooth(data(datastart(3,2):dataend(3,2)));
peVP_S = data(datastart(2,2):dataend(2,2));
petimeS = ptime;
 
%% Table 1 (0 SECONDS)
% Peaks in ECG and Volume Pulse Data
% Esther
[pepeaksECG0_E, petimePeaksECG0_E] = findpeaks(-peECG_E(1:900), ...
    petimeE(1:900), 'MinPeakHeight', 4.4*(10^-4));
[pepeaksvp0_E, petimePeaksvp0_E] = findpeaks(peVP_E(1:1200), ...
    petimeE(1:1200), 'MinPeakHeight', 9.2*(10^-3),'MinPeakDistance',.3);
% Mythri
[pepeaksECG0_M, petimePeaksECG0_M] = findpeaks(peECG_M(1:900), ...
    petimeM(1:900), 'MinPeakHeight', 3.1*(10^-5));
[pepeaksvp0_M, petimePeaksvp0_M] = findpeaks(peVP_M(1:900), ...
    petimeM(1:900), 'MinPeakHeight', 3.2*(10^-4),'MinPeakDistance',.3);
% Salena
[pepeaksECG0_S, petimePeaksECG0_S] = findpeaks(peECG_S(1:900), ...
    petimeS(1:900), 'MinPeakHeight', -9*(10^-5), 'MinPeakDistance', .25);
[pepeaksvp0_S, petimePeaksvp0_S] = findpeaks(peVP_S(1:1000), ...
    petimeS(1:1000), 'MinPeakHeight', 3.2*(10^-3),'MinPeakDistance',.3);
 
% R-R time intervals and Heart rates
% Esther
peAvgRR0_E = petimePeaksECG0_E(2) - petimePeaksECG0_E(1);
peHR0_E = 60/peAvgRR0_E;
% Mythri
peAvgRR0_M = petimePeaksECG0_M(2) - petimePeaksECG0_M(1);
peHR0_M = 60/peAvgRR0_M;
% Salena
peAvgRR0_S = petimePeaksECG0_S(2) - petimePeaksECG0_S(1);
peHR0_S = 60/peAvgRR0_S;
 
% Pulse intervals and Pulse rates
% Esther
avgPI0_E = petimePeaksvp0_E(2) - petimePeaksvp0_E(1);
PR0_E = 60/avgPI0_E;
% Mythri
avgPI0_M = petimePeaksvp0_M(2) - petimePeaksvp0_M(1);
PR0_M = 60/avgPI0_M;
% Salena
avgPI0_S = petimePeaksvp0_S(2) - petimePeaksvp0_S(1);
PR0_S = 60/avgPI0_S;
 
% Data Columns
Zero_Esther = [peAvgRR0_E; peHR0_E; avgPI0_E; PR0_E];
Zero_Mythri = [peAvgRR0_M; peHR0_M; avgPI0_M; PR0_M];
Zero_Salena = [peAvgRR0_S; peHR0_S; avgPI0_S; PR0_S];
 
% EVERYONE POST-EXERCISE 0 SECONDS DATA
T1_pe0 = table(Zero_Esther, Zero_Mythri, Zero_Salena);
T1_pe0.Properties.RowNames = {'R-R Time Intervals (s)', 'Heart Rate (bpm)',...
    'Pulse Interval (s)', 'Pulse Rate (bpm)'}
 
%% Table 1 (30 SECONDS)
% Peaks in ECG and Volume Pulse Data
% Esther
[pepeaksECG30_E, petimePeaksECG30_E] = findpeaks(-peECG_E(400:1400), ...
    petimeE(400:1400), 'MinPeakHeight', 2.8*(10^-4));
[pepeaksvp30_E, petimePeaksvp30_E] = findpeaks(peVP_E(400:1400), ...
    petimeE(400:1400), 'MinPeakHeight', 9.2*(10^-3),'MinPeakDistance',.3);
% Mythri
[pepeaksECG30_M, petimePeaksECG30_M] = findpeaks(peECG_M(400:1100), ...
    petimeM(400:1100), 'MinPeakHeight', 3.1*(10^-5));
[pepeaksvp30_M, petimePeaksvp30_M] = findpeaks(peVP_M(400:1200), ...
    petimeM(400:1200), 'MinPeakHeight', 3.2*(10^-4),'MinPeakDistance',.3);
% Salena
[pepeaksECG30_S, petimePeaksECG30_S] = findpeaks(peECG_S(400:1400), ...
    petimeS(400:1400), 'MinPeakHeight', -9*(10^-5), 'MinPeakDistance',.1);
[pepeaksvp30_S, petimePeaksvp30_S] = findpeaks(peVP_S(400:1100), ...
    petimeS(400:1100), 'MinPeakHeight', 3.2*(10^-3),'MinPeakDistance',.3);
 
% R-R time intervals and Heart rates
% Esther
peAvgRR30_E = petimePeaksECG30_E(2) - petimePeaksECG30_E(1);
peHR30_E = 60/peAvgRR30_E;
% Mythri
peAvgRR30_M = petimePeaksECG30_M(2) - petimePeaksECG30_M(1);
peHR30_M = 60/peAvgRR30_M;
% Salena (time points 2 and 4 are the peaks of the QRS)
peAvgRR30_S = petimePeaksECG30_S(4) - petimePeaksECG30_S(2);
peHR30_S = 60/peAvgRR30_S;
 
% Pulse intervals and Pulse rates
% Esther
avgPI30_E = petimePeaksvp30_E(2) - petimePeaksvp30_E(1);
PR30_E = 60/avgPI30_E;
% Mythri
avgPI30_M = petimePeaksvp30_M(2) - petimePeaksvp30_M(1);
PR30_M = 60/avgPI30_M;
% Salena
avgPI30_S = petimePeaksvp30_S(2) - petimePeaksvp30_S(1);
PR30_S = 60/avgPI30_S;
 
% Data Columns
Esther_30sec = [peAvgRR30_E; peHR30_E; avgPI30_E; PR30_E];
Mythri_30sec = [peAvgRR30_M; peHR30_M; avgPI30_M; PR30_M];
Salena_30sec = [peAvgRR30_S; peHR30_S; avgPI30_S; PR30_S];
 
% EVERYONE POST-EXERCISE 30 SECONDS DATA
T1_pe30 = table(Esther_30sec, Mythri_30sec, Salena_30sec);
T1_pe30.Properties.RowNames = {'R-R Time Intervals (s)', 'Heart Rate (bpm)',...
    'Pulse Interval (s)', 'Pulse Rate (bpm)'}
 
%% Table 1 (END OF COLLECTION)
% Peaks in ECG and Volume Pulse Data
% Esther
[pepeaksECG5_E, petimePeaksECG5_E] = findpeaks(-peECG_E(12500:14000), ...
    petimeE(12500:14000), 'MinPeakHeight', 2.6*(10^-4));
[pepeaksvp5_E, petimePeaksvp5_E] = findpeaks(peVP_E(13000:14000), ...
    petimeE(13000:14000), 'MinPeakHeight', 9*(10^-3),'MinPeakDistance',.3);
% Mythri
[pepeaksECG5_M, petimePeaksECG5_M] = findpeaks(peECG_M(13500:14100), ...
    petimeM(13500:14100), 'MinPeakHeight', 3.1*(10^-5));
[pepeaksvp5_M, petimePeaksvp5_M] = findpeaks(peVP_M(13300:14100), ...
    petimeM(13300:14100) ,'MinPeakHeight', 3.2*(10^-4),'MinPeakDistance',.3);
% Salena
[pepeaksECG5_S, petimePeaksECG5_S] = findpeaks(peECG_S(13300:14100), ... %(4 and 2 again)
    petimeS(13300:14100), 'MinPeakHeight', -9*(10^-5), 'MinPeakDistance',.1);
[pepeaksvp5_S, petimePeaksvp5_S] = findpeaks(peVP_S(12500:14000), ...
    petimeS(12500:14000), 'MinPeakHeight', 3.2*(10^-3), 'MinPeakDistance',.3);
 
% R-R time intervals and Heart rates
% Esther
peAvgRR5_E = petimePeaksECG5_E(2) - petimePeaksECG5_E(1);
peHR5_E = 60/peAvgRR5_E;
% Mythri
peAvgRR5_M = petimePeaksECG5_M(3) - petimePeaksECG5_M(1);
peHR5_M = 60/peAvgRR5_M;
% Salena (time points 2 and 4 are the peaks of the QRS)
peAvgRR5_S = petimePeaksECG5_S(4) - petimePeaksECG5_S(1);
peHR5_S = 60/peAvgRR5_S;
 
% Pulse intervals and Pulse rates
% Esther
avgPI5_E = petimePeaksvp5_E(2) - petimePeaksvp5_E(1);
PR5_E = 60/avgPI5_E;
% Mythri
avgPI5_M = petimePeaksvp5_M(2) - petimePeaksvp5_M(1);
PR5_M = 60/avgPI5_M;
% Salena
avgPI5_S = petimePeaksvp5_S(2) - petimePeaksvp5_S(1);
PR5_S = 60/avgPI5_S;
 
% Data Columns
Esther_5min = [peAvgRR5_E; peHR5_E; avgPI5_E; PR5_E];
Mythri_5min = [peAvgRR5_M; peHR5_M; avgPI5_M; PR5_M];
Salena_5min = [peAvgRR5_S; peHR5_S; avgPI5_S; PR5_S];
 
% EVERYONE POST-EXERCISE END DATA
T1_pe5 = table(Esther_5min, Mythri_5min, Salena_5min);
T1_pe5.Properties.RowNames = {'R-R Time Intervals (s)', 'Heart Rate (bpm)',...
    'Pulse Interval (s)', 'Pulse Rate (bpm)'}


%% Peaks in ECG and Volume Pulse Daya
% Esther's peaks
[peaksECG_E, timePeaksECG_E] = findpeaks(-restingECG_E(100:15100), ...
    timeE(100:15100), 'MinPeakHeight', 2.5*(10^-4));
[peaksvp_E, timePeaksvp_E] = findpeaks(volpulse_E(100:15100), ...
    timeE(100:15100), 'MinPeakHeight', 3.9*(10^-3),'MinPeakDistance',.7);
% Mythri's peaks
[peaksECG_M, timePeaksECG_M] = findpeaks(restingECG_M(100:15100), ...
    timeM(100:15100), 'MinPeakHeight', -9.5*(10^-5),'MinPeakDistance',.54);
[peaksvp_M, timePeaksvp_M] = findpeaks(volpulse_M(100:15100), ...
    timeM(100:15100), 'MinPeakHeight', 6.5*(10^-4),'MinPeakDistance',.5);
% Salena's peaks
[peaksECG_S, timePeaksECG_S] = findpeaks(restingECG_S(100:15100), ...
    timeS(100:15100), 'MinPeakHeight', 4.5*(10^-4));
[peaksvp_S, timePeaksvp_S] = findpeaks(volpulse_S(100:15100), ...
    timeS(100:15100), 'MinPeakHeight', .0095);
%% graph
hold on
findpeaks(-restingECG_E(100:15100), ...
    timeE(100:15100), 'MinPeakHeight', 2.5*(10^-4));
findpeaks(volpulse_E(100:15100), ...
    timeE(100:15100), 'MinPeakHeight', 3.9*(10^-3),'MinPeakDistance',.7);
% Mythri's peaks
findpeaks(restingECG_M(100:15100), ...
    timeM(100:15100), 'MinPeakHeight', -9.5*(10^-5),'MinPeakDistance',.54);
findpeaks(volpulse_M(100:15100), ...
    timeM(100:15100), 'MinPeakHeight', 6.5*(10^-4),'MinPeakDistance',.5);
% Salena's peaks
findpeaks(restingECG_S(100:15100), ...
    timeS(100:15100), 'MinPeakHeight', 4.5*(10^-4));
findpeaks(volpulse_S(100:15100), ...
    timeS(100:15100), 'MinPeakHeight', .0095);
 
%% delay between R and pulse peaks - resting
 
delayE = [];
delayM = [];
delayS = [];
 
%timePeaksvp_E(1:1)=[]; % only do this once!
%timePeaksvp_S(1:2)=[]; % only do this once!
 
for c=1:17
   eDelay = timePeaksvp_E(c)-timePeaksECG_E(c);
   delayE = [delayE eDelay];
end
 
for d=1:26
   mDelay = timePeaksvp_M(d)-timePeaksECG_M(d);
   delayM = [delayM mDelay];
end
 
for e=1:18
   sDelay = timePeaksvp_S(e)-timePeaksECG_S(e);
   delayS = [delayS sDelay];
end


%% post exercise!!! 
 
 
 
%% Esther's exercise ECG and Volume Pulse signal 
% Smooth the ECG data
exercisedECG_E = smoothdata(data(datastart(3,2):dataend(3,2)));
e_volpulse_E = data(datastart(2,2):dataend(2,2));
e_timeE = ptime;
%% Mythri's exercise ECG signal
 % Smooth the ECG data
exercisedECG_M = smoothdata(data(datastart(3,2):dataend(3,2)));
e_volpulse_M = data(datastart(2,2):dataend(2,2));
e_timeM = ptime;
%% Salena's exercise ECG signal 
% Smooth the ECG data
exercisedECG_S = smoothdata(data(datastart(3,2):dataend(3,2)));
e_volpulse_S = data(datastart(2,2):dataend(2,2));
e_timeS = ptime;
 
%% Plotting
figure(2)
% ECG data for all three subjects
subplot(2,1,1)
plot(e_timeE(100:15100), -exercisedECG_E(100:15100))
hold on
plot(e_timeS(100:15100), exercisedECG_S(100:15100))
hold on
plot(e_timeM(100:15100), exercisedECG_M(100:15100))
legend('Esther after exercise','Salena after exercise','Mythri after exercise')
xlabel('Time (s)')
xlim([0,15])
ylabel('Voltage (mV)')
hold off
% Volume pulse data for all three subjects
subplot(2,1,2)
plot(e_timeE(100:15100), e_volpulse_E(100:15100))
hold on
plot(e_timeS(100:15100), e_volpulse_S(100:15100))
hold on
plot(e_timeM(100:15100), e_volpulse_M(100:15100))
legend('Esther after exercise','Salena after exercise','Mythri after exercise')
xlabel('Time (s)')
xlim([0,15])
ylabel('Volume (L)')
hold off
 
%%
%% Peaks in ECG and Volume Pulse - after exercise
% Esther's peaks
[e_peaksECG_E, e_timePeaksECG_E] = findpeaks(-exercisedECG_E(100:15100), ...
    timeE(100:15100), 'MinPeakHeight', 2.0*(10^-4));
[e_peaksvp_E, e_timePeaksvp_E] = findpeaks(volpulse_E(100:15100), ...
    timeE(100:15100), 'MinPeakHeight', 3.9*(10^-3),'MinPeakDistance',.2);
% Mythri's peaks
[e_peaksECG_M, e_timePeaksECG_M] = findpeaks(exercisedECG_M(6000:15100), ...
    timeM(6000:15100), 'MinPeakHeight', -9.5*(10^-5),'MinPeakDistance',.54);
[e_peaksvp_M, e_timePeaksvp_M] = findpeaks(e_volpulse_M(6000:15100), ...
    timeM(6000:15100), 'MinPeakHeight', 6.5*(10^-4),'MinPeakDistance',.54);
% Salena's peaks
[e_peaksECG_S, e_timePeaksECG_S] = findpeaks(exercisedECG_S(100:15100), ...
    timeS(100:15100), 'MinPeakHeight', -2*(10^-4),'MinPeakDistance',.34);
[e_peaksvp_S, e_timePeaksvp_S] = findpeaks(e_volpulse_S(100:15100), ...
    timeS(100:15100), 'MinPeakHeight', .0025,'MinPeakDistance',.34);
%% graph
hold on
findpeaks(-exercisedECG_E(100:15100), ...
    timeE(100:15100), 'MinPeakHeight', 2.0*(10^-4));
findpeaks(e_volpulse_E(100:15100), ...
    timeE(100:15100), 'MinPeakHeight', 3.9*(10^-3),'MinPeakDistance',.2);
%% Mythri's peaks
findpeaks(exercisedECG_M(6000:15100), ...
    timeM(6000:15100), 'MinPeakHeight', 0.6*(10^-5),'MinPeakDistance',.54);
findpeaks(e_volpulse_M(6000:15100), ...
    timeM(6000:15100), 'MinPeakHeight', 6.5*(10^-4),'MinPeakDistance',.54);
%% Salena's peaks
findpeaks(exercisedECG_S(100:15100), ...
    timeS(100:15100), 'MinPeakHeight', -2*(10^-4),'MinPeakDistance',.34);
findpeaks(e_volpulse_S(100:15100), ...
    timeS(100:15100), 'MinPeakHeight', .0025,'MinPeakDistance',.34);
hold off
%% delay between R and pulse peaks - exercising
 
e_delayE = [];
e_delayM = [];
e_delayS = [];
 
e_timePeaksvp_E(1:7)=[]; % only do this once!
e_timePeaksECG_M(1:1)=[]; % only do this once!
e_timePeaksECG_S(1:3)=[]; % only do this once!
 
for c=1:25
   e_eDelay = e_timePeaksvp_E(c)-e_timePeaksECG_E(c);
   e_delayE = [e_delayE e_eDelay];
end
 
for d=1:12
   e_mDelay = e_timePeaksvp_M(d)-e_timePeaksECG_M(d);
   e_delayM = [e_delayM e_mDelay];
end
 
for e=1:27
   e_sDelay = e_timePeaksvp_S(e)-e_timePeaksECG_S(e);
   e_delayS = [e_delayS e_sDelay];
end




