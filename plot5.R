# plot5.R 
# exdata-010 Project 2 Question 5
# 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

source("./proj2.R")

library("ggplot2")

# Baltimore City
Baltimore <- NEI[NEI$fips==24510,]

# What is the emissions from motor vehicle? 

# Option 1
#Looks through Source Classification Code some items has "Vehicle" in the SCC.Level.Two names
s  <- grep(" Vehicle", SCC$SCC.Level.Two)
V1  <- Baltimore[Baltimore$SCC %in% SCC$SCC[s],]
#  str(V1)
# 'data.frame':    1393 obs. of  6 variables:
# $ fips     : Factor w/ 3263 levels "00000","01001",..: 1224 1224 1224 1224 1224 1224 1224 1224 1224 1224 ...
# $ SCC      : Factor w/ 5386 levels "10100101","10100102",..: 445 446 447 449 450 451 453 454 455 457 ...
# $ Pollutant: Factor w/ 1 level "PM25-PRI": 1 1 1 1 1 1 1 1 1 1 ...
# $ Emissions: num  7.38 2.78 11.76 3.5 1.32 ...
# $ type     : Factor w/ 4 levels "NONPOINT","NON-ROAD",..: 3 3 3 3 3 3 3 3 3 3 ...
# $ year     : Factor w/ 4 levels "1999","2002",..: 1 1 1 1 1 1 1 1 1 1 ...
# plot the emissions over years
qplot(x = year, y = Emissions, data = V1, geom="bar", stat = "identity",ylab="Emissions from Motor Vehicle", facets = ~type)
dev.copy(png,file='plot5-v1.png')
dev.off()

# Option 2
# as Herman Boudenoodt posted at https://class.coursera.org/exdata-010/forum/thread?thread_id=140#post-679
# based on NEI document at http://www.epa.gov/ttn/chief/net/2008inventory.html
# The NEI OnRoad and NonRoad data categories contain mobile sources which are estimated for the 2008 NEI v3 via 
# the MOVES2010b and NONROAD models, respectively. NONROAD was run within the National Mobile Inventory Model (NMIM). 
# Note that emissions data for aircraft, locomotives, and commercial marine vessels are NOT included in the NonRoad 
# data category starting with the 2008 NEI. Aircraft engine emissions occurring during Landing and Takeoff operations 
# and the Ground Support Equipment and Auxiliary Power Units associated with the aircraft are now included in the 
# point data category at individual airports in the 2008 NEI. Emissions from locomotives that occur at rail yards 
# are also included in the point data category. In-flight aircraft emissions, locomotive emissions outside of the 
# rail yards, and commercial marine vessel emissions (both underway and port emissions) are included in the NonPoint 
# data category.

V2   <- Baltimore[Baltimore$type %in% factor(c("ON-ROAD", "NON-ROAD")),]
# > str(V2)
# 'data.frame':    1535 obs. of  6 variables:
# $ fips     : Factor w/ 3263 levels "00000","01001",..: 1224 1224 1224 1224 1224 1224 1224 1224 1224 1224 ...
# $ SCC      : Factor w/ 5386 levels "10100101","10100102",..: 445 446 447 449 450 451 453 454 455 457 ...
# $ Pollutant: Factor w/ 1 level "PM25-PRI": 1 1 1 1 1 1 1 1 1 1 ...
# $ Emissions: num  7.38 2.78 11.76 3.5 1.32 ...
# $ type     : Factor w/ 4 levels "NONPOINT","NON-ROAD",..: 3 3 3 3 3 3 3 3 3 3 ...
# $ year     : Factor w/ 4 levels "1999","2002",..: 1 1 1 1 1 1 1 1 1 1 ...

# So data V2 is more complete. I am uploading this plot
qplot(x = year, y = Emissions, data = V2, add=T, geom="bar", stat = "identity",ylab="Emissions from Motor Vehicle", facets = ~type)
dev.copy(png,file='plot5-v2.png')
dev.off()
