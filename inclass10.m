%In this directory, you will find some example data, which is a 300x8
%array stored in a .mat file. Image these are measurements for 300 genes are 8 different time
%points
%GB comments
1)100
2)100
3)100
4)100
overall: 100


%1. Use matlab to perform pca on this data, getting the transformation
%matrix, the transformed data, and the eigenvalues.
data = load('example_dat.mat');
[coeff,score,eigen] = pca(data.dat)

%2. Look at the eigenvalues - how many dimensions are necessary to explain
%the data? 
% the first dimension only.

%3. Using kmeans clustering to cluster the data into 3 clusters. 
% Make a plot of the first coordinate of the raw data vs the second color coded
% by which cluster it is in. Make the same plot but use the first two
% principle components instead. 
idx_3 = kmeans(data.dat,3);
col_1 = data.dat(:,1);
col_2 = data.dat(:,2);
sc_1 = score(:,1);
sc_2 = score(:,2);

figure (1)
subplot(1,2,1);
scatter(col_1,col_2,12,idx_3);
subplot(1,2,2);
scatter(sc_1,sc_2,12,idx_3);

%4. Repeat part 3 but use 7 clusters. Which is a more appropriate number of
%clusters for the data?
idx_7 = kmeans(data.dat,7);
figure (2)
subplot(1,2,1);
scatter(col_1,col_2,12,idx_7);
subplot(1,2,2);
scatter(sc_1,sc_2,12, idx_7);
%3 is more appropriate, since in 7 clusters, we see the data points that
%are supposed to belong to same group are segregated into different colors,
%and some of the 7 groups overlap, forming 3 larger clusters without
%overlapping

