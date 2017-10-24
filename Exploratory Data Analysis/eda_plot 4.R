#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
##############################  PLOT 4  ##############################################
#/////////////////////////////////////////////////////////////////////////////////////


#Reading and preparing dataset
plot4 <- read.table("file:///C:/Users/emili/OneDrive/Documents/datacience specialization/data exploring/exdata_Fdata_Fhousehold_power_consumption/householdpowerconsumption.txt",header=T, sep=";")

plot4$Date <- as.Date(plot4$Date, format="%d/%m/%Y")
subs_plot4 <- subset(plot4, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Transforming the Date and Time 
subs_plot4$Date <- as.Date(subs_plot4$Date, format="%d/%m/%Y")
subs_plot4$Time <- strptime(subs_plot4$Time, format="%H:%M:%S")
subs_plot4[1:1440,"Time"] <- format(subs_plot4[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subs_plot4[1441:2880,"Time"] <- format(subs_plot4[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#2 by 2 layout
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
## Saving png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

