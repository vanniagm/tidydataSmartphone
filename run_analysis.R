#This is a script that does the following:
#1) Downloads the "UCI Human Activity Recognition Using Smartphones Data Set" zip file from the url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, 
# and unzips it in the current working directory
#2) Merges the training and test sets 
#3) Extracts only the measurements on the -mean()- and standard deviation -std()- for each measurement.
#4) Appends the descriptive activites with descriptive names as a factor variable to the data set 
#5) Appropriately labels the data set with descriptive variable names using the "feature" vector
#6) From the extracted data set described above it creates an independent tidy data set with the average of each 
# variable for each activity and each subject
#7) It writes two .csv files, "mean_std_vars.csv" which exports the first data set for the mean and std measurements, and the
# second "avg_data.csv" for the tidy data set with the mean values for each variable for each activity and each subject
# Pleasechoose a proper work directory before running the script. The .zip file would be downloaded in the current work directory. 
# You will need to install the "dplyr" library

library(dplyr)
if(!file.exists("./data")){dir.create("./data")}
fileURL1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL1,destfile = "./data/UCI_data.zip",method = "curl")
folder<-unzip("UCI_data.zip")
tests<-read.table("./UCI HAR Dataset/test/X_test.txt")
testlabel<-read.table("./UCI HAR Dataset/test/y_test.txt",stringsAsFactors = TRUE)
testlabel<-as.factor(testlabel$V1)
subjecttestlabel<-read.table("./UCI HAR Dataset/test/subject_test.txt",stringsAsFactors = FALSE)
subjecttestlabel<-as.integer(subjecttestlabel$V1)
train<-read.table("./UCI HAR Dataset/train/X_train.txt")
trainlabel<-read.table("./UCI HAR Dataset/train/y_train.txt",stringsAsFactors = TRUE)
trainlabel<-as.factor(trainlabel$V1)
subjecttrainlabel<-read.table("./UCI HAR Dataset/train/subject_train.txt",stringsAsFactors = FALSE)
subjecttrainlabel<-as.integer(subjecttrainlabel$V1)
tests$activity<-testlabel #me falta cambiar a los nombres descriptivos
train$activity<-trainlabel
tests$subject<-subjecttestlabel
train$subject<-subjecttrainlabel
activities<-read.table("./UCI HAR Dataset/activity_labels.txt")[2]
activities<-as.character(activities$V2)
levels(train$activity)<-activities
levels(tests$activity)<-activities
features<-read.table("./UCI HAR Dataset/features.txt")[2]
features<-as.character(features$V2)
colnames(tests)<-c(features,"activity","subject")
colnames(train)<-c(features,"activity","subject")
traintest<-rbind(tests,train)
dim(traintest)
meancols<-grep("-mean[^F].*-",names(traintest))
means<-traintest[meancols]
stdcols<-grep("-std.*-",names(traintest))
stds<-traintest[stdcols]
meanstd<-traintest[c(562,563,meancols,stdcols)]
meanstd<-meanstd[order(meanstd$subject),]
meancolsvalues<-grep("-mean[^F].*-",names(traintest),value=TRUE)
avg_meansstds<-meanstd%>% group_by(subject,activity)%>%summarize_each(funs(mean))
names(avg_meansstds) <- ifelse(names(avg_meansstds) %in% c("subject", "activity"),
                               names(avg_meansstds),
                               paste("avg", names(avg_meansstds), sep = "."))
write.csv(avg_meansstds,file="avg_data.csv")
write.csv(meanstd,file="mean_std_vars.csv")
