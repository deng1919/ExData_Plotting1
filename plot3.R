## download data file
url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(url, destfile='proj1.zip')
unzip('proj1.zip')

## read data from file into a dataframe and subsetting the dataframe to get data on only two days
temp_df<-read.table('./household_power_consumption.txt', sep=';', header=T, nrow=100)
classes<-sapply(temp_df, class)
df <- read.table("household_power_consumption.txt", header = TRUE, 
                 colClasses = classes, sep=';', na.strings='?')
df$Date<-as.Date(as.character(df$Date), "%d/%m/%Y")
day1<-as.Date('2007-02-01')
day2<-as.Date("2007-02-02")
data<-df[(df$Date==day1|df$Date==day2),]
timeline<-paste(as.character(data$Date), as.character(data$Time))
data$timeline<-as.POSIXlt(timeline)

## plot3
png(file='plot3.png')
with(data, plot(timeline, Sub_metering_1, type='n', xlab='', ylab=''))
lines(data$timeline, data$Sub_metering_1)
lines(data$timeline, data$Sub_metering_2, col='red')
lines(data$timeline, data$Sub_metering_3, col='blue')
title(ylab="Energy sub metering")
legend('topright', legend=c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'), 
       lty=c(1,1,1), col=c('black','red','blue'))
dev.off()