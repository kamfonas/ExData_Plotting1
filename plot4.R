#Plot4 is a 4-plot page

# Prerequisites:

source("util.functions.R")

# Download step (this is common for all plots - needed only once
	print("...Downloading data file")

#comment next line to avoid repeatnig the step
	dataSetName <- download.EPC.data()

#Data prep step (see readme file)

	print("Begin data table preparation...")

#comment next line to avoid repeatnig the step
	X <- prep.data.table(dataSetName)

print("Data Table preparation complete")

# Prepare a 4-plot page

	par(mfcol=c(2,2))

# plot4a (top-left) is the same as the one of plot2

	with(X,plot( dateTime, Global_active_power,
			type="l",
			col="black",
			ylab="Global Active Power (Kilowats)",
			xlab=""
	))

# plot4b (bottom left) is the same as plot3	

	with(X,plot( dateTime,Sub_metering_1,
			type="l",
			col="black",
			ylab="Energy sub metering",
			xlab=""

	))
	with(X,lines( dateTime,Sub_metering_2,col="red"))
	with(X,lines( dateTime,Sub_metering_3,col="blue"))
	legend("topright",lty=1,bty="n",
		col=c("black","red","blue"),
		legend=c("Sub-metering-1","Sub-metering-2","Sub-metering-3")
		)

# plot4c (top-right) is Voltage over time

	with(X,plot( dateTime, Voltage,
			type="l",
			col="black",
			ylab="Voltage (Volts)",
			xlab=""
	))

# plot4d (bottom-right) is Global reactive power over time

	with(X,plot( dateTime, Global_reactive_power,
			type="l",
			col="black",
			ylab="Global reactive power(Kilowats)",
			xlab=""
	))

# produce a file copy

	dev.copy(png,file="plot4.png", width = 480L, height = 480L) 
	dev.off()

# reset to one plot per page:
	par(mfcol=c(1,1))



