# plot1.R 
# exdata-010 Project 2 Question 1
source("./proj2.R")
# Have total emissions from PM2.5 decreased in the United States 
# from 1999 to 2008? 
# Using the base plotting system, make a plot showing 
# the total PM2.5 emission from all sources for each of 
# the years 1999, 2002, 2005, and 2008.

# Upload a PNG file containing your plot addressing this question.

total_by_year <- tapply(NEI$Emissions, NEI$year, sum)
barplot(total_by_year, xlab='Years',ylab='Total PM2.5 Eimission')
dev.copy(png,file='plot1.png')
dev.off()
