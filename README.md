# har-project
run_analysis.R script overview for Course Project - Getting and Cleaning Data

INTRO - Downloading source zip and establishing working directory
I have commented out the first few lines of code that provide the steps needed to download the source dataset zip and then unpackage or extract the files, you must then set the working directory to the folder that is created when the zip file is extracted, the lesson descibes that this process should be assumed and that the working directory is set as well as the files exist, I added it in just in case a grader wanted to test the results and needed to download the files. 

LOAD LIBRARIES - There are 3 libraries that need to be loaded and are identified accordingly.

BACKGROUND OF DATA - The data is based on various measurements of Human Activity Recognition using the accelerometers from the Samsug Galaxy S smartphone.

Here is a link to the project: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

There were a total of 30 subjects that were involved in both a training and testing session.  Each subject performed 6 movements or activities. The accelerometer data features included 561 different values.  The assignment requires that we combine each of the independent datasets to create a tidy data set that presents average value of each feature for each subject and their corresponding movements.  We are only including  83 of the 561 data features, all of which are values that represent the mean or standard deviation of particular feature.  This ultimately produces a data frame that has 180 unique observations (30 subjects x 6 movements) of 85 variables (83 features plus the subject and movement)


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
