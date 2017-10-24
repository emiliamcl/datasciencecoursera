#plot3#
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen 
#increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question

require(ggplot2)
## Loading required package: ggplot2
require(dplyr)
#png("plot3.png", width=number.add.width, height=number.add.height)
# Group total NEI emissions per year:
baltcitymary.emissions.byyear<-summarise(group_by(filter(NEI, fips == "24510"), year,type), Emissions=sum(Emissions))

ggplot(baltcitymary.emissions.byyear, aes(x=factor(year), y=Emissions, fill=type)) +
  geom_bar(stat="identity") +
  facet_grid(type ~.) +
  xlab("year") +
  ylab(expression("total PM emission in tons")) +
  ggtitle(expression("PM emissions in Baltimore ", "Various source types", sep=""))


# all of them decrease EXCEPT - TYPE POINT