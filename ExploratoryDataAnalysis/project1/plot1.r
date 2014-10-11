##finished <- function(path.numRows=10,startRow=0) {
## Read in data with specified parameters
data = read.csv("household_power_consumption.txt",header=TRUE,sep=';',na.strings="?",stringsAsFactors=FALSE)

## Convert Date and Time to Date and time
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-strptime(data$Time,"%T")

## Subset on date
myDates <- subset(data,data$Date=="2007-02-01" | data$Date=="2007-02-02")

## Create histogram
png("plot1.png")
hist(myDates$Global_active_power,col=2,main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
#}