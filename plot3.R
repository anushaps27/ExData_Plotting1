#Reading the data from file
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";")

#Changing classes of variables and subsetting data
data["Date_Time"] <- dmy_hms(paste(data$Date, data$Time))
data$Date <- as.Date(as.character(data$Date),"%d/%m/%Y")
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
req_data <- rbind(data[data$Date=="2007-02-01",], data[data$Date=="2007-02-02",])

#Plotting the required graph
png(filename = "plot3.png", width = 480, height = 480)
xrange=range(req_data$Date_Time)
yrange=range(c(req_data$Sub_metering_1,req_data$Sub_metering_2,req_data$Sub_metering_3))
plot(xrange, yrange, type="n", xlab="", ylab="Energy sub metering" ) 
lines(req_data$Date_Time,req_data$Sub_metering_1, col="black")
lines(req_data$Date_Time,req_data$Sub_metering_2, col="red")
lines(req_data$Date_Time,req_data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(1,1,1), col=c("black", "red", "blue"))
dev.off()