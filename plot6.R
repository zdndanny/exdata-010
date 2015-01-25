# plot6.R
# exdata-010 Project 2 Question 6
# 6.Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?
source("./proj2.R")
library("ggplot2")

cities  <- NEI[NEI$fips %in% c("24510", "06037"), ]
motor  <- factor(c("ON-ROAD", "NON-ROAD"))
cities$fips  <- factor(cities$fips, labels = c("Los Angeles County", "Baltimore City"))
mv  <- cities[cities$type %in% motor,]

g  <-  ggplot(mv, aes(year, Emissions))

# point 
g1 <- g + geom_point(aes(color = type), size = 4, alpha = 0.2) + facet_grid(~type ~fips)
print(g1)
dev.copy(png,file='plot6_1.png')
dev.off()

# bar - this is what I submit for review
g2  <- g + geom_bar(stat = "identity", aes(color = fips, fill = type)) + facet_grid(. ~fips)
print(g2)
dev.copy(png,file='plot6_2.png')
dev.off()
