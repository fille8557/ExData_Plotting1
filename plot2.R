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
png("plot2.png")
plot(febdata$DT, febdata$Global_active_power, type="l", 
     xlab=NA, ylab="Global Active Power (kilowatts)")
dev.off()