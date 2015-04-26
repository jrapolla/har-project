        fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" ### Source URL for Data
        download.file(fileURL, destfile = "har_dataset.zip")### Download file to current working directory
        unzip("har_dataset.zip")### Extract files 
        setwd("./UCI HAR Dataset")### Set working directory to new folder created from unzip extract
                ### Start creating variables for all relevent test and train data
                ### by reading into R each of the independent datasets upon which we will 
                ### manipulate and construct a tidy data set
        activitylabels <- read.table("activity_labels.txt")
        features <- read.table("features.txt") 
        subtest <- read.table("./test/subject_test.txt") 
        xtest <- read.table("./test/X_test.txt")
        ytest <- read.table("./test/y_test.txt")
        subtrain <- read.table("./train/subject_train.txt")
        xtrain <- read.table("./train/X_train.txt")
        ytrain <- read.table("./train/y_train.txt")
                ### Begin merge process of both test and train datasets plus cleaning and labeling columns, etc..
        subtest <- rename(subtest, subject_id = V1)
        subtrain <- rename(subtrain, subject_id = V1)
        ytest <- rename(ytest, movement = V1)
        ytrain <- rename(ytrain, movement = V1)
        subtrain2 <- data.frame(subtrain, xtrain)
        subtest2 <- data.frame(subtest, xtest)
        subtest3 <- data.frame(subtest2, ytest)
        subtrain3 <- data.frame(subtrain2, ytrain)
        total_data <- rbind(subtest3, subtrain3)
        total_data %>%
                
       