library(data.table)

file <- "household_power_consumption.txt"

DT <- data.table::fread(input = file, na.strings = "?")

DT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

reqDT <- DT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

gap <- as.numeric(reqDT$Global_active_power)

png("plot1.png", width=480, height=480)

hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
