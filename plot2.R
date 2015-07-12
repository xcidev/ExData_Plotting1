library("lubridate")
library("dplyr")

h <- read.csv("household_power_consumption.txt", sep = ";", na.strings=c("?"))
hh <- mutate(h, ndate = dmy_hms(paste(Date, " " ,Time) ))
data <- filter(hh, ndate >= ymd_hms("2007-2-1 0:0:0") & ndate <= ymd_hms("2007-2-2 23:59:59"))

png("plot2.png")
plot(data$Global_active_power ~ data$ndate, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()