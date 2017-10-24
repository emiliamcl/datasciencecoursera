library(dplyr)
library(data.table)

#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
##############################  PLOT 1  ##############################################
#/////////////////////////////////////////////////////////////////////////////////////

#Reading and preparing dataset
plot1 <- read.table(".../exdata_Fdata_Fhousehold_power_consumption/householdpowerconsumption.txt",header=T, sep=";")
plot1$Date <- as.Date(plot1$Date, format="%d/%m/%Y")
head(plot1)
nrow(plot1)
subs_plot1 <- subset(plot1, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
nrow(subs_plot1)

###Making Plot

hist(as.numeric(as.character(subs_plot1$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
#title
title(main="Global Active Power")
#png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
