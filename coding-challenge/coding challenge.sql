-- 1. Provide a SQL script that initializes the database for the Job Board scenario CareerHub. 

Create database IF NOT EXISTS CareerHub;
Use CareerHub;

-- 2. Create tables for Companies, Jobs, Applicants and Applications.
-- 3. Define appropriate primary keys, foreign keys, and constraints. 

-- Companies table
Create Table IF NOT EXISTS Companies (
CompanyID int Primary Key,
CompanyName varchar(255),
Location varchar(255)
);

Insert into Companies(CompanyID, CompanyName, Location) 
values (1, 'Hexaware', 'Chennai'),
(2, 'Accenture', 'Hyderabad'),
(3, 'Microsoft', 'Bangalore'),
(4, 'Hexaware', 'Pune'),
(5, 'Google', 'Mumbai'),
(6, 'Amadeus', 'Bangalore'),
(7, 'Deloitte', 'Hyderabad'),
(8, 'TCS', 'Chennai'),
(9, 'Wipro', 'Bangalore'),
(10, 'Cognizant', 'Pune');

select * from Companies;

-- Jobs table
Create Table IF NOT EXISTS Jobs (
JobID int Primary Key,
CompanyID int,
JobTitle varchar(50),
JobDescription text,
JobLocation varchar(20),
Salary decimal(10, 2),
JobType varchar(20),
PostedDate datetime,
Foreign Key (CompanyID) References Companies(CompanyID)
);

Insert Into Jobs (JobID, CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate)
Values
(101, 1, 'Software Developer', 'We are seeking a skilled software engineer', 'Chennai', 50000.00, 'Full-time', '2024-04-01 09:00:00'),
(102, 2, 'Financial Analyst', 'We are hiring a financial analyst ', 'Hyderabad', 25000.00, 'Part-time', '2024-04-02 10:00:00'),
(103, 3, 'Data Analyst', 'looking for a data analyst to analyze large datasets', 'Mumbai', 65000.00, 'Full-time', '2024-04-01 11:00:00'),
(104, 4, 'Data Engineer', 'SoftWorks is looking for a software developer to work on cutting-edge projects...', 'Pune', 80000.00, 'Full-time', '2024-04-04 12:00:00'),
(105, 5, 'Tester', 'experience in testing must be 3 years ', 'Chennai', 40000.00, 'Part-time', '2024-04-05 13:00:00'),
(106, 6, 'Manager', 'Looking for Manager with experience of 5 years', 'Bangalore', 100000.00, 'Contract', '2024-04-02 14:00:00'),
(107, 7, 'Data Analyst', ' looking for a data analyst to analyze large data sets', 'Hyderabad', 60000.00, 'Full-time', '2024-04-07 15:00:00'),
(108, 8, 'Java Developer', 'Developer with experience 2-3 years', 'Pune', 35000.00, 'Part-time', '2024-04-08 16:00:00'),
(109, 9, 'Designer', 'Looking for a designer', 'Bangalore', 35000.00, 'Full-time', '2024-04-03 17:00:00'),
(110, 10, 'Tester', 'experience in testing must be 3-4 years', 'Pune', 80000.00, 'Contract', '2024-04-8 18:00:00');
select * from Jobs;

-- Applicants table
Create Table IF NOT EXISTS Applicants (
ApplicantID int Primary Key,
FirstName varchar(20),
LastName varchar(20),
Email varchar(40),
Phone varchar(20),
city varchar(20),
state varchar(20),
experience int,
Resume text
);

