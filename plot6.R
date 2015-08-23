# To read each of the two files provided for this course using the readRDS() function
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources
# in Los Angeles County, California
# Which city has seen greater changes over time in motor vehicle emissions?

#Subsetting records from motor vehicle sources in Baltimore City
SubsetMDCA  <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD", ]
TotalPM25 <- aggregate(Emissions ~ year + fips, SubsetMDCA, sum)
TotalPM25$fips[TotalPM25$fips=="24510"] <- "Baltimore, MD"
TotalPM25$fips[TotalPM25$fips=="06037"] <- "Los Angeles, CA"


### Plot total emissions from PM2.5
g <- ggplot(TotalPM25, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity",fill=c("snow","steelblue1","royalblue3","deepskyblue4"), colour="darkgreen") + 
    xlab("Year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from motor vehicle \n sources in Baltimore and Los Angeles') +
    theme(plot.title = element_text(size = rel(1.4), colour = "darkblue"),
          legend.position = "none", legend.title = element_text(face = "italic"), legend.background = element_rect(colour = "black")) + 
    geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=-1)) +
    theme(panel.background = element_rect(fill = "goldenrod1"))
print(g)

##Saving to plot6.png
dev.copy(png, file="plot6.png", height=480, width=480)

#close PNG device
dev.off()