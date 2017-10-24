#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
##############################  PLOT 2  ##############################################
#/////////////////////////////////////////////////////////////////////////////////////

#Reading and preparing dataset
plot2 <- read.table(".../exdata_Fdata_Fhousehold_power_consumption/householdpowerconsumption.txt",header=T, sep=";")
nrow(plot2)
plot2$Date <- as.Date(plot2$Date, format="%d/%m/%Y")
subs_plot2 <- subset(plot2, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
nrow(subs_plot2)


# Transforming the Date and Time
subs_plot2$Time <- strptime(subs_plot2$Time, format="%H:%M:%S")
subs_plot2[1:1440,"Time"] <- format(subs_plot2[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subs_plot2[1441:2880,"Time"] <- format(subs_plot2[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# Ploting
plot(subs_plot2$Time,as.numeric(as.character(subs_plot2$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# Title
title(main="Global Active Power Vs Time")
