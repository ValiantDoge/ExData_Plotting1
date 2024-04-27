power_cons <- read.table(
  "./household_power_consumption.txt",
  sep = ";",
  header = TRUE,
)
feb_subset <- subset(power_cons,
  as.Date(power_cons$Date, "%d/%m/%Y") >= as.Date("2007-02-01")
  & as.Date(power_cons$Date, "%d/%m/%Y") <= as.Date("2007-02-02")
)

hist(as.numeric(as.character(feb_subset)), col = "red")