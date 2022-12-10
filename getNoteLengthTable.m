function noteLengthTabel = getNoteLengthTable(frameLength,fs,bpm)
%GETNOTELENGTHTABLE 获取音符时值对照表
%   输入帧长，采样频率和bpm，获取各种时值音符所对应的帧长
framePerBeat = (fs/frameLength)*(60/bpm);

wholeNote = round(4*framePerBeat);
halfNote = round(2*framePerBeat);
quaterNote = round(framePerBeat);
eighthNote = round(framePerBeat/2);
sixteenthNote = round(framePerBeat/4);
demisemiquaver = round(framePerBeat/8);%32分音符
hemidemisemiquave = round(framePerBeat/16);%64分音符

noteLengthTabel = [wholeNote, halfNote, quaterNote, eighthNote, sixteenthNote, demisemiquaver, hemidemisemiquave];
end

