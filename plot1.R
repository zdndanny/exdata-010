# Question 1 Plot
total_by_year <- tapply(NEI$Emissions, factor(NEI$year), sum)
years <- unlist(dimnames(total_by_year))
plot(total_by_year, xlab='Years',ylab='Total PM2.5 Eimission')
axis(3,1:4, years)

dev.copy(png,file='plot1.png')
dev.off()