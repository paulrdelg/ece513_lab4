% Load Data
lena = load('Lena.mat');

% Pre-process
I = uint8( lena.lena );

% Add blurring
h = fspecial('motion', 10, 1);
blurred = imfilter(I, h, 'conv', 'circular');

% Display noisy image
imshow(b, 'Border', 'tight');

% Apply Wiener Filter
J = wiener2(blurred);

% Display Deblurred image
imshow(J, 'Border', 'tight');