Insert Into Applicants (ApplicantID, FirstName, LastName, Email, Phone, city, state, experience, Resume)
Values
(201, 'Sivani', 'Kolla', 'Sivani@gmail.com', '9856745896', 'Tadepalligudem','Andhra', 2 ,' Sivani Is a seasoned software engineer with 2 years of experience'),
(202, 'Joshika', 'Sri', 'Joshika@gmail.com', '9836360258', 'Tadepalligudem','Andhra', 4 , 'Joshika has a background in finance with experience in financial analysis'),
(203, 'Kusuma', 'Vani', 'kusuma@gmail.com', '8520025021', 'Chennai','Tamil nadu', 4 , 'Kusuma is a data analyst with expertise in data analysis'),
(204, 'Likhitha', 'Gannina', 'likitha@gmail.com', '7584659820', 'Chennai','Tamil nadu', 2 , 'Likhitha is a data engineer with experience of 2 years'),
(205, 'Cherish', 'Vuppala', 'cherishvuppala@gmail.com', '7775557001', 'Banglore','Karnataka', 6 , 'Cherish is a developer with experience of 6 years'),
(206, 'Pavani', 'sree', 'pavani@gmail.com', '8788554102', 'Banglore','Karnataka', 6 , 'Pavani has worked as manager for 10 years'),
(207, 'Sahithi', 'Kumari', 'sahithi@gmail.com', '9398097164', 'Tadepalligudem','Andhra', 2 , 'Sahithi is a data analyst skilled in data visualization and statistical analysis'),
(208, 'Abhi', 'Kumar', 'Abhikumar@gmail.com', '9299605412', 'Pune','Maharashtra', 10 , 'Abhi is an developer with knowledge of multiple languages like Java'),
(209, 'Phanindra', 'Mattu', 'Phanindra@gmail.com', '9491865759', 'Pune','Maharashtra', 6 , 'Phanindra has expertise in Designing feild'),
(210, 'Praneetha', 'Varre', 'praneetha@gmail.com', '9299655412', 'Pune','Maharashtra', 4 , 'Praneetha has experience in testing for 4 years');

select * from Applicants;
-- Applications table

Create table IF NOT EXISTS Applications(
ApplicationID int Primary Key,
JobID int,
ApplicantID int,
ApplicationDate DateTime,
CoverLetter text,
Foreign Key(JobID) References Jobs(JobID),
Foreign Key(ApplicantID) References Applicants(ApplicantID)
);

Insert into Applications (ApplicationID, JobID, ApplicantID, ApplicationDate, CoverLetter) 
Values
(301, 101, 201, '2024-04-05 09:30:00', 'Dear Hiring Manager, I am excited to apply for the software developer position '),
(302, 102, 202, '2024-04-06 10:45:00', 'To the Hiring Team, I am writing to express my interest in the financial analyst role'),
(303, 103, 203, '2024-04-07 11:15:00', 'Dear Hiring team, I am writing to submit my application for the data analyst position'),
(304, 104, 204, '2024-04-08 11:30:00', 'Dear Hiring Manager, I am writing to apply for the data engineer position'),
(305, 105, 205, '2024-04-09 13:45:00', 'Dear Hiring Team, I am interested in the Tester position'),
(306, 106, 206, '2024-04-10 14:00:00', 'Dear Hiring Team, I am writing to apply for the manager position at MediCorp...'),
(307, 107, 207, '2024-04-11 15:15:00', 'Dear Hiring Manager, I am writing to express my interest in the data analyst role'),
(308, 108, 208, '2024-04-12 16:30:00', 'Dear Hiring Team, I am excited to apply for the Java Developer position at EduTech Solutions...'),
(309, 109, 209, '2024-04-13 17:45:00', 'Dear Hiring Team, I am writing to submit my application for Designer Role'),
(310, 110, 210, '2024-04-14 18:00:00', 'Dear Hiring Manager, I am writing to apply for the role of tester');

select * from Applications;

Delete from  Applications
Where JobID IN (
    Select j.JobID
    From Jobs j
    JOIN Companies C On j.CompanyID = C.CompanyID
    Where C.Companyname = 'TCS'
);

Delete from  Applications
Where JobID IN (
    Select j.JobID
    From Jobs j
    JOIN Companies C On j.CompanyID = C.CompanyID
    Where C.Companyname = 'Cognizant'
);

-- aggregate
-- 5. . Write an SQL query to count the number of applications received for each job listing in the "Jobs" table. 
-- Display the job title and the corresponding application count. Ensure that it lists all jobs, even if they have no applications.
Select j.JobTitle, count(a.ApplicationId) as Count_Application 
from Jobs j 
Join 
   Applications a 
on a.JobID = j.JobID
group by j.JobTitle;

-- 6.Develop an SQL query that retrieves job listings from the "Jobs" table within a specified salary range. 
-- Allow parameters for the minimum and maximum salary values. Display the job title, company name, location, and salary for each matching job.


Select j.JobTitle,c.CompanyName,j.JobLocation,j.Salary
From Jobs j
Join 
Companies c 
on c.CompanyID = j.CompanyID
Where j.Salary between 40000 And 100000
Order By j.Salary;

