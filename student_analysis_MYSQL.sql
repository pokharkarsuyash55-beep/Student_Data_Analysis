CREATE DATABASE Student_Analysis;
USE Student_Analysis;

CREATE TABLE Student(
	ID INT PRIMARY KEY,
    class varchar(2),
    gender varchar(10),
    race int,
    GPA decimal(8,2),
    Algebra int,
    Calculus1 int,
    Calculus2 int,
    Statistics int,
    Probability int,
    Measure int,
    Functional_analysis int,
    from1 varchar(2),
    from2 varchar(2),
    from3 varchar(2),
    Y int
);

set Global local_infile=1;
show variables like 'local_infile';
describe Student;

load data local infile 'C:/Users/Admin/Desktop/New_folder_(4)/data analytics/student_analysis/processed_dataset.csv'
into table Student
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from Student;
-- ------------------------------------------------------
-- Total Students  
select count(ID) as Total_Students from Student;
--  --------------------------------------------------------
-- Average GPA
select round(avg(GPA),2) as Average_GPA from student;
-- ---------------------------------------------------------
 -- Average Probability
 select round(avg(Probability),2) as Average_Probability from Student;
 -- ----------------------------------------------------------
  -- Total Measure
  select sum(Measure) as Total_Measure from student;
  -- ---------------------------------------------------------
  -- Average Statistics
  select round(avg(Statistics),2) as Average_Statistcs from student;
 -- -----------------------------------------------------------------
 -- Mark Distribution By From3 
 select From3,
	sum(Algebra) as Algebra,
    sum(Calculus1) as Calculus1,
    sum(Calculus2) as Calculus2 
from student 
group by From3;
-- ----------------------------------------------------------------------
  -- Average GPA by Class
select class,
	round(avg(GPA),2)as Average_GPA 
from student
group by  class;
-- ---------------------------------------------------------------------
-- Statistical Analysis by class and gender
select class,gender,
	sum(Statistics) as Statistics
from student
group by class,gender
order by statistics desc;
-- ----------------------------------------------------------------------
-- Probability by Y and Class
select Y,Class,
	sum(Probability)as Probability
from student
group by Y ,class
order by Y ,Class;

-- ------------------------------------------------------------------------- 
-- Functional_Analysis by Y
select Y,
	Sum(Functional_Analysis) as Functional_Analysis 
from student
group by Y; 
-- -----------------------------------------------------------------------------
-- Sum of Calculus2 by From2 and Class
select From2,class,
	sum(Calculus2) as Calculus2
from student
group by class ,From2;
-- ------------------------------------------------------------------------------
-- Distribution By Gender
SELECT
    Gender,
    concat(ROUND(COUNT(*) * 100/ (SELECT COUNT(*) FROM student), 0),'%') AS Percentage
FROM student
GROUP BY Gender;
-- --------------------------------------------------------------------------------
-- Student Count By Class 
select class,
	count(ID) as Student_Count
From student
group by class;
-- -------------------------------------------------------------------------------------
-- GPA  Distribution by From3
select From3,
	round(sum(GPA)  ,2)as Total_GPA
from student 
group by From3;
-- ---------------------------------------------------------------------------------------
-- Average GPA by Gender
select gender,
	round(Avg(GPA),2) as Average_GPA
from student 
group by  gender;