## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Question 1
total_by_year <- tapply(NEI$Emissions, factor(NEI$year), sum)
years <- unlist(dimnames(total_by_year))
plot(total_by_year, main='Total PM2.5 Emission over Years', xlab='Years',ylab='Total Eimission')
axis(3,1:4, years)
