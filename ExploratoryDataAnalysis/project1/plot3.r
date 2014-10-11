data = read.csv("household_power_consumption.txt",header=TRUE,sep=';',na.strings="?",stringsAsFactors=FALSE)

## Convert Date and Time to Date and time
data$myDateTime = as.POSIXct(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-strptime(data$Time,"%T")

## Subset on date
myDates <- subset(data,data$Date=="2007-02-01" | data$Date=="2007-02-02")

## Plot time series
png("plot3.png")
plot(myDates$Sub_metering_1~myDates$myDateTime,type='l',xlab="",ylab="Energy sub metering",col="black")
lines(myDates$Sub_metering_2~myDates$myDateTime,col="red")
lines(myDates$Sub_metering_3~myDates$myDateTime,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()