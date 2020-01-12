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

subMeter1 <- as.numeric(epcsubset$Sub_metering_1)
subMeter2 <- as.numeric(epcsubset$Sub_metering_2)
subMeter3 <- as.numeric(epcsubset$Sub_metering_3)

#output File name
pngfilename<-"C:/Users/pg/Documents/datascience/Exploratort Data analysis/Assignment1/ExData_Plotting1-master/ExData_Plotting1/plot3.png"
png(pngfilename, width=480, height=480)

plot(datetime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Save file and close device
dev.off()
