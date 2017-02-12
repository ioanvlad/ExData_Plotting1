String_to_time <- function(data) {
    
    # This function converts timestamps in Assignmment 1 data from string
    # to Date/Time objects, so they can be used for plotting
    
    return(strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S"))

}
