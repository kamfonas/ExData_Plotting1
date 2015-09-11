#Plot2 is a plot of Global_active_power over time

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

	with(X,plot( dateTime, Global_active_power,
			type="l",
			col="black",
			ylab="Global Active Power (Kilowats)",
			xlab="",
			main="Global Active Power over Time"
	))

# produce a file copy

	dev.copy(png,file="plot2.png", width = 480L, height = 480L) 
	dev.off()

