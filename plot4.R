# plot4.R 
# exdata-010 Project 2 Question 4
# 4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

source("./proj2.R")

library("ggplot2")

# filer the Source Classification Code to find any Coal Combustion related sources
s  <- grep(" [c|C]oal", SCC$Short.Name)
SCC_coal  <- factor(SCC$SCC[x])
coal_emission  <- NEI[NEI$SCC %in% SCC_coal,]

qplot(x=year, y=Emissions, data=coal_emission, geom="bar", stat="identity", ylab="Emissions from Coal Combution")


dev.copy(png,file='plot4.png')
dev.off()
