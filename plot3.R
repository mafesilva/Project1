library(readr)
library(lubridate)
library(tidyverse)
library(dplyr)

house_pow <- read_delim("household_power_consumption.txt", 
                      ";", escape_double = FALSE, trim_ws = TRUE)

house_pow$Date <- dmy(house_pow$Date)
plot_df <- house_pow %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")
alltime <- ymd_hms(paste(plot_df$Date, plot_df$Time, sep=" "))
sm1 <- as.numeric(plot_df$Sub_metering_1)
sm2 <- as.numeric(plot_df$Sub_metering_2)
sm3 <- as.numeric(plot_df$Sub_metering_3)

#Create plot
png("plot3.png", width=480, height=480)
plot(alltime, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(alltime, sm2, type="l", col="red")
lines(alltime, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
