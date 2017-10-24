---
title: "Research_Project1"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

#Reproducible Research: Peer Assessment 1
```{r}
library(ggplot2)
library(scales)
library(Hmisc)
library(knitr)
library(ggplot2)
library(dplyr)
library(plyr)
```




#1.Code for reading in the dataset and/or processing the data
```{r}
activity_ds <- read.csv('file:///C:/Users/emili/OneDrive/Documents/datacience specialization/Rep research/repdata_Fdata_Factivity/activity.csv')
head(activity_ds)
dim(activity_ds)
str(activity_ds)
```

Process/transform the data 
```{r}
library(lubridate)

activity_ds$date <- ymd(activity_ds$date)

#activityData$interval <- strptime(gsub("([0-9]{1,2})([0-9]{2})", "\\1:\\2", activityData$interval), format='%H:%M')
```


#2 Histogram of the total number of steps taken each day
```{r}
steps_day <- aggregate(steps ~ date, data = activity_ds, FUN = sum, na.rm = TRUE)
plot(steps_day)


ggplot(steps_day, aes(x = steps)) + 
  geom_histogram(fill = "blue", binwidth = 500) + 
  labs(title="Histogram of Steps per Day", 
       x = "Nr of Steps/Day", y = "(Count)") + theme_bw() 
```




#3. Calculate and report the mean and median total number of steps taken per day
```{r}
steps_day_mean <- mean(steps_day$steps)
steps_day_median <- median(steps_day$steps)
steps_day_mean
#9354.23
steps_day_median
# 10395
```



#4 Time series plot of the average number of steps taken

```{r}
average_ap<- aggregate(steps ~ interval, data = activity_ds, FUN = mean, na.rm = TRUE)

```

```{r}
ggplot(data=average_ap, aes(x=interval, y=steps)) +
  geom_line() +
  xlab("5minute interval") +
  ylab("avg number of steps taken") 
```



#5. The 5-minute interval that, on average, contains the maximum number of steps

```{r}
maxsteps <- average_ap$interval[which.max(average_ap$steps)]
maxsteps
```


835th 5-min interval


Imputing missing values
# 6 Code to describe and show a strategy for imputing missing data

Calculate and reportthe total number of rows with NAs)

```{r}
missing <- length(which(is.na(activity_ds$steps)))
missing
```

2304 missing values


```{r}
new_activity <- activity_ds
na <- is.na(new_activity$steps)
avg_data<- tapply(new_activity$steps, new_activity$interval, mean, na.rm=TRUE, simplify = TRUE)
new_activity$steps[na] <- avg_data[as.character(new_activity$interval[na])]
names(new_activity)
sum(is.na(new_activity))
#no missing values in new dataset
summary(new_activity)
```



#without NA
```{r}
new_activity2 <- aggregate(steps ~ date, data = new_activity, FUN = sum, na.rm = TRUE)
new_activity2
```



```{r}
head(new_activity2)
#compare
summary(new_activity)
summary(new_activity2)
```



#7. Histogram of the total number of steps taken each day after missing values are imputed
Histogram without the NA values
```{r}
hist(new_activity2$steps, 
     main = "Total Steps per Day", 
     xlab = "Number of Steps per Day", 
     ylab = "Interval",
     col="blue",
     breaks=100)
```



#8 Panel plot comparing the average number of steps taken per 5-minute interval across weekdays and weekends
New factor variable >> two levels – “weekday” | “weekend” 

method1
```{r}
new_activity<- new_activity %>%
mutate(typeofday= ifelse(weekdays(new_activity$date)=="Saturday" | weekdays(new_activity$date)=="Sunday", "Weekend", "Weekday"))
head(new_activity)

```


Plot1
```{r}
fivemin<- aggregate(steps ~ interval, data = new_activity, FUN = mean, na.rm = TRUE)
head(fivemin)
```



```{r}
ggplot(new_activity, aes(x =interval , y=steps, color=typeofday)) +
  geom_line() +
  labs(title = "Avg Daily Steps", x = "Interval", y = "Total Number of Steps") +
  facet_wrap(~ typeofday, ncol = 1, nrow=2)
```



