# Reading data from working project folder
path <- "household_power_consumption.txt"
Data <- read.table(path,header=TRUE,sep=";",colClasses="character")

# Conversion to Date/Time classes
Data[,1] <- as.Date(Data$Date,"%d/%m/%Y")

# Subsetting data between 2007-02-01 and 2007-02-02
subData <- subset(Data, Data$Date %in% as.Date(c("2007-02-01","2007-02-02")))

subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time), format="%Y-%m-%d %H:%M:%S")

# Heaving relevant columns as numeric
subData[,3] <- as.numeric(subData[,3])

# Plotting Plot 2 
plot(subData$DateTime, subData[,3], type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

# Conversion to PNG image file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()