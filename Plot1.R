# My working directory path
# "C:/Users/pg/Documents/datascience/Exploratort Data analysis/Assignment1/ExData_Plotting1-master/ExData_Plotting1"
# Downloaded file location
# "C:/Users/pg/Documents/datascience/Exploratort Data analysis/Assignment1/household_power_consumption.txt"
filename<-"C:/Users/pg/Documents/datascience/Exploratort Data analysis/Assignment1/household_power_consumption.txt"
#read the epc data and assign to varibale epcdata
epcdata <- read.table(filename, header= TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?", dec=".")

#Select spcific data between 1/2/2007 & 2/2/2207
epcsubset <- epcdata[epcdata$Date %in% c("1/2/2007","2/2/2007"),]

globalActivePower <- as.numeric(epcsubset$Global_active_power)

#output File name
pngfilename<-"C:/Users/pg/Documents/datascience/Exploratort Data analysis/Assignment1/ExData_Plotting1-master/ExData_Plotting1/plot1.png"
png(pngfilename, width=480, height=480)

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Save file and close device

dev.off()

