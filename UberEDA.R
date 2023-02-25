library(ggplot2)
library(ggthemes)
library(lubridate)
library(dplyr)
library(tidyr)
library(DT)
library(scales)
#importing and binding data to dataframe
apr_data <- read.csv("C:/Users/harsh/Desktop/Projects/Uber EDA/uber-raw-data-apr14.csv")
may_data <- read.csv("C:/Users/harsh/Desktop/Projects/Uber EDA/uber-raw-data-may14.csv")
jun_data <- read.csv("C:/Users/harsh/Desktop/Projects/Uber EDA/uber-raw-data-jun14.csv")
jul_data <- read.csv("C:/Users/harsh/Desktop/Projects/Uber EDA/uber-raw-data-jul14.csv")
aug_data <- read.csv("C:/Users/harsh/Desktop/Projects/Uber EDA/uber-raw-data-aug14.csv")
sep_data <- read.csv("C:/Users/harsh/Desktop/Projects/Uber EDA/uber-raw-data-sep14.csv")

data_2014 <- rbind(apr_data,may_data, jun_data, jul_data, aug_data, sep_data)
colors <- c("#CC1020", "#05a390","#0683d9","#f5e840", "#e075b6", "#cfcaff","#665566")
#formatting date time

data_2014$Date.Time <- as.POSIXct(data_2014$Date.Time, format = "%m/%d/%Y %H:%M:%S")

data_2014$Time <- format(as.POSIXct(data_2014$Date.Time, format = "%m/%d/%Y %H:%M:%S"), format="%H:%M:%S")

data_2014$Date.Time <- ymd_hms(data_2014$Date.Time)
#adding date, month, year, day separating
data_2014$day <- factor(day(data_2014$Date.Time))
data_2014$month <- factor(month(data_2014$Date.Time, label = TRUE))
data_2014$year <- factor(year(data_2014$Date.Time))
data_2014$dayofweek <- factor(wday(data_2014$Date.Time, label = TRUE))

data_2014$hour <- factor(hour(hms(data_2014$Time)))
data_2014$minute <- factor(minute(hms(data_2014$Time)))
data_2014$second <- factor(second(hms(data_2014$Time)))

#plotting data by hour
hour_data <- data_2014 %>%
  group_by(hour) %>%
  dplyr::summarize(Total = n()) 
datatable(hour_data)

ggplot(hour_data, aes(hour, Total)) + 
  geom_bar( stat = "identity", fill = "violet", color = "steelblue") +
  ggtitle("Trips Every Hour") +
  theme(legend.position = "none") +
  scale_y_continuous(labels = comma)
#plotting data by hour and month
month_hour <- data_2014 %>%
  group_by(month, hour) %>%
  dplyr::summarize(Total = n())

ggplot(month_hour, aes(hour, Total, fill = month)) + 
  geom_bar( stat = "identity") +
  ggtitle("Trips by Hour and Month") +
  scale_y_continuous(labels = comma)

#plotting data by day
day_group <- data_2014 %>%
  group_by(day) %>%
  dplyr::summarize(Total = n()) 
datatable(day_group)

ggplot(day_group, aes(day, Total)) + 
  geom_bar( stat = "identity", fill = "darkblue") +
  ggtitle("Trips Every Day") +
  theme(legend.position = "none") +
  scale_y_continuous(labels = comma)
#plotting data by day & month
day_month_group <- data_2014 %>%
  group_by(month, day) %>%
  dplyr::summarize(Total = n())

ggplot(day_month_group, aes(day, Total, fill = month)) + 
  geom_bar( stat = "identity") +
  ggtitle("Trips by Day and Month") +
  scale_y_continuous(labels = comma) +
  scale_fill_manual(values = colors)

#plotting data by month
month_group <- data_2014 %>%
  group_by(month) %>%
  dplyr::summarize(Total = n()) 
datatable(month_group)
ggplot(month_group , aes(month, Total, fill = month)) + 
  geom_bar( stat = "identity") +
  ggtitle("Trips by Month") +
  theme(legend.position = "none") +
  scale_y_continuous(labels = comma) +
  scale_fill_manual(values = colors)
#plotting data by day and month
month_weekday <- data_2014 %>%
  group_by(month, dayofweek) %>%
  dplyr::summarize(Total = n())

ggplot(month_weekday, aes(month, Total, fill = dayofweek)) + 
  geom_bar( stat = "identity", position = "dodge") +
  ggtitle("Trips by Day and Month") +
  scale_y_continuous(labels = comma) +
  scale_fill_manual(values = colors)

#plotting by bases
ggplot(data_2014, aes(Base)) + 
  geom_bar(fill = "cyan2") +
  scale_y_continuous(labels = comma) +
  ggtitle("Trips by Bases")
#by base and month
ggplot(data_2014, aes(Base, fill = month)) + 
  geom_bar(position = "dodge") +
  scale_y_continuous(labels = comma) +
  ggtitle("Trips by Bases and Month") +
  scale_fill_manual(values = colors)
#base and day of week
ggplot(data_2014, aes(Base, fill = dayofweek)) + 
  geom_bar(position = "dodge") +
  scale_y_continuous(labels = comma) +
  ggtitle("Trips by Bases and DayofWeek") +
  scale_fill_manual(values = colors)

#heatmap by day & hour
day_and_hour <- data_2014 %>%
  group_by(day, hour) %>%
  dplyr::summarize(Total = n())

datatable(day_and_hour)

ggplot(day_and_hour, aes(day, hour, fill = Total)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low="pink", high="violet") +
  ggtitle("Heat Map by Hour and Day")

#month and day
ggplot(day_month_group, aes(day, month, fill = Total)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low="lightblue", high="darkblue") +
  ggtitle("Heat Map by Month and Day")

#month and day of week
ggplot(month_weekday, aes(dayofweek, month, fill = Total)) +
  geom_tile(color = "white") +
  ggtitle("Heat Map by Month and Day of Week")
#month and base
month_base <-  data_2014 %>%
  group_by(Base, month) %>%
  dplyr::summarize(Total = n()) 

day0fweek_bases <-  data_2014 %>%
  group_by(Base, dayofweek) %>%
  dplyr::summarize(Total = n()) 

ggplot(month_base, aes(Base, month, fill = Total)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low="#06aa85", high="#0590f5") +
  ggtitle("Heat Map by Month and Bases")

#month and bases

ggplot(day0fweek_bases, aes(Base, dayofweek, fill = Total)) +
  geom_tile(color = "white") +
  ggtitle("Heat Map by Bases and Day of Week")
# new york map
min_lat <- 40.5774
max_lat <- 40.9176
min_long <- -74.15
max_long <- -73.7004

ggplot(data_2014, aes(x=Lon, y=Lat)) +
  geom_point(size=1, color = "cyan") +
  scale_x_continuous(limits=c(min_long, max_long)) +
  scale_y_continuous(limits=c(min_lat, max_lat)) +
  theme_map() +
  ggtitle("NYC MAP BASED ON UBER RIDES DURING 2014 (APR-SEP)")

ggplot(data_2014, aes(x=Lon, y=Lat, color = Base)) +
  geom_point(size=1) +
  scale_x_continuous(limits=c(min_long, max_long)) +
  scale_y_continuous(limits=c(min_lat, max_lat)) +
  theme_map() +
  ggtitle("NYC MAP BASED ON UBER RIDES DURING 2014 (APR-SEP) by BASE")
