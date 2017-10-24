## Course Project 1

#### 1.Code for reading in the dataset and/or processing the data
#### 2.Histogram of the total number of steps taken each day
#### 3.Mean and median number of steps taken each day
#### 4.Time series plot of the average number of steps taken
#### 5.The 5-minute interval that, on average, contains the maximum number of steps
#### 6.Code to describe and show a strategy for imputing missing data
#### 7.Histogram of the total number of steps taken each day after missing values are imputed
#### 8.Panel plot comparing the average number of steps taken per 5-minute interval across weekdays and weekends
#### 9. All of the R code needed to reproduce the results (numbers, plots, etc.) in the report


### Assignmentless 
This assignment will be described in multiple parts. You will need to write a report that answers the questions detailed below. Ultimately, you will need to complete the entire assignment in a single R markdown document that can be processed by knitr and be transformed into an HTML file.

Throughout your report make sure you always include the code that you used to generate the output you present. When writing code chunks in the R markdown document, always use echo = TRUE so that someone else will be able to read the code. This assignment will be evaluated via peer assessment so it is essential that your peer evaluators be able to review the code for your analysis.

For the plotting aspects of this assignment, feel free to use any plotting system in R (i.e., base, lattice, ggplot2)

Fork/clone the GitHub repository created for this assignment. You will submit this assignment by pushing your completed files into your forked repository on GitHub. The assignment submission will consist of the URL to your GitHub repository and the SHA-1 commit ID for your repository state.

NOTE: The GitHub repository also contains the dataset for the assignment so you do not have to download the data separately.

Loading and preprocessing the data

Show any code that is needed to

#### 1.Load the data (i.e. read.csv())
#### 2.Process/transform the data (if necessary) into a format suitable for your analysis
#### 3.What is mean total number of steps taken per day?

For this part of the assignment, you can ignore the missing values in the dataset.

#### 1.Calculate the total number of steps taken per day
#### 2.If you do not understand the difference between a histogram and a barplot, research the difference between them. 
#### 3.Make a histogram of the total number of steps taken each day
#### 4.Calculate and report the mean and median of the total number of steps taken per day
#### 5.What is the average daily activity pattern? 
#### 6.Make a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)
#### 7.Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?

### Imputing missing values

##### Note that there are a number of days/intervals where there are missing values (coded as NA). The presence of missing days may introduce bias into some calculations or summaries of the data.

1.Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with NAs)

2.Devise a strategy for filling in all of the missing values in the dataset. The strategy does not need to be sophisticated. For example, you could use the mean/median for that day, or the mean for that 5-minute interval, etc.

3.Create a new dataset that is equal to the original dataset but with the missing data filled in.

4.Make a histogram of the total number of steps taken each day and Calculate and report the mean and median total number of steps taken per day. Do these values differ from the estimates from the first part of the assignment? What is the impact of imputing missing data on the estimates of the total daily number of steps?

5.Are there differences in activity patterns between weekdays and weekends?

For this part the weekdays() function may be of some help here. Use the dataset with the filled-in missing values for this part.

Create a new factor variable in the dataset with two levels – “weekday” and “weekend” indicating whether a given date is a weekday or weekend day.

Make a panel plot containing a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all weekday days or weekend days (y-axis). See the README file in the GitHub repository to see an example of what this plot should look like using simulated data.
