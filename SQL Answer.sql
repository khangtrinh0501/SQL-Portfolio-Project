-- I.	Simple Queries


--Simple Queries / Ex 1: 
select
	EventName,
	EventDate
from
	tblEvent
order by
	EventDate desc;
	
--Simple Queries / Ex 2
select
	top 5 EventName,
	EventDetails
from
	tblEvent te
order by
	EventDate asc;


--Simple Queries / Ex 3:
select
	top 3
	CategoryID,
	CategoryName
from
	tblCategory tc
order by
	CategoryName desc;

--Simple Queries / Ex 4: Click on the Text instead of Grid to switch
select
	top 2 EventName,
	EventDetails
from
	tblEvent te
order by
	EventDate asc ;

select
	top 2 EventName,
	EventDetails
from
	tblEvent te
order by
	EventDate desc;

-- II. Use Where
--Use WHERE / Ex 1:
select
	*
from
	tblEvent te
where
	CategoryID = 11;


--Use WHERE / Ex 2: 
select
	*
from
	tblEvent te
where
	year(EventDate) = 2005
	and month(EventDate) = 2;


--Use WHERE / Ex 3: 
select
	*
from
	tblEvent te
where
	EventName like '%Teletubbies %'
	or EventName like '%Pandy %';


--Use WHERE / Ex 4: 

select
	*
from
	tblEvent te
where
	(CountryID in (8, 22, 30, 35)
	or EventDetails like '%Water %'
	or CategoryID = 4) 
	and year(EventDate) >= 1970;

--Use WHERE / Ex 5: 
select
	*
from
	tblEvent te
where
	CategoryID != 14
	and EventDetails like '%Train%';
	
	
--Use WHERE / Ex 6: 
select
	*
from
	tblEvent te
where
	CountryID = 13
	and EventName not like '%Space%'
	and EventDetails not like '%Space%'
	
--Use WHERE / Ex 7: 
select
	*
from
	tblEvent te
where
	CategoryID in (5, 6)
	and EventDetails not like '%War%'
	and EventDetails not like '%Death%';

-- III. Basic joins
--Basic joins / Ex 1: 
SELECT
	tblAuthor.AuthorName,
	tblEpisode.Title,
	tblEpisode.EpisodeType
FROM
	tblAuthor
INNER JOIN tblEpisode ON
	tblAuthor.AuthorId = tblEpisode.AuthorId
WHERE
	tblEpisode.EpisodeType LIKE '%special%'
ORDER BY
	tblEpisode.Title;


--Basic joins / Ex 2: 
select
	td.DoctorName ,
	te.Title
from
	tblEpisode te
left join tblDoctor td on
	te.DoctorId = td.DoctorId
where
	year(te.EpisodeDate) = 2010;


--Basic joins / Ex 3: 
select
	CountryName ,
	eventname,
	eventdate
from
	tblCountry tc
inner join tblEvent te on
	tc.CountryID = te.CountryID
order by
	eventdate;

--Basic joins / Ex 4: 
select
	te.EventName,
	tc.CountryName,
	tc2.ContinentName
from
	tblEvent te
left join tblCountry tc on
	te.CountryID = tc.CountryID
left join tblContinent tc2 on
	tc.ContinentID = tc2.ContinentID
where
	tc.CountryName = 'Russia'
	or tc2.ContinentName = 'Antarctic';

--Basic joins / Ex 5:
--Inner join
select
	EventName,
	EventDate,
	tc.CategoryName
from
	tblEvent te
inner join tblCategory tc on
	te.CategoryID = tc.CategoryID;
--Full outer join, 461 rows
select 
	EventName,
	EventDate,
	tc.CategoryName
from
	tblCategory tc
full join tblEvent te on
	tc.CategoryID = te.CategoryID;

select
	EventName,
	EventDate,
	tc.CategoryName
from
	tblEvent te
full outer join tblCategory tc on
	te.CategoryID = tc.CategoryID
where EventID is null;

--Basic joins / Ex 6:	 
select
	Title,
	authorname,
	enemyname
from
	tblEpisode te
inner join tblAuthor ta on
	te.AuthorId = ta.AuthorId
inner join tblEpisodeEnemy tee on
	te.EpisodeId = tee.EpisodeId
inner join tblEnemy te2 on
	tee.EnemyId = te2.EnemyId
where
	te2.EnemyName = 'Daleks'


--Basic joins / Ex 7: 
select 
ta.AuthorName ,
len(ta.AuthorName),
te.Title ,
len(te.Title),
td.DoctorName ,
len(td.DoctorName),
te2.EnemyName ,
len(te2.EnemyName),
len(ta.AuthorName) + len(te.Title) + len(td.DoctorName) + len(te2.EnemyName) as [total length]
from
	tblEpisode te
