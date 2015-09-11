# Auxiliary functions used in the plot functions to avoid repetition

# Make sure required packages are installed and used

install.packages("data.table")
library(data.table)


## Download the file, unzip it and append the date to its name
## The function returns the augmented name of teh downloaded file

download.EPC.data <- function(){

	# all data goes into the "./data" directory
	# create it if not exists

	if(!file.exists("data")){dir.create("data")}

	# Constants for this file
	fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
	zipFileName<- "./data/household_power_consumption.zip"

	# download and unzip
	download.file(fileUrl,destfile=zipFileName)
	unzip(zipFileName,overwrite=TRUE,unzip="unzip",exdir="./data")

	# extract the file name from the zip file and augment its name with the date
	dataFile <- paste("./data/",unzip(zipFileName,list=TRUE)[1],sep="")

	# cleanup zip file and return file name

	file.remove(zipFileName)
	dataFile
}


# optional function to augment the file name with date/time
# this is useful if we need to know when the file was downloaded
# Warning: The data is obtained independently from the download, 
#          so this function must be called right after the download
augment.EPC.data <- function(dataFile){

	dateDownloaded <- gsub(" ","_",date())
	dateDownloaded <- gsub(":","",dateDownloaded )

	augmentedFileName <-  paste(dataFile,dateDownloaded,sep="")
	file.rename(dataFile, augmentedFileName)

	augmentedFileName

}

# Load Data Table and deal with missing values

prep.data.table <- function(dataFile){
	TimeRangeFrom <-strptime("2007-02-01 00:00:00","%Y-%m-%d %H:%M:%S")
	TimeRangeTo   <-strptime("2007-02-03 00:00:00","%Y-%m-%d %H:%M:%S")

	DT<-fread(dataFile, na.strings=c("?","NA","N/A",""))
	dateTime<-strptime(paste(DT$Date,DT$Time),"%d/%m/%Y %H:%M:%S")
	DT<-cbind(DT,dateTime)
	set(DT,NULL,1L,as.Date(DT$Date,"%d/%m/%Y"))
	DT<-DT[dateTime>=TimeRangeFrom & dateTime <= TimeRangeTo]
	DT[,weekDay:=weekdays(dateTime)]

	DT[,Global_active_power := as.numeric(Global_active_power)]
	DT[,Sub_metering_1 := as.numeric(Sub_metering_1)]
	DT[,Sub_metering_2 := as.numeric(Sub_metering_2)]
	DT[,Sub_metering_3 := as.numeric(Sub_metering_3)]
	DT[,Voltage := as.numeric(Voltage)]
	DT[,Global_reactive_power := as.numeric(Global_reactive_power)]

	DT
}