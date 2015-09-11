#Plot3 is a line plot of of three variables over time

# Prerequisites:

source("util.functions.R")

# Download step (this is common for all plots - needed only once
	print("Begin Downloading data file")

#comment next line to avoid repeatnig the step
	dataSetName <- download.EPC.data()

#Data prep step (see readme file)

	print("Begin data table preparation...")

#comment next line to avoid repeatnig the step
	X <- prep.data.table(dataSetName)

	print("Data Table preparation complete")

# one plot on the page:
	par(mfcol=c(1,1))

# The plot is generated using the basic plot system

	with(X,plot( dateTime,Sub_metering_1,
			type="l",
			col="black",
			ylab="Energy sub metering",
			xlab=""

	))
	with(X,lines( dateTime,Sub_metering_2,col="red"))
	with(X,lines( dateTime,Sub_metering_3,col="blue"))
	legend("topright",lty=1,col=c("black","red","blue"),
		legend=c("Sub-metering-1","Sub-metering-2","Sub-metering-3")
		)

# produce a file copy

	dev.copy(png,file="plot3.png", width = 480L, height = 480L) 
	dev.off()