inner join tblAuthor ta on
	te.AuthorId = ta.AuthorId
inner join tblDoctor td on 
	te.DoctorId = td.DoctorId 
inner join tblEpisodeEnemy tee on
	te.EpisodeId = tee.EpisodeId
inner join tblEnemy te2 on
	tee.EnemyId = te2.EnemyId
where len(ta.AuthorName) + len(te.Title) + len(td.DoctorName) + len(te2.EnemyName) < 40;

--Basic joins / Ex 8: 
select
	*
from
	tblCountry tc
full outer join tblEvent te on
	tc.CountryID = te.CountryID
where
	te.EventID is null;

-- IV. Aggregation and grouping
--Aggregation and grouping / Ex 1: 
select
	ta.AuthorName,
	count(distinct EpisodeId) as [Count Episode],
	min(EpisodeDate) as [Earliest episode date],
	max(EpisodeDate) as [Latest episode date]
from
	tblEpisode te
inner join tblAuthor ta on
	te.AuthorId = ta.AuthorId
group by
	ta.AuthorName
order by
	count(distinct EpisodeId) desc;


--Aggregation and grouping / Ex 2: 
select
	tc.CategoryName ,
	count(distinct te.EventID) as [Count event]
from
	tblCategory tc
inner join tblEvent te on
	tc.CategoryID = te.CategoryID
group by
	tc.CategoryName
order by
	count(distinct te.EventID) desc;

--Aggregation and grouping / Ex 3:
select
	count(distinct EventID) as [Number of events],
	min(EventDate) as [First Date],
	max(EventDate) as [Last Date]
from
	tblEvent te;


--Aggregation and grouping / Ex 4: 42 rows
select
	tc2.ContinentName,
	tc.CountryName,
	count(distinct te.EventID) as [Number of events]
from
	tblEvent te
inner join tblCountry tc on
	te.CountryID = tc.CountryID
inner join tblContinent tc2 on
	tc2.ContinentID = tc.ContinentID
group by
	tc2.ContinentName,
	tc.CountryName;

--Aggregation and grouping / Ex 5: 
select
	ta.AuthorName,
	td.DoctorName,
	count(distinct te.EpisodeId) as [Number of episodes]
from
	tblEpisode te
inner join tblAuthor ta on
	te.AuthorId = ta.AuthorId
inner join tblDoctor td on
	te.DoctorId = td.DoctorId
group by
	ta.AuthorName,
	td.DoctorName
having
	count(distinct te.EpisodeId) > 5
order by
	count(distinct te.EpisodeId) desc;

--Aggregation and grouping / Ex 6: 
select
	year(te.EpisodeDate) as [Episode Year],
	te2.EnemyName,
	count(distinct te.EpisodeId) as [Episodes]
from
	tblEpisode te
inner join tblEpisodeEnemy tee on
	te.EpisodeId = tee.EpisodeId
inner join tblEnemy te2 on
	tee.EnemyId = te2.EnemyId
inner join tblDoctor td on 
	te.DoctorId = td.DoctorId 
where year(td.BirthDate) < 1970
group by
	year(te.EpisodeDate),
	te2.EnemyName
having 
	count(distinct te.EpisodeId) > 1
order by 
	count(distinct te.EpisodeId) desc;



--Aggregation and grouping / Ex 7: 
select
	left(tc.CategoryName, 1),
	count(distinct te.EventID) as [Number of events],
	avg(len(EventName)) as [Average event name length]
from
	tblEvent te
inner join tblCategory tc on
	te.CategoryID = tc.CategoryID
group by
	left(tc.CategoryName, 1)
order by 
	avg(len(EventName)) desc;


--Aggregation and grouping / Ex 8:
--Because 21st century starts from 2001 so we need to – 1. 
select
	concat(1 + (year(EventDate) - 1) / 100,  
		case when right(1 + (year(EventDate) - 1) / 100, 1) = 1 
			 then 'st'
			 when right(1 + (year(EventDate) - 1) / 100, 1) = 2
			 then ' nd'
			 when right(1 + (year(EventDate) - 1) / 100, 1) = 3 
			 then ' rd'
			 else 'th'
			 end,
		' century')
	as century,
	count(distinct EventID) as [Number of events]
from
	tblEvent te
group by
	1 + (year(EventDate) - 1) / 100;

--V. Calculations
--Calculations / Ex 1:
select
	EventName,
	LEN(EventName)
from
	tblEvent te
order by
	LEN(EventName) asc;

--Calculations / Ex 2:
select
	EventName ,
	CategoryID ,
	concat(EventName, ' (Category ', CategoryID, ')') as [Event(Category)]
from
	tblEvent;	
	
