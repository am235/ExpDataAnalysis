##########################################
#    Exploratory Data Analysis - Week 1
##########################################

## Plot 1 : Creating a Histogram
setwd("C:\\Users\\Arindam\\Desktop\\RWk1\\exdata")

energy_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors=FALSE, dec=".")
energy_data_subset <- energy_data[energy_data$Date %in% c("1/2/2007","2/2/2007") ,]

##Converting the power to Kilowatts
energy_data_subset$Global_active_power <- as.numeric(energy_data_subset$Global_active_power)


#Plot 1 - Histogram
par(mfrow=c(1,1))
hist(energy_data_subset$Global_active_power, freq = TRUE, cex.main = 0.8, col = "red", main="Global Active Power", xlab = "Global Active Power (Kilowatts)") 
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
