#Plot1 is a frequency histogram of Global_active_power

# Prerequisites:

source("util.functions.R")

# Download step (this is common for all plots - needed only once
print("Begin Downloading data file")
	dataSetName <- download.EPC.data()

#Data prep step (see readme file)

print("Begin data table preparation...")

	X <- prep.data.table(dataSetName)

print("Data Table preparation complete")

# one plot on the page:
	par(mfcol=c(1,1))

# The histogram is generated using the basic plot system

	with(X,hist( Global_active_power,
			col="red",
			xlab="Global Active Power (Kilowats)",
			ylab="Frequency",
			main="Global Active Power"
	))

# produce a file copy

	dev.copy(png,file="plot1.png", width = 480L, height = 480L) 
	dev.off()

