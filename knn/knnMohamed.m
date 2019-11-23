
%Class = knnclassify(Sample, Training, Group, k)
load fisheriris
D=meas();
S=species;
learnDataIn=[D(1:40,:);D(51:90,:);D(101:140,:)];
learnDataOut=[S(1:40);S(51:90);S(101:140)];
k=13;
Sample=[5.9000    3.0000    5.1000    1.8000];

Class = knnclassify(Sample, learnDataIn, learnDataOut, k)