--Calculation / Ex 3:
select 
	ContinentID,
	ContinentName, 
	Summary,
	isnull(Summary, 'No summary') as [IsNull], 
	COALESCE(Summary, 'No summary') as [Coalesce],
	case when Summary is null then 'No summary'	else Summary end as [Case When]
from 
	tblContinent tc;

--Calculation / Ex 4:
select
	countryname,
	case
		when ContinentID in (1, 3) then 'Eurasia'
		when ContinentID in (5, 6) then 'Americas'
		when ContinentID in (2, 4) then 'Somewhere hot'
		when ContinentID = 7 then 'Somewhere cold'
		else 'Somewhere else'
	end as CountryLocation
from
	tblCountry tc;


--Calculation / Ex 5:

select country, 
	   KmSquared,
	   KmSquared % 20761 as AreaLeftOver, round(KmSquared / 20761,0) as WalesUnits, 
	   concat(round(KmSquared / 20761,0), ' x Wales plus ', KmSquared % 20761, ' sq. km') as WalesComparison
from
	CountriesByArea cba
order by abs(KmSquared - 20761) asc;

--Calculation / Ex 6:
select
	EventName,
	left(EventName, 1),
	right(EventName, 1)
from
	tblEvent te
where
	left(EventName, 1) in ('u', 'e', 'o', 'a', 'i')
	and right(EventName, 1) in ('u', 'e', 'o', 'a', 'i');
	
--Calculation / Ex 7:
select
	EventName,
	left(EventName, 1),
	right(EventName, 1)
from
	tblEvent te
where
	left(EventName, 1) = right(EventName, 1);

-- VI.Calculations using dates
--Calculations using dates / Ex 1:
select
	EventDate,
	format(EventDate, 'dd/MM/yyyy') as formattedDate
from
	tblEvent te
where 
year(EventDate) = 1995;

--Calculations using dates / Ex 2:
select
	EventDate ,
	cast('09/26/1995' as date) as DOB, --or datefromparts
	abs(datediff(day, EventDate, cast('09/26/1995' as date))) as daydiff
from
	tblEvent te
order by
	abs(datediff(day, EventDate, cast('09/26/1995' as date))) asc;


--Calculations using dates / Ex 3:
select
	EventName,
	EventDate,
	datename(weekday, EventDate) as [Day of week],
	datepart(day, EventDate) as [Day number]
from
	tblEvent te
where 
	datename(weekday, EventDate) = 'Friday' 
	and datepart(day, EventDate) = 13;

select
	EventName,
	EventDate,
	datename(weekday, EventDate) as [Day of week],
	datepart(day, EventDate) as [Day number]
from
	tblEvent te
where 
	datename(weekday, EventDate) = 'Thursday' 
	and datepart(day, EventDate) = 12;
	
select
	EventName,
	EventDate,
	datename(weekday, EventDate) as [Day of week],
	datepart(day, EventDate) as [Day number]
from
	tblEvent te
where 
	datename(weekday, EventDate) = 'Saturday' 
	and datepart(day, EventDate) = 14;

--Calculations using dates / Ex 4:
select
	EventName as [Event Name],
	concat(datename(weekday, EventDate), ' ', 
	case 
        when datepart(day, EventDate) in (1, 21, 31) 
       		then convert(varchar, datepart(day, EventDate))+ 'st'
       	when datepart(day, EventDate) in (2, 22) 
       		then convert(varchar, datepart(day, EventDate))+ 'nd'
       	when datepart(day, EventDate) in (3, 23) 
	        then convert(varchar, datepart(day, EventDate))+ 'rd'
        else convert(varchar, datepart(day, EventDate)) + 'th'
        end , ' ' 
        , datename(month, EventDate) , ' ' 
        , year(EventDate)) as [Full Date]
from
	tblEvent te;



--Subqueries / Ex 1:

select
	eventname,
	eventdate
from
	tblEvent te
where
	eventdate > 
	(select
		max(eventdate)
	from
		tblEvent te
	where
		CountryID = 21)
order by
	EventDate desc;


--Subqueries / Ex 2: 
select
	EventName,
	len(EventName) as [Name length]
from
	tblEvent te2
where
	len(EventName) >
	(select
		avg(len(eventname)) as [avg event name length]
	from
		tblEvent te)
order by
	len(EventName) desc;


--Subqueries / Ex 3: 

select
	tc4.ContinentName ,
	EventName
from
	tblEvent te2
inner join tblCountry tc3 on
	te2.CountryID = tc3.CountryID
inner join tblContinent tc4 on
	tc3.ContinentID = tc4.ContinentID
