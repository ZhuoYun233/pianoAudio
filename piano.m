close all;
clc
clear all;

%[audio,fs] = audioread(".\audios\Start_92.wav");
[audio,fs] = audioread(".\audios\Start_46.wav");
audio = audio(:,1); %单声道
audio = smooth(audio,15); %滑动平均滤波

N = length(audio);

%audio = resample(audio,1,4);

%帧长选择20ms
frame_length = fs/50;%帧长
frame_translate = frame_length/2;%帧移
t = (0:N-1)/fs; %音频图横坐标换算

audioFrame = enframe(audio,frame_length,frame_translate); %未加窗

audioFFT = fft(audioFrame')';% fft对列做变换故转置

noteEdges = DetectNotes(audioFFT,20,140);

newFFT = 2*audioFFT(:,1:frame_translate/2);

freq = (0:frame_length-1)*(fs/frame_length); % fft频谱图横坐标换算

maxFFT = max(abs(audioFFT),[],2);
maxA = max(maxFFT);

maxFFT = maxFFT/maxA;
[peaks,locs] = findpeaks(maxFFT,MinPeakHeight=0.3, MinPeakDistance=30); %0.2不能完全砍掉

c1=xcorr(locs);
[m,p]=max(c1);
bpm=(60*p*frame_length)/fs;

tmp = 0; %临时值
gap=zeros(1,length(locs)); %存放间隔长度
j=1; %索引
for i=locs'
    gap(j)=i-tmp;
    tmp = i;
    j=j+1;
end
gap(1)=[]; %去除无效元素


figure(1);
plot(t,audio); %音频幅度图
figure(2);
plot(abs(newFFT(220,:))); % 某一帧fft频谱图 注：fft具有对称性
figure(3)
plot(maxFFT); % 将每一帧频谱图中最大值取出作图
hold on
plot(locs,peaks,'o');
figure(4);
plot(c1);
imagesc(abs(newFFT));