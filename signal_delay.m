t = 0:1:40;
s1 = t>=0 & t<=10;
s2 = (t>=15 & t<=25)*(-1);
y1 = s1+s2;
subplot(3,1,1);
plot(t,y1);
title("Sending")
s3 = t>=10 & t<=20;
s4 = (t>=25 & t<=35)*(-1);
y2 = s3+s4;
y2 = y2+0.5*rand(size(y2));
subplot(3,1,2);
plot(t,y2);
title("Receiving");

y = xcorr(y1, y2);

[max_val, max_idx] = max(abs(y));

time_delay = (max_idx - 1);
lag = -length(y1)+1:length(y1)-1;

subplot(3,1,3);
plot(lag,y);
title("Correlation");
fprintf('The time delay between y1 and y2 is %.3f seconds.\n', time_delay);
