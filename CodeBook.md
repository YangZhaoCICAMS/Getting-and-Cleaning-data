#Introduction

The script run_analysis.R is used to performed the 5 steps described in the course project.

Firstly, all the train set names train.set and test set names test.set are merged useing the rbind() function.
Secondly, only those columns with mean and standard deviation measures are taken from the total dataset, after exacting these columns, they are given the correct names, taken from features.txt.
Owing to stucture dataset, activities.set data is addressed with values 1:6, we also take the activities.set names and IDs from orginal documents activity_labels.txt, which are substituted in the dataset.
Thirdly, all the column names are corrected.
Finally, a new dataset was generated with all average measures for each subject subject and activity type. 

#Variables

train.set,train.label,subject.train,test.set,test.label and subject.test were dataset imported from the downloaded files directedly.
data.set,data.label and subject.set are the binded data for further analysis.
features.set contains the correct names for the data.set dataset, which are applied to the columns stored in mean_std_features, a numeric vector used to extract the desired data.
data mergers data.set, data.label and subject.set, which is the bigest dataset contains all the information orelated with the data.
avetage.txt contains the relevant averages which is generated by write.table function with ddply() and colMeans() functions in dply package. 
