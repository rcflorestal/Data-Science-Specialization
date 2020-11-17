#-----------------------Dates and Times with lubridate-------------------------#
library(lubridate)

# To view your locale, type Sys.getlocale("LC_TIME").
Sys.getlocale("LC_TIME")

# The today() function returns today's date
this_day <- today()
this_day

# There are three components to this date. In order, they are year, month, and 
# day. We can extract any of these components using the year(), month(), 
# or day() 
# function, respectively. Try any of those on this_day now.
month(this_day)

# We can also get the day of the week from this_day using the wday() function.
# It will be represented as a number, such that 1 = Sunday, 2 = Monday, 3 = 
# Tuesday, etc.
wday(this_day)

# Now try the same thing again, except this time add a second argument, 
# label = TRUE, to display the *name* of the weekday (represented as an ordered 
# factor).
wday(this_day, label = TRUE)

# In addition to handling dates, lubridate is great for working with date and 
# time combinations, referred to as date-times. The now() functionreturns the 
# date-time representing this exact moment in time. Give it a try and store the 
# result in a variable called this_moment.
this_moment <- now()
this_moment

# Just like with dates, we can extract the year, month, day, or day of week. 
# However, we can also use hour(), minute(), and second() to extract specific 
# time information. Try any of these three new functions now to extract one 
# piece of time information from this_moment.

second(this_moment)

# To see how these functions work, try ymd("1989-05-17"). You must surround the 
# date with quotes. Store the result in a variable called my_date.
my_date <- ymd("1989-05-17")
my_date

# It looks almost the same, except for the addition of a time zone, which we'll 
# discuss later in the lesson. Below the surface, there's another important 
# change that takes place when lubridate parses a date. Type class(my_date) to 
# see what that is.
class(my_date)

# "1989-05-17" is a fairly standard format, but lubridate is 'smart' enough to 
# figure out many different date-time formats. Use ymd() to parse "1989 May 17". 
# Don't forget to put quotes around the date!
ymd("1989 May 17")

# Despite being formatted differently, the last two dates had the year first, 
# then the month, then the day. Hence, we used ymd() to parse them.
# What do you think the appropriate function is for parsing "March 12, 1975"?
mdy("March 12, 1975")


# We can even throw something funky at it and lubridate will often know the right 
# thing to do. Parse 25081985, which is supposed to represent the 25th day of 
# August 1985. Note that we are actually parsing a numeric value here -- not a 
# character string -- so leave off the quotes.
dmy(25081985)


# But be careful, it's not magic. Try ymd("192012") to see what happens when we
# give it something more ambiguous. Surround the number with quotes again, just 
# to be consistent with the way most dates are represented (as character strings).
ymd("1920/1/2")

# In addition to dates, we can parse date-times. I've created a date-time object 
# called dt1.
dt1 <- c("2014-08-23 17:23:02")
dt1

# Now parse dt1 with ymd_hms().
ymd_hms(dt1)


# What if we have a time, but no date? Use the appropriate lubridate function to 
# parse "03:22:14" (hh:mm:ss).
hms("03:22:14")


# lubridate is also capable of handling vectors of dates, which is particularly 
# helpful when you need to parse an entire column of data. I've created a vector 
# of dates called dt2. View its contents now.
dt2 <- c("2014-05-14", "2014-09-22", "2014-07-11")
dt2

# Now parse dt2 using the appropriate lubridate function.
ymd(dt2)

# The update() function allows us to update one or more components of a date-time. 
# For example, let's say the current time is 08:34:55 (hh:mm:ss).
# Update this_moment to the new time using the following command:
update(this_moment, hours = 8, minutes = 34, seconds = 55)

# It's important to recognize that the previous command does not alter this_moment 
# unless we reassign the result to this_moment. To see this, print the contents
# of this_moment.
this_moment

# Unless you're a superhero, some time has passed since you first created 
# this_moment. Use update() to make it match the current time, specifying at 
# least hours and minutes. Assign the result to this_moment, so that this_moment 
# will contain the new time.
update(this_moment, hours = 10, minutes = 16, seconds = 0)

