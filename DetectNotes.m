function EdgePoints = DetectNotes(frames,k,T)
%DETECTEDGES 此处显示有关此函数的摘要
%   此处显示详细说明
energy = sum(abs(frames).^2,2);
figure(10);
plot(energy);
result = 0;
preE = 0; i = 1; distance = T+1;
for frameIndex = 1:length(energy)
    E = energy(frameIndex, 1);
    if (abs(E-preE)>k)
        if (distance > T)
            result(1,i) = frameIndex;
            result(2,i) = E-preE;
            i = i+1;
            distance = 0;
        end
    end
    distance=distance+1;
    preE = E;
end

EdgePoints = result;
end

