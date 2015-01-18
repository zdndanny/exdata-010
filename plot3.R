# Question 3 Plot
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
library("ggplot2")

# Upload a PNG file containing your plot addressing this question.
B  <- NEI[NEI$fips==24510,]
B  <- transform(B, year = factor(year), type = factor(type))

qplot(data=B, x=year, y=Emissions, geom="bar", stat="identity", ylab="Emissions Total", facets=~type)


dev.copy(png,file='plot3.png')
dev.off()
