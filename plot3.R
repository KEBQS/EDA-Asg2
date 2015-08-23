# To read each of the two files provided for this course using the readRDS() function
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999 to 2008 for Baltimore City?
# Which have seen increases in emissions from 1999 to 2008? Use the ggplot2 plotting system to make a
# plot answer this question

# Calculate total pm2.5 emissions for each year just for Baltimore city, MD
SubsetMD  <- NEI[NEI$fips=="24510", ]

#Classify Emissions by year and by type
TotalPM25 <- aggregate(Emissions ~ year + type, SubsetMD, sum)

### Plot total emissions from PM2.5
g <- ggplot(TotalPM25, aes(year, Emissions, color = type))
g <- g + geom_line() +
        xlab("Year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions in  \n Baltimore City, Maryland') +
        theme(plot.title = element_text(size = rel(1.6), colour = "blue"),
            legend.title = element_text(face = "italic"), legend.background = element_rect(colour = "darkgreen"))
        #theme(panel.background = element_rect(fill = "white"))
print(g)

##Saving to plot3.png
dev.copy(png, file="plot3.png", height=480, width=480)

#close PNG device
dev.off()