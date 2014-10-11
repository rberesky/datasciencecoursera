data = read.csv("household_power_consumption.txt",header=TRUE,sep=';',na.strings="?",stringsAsFactors=FALSE)

## Convert Date and Time to Date and time
data$myDateTime = as.POSIXct(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-strptime(data$Time,"%T")

## Subset on date
myDates <- subset(data,data$Date=="2007-02-01" | data$Date=="2007-02-02")

## Plot time series
png("plot2.png")
plot(myDates$Global_active_power~myDates$myDateTime,type='l',xlab="",ylab="Global Active Power (kilowatts)")
dev.off()