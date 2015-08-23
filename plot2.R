# To read each of the two files provided for this course using the readRDS() function
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Calculate total pm2.5 emissions for each year just for Baltimore city, Maryland
SubsetMD  <- NEI[NEI$fips=="24510", ]
TotalPM25 <- aggregate(Emissions ~ year, SubsetMD, sum)

### Plot total emissions from PM2.5
barplot(height=as.numeric(TotalPM25$Emissions), names.arg=TotalPM25$year,xlab="Year", ylab = "Total PM2.5 Emissions",main=expression('Total PM'[2.5]* 'for Baltimore city, Maryland'), col=c("cadetblue","coral","darkgoldenrod1","cyan3"))

##Saving to plot2.png
dev.copy(png, file="plot2.png", height=480, width=480)

#close PNG device
dev.off()