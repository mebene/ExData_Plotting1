source("format_data.R")


## create graphing png file
 png(filename="plot1.png", height = 480 , width = 480)

## create histogram
with(hpc_sub, hist(as.numeric(Global_active_power)/500, col="red", main= "Gobal Active Power", xlab="Global Active Power(kilowatts)"))
dev.off()
