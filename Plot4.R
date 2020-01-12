# My working directory path
# "C:/Users/pg/Documents/datascience/Exploratort Data analysis/Assignment1/ExData_Plotting1-master/ExData_Plotting1"
# Downloaded file location
# "C:/Users/pg/Documents/datascience/Exploratort Data analysis/Assignment1/household_power_consumption.txt"
filename<-"C:/Users/pg/Documents/datascience/Exploratort Data analysis/Assignment1/household_power_consumption.txt"
#read the epc data and assign to varibale epcdata
epcdata <- read.table(filename, header= TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?", dec=".")

#Select spcific data between 1/2/2007 & 2/2/2207
epcsubset <- epcdata[epcdata$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- strptime(paste(epcsubset$Date, epcsubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#output File name
pngfilename<-"C:/Users/pg/Documents/datascience/Exploratort Data analysis/Assignment1/ExData_Plotting1-master/ExData_Plotting1/plot4.png"
png(pngfilename, width=480, height=480)

par(mfrow = c(2, 2)) 

# First plot
globalActivePower <- as.numeric(epcsubset$Global_active_power)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Second plot
voltage <- as.numeric(epcsubset$Voltage)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Third plot
subMeter1 <- as.numeric(epcsubset$Sub_metering_1)
subMeter2 <- as.numeric(epcsubset$Sub_metering_2)
subMeter3 <- as.numeric(epcsubset$Sub_metering_3)
plot(datetime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Fourth plot
globalReactivePower <- as.numeric(epcsubset$Global_reactive_power)
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power", cex=0.2)

## Save file and close device
dev.off()