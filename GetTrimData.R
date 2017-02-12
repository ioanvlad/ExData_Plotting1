GetTrimData <- function() {
    
    # This function checks if the saved reduced data file needed for assignment
    # 1 exists. If it does, it loads the data from it. If it does not, it 
    # downloads the zip file from the web, unzips it, extracts only the 
    # subset corresponding to the relevant dates, saves it to a file for future
    # use, and returns it to the caller
    
    reduced_data_file <- 'reduced_data.txt'
    
    if(file.exists(reduced_data_file)) {
    
        my_data <- read.table(reduced_data_file, header=TRUE, sep=';')
    
    } else {
    
        url <- paste0('https://d396qusza40orc.cloudfront.net/',
                      'exdata%2Fdata%2Fhousehold_power_consumption.zip')
        
        txt_file <- 'household_power_consumption.txt'
        
        zip_file <- paste0(txt_file, '.zip')
        
        download.file(url, zip_file)

        unzip(zip_file)

        file.remove(zip_file)
        
        all <- read.table(txt_file, header=TRUE, sep=';')

        my_data <- subset(all, Date=='1/2/2007' | Date=='2/2/2007')

        write.table(my_data, file=reduced_data_file, sep=';', quote=FALSE,
                    row.names = FALSE, col.names = TRUE)

        file.remove(txt_file)
        
        rm(reduced_data_file, url, txt_file, zip_file, all)
    }
    
    return(my_data)
}
