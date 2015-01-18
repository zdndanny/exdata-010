# plot2.R 
# exdata-010 Project 2 Question 2

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == 24510) from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.
# Upload a PNG file containing your plot addressing this question.
source("./proj2.R")

Baltimore  <- NEI[NEI$fips==24510,]
total <- tapply(Baltimore$Emissions, Baltimore$year, sum)

barplot(total, xlab='Years',ylab='Baltimore City PM2.5 Eimission')

dev.copy(png,file='plot2.png')
dev.off()
