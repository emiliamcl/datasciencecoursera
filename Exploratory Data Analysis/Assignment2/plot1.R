require(downloader)
library(downloader)
require(dplyr)


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("C:/Users/emili/OneDrive/Documents/datacience specialization/data exploring/exdata_Fdata_FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/emili/OneDrive/Documents/datacience specialization/data exploring/exdata_Fdata_FNEI_data/Source_Classification_Code.rds")
head(NEI)
head(SCC)

#plot1#
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years
#1999, 2002, 2005, and 2008.

emissions <- summarise(group_by(NEI, year), Emissions=sum(Emissions))


b1<-barplot(height=emissions$Emissions/1000, names.arg=emissions$year,
            xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,8000),
            main=expression('Total PM'[2.5]*' emissions at various years in kilotons'))

## Add text to bars
text(x = b1, y = round(emissions$Emissions/1000,2), label = round(emissions$Emissions/1000,2), pos = 3, cex = 0.8, col = "black")

#decreasing all years >> 1999(7332.97) to 2008(3464.21) decrease >> - 0.53%