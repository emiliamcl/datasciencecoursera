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
