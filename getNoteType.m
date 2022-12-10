function noteType = getNoteType(noteFrameLength,noteLengthTable)
%GETNOTETYPE 此处显示有关此函数的摘要
%   此处显示详细说明
type = 0; timeError = 100;
for i=1:length(noteLengthTable)
    newTimeError = 100*(abs(noteLengthTable(i)-noteFrameLength)/noteFrameLength);   %时值误差
    if newTimeError<timeError
        timeError = newTimeError;
        type = i;
    end
end
if timeError > 30   %误差过大
    type = 0;   %0为识别失败
end

noteType = type;
end

