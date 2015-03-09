# create png file Plot1
png(filename = "plot2.png",
    width = 480, height = 480)

# Read in file
test <-read.table(list.files(pattern=".txt"), header=TRUE, sep=";", na.strings = "?")

# convert date and time variables
test$Time <- strptime(paste(test$Date, test$Time), format = "%d/%m/%Y %H:%M:%S")
test$Date <- as.Date(as.character(test$Date), '%d/%m/%Y')

# subset to only records we need
test <- subset(test, Date == "2007-02-01" |Date == "2007-02-02" )

# reset par (just in case)
par(mfrow=c(1,1))

plot(test$Time, test$Global_active_power, 
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# Reset Device
dev.off()