##########################################
#    Exploratory Data Analysis - Week 1
##########################################

## Plot 2 : Creating a Line Graph
setwd("C:\\Users\\Arindam\\Desktop\\RWk1\\exdata")

energy_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
energy_data_subset <- subset(energy_data, Date == "2/2/2007" | Date == "1/2/2007")

##Converting the power to Kilowatts
energy_data_subset$Global_active_power <- as.numeric(energy_data_subset$Global_active_power)/1000

#Converting to Date
energy_data_subset$DateNew <- as.Date(as.character(energy_data_subset$Date),"%d/%m/%Y")

##Converting to Date and Time format / Timestamp with Date and Time columns
DatenTime <- paste(as.character(energy_data_subset$DateNew),energy_data_subset$Time)
energy_data_subset$timeDt <- strptime(DatenTime, "%Y-%m-%d %H:%M:%S",tz="")

#### Now plot to Window Device
par(mfrow=c(1,1))
plot(energy_data_subset$timeDt, energy_data_subset$Global_active_power,type="l",ylab="Global Active Power (Kilowatts)",xlab="")

# Copy my plot to a PNG file
dev.copy(png, file = "plot2.png")
dev.off()
