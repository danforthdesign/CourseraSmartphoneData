# Human Activity Recognition through Smartphones

To create the simplified dataset, download the run_analysis.R script to your computer and run the file in RStudio. First this script will download and unzip the dataset, then process the files in the original raw data developed by UC Irvine's Machine Learning Repository.

The raw data includes a training set and a test set which need to be combined into one table. Each set includes measurements for a multitude of properties for each activity instance. We only are interested in the mean and standard deviation for each activity instance so after combining the sets, the relevant columns are saved separately.

Each set also includes a file aligning the activity type and which subject performed the activity. These files are read into R, then combined into a vector for activities and a vector for subjects. Then the activities, subjects and relevant measurements are all combined into one dataframe. From this dataframe, we create a subset which only includes the means for each activity to be able to easily generate the mean for each activity.

Next, we subset the dataframe with just the means into six separate dataframes, one for each activity measured: walking, walking upstairs, walking downstairs, sitting, standing, and laying. For each activity dataset, we calculate the mean for each activity from the average of all of the measurements captured for each subject.

Now that all data has been processed, the script will save a txt file of the simplified data in your working directory.