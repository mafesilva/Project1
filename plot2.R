library(readr)
library(lubridate)
library(tidyverse)
library(dplyr)

house_pow <- read_delim("household_power_consumption.txt", 
                      ";", escape_double = FALSE, trim_ws = TRUE)

house_pow$Date <- dmy(house_pow$Date)
plot_df <- house_pow %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")
alltime <- ymd_hms(paste(plot_df$Date, plot_df$Time, sep=" ")) 
gap <- as.numeric(plot_df$Global_active_power)
#Create plot
png("plot2.png", width=480, height=480)
plot(alltime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
