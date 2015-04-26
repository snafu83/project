### course project - Getting and Cleaning Data
### christian jaehnichen

# load libraries

library("dplyr")
library("data.table")

# check whether data exists in working directory and download data if not
# set ./UCI\ HAR\ Dataset as working directory

if(!dir.exists("UCI\ HAR\ Dataset")){
  dir.create("data")
  setwd("./data")
}else{
  setwd("./UCI\ HAR\ Dataset")
}

if(!(file.exists("activity_labels.txt") & file.exists("features.txt") & file.exists("./test/X_test.txt") & file.exists("./test/Y_test.txt") & file.exists("./train/X_train.txt") & file.exists("./train/Y_train.txt"))){
  file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(file.url, destfile = "./data/dataset.zip", method = "curl")
  unzip("./data/dataset.zip", overwrite = TRUE)
  setwd("./UCI\ HAR\ Dataset")
}

# read files, i.e. training and test sets including subjects and activity & variable names

activities <- read.table("activity_labels.txt", col.names = c("number", "label"))
features <- read.table("features.txt", col.names = c("number", "label"))

train.x <- read.table("./train/X_train.txt")
train.y <- read.table("./train/Y_train.txt", col.names = c("activities"))
subject.train <- read.table("./train/subject_train.txt", col.names = c("subject"))

test.x <- read.table("./test/X_test.txt")
test.y <- read.table("./test/Y_test.txt", col.names = c("activities"))
subject.test <- read.table("./test/subject_test.txt", col.names = c("subject"))

# label activities

for (i in 1:length(test.y$activities)){
  for (j in 1:6){
    if (test.y$activities[i] == j){
      test.y$activities[i] <- as.character(activities$label[j])
    }
  }
}

for (i in 1:length(train.y$activities)){
  for (j in 1:6){
    if (train.y$activities[i] == j){
      train.y$activities[i] <- as.character(activities$label[j])
    }
  }
}

# merge activities, subjects and numbers

complete.test <- cbind(test.y, subject.test, test.x)
complete.train <- cbind(train.y, subject.train, train.x)

# combine train and test data

complete.set <- rbind(complete.test, complete.train)

# subset of dataset, i.e. only column including mean and std in name plus subjact and activity, and name columns

x <- grep("mean\\(\\)|std\\(\\)", features$label) + 2
data.filtered <- select(complete.set, c(1, 2, x))
names(data.filtered) <- c("activities", "subject", as.character(features$label[x-2]))

# remove all temporary data, i.e. complete.set is the only one left

rm(test.y, test.x, train.y, train.x, activities, subject.test, subject.train, complete.test, complete.train, i, j)

# change labels to appropriate labels

names(data.filtered) <- gsub("^t", "time", names(data.filtered))
names(data.filtered) <- gsub("^f", "Frequency", names(data.filtered))
names(data.filtered) <- gsub("Acc", "Accelerometer", names(data.filtered))
names(data.filtered) <- gsub("Gyro", "Gyroscope", names(data.filtered))
names(data.filtered) <- gsub("Mag", "Magnitude", names(data.filtered))
names(data.filtered) <- gsub("BodyBody", "Body", names(data.filtered))

# tidy dataset with average for each variable by activity and subject and write it in text file

tidy.data <- aggregate(. ~ subject + activities, data.filtered, mean)
write.table(tidy.data, "tidy_data.txt", sep = "\t", row.name = FALSE, quote = FALSE)

# remove rest of saved variables

rm(tidy.data, features, complete.set, data.filtered, x)
