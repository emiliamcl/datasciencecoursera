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