# Question 2 Plot
Baltimore  <- NEI[NEI$fips==24510,]
total_2 <- tapply(Baltimore$Emissions, factor(Baltimore$year), sum)
years <- unlist(dimnames(total_2))
plot(total_2, xlab='Years',ylab='Baltimore City PM2.5 Eimission')
axis(3,1:4, years)

dev.copy(png,file='plot2.png')
dev.off()
