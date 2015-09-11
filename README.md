## Introduction

This document has been updated to include data transformatino notes. Parts of the original "readme" have been kept as they explain relevant details.

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data

Data loading is coded in a utility file named <b>util.functions.R</b> and includes the following functions:
<ol><li> <b>download.EPC.data()</b>: The function checks to see if a data directory exists and creates one if it is missing.
		It then downloads the file from <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> ,
		unzips the file, and discards the zip file. The function returns the relative file path
</li><li> <b>augment.EPC.data(downloadedFileName)</b>: This function is optional, and it is used to distinguish various versions of the file downloaded by appending the data to its name
  		Simply pass the downloaded file name as an argument and the function will return the augmented name. 
  		Notice that if this functionality is used, multiple files will be retained and may require periodic cleanup. 
  		This functionality normalizes the name of each file and it may be relevant to track versions of the file if they change often.
  		This function is not used in the plot scripts.
</li><li> <b>prep.data.table(filePath)</b>: This function load and prepares a data table using these steps:
	<ol><li>Loads a data.table using fread() and considering "?" to denote NA values
	</li><li>Appends a dateTime column
	</li><li>Filters and discards unneeded rows keeping only "2007-02-01 00:00:00" to "2007-02-03 00:00:00"
	</li><li> Adds a weekday column based on the timestamp
	</li><li> Converts coerced character columns by fread to numerics so that they can be used by the plot functions.  
	</li><li> Return the reference to the resultign Data Table.
	</li></ol> 
</li></ol>

The approach used above addresses the considerations put forth by the assignment instructions repeatd below:

* The dataset has 2,075,259 rows and 9 columns. First
calculate a rough estimate of how much memory the dataset will require
in memory before reading into R. Make sure your computer has enough
memory (most modern computers should be fine).

* We will only be using data from the dates 2007-02-01 and
2007-02-02. One alternative is to read the data from just those dates
rather than reading in the entire dataset and subsetting to those
dates.

* You may find it useful to convert the Date and Time variables to
Date/Time classes in R using the `strptime()` and `as.Date()`
functions.

* Note that in this dataset missing values are coded as `?`.


## The Plots

The overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007. Your task is to
reconstruct the following plots below, all of which were constructed
using the base plotting system.


For each plot:

* Constructed the plot and saved it to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Named each of the plot files as `plot1.png`, `plot2.png`, etc.

* Created a separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. Your code file **should include code for reading
the data** so that the plot can be fully reproduced. The code that creates the PNG file is included.

* Both the PNG file and R code files are in the git repository


## Individual Plot Notes 


### Plot 1

The plot was constructed to emulate the following frequency histogram, 
depicting of Global Active Power

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


### Plot 2

Plot 2 is a line-plot (type="l") emulating this target plot:

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


### Plot 3

This plot is made in three parts. The first set is part of the plot call,
the other two are added using the line() function. The legend is
added at the end. 

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


### Plot 4

The grid of four plots was set-up in columns. The left plots are similar to 
Plots 2 adn 3 above. The box around the legend was removed as indicated. 
At the end the par function resets the original single picture setting. 


![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

