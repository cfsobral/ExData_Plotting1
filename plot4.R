### Work Directory - setwd("/RStudio_Project/Course_Project1/ExData_Plotting1")

## Load the libraries
library(ggplot2)
library(dplyr)
library(jpeg)
library(lattice)
library(png)
library(datasets)

### The paragraphs below will be the basic procedures will for constructing all graphs.
## Create database that will be named "Consumption". 
Consumption <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", check.names = FALSE, stringsAsFactors = FALSE)
dim(Consumption)

## Selecting and formatting the Date.
DataRange4 <- subset(Consumption, Date %in% c("1/2/2007", "2/2/2007"))
DataRange4$Date <- as.Date(DataRange4$Date, format = "%d/%m/%Y")
DaysWeek <- paste(as.Date(DataRange4$Date), DataRange3$Time)
DataRange4$DaysWeek <- as.POSIXct(DaysWeek)

## The procedures for generating the graphic and creating the png file.
## This is the default setup to PAR command, as reported in course 5: Base Plotting System!
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 1))

with(DataRange4, {
       plot(Global_active_power ~ DaysWeek, type = "l", xlab = "", ylab = "Global Active Power")
       plot(Voltage ~ DaysWeek, type = "l", xlab = "datatime", ylab = "Voltage")
       plot(Sub_metering_1 ~ DaysWeek, type = "l", xlab = "", ylab = "Energy sub Metering")
       lines(DataRange3$Sub_metering_2 ~ DaysWeek, col = "red")
       lines(DataRange3$Sub_metering_3 ~ DaysWeek, col = "blue")
       legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, bty = "n", cex = 0.8, 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
       
      plot(Global_reactive_power ~ DaysWeek, type = "l", xlab = "datatime")
       
   })

## Closing the command png
dev.off()

### Thanks to following sources who provided me useful information
### and tips that helped me to develop this project.
### Thank you for All!

### Jeremias Lalis - https://rpubs.com/skycrater/180401
### mGalarnyk - https://gist.github.com/mGalarnyk/939c4a52e98e557e1ad844f7e81fcdba
### Akash Gupta - https://rstudio-pubs-static.s3.amazonaws.com/241847_1539de2aea3b4db1b316a53847bad63a.html
### Link1 - https://stat.ethz.ch/R-manual/R-devel/library/grDevices/html/png.html
### Link2 - https://swcarpentry.github.io/r-novice-inflammation/12-supp-factors/
### DataCamp - https://www.youtube.com/watch?v=0MrYVzPxBIc
### Link3 - https://stackoverflow.com/questions/39133170/how-to-reduce-the-size-of-the-legend-in-r-plot-while-still-making-it-readable

