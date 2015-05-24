        ### fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" ### Source URL for Data
        ### download.file(fileURL, destfile = "har_dataset.zip")### Download file to current working directory
        ### unzip("har_dataset.zip")### Extract files 
        ### setwd("./UCI HAR Dataset")### Set working directory to new folder created from unzip extract
                ### Start creating variables for all relevent test and train data
                ### by reading into R each of the independent datasets upon which we will 
                ### manipulate and construct a tidy data set
        library(dplyr)
        library(reshape2)
        library(data.table)
                
        activitylabels <- read.table("activity_labels.txt")
        features <- read.table("features.txt") 
        subtest <- read.table("./test/subject_test.txt") 
        xtest <- read.table("./test/X_test.txt")
        ytest <- read.table("./test/y_test.txt")
        subtrain <- read.table("./train/subject_train.txt")
        xtrain <- read.table("./train/X_train.txt")
        ytrain <- read.table("./train/y_train.txt")
                ### Begin merge process of both test and train datasets plus cleaning and labeling columns, etc..
        subtest <- rename(subtest, subject = V1)
        subtrain <- rename(subtrain, subject = V1)
        ytest <- rename(ytest, movement = V1)
        ytrain <- rename(ytrain, movement = V1)
        featuretable <- as.data.table(features)
        featurelist2 <- featuretable[, V2]
        featurelist3 <- as.character(featurelist2)
        colnames(xtest) <- featurelist3        
        colnames(xtrain) <- featurelist3
        subtrain2 <- data.frame(subtrain, xtrain)
        subtest2 <- data.frame(subtest, xtest)
        subtest3 <- data.frame(subtest2, ytest)
        subtrain3 <- data.frame(subtrain2, ytrain)
        movement.code <- c(walking=1, walking_upstairs=2, walking_downstairs=3, sitting=4, standing=5, laying=6)
        subtest3$movement <- names(movement.code)[match(subtest3$movement, movement.code)]
        subtrain3$movement <- names(movement.code)[match(subtrain3$movement, movement.code)]
        total_data <- rbind(subtest3, subtrain3)
        filtercolumn <- c(1:7, 42:47, 82:87, 122:127, 162:167, 202:203, 215:216, 228:229, 241:242, 254:255, 267:272, 295:297, 346:351, 374:376 425:430, 453:455, 504:505, 514, 517:518, 527, 530:531, 540, 543:544, 553, 557:563)
        totaldata2 <- total_data[, filtercolumn]
        a <- colnames(totaldata2[2:86])
        totaldata2melt <- melt(totaldata2, id=c("subject","movement"), measure.vars=a)
        td7 <- dcast(totaldata2melt, subject + movement ~ variable, fun.aggregate = mean, na.rm = TRUE)
        write.table(td7, "step5tidydata.txt", row.name=FALSE) #exports text file per assignment instructions
        View(td7) #displays final dataset for validation
