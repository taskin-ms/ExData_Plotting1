library(data.table)

file <- "household_power_consumption.txt"

table <- data.table::fread(input = file, na.strings = "?", sep=";", header=TRUE, dec=".")

table2 <- table[table$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(table2$Date, table2$Time, sep=" ")
                     , "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(table2$Global_active_power)

png("plot2.png", width=480, height=480)

plot(x = datetime, y= GAP, xlab = "",ylab="Global Active Power (kilowatts)" ,type = "l")

dev.off()