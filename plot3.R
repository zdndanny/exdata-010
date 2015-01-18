# plot3.R 
# exdata-010 Project 2 Question 3

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
source("./proj2.R")
library("ggplot2")

# Upload a PNG file containing your plot addressing this question.
B  <- NEI[NEI$fips==24510,]

# If you want y to represent counts of cases, use stat="bin" and don't map a variable to y.
# If you want y to represent values in the data, use stat="identity".
# See ?geom_bar for examples.

qplot(data=B, x=year, y=Emissions, geom="bar", stat="identity", ylab="Emissions Total", facets=~type)


dev.copy(png,file='plot3.png')
dev.off()
