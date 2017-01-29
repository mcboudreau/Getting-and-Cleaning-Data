# Create file directory and download data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip dataSet to /data directory
unzip("./data/Dataset.zip",exdir="./data")


# Read the files into tables
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./data/UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./data/UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")

activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")

# Let's merge the data sets to create one master data set
data_test <- cbind(y_test,subject_test,x_test)
data_training <- cbind(y_train,subject_train,x_train)
data_master <- rbind(data_test,data_training)

# Assign meaningful column names
names(data_master) <- c("Activity","Subject",as.character(features[,2]))

# Extract only the measurements on the mean and standard deviation for each measurement
data_master <- data_master[,grepl("mean", names(data_master)) | grepl("std", names(data_master)) 
                          | grepl("Subject", names(data_master)) | grepl("Activity", names(data_master))]

# Use descriptive activity names to name the activities in the data set
data_master[,1] <- activity_labels[data_master[,1],2]

# From the master data set create a second, independent tidy data set with the average 
# of each variable for each activity and each subject
data_tidy <- aggregate(. ~Activity + Subject, data_master, mean)
write.table(data_tidy,"./data/tidydata.txt", sep = "\t")