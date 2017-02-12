#!/usr/bin/Rscript

# The code for downloading, unzipping and selecting the necessary data has
# been placed in a separate function so it can be reused for different plots:
source('GetTrimData.R')

# Load function for converting from string to Date/Time objects for plotting
source('String_to_time.R')

# Read data
data <- GetTrimData()

# Open PNG device
png("plot3.png", width=480, height=480)

# Convert timestamps in data from string to Date/Time objects
t <- String_to_time(data)

plot (t, data$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")
lines(t, data$Sub_metering_2, type="l", col="red")
lines(t, data$Sub_metering_3, type="l", col="blue")

legend("topright",
       paste0('Sub_metering_', c('1','2','3')),
       lty=1,
       lwd=2.5,
       col=c("black", "red", "blue"))

# Write plot and close file
dev.off()
