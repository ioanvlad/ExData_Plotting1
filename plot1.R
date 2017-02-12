#!/usr/bin/Rscript

# The code for downloading, unzipping and selecting the necessary data has
# been placed in a separate function so it can be reused for different plots:
source('GetTrimData.R')
data <- GetTrimData()

# Open PNG device
png("plot1.png", width=480, height=480)

title <- "Global Active Power"

# Histogram
hist(data$Global_active_power, 
     col="red", 
     main=title, 
     xlab=paste0(title," (kilowatts)"))

# Write plot and close file
dev.off()
