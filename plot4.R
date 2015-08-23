# To read each of the two files provided for this course using the readRDS() function
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Across the United States, how have emissions from coal combustion-related sources changed from 1999 to 2008?

# merge the two data sets 
DSNEISCC <- merge(NEI, SCC, by="SCC")

#Subsetting records from coal combustion-related sources
onlyCoal  <- grepl("coal", DSNEISCC$Short.Name, ignore.case=TRUE)
subsetCoal <- DSNEISCC[onlyCoal, ]

TotalPM25 <- aggregate(Emissions ~ year, subsetCoal, sum)

### Plot total emissions from PM2.5
g <- ggplot(TotalPM25, aes(factor(year), Emissions/1000), color = type)
g <- g + geom_bar(stat="identity",fill=c("darkgoldenrod","chocolate1","chartreuse2","aquamarine2"), colour="darkgreen") +    # heights of the bars to represent values
    xlab("Year") +
    ylab(expression('Total PM'[2.5]*" Emissions in thousands")) +
    ggtitle('Total Emissions from coal combustion-related  \n sources changed from 1999 to 2008') +
    theme(plot.title = element_text(hjust = 0.5),plot.title = element_text(size = rel(1.6), colour = "darkblue"),
          legend.title = element_text(face = "italic"), legend.background = element_rect(colour = "darkgreen"),
            panel.background = element_rect(fill = "palegoldenrod"))
print(g)

##Saving to plot4.png
dev.copy(png, file="plot4.png", height=480, width=480)

#close PNG device
dev.off()