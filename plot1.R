plot1 <- function(){
##Read the file - skip records until Feb 1st 2007 and read until Feb 2nd 2007
datatable <- read.table("household_power_consumption.txt", header=FALSE,sep=";",skip=66638,nrows=2880)

##create the date and time columns as a datetime object
datetime <- as.POSIXct(strptime(paste(datatable[,1],datatable[,2]), "%d/%m/%Y %H:%M:%S"))

## create a data frame with the datetime and the rest of the columns
dm <- data.frame(datetime=datetime, GAP=datatable[,3], GRP=datatable[,4], Voltage=datatable[,5], sm1=datatable[,7], sm2=datatable[,8], sm3=datatable[,9])

## Define the png output file
png("plot1.png", width=480, height=480)

## plot the graph 
hist(dm[,3], col="red", main = "Global Active Power", xlab="Global Active Power(kilowatts)")

dev.off()
}