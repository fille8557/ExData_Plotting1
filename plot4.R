##read in data
data <- read.csv("household_power_consumption.txt", 
                 header=TRUE, sep=";", na.strings="?", 
                 stringsAsFactors=FALSE)
##convert date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")

##subset by date Feb 1 and 2, 2007
febdata <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

##create date/time variable
febdata$DT <- paste(as.character(febdata$Date), febdata$Time)

##change format of date/time variable
strptime(febdata$DT, format ="%F %H:%M:%S")

##create plot
png("plot4.png")
par(mfrow= c(2,2))
##plot top left
plot(febdata$DT, febdata$Global_active_power, type="l", 
     xlab=NA, ylab="Global Active Power")
##plot top right
plot(febdata$DT, febdata$Voltage, type="l", xlab="datetime", 
     ylab="Voltage")
##plot bottom left
plot(febdata$DT, febdata$Sub_metering_1, xlab=NA, 
     ylab="Energy sub metering", type="l")
lines(febdata$DT, febdata$Sub_metering_2, col="red")
lines(febdata$DT, febdata$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", 
                              "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=1.5, col = c("black", "red", "blue"))
##plot bottom right
plot(febdata$DT, febdata$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")
dev.off()