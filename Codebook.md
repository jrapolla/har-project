Codebook

Descriptions for "movement" 
1  = WALKING
2 =  WALKING_UPSTAIRS
3 =  WALKING_DOWNSTAIRS
4 =  SITTING
5 =  STANDING
6 =  LAYING

List of the 85 of 561 activities that are used in final dataset  

1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z
41 tGravityAcc-mean()-X
42 tGravityAcc-mean()-Y
43 tGravityAcc-mean()-Z
44 tGravityAcc-std()-X
45 tGravityAcc-std()-Y
46 tGravityAcc-std()-Z
81 tBodyAccJerk-mean()-X
82 tBodyAccJerk-mean()-Y
83 tBodyAccJerk-mean()-Z
84 tBodyAccJerk-std()-X
85 tBodyAccJerk-std()-Y
86 tBodyAccJerk-std()-Z
121 tBodyGyro-mean()-X
122 tBodyGyro-mean()-Y
123 tBodyGyro-mean()-Z
124 tBodyGyro-std()-X
125 tBodyGyro-std()-Y
126 tBodyGyro-std()-Z
161 tBodyGyroJerk-mean()-X
162 tBodyGyroJerk-mean()-Y
163 tBodyGyroJerk-mean()-Z
164 tBodyGyroJerk-std()-X
165 tBodyGyroJerk-std()-Y
166 tBodyGyroJerk-std()-Z
201 tBodyAccMag-mean()
202 tBodyAccMag-std()
214 tGravityAccMag-mean()
215 tGravityAccMag-std()
227 tBodyAccJerkMag-mean()
228 tBodyAccJerkMag-std()
240 tBodyGyroMag-mean()
241 tBodyGyroMag-std()
253 tBodyGyroJerkMag-mean()
254 tBodyGyroJerkMag-std()
266 fBodyAcc-mean()-X
267 fBodyAcc-mean()-Y
268 fBodyAcc-mean()-Z
269 fBodyAcc-std()-X
270 fBodyAcc-std()-Y
271 fBodyAcc-std()-Z
294 fBodyAcc-meanFreq()-X
295 fBodyAcc-meanFreq()-Y
296 fBodyAcc-meanFreq()-Z
345 fBodyAccJerk-mean()-X
346 fBodyAccJerk-mean()-Y
347 fBodyAccJerk-mean()-Z
348 fBodyAccJerk-std()-X
349 fBodyAccJerk-std()-Y
350 fBodyAccJerk-std()-Z
373 fBodyAccJerk-meanFreq()-X
374 fBodyAccJerk-meanFreq()-Y
375 fBodyAccJerk-meanFreq()-Z
424 fBodyGyro-mean()-X
425 fBodyGyro-mean()-Y
426 fBodyGyro-mean()-Z
427 fBodyGyro-std()-X
428 fBodyGyro-std()-Y
429 fBodyGyro-std()-Z
452 fBodyGyro-meanFreq()-X
453 fBodyGyro-meanFreq()-Y
454 fBodyGyro-meanFreq()-Z
503 fBodyAccMag-mean()
504 fBodyAccMag-std()
513 fBodyAccMag-meanFreq()
516 fBodyBodyAccJerkMag-mean()
517 fBodyBodyAccJerkMag-std()
526 fBodyBodyAccJerkMag-meanFreq()
529 fBodyBodyGyroMag-mean()
530 fBodyBodyGyroMag-std()
539 fBodyBodyGyroMag-meanFreq()
542 fBodyBodyGyroJerkMag-mean()
543 fBodyBodyGyroJerkMag-std()
552 fBodyBodyGyroJerkMag-meanFreq()
556 angle(tBodyAccJerkMean),gravityMean)
557 angle(tBodyGyroMean,gravityMean)
558 angle(tBodyGyroJerkMean,gravityMean)
559 angle(X,gravityMean)
560 angle(Y,gravityMean)
561 angle(Z,gravityMean)

Subjects were simply identified as a number 1-30



READING DATA INTO R AND MANIPULATIONS - Establish the starting source datasets into their corresponding variables

"activitylabels" - this we rename later into movements as more descriptive name, there are 6 total movements that each test subject perform, they are walking, walking_upstairs, walking_downstairs, sitting, standing, and laying
"features" - these are the technical descriptions of each variable associated to the various movements, we ultimately will need to apply these labels to each of the measurements collected
"subtest" and "subtrain" - these correspond to the subjects associated to each test and train sessions 
"xtest" and "xtrain" - these are the observations of the 561 features
"ytest" and "ytrain" - these correspond to the movements/activities associated to each of the 561 feature observations
"subtest" and "subtrain" - we rename each of the data columns to be the same in order to merge - we name it "subject"
"ytest" and "ytrain" - we rename each of the data columns to be the same in order to merge - we name it "movement"

The next featuretable sequence creates a character vector of each of the names of the 561 features so we can map these names to the "xtest" and "xtrain" data.

Now we begin to merge the subject data with the test and train data that corresponds to each and then we merge the movement data to the test and train data. 

Ultimately we have "subtest3" and "subtrain3" after this processing.  Since the movement data is still coded numerically, we need to replace those codes with the descriptive movement instead. So we create "movement.code" that establishes a vector to assign the proper labels to each numeric code. 

"total_data" - we now can merge the test and train data, "subtest3" and "subtrain3" accordingly. 

Since this includes all of the 561 features, we need to filter out all on the features that are not mean or standard deviation values.  We create a vector that selects each of the columns called "featurecolumn" and subset the total_data data frame producing "totaldata2" dataframe which is our first tidy data set, but we need to summarize by averaging the values for each subject and each movement, which means we need to melt the "totaldata2" dataframe. 

To prepare for the melt function, we have to identify the variable names, and since they are so long and unique, we create another variable "a" that takes the column names we need from the "totaldata2" data frame.

We create "totaldata2melt" by using "subject" and "movement" as id's and the measure variables are in the "a" variable we just created. 

This creates our long tidy set and now we will use the dcast function to aggregate the values and calculate the mean, we randomly assigned this to the "td7" because it took me several tries (seven) to make this work correctly!

The last step creates the text file as per the assignment and stores into the working directory without row names. 

Victory!  