where
	tc4.ContinentName in (
	select 
		top 3 tc2.ContinentName 
	from
		tblEvent te
	inner join tblCountry tc on
		te.CountryID = tc.CountryID
	inner join tblContinent tc2 on
		tc.ContinentID = tc2.ContinentID
	group by
		tc2.ContinentName
	order by
		count(distinct EventID) asc;

--Subqueries / Ex 4: 
select
	A.CountryName
from
	TblCountry A
inner join 
	(select
		TE.CountryID,
		COUNT(distinct TE.EventID) as countd_event
	from
		tblEvent TE
	group by
		TE.CountryID
	having
		COUNT(distinct TE.EventID) > 8) B on
	A.CountryID = B.CountryID;



--Subqueries / Ex 5: 
select
	EventName
from
	tblEvent te
where
	CountryID not in 
		(select
			top 30 CountryID
		from
			tblCountry tc
		order by
			countryname desc)
	and CategoryID not in (
		select
			top 15 CategoryID
		from
			tblCategory tc2
		order by
			categoryname desc);


-- CTEs / Ex 1:
-- show the number of events whose descriptions contain the words this and/or that:
	with ThisAndThat as
	(select te.EventID, 
	case
		when te.EventName  like '%this%' then '1'
		when te.EventDetails like '%this%' then '1'
		else '0'
		end as Ifthis,
	case
		when te.EventName  like '%that%' then '1'
		when te.EventDetails like '%that%' then '1'
		else '0'
		end as Ifthat	
	from
		tblEvent te)
select
	Ifthis,
	Ifthat, count(DISTINCT EventID) as [No of events]
from
	ThisAndThat as tat
where
	Ifthis = 0 and Ifthat = 0 
	or Ifthis = 1 and Ifthat = 0
	or Ifthis = 0 and Ifthat = 1
	or Ifthis = 1 and Ifthat = 1
	group by Ifthis, Ifthat;

	-- Show the 3 events whose details contain both this and that: 
	with ThisAndThat as
	(select te.EventID, 
	case
		when te.EventName  like '%this%' then '1'
		when te.EventDetails like '%this%' then '1'
		else '0'
		end as Ifthis,
	case
		when te.EventName  like '%that%' then '1'
		when te.EventDetails like '%that%' then '1'
		else '0'
		end as Ifthat	
	from
		tblEvent te)
select
	te3.EventName, te3.EventDetails  
from
	ThisandThat as tat
full join tblEvent te3 on
	tat.EventId = te3.EventID
where
	Ifthis = 1 and Ifthat = 1;	
	


-- CTEs / Ex 02:
	with Betweennz as
	-- get a list events which end with letter between n and z
	(select
	EventName,CountryID 
from
	tblEvent te
	where right(EventName,1) BETWEEN 'n' and 'z')

select
	tc.CountryName, bnz.EventName
from
	Betweennz as bnz
left join tblCountry tc on
	bnz.CountryID = tc.CountryID;
	
	


-- CTEs / Ex 03:
with MpInAuthorName as
-- Get a list of all of the episodes written by authors with MP in their names and show the episode id numbers for those Doctor Who episodes written by authors with MP as part of their names
(select
	ta.AuthorName,
	te.EpisodeNumber,
	te.EpisodeId 
from
	tblEpisode te
left join tblAuthor ta on
	te.AuthorId = ta.AuthorId
where ta.AuthorName like '%MP%')


select
	DISTINCT tc.CompanionName 
from
	MpInAuthorName as mian
left join tblEpisodeCompanion tec on
	mian.EpisodeId = tec.EpisodeId
inner join tblCompanion tc on
tec.CompanionId = tc.CompanionId; 


 
-- CTEs / Ex 04:
with nonowlevents as 
-- get a list of events which contain none of the the lettersin the worlf OWL
(select
	*
from
	tblEvent te
where
	EventDetails not like '%o%'
	and EventDetails not like '%w%'
	and EventDetails not like '%l%')

	,OtherEventsInNonOwlCountries as 
(select
	tc.CountryName,
	te2.EventName,
	te2.CountryID,
	te2.CategoryID 
from
	nonowlevents as noe
left join tblCountry tc on
	noe.CountryID = tc.CountryID
inner join tblEvent te2 on --Its ok to use left join 
	noe.CountryID = te2.CountryID) 


	select
	DISTINCT tc.CategoryName, te.EventName, te.EventDate
from
	OtherEventsInNonOwlCountries as Other
left join tblCategory tc on
	Other.CategoryID = tc.CategoryID 
left join tblEvent te on Other.CategoryID = te.CategoryID;


-- CTEs / Ex 05:
with EraandEventId as
(select
	case
		when year(te.EventDate) <1900 then '19th century and earlier'
		when year(te.EventDate) < 2000 then '20th century'
		else '21st century'
		end as Era,
		te.EventID 
	from
		tblEvent te)
	-- Epoch making		
select Era, 
	count (DISTINCT EventId)
from
	EraandEventId as eae 
	group by Era;



