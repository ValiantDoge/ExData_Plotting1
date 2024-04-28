power_cons <- read.table("household_power_consumption.txt",
                         skip = "1",
                         sep = ";")

names(power_cons) <- c("Date", "Time", "Global_active_power",
                       "Global_reactive_power", "Voltage", "Global_intensity",
                       "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

power_cons$Date <- as.Date(power_cons$Date, "%d/%m/%Y")

power_cons_subset <- subset(power_cons,
                            Date >= as.Date("1/2/2009", "%d/%m/%Y")
                            & Date <= as.Date("2/2/2009", "%d/%m/%Y"))

hist(as.numeric(power_cons_subset$Global_active_power),
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()