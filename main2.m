% Load Data
lena = load('Lena.mat');

% Pre-process
I = uint8( lena.lena );
Id = double(I);

% Calculate sigma of original
sigma_original = var(Id, 0, 'all');
disp(sigma_original);

% Noise Added
J = imnoise(I, 'gaussian', 0.5687798 );
Jd = double(J);

% Calculate sigma of noise image
sigma_noise = var(Jd, 0, 'all');
%disp(sigma_noise);

% Calculate SNR of noise image to original
snr = 10 * log10( sigma_original/sigma_noise );
%disp(snr);

% Display noise (tight)
%imshow(J, 'Border', 'tight');

% Apply Wiener Filter
K = wiener2(J);
Kd = double(K);

% Display Filtered Image
%imshow(K, 'Border', 'tight');

% Calculate sigma of wiener
sigma_wiener = var(Kd, 0, 'all');
disp(sigma_wiener);

% Calculate SNR of wiener image to original
snr = 10 * log10( sigma_original/sigma_wiener );
disp(snr);


O = minus(Id, Kd);
P = abs(O);
Q = uint8(P);
sigma_wiener = var(P, 0, 'all');
disp(sigma_wiener);

%imshow(Q, 'Border', 'tight');



sigma_inv = var(double(Q), 0, 'all');
disp(sigma_inv);

Z = wiener2(I);
sigma_no_blur = var(double(Z), 0, 'all');
disp(sigma_no_blur);

