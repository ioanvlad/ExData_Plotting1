#!/usr/bin/Rscript

# The code for downloading, unzipping and selecting the necessary data has
# been placed in a separate function so it can be reused for different plots:
source('GetTrimData.R')

# Load function for converting from string to Date/Time objects for plotting
source('String_to_time.R')

# Read data
data <- GetTrimData()

# Open PNG device
png("plot2.png", width=480, height=480)

plot(String_to_time(data),
     data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# Write plot and close file
dev.off()
