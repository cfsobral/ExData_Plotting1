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
DataRange3 <- subset(Consumption, Date %in% c("1/2/2007", "2/2/2007"))
DataRange3$Date <- as.Date(DataRange3$Date, format = "%d/%m/%Y")
DaysWeek <- paste(as.Date(DataRange3$Date), DataRange3$Time)
DataRange3$DaysWeek <- as.POSIXct(DaysWeek)

## The procedures for generating the graphic and creating the png file.
png(filename = "plot3.png", width = 480, height = 480)
with(DataRange3, {
  plot(DaysWeek, Sub_metering_1,
       xlab = "",
       ylab = "Energy sub Metering",
       type = "l",
       main = "Indicators Energy Sub Metering")
  lines(DaysWeek, DataRange3$Sub_metering_2, col = "red")
  lines(DaysWeek, DataRange3$Sub_metering_3, col = "blue")

}  )

## The Legend

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,   
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
  
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
