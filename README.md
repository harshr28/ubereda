# Exploratory Data Analysis on Uber Rides Dataset
The repository consists of a dataset containing Uber rides data from April to September 2014. The R script file performs exploratory data analysis on the data.

#Project Details:
Domain: Data Science
Project Name: Exploratory Data Analysis on Uber Dataset
Theme: Descriptive Analytics

Objective:
To gather basic insights from the Uber Rides dataset comprising data of rides from April to September 2014. The project plots various datatables; bar graphs; heatmaps and generates a map of New York City using the data.

Data Description:
There are six files of raw data on Uber pickups in New York City from April to September 2014. The files are separated by month and each has the following columns:

Date/Time : The date and time of the Uber pickup
Lat : The latitude of the Uber pickup
Lon : The longitude of the Uber pickup
Base : The TLC base company code affiliated with the Uber pickup

These files are named:

uber-raw-data-apr14.csv
uber-raw-data-aug14.csv
uber-raw-data-jul14.csv
uber-raw-data-jun14.csv
uber-raw-data-may14.csv
uber-raw-data-sep14.csv

The Base codes are for the following Uber bases:

B02512 : Unter
B02598 : Hinter
B02617 : Weiter
B02682 : Schmecken
B02764 : Danach-NY

#Results:
1. The following insights were found using different barplots:
a. The highest number of trips were undertaken between 5 PM and 6 PM. 
![image](https://user-images.githubusercontent.com/119730322/221345502-a95ca1fb-0db5-432a-a549-191cd43683a3.png)
![image](https://user-images.githubusercontent.com/119730322/221345575-7f6247d4-454a-47fa-b459-7a926f973b36.png)

b. The highest number of trips were undertaken on the 30th of the month, mostly contributed by the month of April.
![image](https://user-images.githubusercontent.com/119730322/221345688-e77708d5-3316-4235-87c7-cf342d0154c4.png)
![image](https://user-images.githubusercontent.com/119730322/221345692-01afe5aa-9117-4edf-bdaa-d5e95f747b0d.png)

c. The most number of trips were undertaken in September and the least in April.
![image](https://user-images.githubusercontent.com/119730322/221345767-25daecd5-dfeb-4292-b4cc-7ad34f3672c9.png)

d. The most number of trips in on Wednesday for April; on Friday in May; on Thursday in June and July; on Friday in August and on Tuesday in September.
![image](https://user-images.githubusercontent.com/119730322/221345899-8e1b9b78-4838-4434-8bda-b524035fc54e.png)

e. The higeshest number of trips were taken from Weiter base, with most contribution from September.
![image](https://user-images.githubusercontent.com/119730322/221345953-05f02b1a-bcb8-4a3b-b0eb-a0a621e4e93c.png)

![image](https://user-images.githubusercontent.com/119730322/221345964-bef43b66-f567-472b-9b7f-7c84cbd264dd.png)

f. Grouped by bases, most bases had the highest number of trips on Thursday.
![image](https://user-images.githubusercontent.com/119730322/221346005-09cda08f-a08e-48eb-9d73-271d8c73d547.png)

2. The following insights were found using heatmaps:
a. The number of trips were higher in the evening on each day.
![image](https://user-images.githubusercontent.com/119730322/221346060-67995504-0d0c-4a80-99ee-618c99ab0ffb.png)

b. Most months had a recurring pattern with dates for number of trips.
![image](https://user-images.githubusercontent.com/119730322/221346114-04bda3a3-8f36-4b83-84f2-ccd77ab2578c.png)

c. The trips were higher on Sundays of April as compared to other month day combinations.
![image](https://user-images.githubusercontent.com/119730322/221346158-c3175bdd-9d47-4ec8-971d-336953e613b5.png)

d. Most number of trips were undertaken from Weiter base in September as compared to other combinations.
![image](https://user-images.githubusercontent.com/119730322/221346222-ea796c1c-f81d-47ef-bbfb-107b273075a8.png)

e. The distrbution of trips from bases were almost uniform for each base.
![image](https://user-images.githubusercontent.com/119730322/221346269-96846bbd-44d1-4394-a66f-f0ce81df4e8a.png)

3. The map of New York City was plotted using the pickup locations:

Plotted Map:

![image](https://user-images.githubusercontent.com/119730322/221346583-d21839d3-e837-4ce5-8e78-c10b0cee567b.png)


Image for reference[Wikimedia Commons]:

![image](https://user-images.githubusercontent.com/119730322/221346856-97cf060c-cf02-4c86-9ce3-40c2bfd95f13.png)


Map plotted by bases:

![image](https://user-images.githubusercontent.com/119730322/221346736-103f46b4-bff9-4182-9c8e-00c77ca8ed71.png)

