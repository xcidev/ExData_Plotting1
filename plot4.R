library("lubridate")
library("dplyr")

h <- read.csv("household_power_consumption.txt", sep = ";", na.strings=c("?"))
hh <- mutate(h, ndate = dmy_hms(paste(Date, " " ,Time) ))
data <- filter(hh, ndate >= ymd_hms("2007-2-1 0:0:0") & ndate <= ymd_hms("2007-2-2 23:59:59"))


png("plot4.png")
par(mfrow=c(2,2))
plot(data$Global_active_power ~ data$ndate, type="l", ylab="Global Active Power", xlab="")

plot(data$Voltage ~ data$ndate, type="l", ylab="Voltage", xlab="datetime")

plot(  c(data$ndate,data$ndate,data$ndate)  , c(data$Sub_metering_3, data$Sub_metering_2, data$Sub_metering_1), type="n", ylab="Energy sub metering", xlab="")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col="red")

points(data$ndate, data$Sub_metering_1, col="black", type='l')
points(data$ndate, data$Sub_metering_2, col="red", type='l')
points(data$ndate, data$Sub_metering_3, col="blue", type='l')
plot(data$Global_reactive_power ~ data$ndate, type="l", ylab="Global Rective Power", xlab="datetime")

dev.off()