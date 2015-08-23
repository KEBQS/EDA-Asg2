# To read each of the two files provided for this course using the readRDS() function
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total
#PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# Calculate total pm2.5 emissions for each year
TotalPM25 <- aggregate(Emissions ~ year, NEI, sum)

### Plot total emissions from PM2.5
barplot(height=as.numeric(TotalPM25$Emissions/1000000), names.arg=TotalPM25$year,xlab="Year", ylab = "Total PM2.5 Emissions in millions",main=expression('Total PM'[2.5]*'  in the United States'), col=c("blue","red","green","yellow"))

##Saving to plot1.png
dev.copy(png, file="plot1.png", height=480, width=480)

#close PNG device
dev.off()