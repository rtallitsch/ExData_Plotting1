# create png file Plot1
png(filename = "plot4.png",
    width = 480, height = 480)

# Read in file
test <-read.table(list.files(pattern=".txt"), header=TRUE, sep=";", na.strings = "?")

# convert date and time variables
test$Time <- strptime(paste(test$Date, test$Time), format = "%d/%m/%Y %H:%M:%S")
test$Date <- as.Date(as.character(test$Date), '%d/%m/%Y')

# subset to only records we need
test <- subset(test, Date == "2007-02-01" |Date == "2007-02-02" )

# set par
par(mfrow = c(2,2))

with(test, {
        plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power")
        plot(Time, Voltage, type="l", xlab="datetime", ylab="Voltage")
        plot(Time, Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               lty=c(1,1,1), col=c("black", "red","blue"), box.lty=0,  bty = "n",lwd=2, cex=1,y.intersp=1)
        lines(Time, Sub_metering_2, col = "red")
        lines(Time, Sub_metering_3, col = "blue")
        plot(Time, Global_reactive_power, type="l", xlab="datetime")
})

# Reset Device
dev.off()