library(dplyr)
library(data.table)

#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
##############################  PLOT 1  ##############################################
#/////////////////////////////////////////////////////////////////////////////////////

#Reading and preparing dataset
plot1 <- read.table("...data exploring/exdata_Fdata_Fhousehold_power_consumption/householdpowerconsumption.txt",header=T, sep=";")
plot1$Date <- as.Date(plot1$Date, format="%d/%m/%Y")
head(plot1)
nrow(plot1)
subs_plot1 <- subset(plot1, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
nrow(subs_plot1)

###Making Plots

hist(as.numeric(as.character(subs_plot1$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

title(main="Global Active Power")

#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
##############################  PLOT 2  ##############################################
#/////////////////////////////////////////////////////////////////////////////////////

#Reading and preparing dataset
plot2 <- read.table("file:///C:/Users/emili/OneDrive/Documents/datacience specialization/data exploring/exdata_Fdata_Fhousehold_power_consumption/householdpowerconsumption.txt",header=T, sep=";")
nrow(plot2)
plot2$Date <- as.Date(plot2$Date, format="%d/%m/%Y")
subs_plot2 <- subset(plot2, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
nrow(subs_plot2)


# Transforming the Date and Time
subs_plot2$Time <- strptime(subs_plot2$Time, format="%H:%M:%S")
subs_plot2[1:1440,"Time"] <- format(subs_plot2[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subs_plot2[1441:2880,"Time"] <- format(subs_plot2[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# plot function
plot(subs_plot2$Time,as.numeric(as.character(subs_plot2$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# title
title(main="Global Active Power Vs Time")


#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
##############################  PLOT 3  ##############################################
#/////////////////////////////////////////////////////////////////////////////////////

#Reading and preparing dataset
plot3 <- read.table(".../data exploring/exdata_Fdata_Fhousehold_power_consumption/householdpowerconsumption.txt",header=T, sep=";")

plot3$Date <- as.Date(plot3$Date, format="%d/%m/%Y")
subs_plot3 <- subset(plot3, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Transforming the Date and Time 
subs_plot3$Date <- as.Date(subs_plot3$Date, format="%d/%m/%Y")
subs_plot3$Time <- strptime(subs_plot3$Time, format="%H:%M:%S")
subs_plot3[1:1440,"Time"] <- format(subs_plot3[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subs_plot3[1441:2880,"Time"] <- format(subs_plot3[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# plot functions
plot(subs_plot3$Time,subs_plot3$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subs_plot3,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subs_plot3,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subs_plot3,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# title
title(main="Energy sub-metering")

#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
##############################  PLOT 4  ##############################################
#/////////////////////////////////////////////////////////////////////////////////////


#Reading and preparing dataset
plot4 <- read.table(".../data exploring/exdata_Fdata_Fhousehold_power_consumption/householdpowerconsumption.txt",header=T, sep=";")

plot4$Date <- as.Date(plot4$Date, format="%d/%m/%Y")
subs_plot4 <- subset(plot4, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subs_plot4$Date <- as.Date(subs_plot4$Date, format="%d/%m/%Y")
subs_plot4$Time <- strptime(subs_plot4$Time, format="%H:%M:%S")
subs_plot4[1:1440,"Time"] <- format(subs_plot4[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subs_plot4[1441:2880,"Time"] <- format(subs_plot4[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


##
par(mfrow=c(2,2))

#4 plots that form the graph
with(subs_plot4,{
  plot(subs_plot4$Time,as.numeric(as.character(subs_plot4$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subs_plot4$Time,as.numeric(as.character(subs_plot4$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subs_plot4$Time,subs_plot4$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subs_plot4,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subs_plot4,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subs_plot4,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subs_plot4$Time,as.numeric(as.character(subs_plot4$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})


