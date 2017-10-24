#plot2#
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("C:/Users/emili/OneDrive/Documents/datacience specialization/data exploring/exdata_Fdata_FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/emili/OneDrive/Documents/datacience specialization/data exploring/exdata_Fdata_FNEI_data/Source_Classification_Code.rds")
str(NEI$fips)
names(NEI)
head(SCC)


library(dplyr)
library(ggplot2)


#subset baltimore City, Maryland (fips == "24510") 
baltcitymary.emissions<-summarise(group_by(filter(NEI, fips == "24510"), year), Emissions=sum(Emissions))


b2<-barplot(height=baltcitymary.emissions$Emissions/1000, names.arg=baltcitymary.emissions$year,
            xlab="years", ylab=expression('total PM emission in kilotons'),ylim=c(0,4),
            main=expression('Total PM  emissions in Baltimore City-MD in kilotons'))

## Add text at top of bars
text(x = b2, y = round(baltcitymary.emissions$Emissions/1000,2), label = round(baltcitymary.emissions$Emissions/1000,2), pos = 3, cex = 0.8, col = "black")

# increases in 2005
#all period >3.27 in 1999 to 1.86 in 2008 -  (decrease >> -0.43%) 