-- joins
-- 7. Write an SQL query that retrieves the job application history for a specific applicant. Allow a parameter for the ApplicantID, 
-- and return a result set with the job titles, company names, and application dates for all the jobs the applicant has applied to.

Select a.applicantId, j.JobTitle,C.CompanyName,a.ApplicationDate from Applications a
Join Jobs j ON a.JobID = j.JobID
Join Companies c ON j.CompanyID = c.CompanyID
Where a.ApplicantID = 201;

-- 8.Create an SQL query that calculates and displays the average salary offered by all companies for job listings in the "Jobs" table.
-- Ensure that the query filters out jobs with a salary of zero
Select Avg(Salary) as Avg_Salary from Jobs
Where Salary>0;

-- 9. Write an SQL query to identify the company that has posted the most job listings.
-- Display the company name along with the count of job listings they have posted.
-- Handle ties if multiple companies have the same maximum count.
select COUNT(j.CompanyID) as no_of_jobs, c.Companyname from Companies c
join Jobs j on c.CompanyID=j.CompanyID
group by j.CompanyID,c.Companyname
Order By no_of_jobs desc;

-- 10:Find the applicants who have applied for positions in companies located in 'CityX' and have at least 3 years of experience.
-- sub query
Select FirstName, LastName From Applicants 
Where applicantid IN 
(Select applicantid From applications
Where jobid IN (
Select jobid From jobs where companyid IN 
	(Select companyid From companies where location = 'Bangalore'))
) And experience >= 3;

-- 11:Retrieve a list of distinct job titles with salaries between $70,000 and $80,000.
Select distinct JobTitle,Salary from Jobs
Where Salary Between 70000 and 80000;

-- 12:Find the jobs that have not received any applications.
Select j.JobID, j.JobTitle,app.ApplicationID from Jobs j
Left Join Applications app On j.JobID = app.JobID
Where app.ApplicationID IS NULL;

-- 13:List all applicants along with the companies and positions they have applied for, including those who have not applied.
Select a.FirstName, a.LastName, c.CompanyName, j.JobTitle from  Applicants a
Left join applications ap on a.applicantid = ap.applicantid
left join jobs j on ap.jobid = j.jobid
left join companies c on j.companyid = c.companyid;

-- 14:Retrieve a list of companies along with the count of jobs they have posted, even if they have not received any applications.(A)
Select c.CompanyName, Count(j.JobID) AS JobCount from Companies c
Left Join  Jobs j ON c.CompanyID = j.CompanyID
Group By c.CompanyName;

-- joins
-- 15:. List all applicants along with the companies and positions they have applied for, including those who have not applied.
Select CONCAT(a.FirstName, ' ', a.LastName) AS FullName,c.CompanyName,j.JobTitle
From Applicants a
Left Join Applications ap On ap.ApplicantID=a.ApplicantID
Left Join jobs j On ap.jobid=j.jobid
Left Join companies c On j.companyid=c.companyid 
Order By a.FirstName;

-- 16: Find companies that have posted jobs with a salary higher than the average salary of all jobs
Select c.companyname, j.salary, (Select Avg(salary) From jobs) As avg_salary
From jobs j
Inner Join companies c ON j.companyid = c.CompanyID
Where j.salary > (Select AVG(salary) From jobs);


-- 17:. Display a list of applicants with their names and a concatenated string of their city and state
Select Concat(FirstName,' ',LastName) as AppName,Concat(City,' , ',State) as City_State from Applicants;  

-- 18:Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'
select * from jobs
where jobtitle like '%developer%' or jobtitle like '%engineer%';

-- 19:. Retrieve a list of applicants and the jobs they have applied for, including those who have not applied and jobs without applicants.
select a.firstname, a.lastname, j.jobtitle
from applicants a
left join applications ap on a.applicantid = ap.applicantid
left join jobs j on ap.jobid = j.jobid;

-- 20:List all combinations of applicants and companies where the company is in a specific city and the applicant has more than 2 years of experience. For example: city=Chennai
Select a.FirstName,a.Lastname,a.Experience,c.CompanyName,c.Location from Applicants a
join applications ap on a.applicantid=ap.applicantid
Join jobs j on ap.jobid=j.jobid
join Companies c on j.companyid=c.companyid
where c.location='bangalore' and a.Experience>2;