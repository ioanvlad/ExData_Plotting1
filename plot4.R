#!/usr/bin/Rscript

# The code for downloading, unzipping and selecting the necessary data has
# been placed in a separate function so it can be reused for different plots:
source('GetTrimData.R')

# Load function for converting from string to Date/Time objects for plotting
source('String_to_time.R')

# Read data
data <- GetTrimData()

# Open PNG device
png("plot4.png", width=480, height=480)

# Convert timestamps in data from string to Date/Time objects
datetime <- String_to_time(data)

par(mfrow = c(2, 2)) 

# Upper left panel
plot(datetime,
     data$Global_active_power,
     type="l",
     xlab="", 
     ylab="Global Active Power") 

# Upper right panel
plot(datetime,
     data$Voltage, 
     type="l", 
     ylab="Voltage")

# Lower left panel
plot(datetime, 
     data$Sub_metering_1, 
     type="l",
     xlab="", 
     ylab="Energy Submetering")
lines(datetime,
      data$Sub_metering_2, 
      type="l", 
      col="red")
lines(datetime,
      data$Sub_metering_3, 
      type="l", 
      col="blue")
legend("topright", 
       paste0('Sub_metering_', c('1','2','3')), 
       lty=1,
       lwd=2.5, 
       col=c("black", "red", "blue"))

# Lower right panel
plot(datetime, 
     data$Global_reactive_power, 
     type="l", ylab="Global_reactive_power")

# Write plot and close file
dev.off()
