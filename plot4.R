# read in data
data <- read.table("./R data/household_power_consumption.txt",header=T,sep=";",na.strings="?")
# get data within defined date range
data <- data[as.Date(data$Date,"%d/%m/%Y") >= as.Date('2007-02-01','%Y-%m-%d') & as.Date(data$Date,"%d/%m/%Y") <= as.Date('2007-02-02','%Y-%m-%d'),]
# create DateTime column for ease later
data$DateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
# setup and create plot # 4
# create 2 x 2 frame
png('plot4.png',width=480,height=480)
par(mfrow=c(2,2))
with(data, plot(DateTime, Global_active_power, ylab = 'Global Active Power', type='l', xlab=''))
with(data, plot(DateTime, Voltage, type='l', xlab='datetime'))
with(data, plot(DateTime, Sub_metering_1, ylab = 'Energy sub metering', type='n', xlab=''))
with(data, lines(DateTime, Sub_metering_1, col = 'black'))
with(data, lines(DateTime, Sub_metering_2, col = 'red'))
with(data, lines(DateTime, Sub_metering_3, col = 'blue'))
legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black','red','blue'), lty = c(1,1,1))
with(data, plot(DateTime, Global_reactive_power, type='l', xlab='datetime'))
dev.off()