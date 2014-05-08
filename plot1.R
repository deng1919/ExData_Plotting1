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

## plot1
png(file='plot1.png')
hist(data$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', 
     main='Global Active Power')
dev.off()