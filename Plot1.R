##########################################
#    Exploratory Data Analysis - Week 1
##########################################

## Plot 1 : Creating a Histogram
setwd("C:\\Users\\Arindam\\Desktop\\RWk1\\exdata")

energy_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
energy_data_subset <- subset(energy_data, Date == "2/2/2007" | Date == "1/2/2007")

##Converting the power to Kilowatts
energy_data_subset$Global_active_power <- as.numeric(energy_data_subset$Global_active_power)/1000


#Plot 1 - Histogram
par(mfrow=c(1,1))
hist(energy_data_subset$Global_active_power, ylim = c(0,2000), xlim = c(0,3), cex.main = 0.8, col = "red", breaks = 12, labels = TRUE, main="Global Active Power", xlab = "Global Active Power (Kilowatts)") 
dev.copy(png, file = "plot1.png")
dev.off()