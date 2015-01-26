clear;
clc;
[Total_label, Total_Data] = libsvmread('input_for_2_class_SVM.txt');
avg_accuracy=0;
for k=1:1000
r=0.1;
C=10;
rand=randperm(size(Total_Data,1));
rand_val=rand(1:size(Total_Data,1)*0.2);
rand_train=rand(size(Total_Data,1)*0.2+1:size(Total_Data,1));
val_size=size(rand_val,2);
train_size=size(rand_train,2);
val_label=[];
val_data=[];
train_label=[];
train_data=[];
for i=1:val_size
    val_label=[val_label; Total_label(rand_val(i))];
    val_data=[val_data; Total_Data(rand_val(i),:)];
end
for i=1:train_size
    train_label=[train_label; Total_label(rand_train(i))];
    train_data=[train_data; Total_Data(rand_train(i),:)]; 
end
    
    model=svmtrain(train_label,train_data,['-c ',num2str(C),' -g ' num2str(r)]);
    [predicted,accuracy,prob_estimates]=svmpredict(val_label,val_data,model);
    avg_accuracy=avg_accuracy+accuracy;
    h=k
end
avg_accuracy=avg_accuracy/1000;
