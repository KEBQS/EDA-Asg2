# To read each of the two files provided for this course using the readRDS() function
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# How have emissions from motor vehicle sources changed from 1999 to 2008 in Baltimore City?

#Subsetting records from motor vehicle sources in Baltimore City
SubsetMD  <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD", ]
TotalPM25 <- aggregate(Emissions ~ year, SubsetMD, sum)

### Plot total emissions from PM2.5
g <- ggplot(TotalPM25, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity",fill=c("forestgreen","firebrick1","deeppink4","dodgerblue"), colour="darkgreen") +    # heights of the bars to represent values
    xlab("Year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from motor vehicle sources \n changed from 1999 to 2008 in Baltimore City') +
    theme(plot.title = element_text(hjust = 0.5),plot.title = element_text(size = rel(1.6), colour = "darkblue"),
          legend.title = element_text(face = "italic"), legend.background = element_rect(colour = "darkgreen")) +
    theme(panel.background = element_rect(fill = "darkolivegreen1"))
print(g)

##Saving to plot5.png
dev.copy(png, file="plot5.png", height=480, width=480)

#close PNG device
dev.off()