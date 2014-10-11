data = read.csv("household_power_consumption.txt",header=TRUE,sep=';',na.strings="?",stringsAsFactors=FALSE)

## Convert Date and Time to Date and time
data$myDateTime = as.POSIXct(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-strptime(data$Time,"%T")

## Subset on date
myDates <- subset(data,data$Date=="2007-02-01" | data$Date=="2007-02-02")

## Plot time series
png("plot4.png")
par(mfrow=c(2,2))
plot(myDates$Global_active_power~myDates$myDateTime,type='l',xlab="",ylab="Global Active Power (kilowatts)")
plot(myDates$Voltage~myDates$myDateTime,type='l',xlab="datetime",ylab="Voltage")
plot(myDates$Sub_metering_1~myDates$myDateTime,type='l',xlab="",ylab="Energy sub metering",col="black")
lines(myDates$Sub_metering_2~myDates$myDateTime,col="red")
lines(myDates$Sub_metering_3~myDates$myDateTime,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")
plot(myDates$Global_reactive_power~myDates$myDateTime,type='l',xlab="datetime",ylab="Global_reactive_power")
dev.off()