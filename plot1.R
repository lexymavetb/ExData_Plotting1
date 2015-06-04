# Reading data from working project folder
path <- "household_power_consumption.txt"
Data <- read.table(path,header=TRUE,sep=";",colClasses="character")

# Conversion to Date/Time classes
Data[,1] <- as.Date(Data$Date,"%d/%m/%Y")
Data[,2] <- as.Date(Data$Time,"%H/%M/%S")

# Subsetting data between 2007-02-01 and 2007-02-02
subData <- subset(Data, Data$Date %in% as.Date(c("2007-02-01","2007-02-02")))

# Heaving rest of columns as numeric
subData[,3] <- as.numeric(subData[,3])

# Plotting Plot 1 
hist(subData[,3], col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency")

# Conversion to PNG image file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()