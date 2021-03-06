# read in data
data <- read.table("./R data/household_power_consumption.txt",header=T,sep=";",na.strings="?")
# get data within defined date range
data <- data[as.Date(data$Date,"%d/%m/%Y") >= as.Date('2007-02-01','%Y-%m-%d') & as.Date(data$Date,"%d/%m/%Y") <= as.Date('2007-02-02','%Y-%m-%d'),]
# create DateTime column for ease later
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
# setup and create plot # 1
png('plot1.png',width=480,height=480)
with(data, hist(Global_active_power, xlab='Global Active Power (kilowatts)', main='Global Active Power', col='red'))
dev.off()
