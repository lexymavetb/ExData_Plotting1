# Reading data from working project folder
path <- "household_power_consumption.txt"
Data <- read.table(path,header=TRUE,sep=";",colClasses="character")

# Conversion to Date/Time classes
Data[,1] <- as.Date(Data$Date,"%d/%m/%Y")

# Subsetting data between 2007-02-01 and 2007-02-02
subData <- subset(Data, Data$Date %in% as.Date(c("2007-02-01","2007-02-02")))

subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time), format="%Y-%m-%d %H:%M:%S")

# Heaving relevant columns as numeric
subData[,7] <- as.numeric(subData[,7])
subData[,8] <- as.numeric(subData[,8])
subData[,9] <- as.numeric(subData[,9])

# Plotting Plot 3
plot(subData$DateTime, subData[,7], type = "l", xlab = " ", ylab = "Energy sub metering")
lines(subData[,10], subData[,8], col = "Red")
lines(subData[,10], subData[,9], col = "Blue")
legend(x="topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("Black","Red","Blue"), lwd = 1)

# Conversion to PNG image file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()