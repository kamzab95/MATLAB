clear all; close all;
hold on;
[t1, y1]=sinwave(5, 100, 0, 1, 0, 1);
%plot(t1, y1);
[t2, y2]=sinwave(20, 100, 0, 1, 1, 2);
%plot(t2, y2);
[t3, y3]=sinwave(2, 100, 0, 1, 2, 3);

t = [t1, t2, t3];
y = [y1, y2, y3];

subplot(2, 1, 1);
plot(t, y)

[fx, fy] = sft(y, 100);

subplot(2, 1, 2);
plot(fx, fy);
xlim([0 30])

figure(2);
spectrogram(y,rectwin(100),0,100, 100,'yaxis');

hold off;

function [t, y]=sinwave(freq, fs, phase_shift, amp, start_time, stoptime)
    t=start_time:(1/fs):stoptime;
    y = amp*(sin(2*pi*freq*t + deg2rad(phase_shift)));
end


function [fx, fy]=sft(X, sampling)
    fy = fft(X);
    fn = length(fy);
    fy = fy./fn;
    df = sampling/fn;
    fv = 0:df:(sampling-df);
    sf = abs(fy);
    %plot(fv1, sf1);
    fx = fv;
    fy = sf;
end
