#Read the Dataset as a table
power_cons <- read.table("household_power_consumption.txt",
                         skip = "1",
                         sep = ";")
#Naming the columns
names(power_cons) <- c("Date", "Time", "Global_active_power",
                       "Global_reactive_power", "Voltage", "Global_intensity",
                       "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#Converting the Date column to Date format
power_cons$Date <- as.Date(power_cons$Date, "%d/%m/%Y")

#Subset the data for the dates 1/2/2007 and 2/2/2007
power_cons_subset <- subset(power_cons,
                            Date >= as.Date("1/2/2007", "%d/%m/%Y")
                            & Date <= as.Date("2/2/2007", "%d/%m/%Y"))

#Plotting the histogram
par(bg = "white") #Set the background color to white
hist(as.numeric(power_cons_subset$Global_active_power),
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

#Save the plot as a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()