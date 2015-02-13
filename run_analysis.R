## load "foreign" and "plyr" packages into working directory
library(foreign)
library(plyr)

##
## Step1: Merges the training and the test sets to create on data set
##

## import the train set, stored in "X_train.txt" document
train.set <- read.table("J:/Coursera/Get_and_data_clean/UCI HAR Dataset/train/X_train.txt")
## import the labels of train set, stored in "y_trian.txt" document
train.label <- read.table("J:/Coursera/Get_and_data_clean/UCI HAR Dataset/train/y_train.txt")
## import the subject train set, stored in "subject_trian.txt" document
subject.train <- read.table("J:/Coursera/Get_and_data_clean/UCI HAR Dataset/train/subject_train.txt")


## import the test set, stored in "X_test.txt" document
test.set <- read.table("J:/Coursera/Get_and_data_clean/UCI HAR Dataset/test/X_test.txt")
## import the labels of test set, stored in "y_test.txt" document
test.label <- read.table("J:/Coursera/Get_and_data_clean/UCI HAR Dataset/test/y_test.txt")
## import the subject test set, stored in "subject_test.txt" document
subject.test <- read.table("J:/Coursera/Get_and_data_clean/UCI HAR Dataset/test/subject_test.txt")


## bind the train set and test set, named data.set
data.set <- rbind(train.set,test.set)
data.label <- rbind(train.label,test.label)
subject.set <- rbind(subject.train,subject.test)


##
##Step2: Extracts only the measurements to the mean and standard deviation for earch measurement
##

features.set <- read.table("J:/Coursera/Get_and_data_clean/UCI HAR Dataset/features.txt")
##View(features.set)

## get columns with mean() and std() in their names
mean_std_features <- grep("-(mean|std)\\(\\)",features.set[,2])

## subset the desired columns
data.set <- data.set[,mean_std_features]

## correct the columns names
names(data.set) <- features.set[mean_std_features,2]
##View(data.set)


##
## Step 3: Uses descriptive activity names to name the activities in the data set
##

activities.set <- read.table("J:/Coursera/Get_and_data_clean/UCI HAR Dataset/activity_labels.txt")
View(activities.set)

##update values with correct activity names
data.label[,1] <- activities.set[data.label[,1],2]

##correct column name
names(data.label) <- "activity" 


##
## Step 4: appropriately label the data set with descriptive variable names
##

## correct column name
names(subject.set) <- "subject"

## bind al the data in a single set
data <- cbind(data.set,data.label,subject.set)

View(data)


##
## Step 5: create a second, indepent tidy data set with the average of each varaibe for earch activity and each subject
##

average.data <- ddply(data,.(subject,activity),function(x) colMeans(x[,1:66]))
View(average.data)

write.table(average.data,"J:/Coursera/Get_and_data_clean/average_data.txt",row.name=FALSE)