# Take one more look at this_moment to see that it's been updated.
this_moment

# Now, pretend you are in New York City and you are planning to visit a friend 
# in Hong Kong. You seem to have misplaced your itinerary, but you know that 
# your flight departs New York at 17:34 (5:34pm) the day after tomorrow. 
# You also know that your flight is scheduled to arrive in Hong Kong exactly 15 
# hours and 50 minutes after departure.
# Let's reconstruct your itinerary from what you can remember, starting with the 
# full date and time of your departure. We will approach this by finding the 
# current date in New York, adding 2 full days, then setting the time to 17:34.
# To find the current date in New York, we'll use the now() function again. This 
# time, however, we'll specify the time zone that we want: "America/New_York". 
# Store the result in a variable called nyc. Check out ?now if you need help.
nyc <- now("America/New_York")
nyc

# For a complete list of valid time zones for use with lubridate, check out the 
# following Wikipedia page: http://en.wikipedia.org/wiki/List_of_tz_database_time_zones

# Your flight is the day after tomorrow (in New York time), so we want to add 
# two days to nyc. One nice aspect of lubridate is that it allows you to use 
# arithmetic operators on dates and times. In this case, we'd like to add two 
# days to nyc, so we can use the following expression: nyc + days(2). Give it a 
# try, storing the result in a variable called depart.
depart <- nyc + days(2)
depart

# So now depart contains the date of the day after tomorrow. Use update() to add 
# the correct hours (17) and minutes (34) to depart. Reassign the | result to depart.
depart <- update(depart, hours = 17, minutes = 34)
depart

# Your friend wants to know what time she should pick you up from the airport in 
# Hong Kong. Now that we have the exact date and time of your departure from New 
# York, we can figure out the exact time of your arrival in Hong Kong.
# The first step is to add 15 hours and 50 minutes to your departure time. 
# Recall that nyc + days(2) added two days to the current time in New York. 
# Use the same approach to add 15 hours and 50 minutes to the date-time stored 
# in depart. Store the result in a new variable called arrive.
arrive <- depart + hours (15) + minutes(50)

# The arrive variable contains the time that it will be in New York when you 
# arrive in Hong Kong. What we really want to know is what time it will be in 
# Hong Kong when you arrive, so that your friend knows when to meet you.
# The with_tz() function returns a date-time as it would appear in another time 
# zone. Use ?with_tz to check out the documentation.
arrive <- with_tz(arrive, tzone = "Asia/Hong_Kong")
arrive

# Fast forward to your arrival in Hong Kong. You and your friend have just met 
# at the airport and you realize that the last time you were together was in 
# ingapore on June 17, 2008. Naturally, you'd like to know exactly how long it 
# has been. Use the appropriate lubridate function to parse "June 17, 2008", 
# just like you did near the beginning of this lesson. This time, however, you 
# should specify an extra argument, tz = "Singapore". Store the result in a 
# variable called last_time.
last_time <- mdy("June 17, 2008", tz = "Singapore")
last_time

# Pull up the documentation for interval(), which we'll use to explore how much 
# time has passed between arrive and last_time.
?interval

# Create an interval() that spans from last_time to arrive. Store it in a new 
# variable called how_long.
how_long <- interval(last_time, arrive)

# Now use as.period(how_long) to see how long it's been.
as.period(how_long)

# This is where things get a little tricky. Because of things like leap years, 
# leap seconds, and daylight savings time, the length of any given minute, day, 
# month, week, or year is relative to when it occurs. In contrast, the length of 
# a second is always the same, regardless of when it occurs.
# To address these complexities, the authors of lubridate introduce four classes 
# of time related objects: 
        # instants, 
        # intervals, 
        # durations, 
        # periods. 
# These topics are beyond the scope of this lesson, but you can find a complete 
# discussion in the 2011 Journal of Statistical Software paper titled 'Dates and 
# Times Made Easy with lubridate'.

