library(readr)
library(lubridate)
library(tidyverse)
library(dplyr)

house_pow <- read_delim("household_power_consumption.txt", 
                      ";", escape_double = FALSE, trim_ws = TRUE)

house_pow$Date <- dmy(house_pow$Date)
plot_df <- house_pow %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")
gap <- as.numeric(plot_df$Global_active_power)

#Create plot
png("plot1.png", width=480, height=480)
hist(gap, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
