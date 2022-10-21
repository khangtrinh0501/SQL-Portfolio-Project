SQL Exercises

I.	Simple queries
Ex 1:
Create a query to list out the following columns from the tblEvent table, with the most recent first (for which you'll need to use an ORDER BY clause):
●	The event name
●	The event date


Ex 2: 
Write a query to show the first 5 events (in date order) from the tblEvent table:
There are a few things to notice about this:
●	You should give the columns aliases (Eventname to be What and EventDetails to be Details in this case);
●	Use SELECT TOP 5 to limit the results to 5 rows;
●	Even though you're sorting by the event date, it doesn't have to be included in your results.

Ex 3: 
Create a query to list out the id number and name of the last 3 categories from the tblCategory table in alphabetical order

Ex 4: 
Create a query which uses two separate SELECT statements to show the first and last 2 events in date order from the tblEvent table.

Redirect the output of this query to text, rather than to grid, to get something like this when you run it:

 


II.	Use WHERE

Ex 1:
Write a query to list out all of the events from the tblEvent table in category number 11 (which corresponds to Love and Relationships, as it happens)


Ex 2:
Create a query which lists out all of the events which took place in February 2005
This should return 2 rows. 

Ex 3:
Create a query which lists out all of the tblEvent events which include the word Teletubbies:
Now add an OR condition to your query so that it lists out all events whose:
●	Name includes Teletubbies; or
●	Name includes Pandy.


Ex 4: 
First show a list of all events which might have something to do water.  The interpretation of this is that one or more of the following is true:
●	They take place in one of the island countries (8, 22, 30 and 35, corresponding to Japan, the Marshall Islands, Cuba and Sri Lanka respectively)
●	Their EventDetails column contains the word Water (not the text Water, but the word)
●	Their category is number 4 (Natural World)
Now add a criterion to show only those events which happened since 1970 (you may need to use parentheses to get this to give the correct answer).

Ex 5:
Events which aren't in the Transport category (number 14), but which nevertheless include the text Train in the EventDetails column.

Ex 6:
Events which are in the Space country (number 13), but which don't mention Space in either the event name or the event details columns.

Ex 7:
Events which are in categories 5 or 6 (War/conflict and Death/disaster), but which don't mention either War or Death in the EventDetails column.


III.	Basic joins

Ex 1: 
Right click on tblAuthor and View Diagram, you can see the tblAuthor and tblEpisode are linked by AuthorId, Each episode is linked to the person who wrote it.
a.	Add columns and filters to your query so that it shows who wrote the "special" episodes (there should be 13 listed out)
b.	Remember to tidy up the query. 


 

Ex 2:
Each episode in the database has assigned to it the doctor who played the starring role:

 

Create a join to list out all of the doctors who appeared in episodes made in 2010

Ex 3: 
From tblCountry and tblEvent, create a query to get a list of EventName happened in each country and when date they happened. 

Ex 4:
Create a query to link together the following 3 tables:
●	tblContinent
●	tblCountry
●	tblEvent
Your query should list out those events which took place in either:
●	the continent called Antarctic; or
●	the country called Russia.

Ex 5:
Create a query which uses an inner join to link the categories table to the events table (they share a column/field called CategoryId). How many rows are there in the full result table? 

Change the inner join to a full outer join, so that you show for each category its events - even when there aren't any. How many rows are there?
Add a WHERE clause to show only those categories which don't have any corresponding events.

Ex 6:
Write a query using inner joins to show all of the authors who have written episodes featuring the Daleks.  You may find the following relationship diagram useful to refer to

 


Ex 7:
Create a query to list out the appearances of enemies in episodes which have length under 40 characters, where the length is defined as the sum of:
●	the number of characters in the author's name;
●	the number of characters in the episode's title;
●	the number of characters in the doctor's name; and
●	the number of characters in the enemy's name.

Ex 8:
Create a query using an outer join to list out those countries which have no corresponding events.

IV.	Aggregation and grouping

Ex 1:
The following diagram shows how the authors and episodes tables are related

 

Use this to show for each author:
●	the number of episodes they wrote;
●	their earliest episode date; and
●	their latest episode date.
Sort these so that the most prolific authors come first.

Ex 2: 
Create a query which:
●	groups by the category name from the category table; and
●	counts the number of events for each.

Ex 3: 
Create a query to list out the following statistics from the table of events
 


Ex 4:
Create a query listing out for each continent and country the number of events taking place therein

Ex 5:
The tables you'll need for this exercise are as follows. Write a query to list out for each author and doctor the number of episodes made, but restrict your output to show only the author/doctor combinations for which more than 5 episodes have been written.

 

Ex 6:
Write a query to list out for each episode year and enemy the number of episodes made, but in addition:
●	Only show episodes made by doctors born before 1970; and
●	Omit rows where an enemy appeared in only one episode in a particular year.

Ex 7:
Create a query which shows two statistics for each category initial:
1.	The number of events for categories beginning with this letter; and
2.	The average length in characters of the event name for categories beginning with this letter.

Ex 8: 
Create a query to show the following information. You'll need to calculate the century for each event date, and group by this

 

V.	Calculations

Ex 1:
Create a query listing out each event with the length of its name, with the "shortest event" first. To calculate number of characters, use function LEN()
Ex 2:
Create a query to list out for each event the category number that it belongs to. Use concat function.

Ex 3:
The tblContinent table lists out the world's continents, but there are gaps:

 
Use these 3 functions to show 3 ways of changing the Null value in Summary column to be ‘No summary’: ISNULL(), COALESCE(), CASE WHEN 

Ex 4:
Write a query to divide countries into these groups:

 


Ex 5: 
It's traditional to express a country's size in terms of how many times you could fit Wales into it - so let's do this!  First create the following columns in a query:

 
You'll need to know that Wales is 20,761 square kilometres in area!
Now extend your query to show a text description of how many times each country could accommodate Wales
Finally, change your query's sort order so that it lists countries with the closest in size to Wales first

Ex 6: 
Write a query to list out all the event names that begin and end with vowel.

Ex 7:
Write a query to list out all the event names that begin and end with the same letter.

VI.	Calculations using dates

Ex 1:
First create a query showing events which took place in your year of birth, neatly formatted.
Amend your query so that it shows the event date neatly formatted using FORMAT() function.

Ex 2: 
The idea behind this exercise is to see what was happening in the world around the time when you were born (but you can use any reference date).  First create a query to show the number of days which have elapsed for any event since your birthday.
The ABS function returns the absolute value of a number (for example, ABS(42) and ABS(-42) both equal 42).  Use this to list the events in order of closeness to your birthday

Ex 3:
Create a query to show the day of the week and also the day number on which each event occurred.
Use this to show:
●	That mercifully there weren't any events on Friday the 13th;
●	That there was one event on Thursday 12th (the day before); and
●	That there were two events on Saturday the 14th (the day after).

Ex 4: 
Create a query to show the full dates for any event in the below format

 

