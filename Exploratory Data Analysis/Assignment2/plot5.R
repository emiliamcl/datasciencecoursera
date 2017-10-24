#plot5#
#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#on road | baltimore
baltcitymary.emissions<-NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]

require(dplyr)
baltcitymary.emissions.byyear <- summarise(group_by(baltcitymary.emissions, year), Emissions=sum(Emissions))
require(ggplot2)
ggplot(baltcitymary.emissions.byyear, aes(x=factor(year), y=Emissions,fill=year, label = round(Emissions,2))) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("total emissions in tons")) +
  ggtitle("Emissions from motor vehicle in Baltimore City")+
  geom_label(aes(fill = year),colour = "white")

#Yes, a big increase was seen >> 1999 to 2008 > 346.82 to 88.28 
