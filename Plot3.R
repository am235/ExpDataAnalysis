##########################################
#    Exploratory Data Analysis - Week 1
##########################################

## Plot 3 : Creating a Line Graph with sub-merting info
setwd("C:\\Users\\Arindam\\Desktop\\RWk1\\exdata")

energy_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors=FALSE, dec=".")
energy_data_subset <- energy_data[energy_data$Date %in% c("1/2/2007","2/2/2007") ,]

##Converting the power to Kilowatts
energy_data_subset$Global_active_power <- as.numeric(energy_data_subset$Global_active_power)

#Converting to Date
energy_data_subset$DateNew <- as.Date(as.character(energy_data_subset$Date),"%d/%m/%Y")

##Converting to Date and Time format / Timestamp with Date and Time columns
DatenTime <- paste(as.character(energy_data_subset$DateNew),energy_data_subset$Time)
energy_data_subset$timeDt <- strptime(DatenTime, "%Y-%m-%d %H:%M:%S",tz="")

##Converting the Sub-Metering info to numeric format
energy_data_subset$Sub_metering_1 <- as.numeric(energy_data_subset$Sub_metering_1)
energy_data_subset$Sub_metering_2 <- as.numeric(energy_data_subset$Sub_metering_2)
energy_data_subset$Sub_metering_3 <- as.numeric(energy_data_subset$Sub_metering_3)


#Plot 3 - Sub-Metering Line Graph
par(mfrow=c(1,1))
plot(energy_data_subset$timeDt, energy_data_subset$Sub_metering_1, type="l", ylab="Energy Sub Metering",xlab="")
#Adding lines for 2nd submeter
lines(energy_data_subset$timeDt, energy_data_subset$Sub_metering_2, type="l", col="red",xaxt="n",yaxt="n")
#Adding lines for 3rd submeter
lines(energy_data_subset$timeDt, energy_data_subset$Sub_metering_3, type="l", col="blue",xaxt="n",yaxt="n")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


##Adding to output PNG file
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()
