%% Read Data
clc 
clear all
close all
Data=readtable("diabetes.csv");
%% Data preprocessing
%Null value check
n=sum(ismissing(Data));
% Feature Scaling (Normalizing)
Data.Pregnancies=(Data.Pregnancies-min(Data.Pregnancies))/(max(Data.Pregnancies)-min(Data.Pregnancies));
Data.Glucose=(Data.Glucose-min(Data.Glucose))/(max(Data.Glucose)-min(Data.Glucose));
Data.BloodPressure=(Data.BloodPressure-min(Data.BloodPressure))/(max(Data.BloodPressure)-min(Data.BloodPressure));
Data.SkinThickness=(Data.SkinThickness-min(Data.SkinThickness))/(max(Data.SkinThickness)-min(Data.SkinThickness));
Data.Insulin=(Data.Insulin-min(Data.Insulin))/(max(Data.Insulin)-min(Data.Insulin));
Data.BMI=(Data.BMI-min(Data.BMI))/(max(Data.BMI)-min(Data.BMI));
Data.DiabetesPedigreeFunction=(Data.DiabetesPedigreeFunction-min(Data.DiabetesPedigreeFunction))/(max(Data.DiabetesPedigreeFunction)-min(Data.DiabetesPedigreeFunction));
Data.Age=(Data.Age-min(Data.Age))/(max(Data.Age)-min(Data.Age));
%% Data Partition into train and test
%Split data into train test
cv=cvpartition(size(Data,1),'HoldOut',0.3);
idx=cv.test;
%Separete to training and test data
dataTrain=Data(~idx,:);
dataTest=Data(idx,:);
%% Now we have to handle the  values in the data which is not possible.
g=(dataTrain.Glucose==0);
k=(dataTrain.BloodPressure==0);
l=(dataTrain.SkinThickness==0);
m=(dataTrain.Insulin==0);
n=(dataTrain.BMI==0);
o=(dataTrain.DiabetesPedigreeFunction==0);
p=(dataTrain.Age==0);
WrongValues=[sum(g) sum(k) sum(l) sum(m) sum(n) sum(o) sum(p)];
% Now 0 corrosponding to outcome 1 is replaced mean corrospoding to outcome1
% and Now 0 corrosponding to outcome 0 is replaced mean corrospoding to outcome0
% replacing by average mean
g=(dataTrain.Glucose==0);
Outg=(dataTrain.Outcome==1);
dataTrain.Glucose(g & Outg)=mean(dataTrain.Glucose(~g & Outg));
dataTrain.Glucose(g & ~Outg)=mean(dataTrain.Glucose(~g & ~Outg));
k=(dataTrain.BloodPressure==0);
Outg=(dataTrain.Outcome==1);
dataTrain.BloodPressure(k & Outg)=mean(dataTrain.BloodPressure(~k & Outg));
dataTrain.BloodPressure(k & ~Outg)=mean(dataTrain.BloodPressure(~k & ~Outg));
l=(dataTrain.SkinThickness==0);
Outg=(dataTrain.Outcome==1);
dataTrain.SkinThickness(l & Outg)=mean(dataTrain.SkinThickness(~l & Outg));
dataTrain.SkinThickness(l & ~Outg)=mean(dataTrain.SkinThickness(~l & ~Outg));
m=(dataTrain.Insulin==0);
Outg=(dataTrain.Outcome==1);
dataTrain.Insulin(m & Outg)=mean(dataTrain.Insulin(~m & Outg));
dataTrain.Insulin(m & ~Outg)=mean(dataTrain.Insulin(~m & ~Outg));
n=(dataTrain.BMI==0);
Outg=(dataTrain.Outcome==1);
dataTrain.BMI(n & Outg)=mean(dataTrain.BMI(~n & Outg));
dataTrain.BMI(n & ~Outg)=mean(dataTrain.BMI(~n & ~Outg));
o=(dataTrain.DiabetesPedigreeFunction==0);
Outg=(dataTrain.Outcome==1);
dataTrain.DiabetesPedigreeFunction(o & Outg)=mean(dataTrain.DiabetesPedigreeFunction(~o & Outg));
dataTrain.DiabetesPedigreeFunction(o & ~Outg)=mean(dataTrain.DiabetesPedigreeFunction(~o & ~Outg));
p=(dataTrain.Age==0);
Outg=(dataTrain.Outcome==1);
dataTrain.Age(p & Outg)=mean(dataTrain.Age(~p & Outg));
dataTrain.Age(p & ~Outg)=mean(dataTrain.Age(~p & ~Outg));
%% Same for test data
g=(dataTest.Glucose==0);
k=(dataTest.BloodPressure==0);
l=(dataTest.SkinThickness==0);
m=(dataTest.Insulin==0);
n=(dataTest.BMI==0);
o=(dataTest.DiabetesPedigreeFunction==0);
p=(dataTest.Age==0);
WrongValues=[sum(g) sum(k) sum(l) sum(m) sum(n) sum(o) sum(p)];
% Now 0 corrosponding to outcome 1 is replaced mean corrospoding to outcome1
% and Now 0 corrosponding to outcome 0 is replaced mean corrospoding to outcome0
% replacing by average mean
g=(dataTest.Glucose==0);
Outg=(dataTest.Outcome==1);
dataTest.Glucose(g & Outg)=mean(dataTest.Glucose(~g & Outg));
dataTest.Glucose(g & ~Outg)=mean(dataTest.Glucose(~g & ~Outg));
k=(dataTest.BloodPressure==0);
Outg=(dataTest.Outcome==1);
dataTest.BloodPressure(k & Outg)=mean(dataTest.BloodPressure(~k & Outg));
dataTest.BloodPressure(k & ~Outg)=mean(dataTest.BloodPressure(~k & ~Outg));
l=(dataTest.SkinThickness==0);
Outg=(dataTest.Outcome==1);
dataTest.SkinThickness(l & Outg)=mean(dataTest.SkinThickness(~l & Outg));
dataTest.SkinThickness(l & ~Outg)=mean(dataTest.SkinThickness(~l & ~Outg));
m=(dataTest.Insulin==0);
Outg=(dataTest.Outcome==1);
dataTest.Insulin(m & Outg)=mean(dataTest.Insulin(~m & Outg));
dataTest.Insulin(m & ~Outg)=mean(dataTest.Insulin(~m & ~Outg));
n=(dataTest.BMI==0);
Outg=(dataTest.Outcome==1);
dataTest.BMI(n & Outg)=mean(dataTest.BMI(~n & Outg));
dataTest.BMI(n & ~Outg)=mean(dataTest.BMI(~n & ~Outg));
o=(dataTest.DiabetesPedigreeFunction==0);
Outg=(dataTest.Outcome==1);
dataTest.DiabetesPedigreeFunction(o & Outg)=mean(dataTest.DiabetesPedigreeFunction(~o & Outg));
dataTest.DiabetesPedigreeFunction(o & ~Outg)=mean(dataTest.DiabetesPedigreeFunction(~o & ~Outg));
p=(dataTest.Age==0);
Outg=(dataTest.Outcome==1);
dataTest.Age(p & Outg)=mean(dataTest.Age(~p & Outg));
dataTest.Age(p & ~Outg)=mean(dataTest.Age(~p & ~Outg));
%% Train model using training data
classification_model=fitcsvm(dataTrain,'Outcome~Pregnancies+Glucose+BloodPressure+SkinThickness+Insulin+BMI+DiabetesPedigreeFunction+Age');
%% Accuracy
gs=dataTest(:,1:8);
mk=predict(classification_model,gs);
accurancy_check=((sum((mk==table2array(dataTest(:,9)))))/size(dataTest,1))*100;
disp(accurancy_check);