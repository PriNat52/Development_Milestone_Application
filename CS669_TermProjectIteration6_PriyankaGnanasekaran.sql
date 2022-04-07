--DROP TABLES
DROP TABLE ACCOUNT; --ACCOUNT TABLE
DROP TABLE NoSibling; --NO_SIBLING TABLE
DROP TABLE SIBLINGS;	--SIBLINGS TABLE
DROP TABLE FORUM;	--FORUM TABLE
DROP TABLE DoctorAppointments;	--DOCTOR_APPOINTMENTS TABLE
DROP TABLE DevelopmentMilestones;	--DEV TABLE
DROP TABLE MILESTONES;	--MILESTONE TABLE
DROP TABLE AgeGrown;	--AGE_GROWN TABLE
DROP TABLE PediatricVaccines;	--PED_VACC TABLE
DROP TABLE VaccineAlerts;	--VACCINE_ALERT TABLE
DROP TABLE PediatricConsultant;	--PED_CONSUTANT TABLE
DROP TABLE TextChat;	--TEXT CHAT TABLE
DROP TABLE VideoChat;	--VIDEO CHAT TABLE
DROP TABLE AppointmentsReference;	--AppointmentsReference TABLE (History Table)

--DROP SEQUENCES
DROP SEQUENCE AccountSeq;
DROP SEQUENCE NoSiblingSeq;
DROP SEQUENCE SiblingsSeq;
DROP SEQUENCE ForumSeq;
DROP SEQUENCE DoctorAppointmentSeq;
DROP SEQUENCE DevelopmentMilestonesSeq;
DROP SEQUENCE MilestonesSeq;
DROP SEQUENCE AgeGrownSeq;
DROP SEQUENCE PediatricVaccinesSeq;
DROP SEQUENCE VaccineAlertsSeq;
DROP SEQUENCE PediatricConsultantSeq;
DROP SEQUENCE TextChatSeq;
DROP SEQUENCE VideoChatSeq;
DROP SEQUENCE ReferenceAppointmentsSeq; --(History Table)

--DROP PROCEDURE
DROP PROCEDURE AddNoSiblingAccount;
go
DROP PROCEDURE SiblingsAccount;
go
DROP PROCEDURE AddDevelopmentAge;
go
DROP PROCEDURE PopulateMilestones;
go
DROP PROCEDURE InsertAgeGrown;
go
Drop procedure InsertPediatricVaccines;
go

--SELECT statements
Select * from Account;
select * from NoSibling;
Select * from SIBLINGS;
select * from PediatricVaccines;
select * from DevelopmentMilestones;
select * from MILESTONES;
select * from Forum;
Select * from AgeGrown;
select * from DoctorAppointments;
select * from AppointmentsReference;
select * from PediatricConsultant;
select * from VaccineAlerts;
select * from VideoChat;

--TABLES
CREATE TABLE ACCOUNT(
AccountID DECIMAL(12) NOT NULL,
firstname VARCHAR(32) NOT NULL,
lastname VARCHAR(32) NOT NULL,
birthDate DATE NOT NULL,
pediatricDocFirstName VARCHAR(32) NOT NULL,
pediatricDocLasttName VARCHAR(32) NOT NULL
PRIMARY KEY(AccountID)); --ACCOUNT TABLE

CREATE TABLE NoSibling(
AccountID DECIMAL(12) NOT NULL,
NAccountID  DECIMAL(12) NOT NULL,
PRIMARY KEY(NAccountID),
FOREIGN KEY (AccountID) REFERENCES Account); --NO_SIBLING TABLE

CREATE TABLE SIBLINGS(
AccountID DECIMAL(12) NOT NULL,
SAccountID  DECIMAL(12) NOT NULL,
SiblingURL VARCHAR(1024) NOT NULL,
PRIMARY KEY(SAccountID),
FOREIGN KEY (AccountID) REFERENCES Account);	--SIBLINGS TABLE

CREATE TABLE FORUM(
ForumID DECIMAL(12) NOT NULL,
AccountID DECIMAL(12) NOT NULL,
title VARCHAR(64) NOT NULL,
content VARCHAR(255) NOT NULL,
summary VARCHAR(13) NOT NULL,
created_on DATE NOT NULL,
PRIMARY KEY(ForumID),
FOREIGN KEY (AccountID) REFERENCES ACCOUNT);	--FORUM TABLE

CREATE TABLE DoctorAppointments(
DoctorAppOintmentID DECIMAL(12) NOT NULL,
AccountID DECIMAL(12) NOT NULL,
title VARCHAR(64) NOT NULL,
created_on DATE NOT NULL,
appointment_date DATE NOT NULL,
PRIMARY KEY (DoctorAppointmentID),
FOREIGN KEY (AccountID) REFERENCES ACCOUNT);	--DOCTOR_APPOINTMENTS TABLE

CREATE TABLE AppointmentsReference(
ReferenceAppointmentID DECIMAL(12) NOT NULL,
DoctorAppOintmentID DECIMAL(12) NOT NULL,
Old_Appt_date DATE NOT NULL,
New_Appt_date DATE NOT NULL,
change_created_on DATE NOT NULL,
PRIMARY KEY (ReferenceAppointmentID),
FOREIGN KEY (DoctorAppOintmentID) REFERENCES DoctorAppointments);	--AppointmentsReference TABLE(History Table)

select * from AppointmentsReference;

CREATE TABLE MILESTONES(
MilestoneID DECIMAL(12) NOT NULL,
age DECIMAL(12) NOT NULL,
CognitiveURL VARCHAR(1024) NOT NULL,
PhysicalURL VARCHAR(1024) NOT NULL,
EmotionalURL VARCHAR(1024) NOT NULL,
LanguageURL VARCHAR(1024) NOT NULL,
PRIMARY KEY(MilestoneID));	--MILESTONE TABLE

CREATE TABLE DevelopmentMilestones(
DevelopmentID DECIMAL(12) NOT NULL,
age DECIMAL(12) NOT NULL,
MilestoneID DECIMAL(12) NOT NULL,
PRIMARY KEY(DevelopmentID),
FOREIGN KEY (MilestoneID) REFERENCES MILESTONES);	--DEV TABLE

CREATE TABLE AgeGrown(
GrownID DECIMAL(12) NOT NULL,
AccountId DECIMAL(12) NOT NULL,
DevelopmentID DECIMAL(12) NOT NULL,
name VARCHAR(32) NOT NULL,
PRIMARY KEY(GrownID),
FOREIGN KEY (AccountId) REFERENCES Account,
FOREIGN KEY (DevelopmentID) REFERENCES DevelopmentMilestones);	--AGE_GROWN TABLE

CREATE TABLE PediatricConsultant(
PediatricID DECIMAL(12) NOT NULL,
title VARCHAR(32) NOT NULL,
created_on DATE NOT NULL,
consulting_appointment DATE NOT NULL,
PRIMARY KEY(PediatricID));	--PED_CONSUTANT TABLE

CREATE TABLE TextChat(
PediatricID DECIMAL(12) NOT NULL,
TextID DECIMAL(12) NOT NULL,
content VARCHAR(255) NOT NULL,
summary VARCHAR(13) NOT NULL,
created_on DATE NOT NULL,
PRIMARY KEY (TextID),
FOREIGN KEY (PediatricID) REFERENCES PediatricConsultant);	--TEXT CHAT TABLE

CREATE TABLE VideoChat(
PediatricID DECIMAL(12) NOT NULL,
VideoId DECIMAL(12) NOT NULL,
VideoURL VARCHAR(1024) NOT NULL,
PRIMARY KEY (VideoID),
FOREIGN KEY (PediatricID) REFERENCES PediatricConsultant);	--VIDEO CHAT TABLE

CREATE TABLE VaccineAlerts(
VaccineID DECIMAL(12) NOT NULL,
vaccine_name VARCHAR(64) NOT NULL,
content VARCHAR(255) NOT NULL,
vaccineURL VARCHAR(1024) NOT NULL,
PRIMARY KEY(VaccineID));	--VACCINE_ALERT TABLE

CREATE TABLE PediatricVaccines(
PVID DECIMAL(12) NOT NULL,
AccountId DECIMAL(12) NOT NULL,
VaccineId DECIMAL(12) NOT NULL,
PediatricID DECIMAL(12) NOT NULL,
name VARCHAR(32) NOT NULL,
age DECIMAL(12) NOT NULL,
PRIMARY KEY(PVID),
FOREIGN KEY (AccountId) REFERENCES Account,
FOREIGN KEY (VaccineId) REFERENCES VaccineAlerts,
FOREIGN KEY (PediatricID) REFERENCES PediatricConsultant);	--PED_VACC TABLE

--SEQUENCES
CREATE SEQUENCE AccountSeq START WITH 1;
CREATE SEQUENCE NoSiblingSeq START WITH 1;
CREATE SEQUENCE SiblingsSeq START WITH 1;
CREATE SEQUENCE ForumSeq START WITH 1;
CREATE SEQUENCE DoctorAppointmentSeq START WITH 1;
CREATE SEQUENCE DevelopmentMilestonesSeq START WITH 1;
CREATE SEQUENCE MilestonesSeq START WITH 1;
CREATE SEQUENCE AgeGrownSeq START WITH 1;
CREATE SEQUENCE PediatricVaccinesSeq START WITH 1;
CREATE SEQUENCE VaccineAlertsSeq START WITH 1;
CREATE SEQUENCE PediatricConsultantSeq START WITH 1;
CREATE SEQUENCE TextChatSeq START WITH 1;
CREATE SEQUENCE VideoChatSeq START WITH 1;
CREATE SEQUENCE ReferenceAppointmentsSeq START WITH 1;

--INDEXES
CREATE INDEX BirthDateIdx
ON Account(birthDate);

CREATE INDEX AgeDevIdx
ON DevelopmentMilestones(age);

CREATE INDEX AgeMilestoneIdx
ON Milestones(age);

CREATE INDEX TitleForumIdx
ON Forum(title);

CREATE INDEX NameVaccineIdx
ON PediatricVaccines(name);

--STORED PROCEDURES
--Adding Account for only child
CREATE PROCEDURE AddNoSiblingAccounts 
	@firstname VARCHAR(32),
	@lastname VARCHAR(32), @birthDate DATE, @pediatricDocFirstName VARCHAR(32), @pediatricDocLasttName VARCHAR(32)
AS
BEGIN
DECLARE @AccountID INT = NEXT value for AccountSeq;

	INSERT INTO Account(AccountID,firstname,lastname,birthDate, pediatricDocFirstName, pediatricDocLasttName)
	VALUES(@AccountID, @firstname, @lastname, @birthDate, @pediatricDocFirstName, @pediatricDocLasttName);

	INSERT INTO NoSibling(AccountID, NAccountID)
	VALUES(@AccountID, NEXT value for NoSiblingSeq );
END;
go

BEGIN Transaction  AddNoSiblingAccounts;
EXECUTE  AddNoSiblingAccounts'Raz','Joy', '01-JAN-2020', 'Didi','Roy';
EXECUTE  AddNoSiblingAccounts'Maya','Muyar', '09-MAY-2021', 'Mat','Das';
EXECUTE  AddNoSiblingAccounts'Anaya','Shah', '18-Mar-2021', 'Kate','Fishman';
EXECUTE  AddNoSiblingAccounts'Sabari','Malik', '21-Apr-2019', 'Didi','Roy';
COMMIT Transaction  AddNoSiblingAccounts;

--Adding Account with Siblings
CREATE PROCEDURE SiblingsAccount 
	@firstname VARCHAR(32),
	@lastname VARCHAR(32), @birthDate DATE, @pediatricDocFirstName VARCHAR(32), @pediatricDocLasttName VARCHAR(32),  @SiblingURL VARCHAR(1024)
AS
BEGIN
DECLARE @AccountID INT = NEXT value for AccountSeq;

	INSERT INTO Account(AccountID,firstname,lastname,birthDate, pediatricDocFirstName, pediatricDocLasttName)
	VALUES(@AccountID, @firstname, @lastname, @birthDate, @pediatricDocFirstName, @pediatricDocLasttName);

	INSERT INTO SIBLINGS(AccountID, SAccountID, SiblingURL)
	VALUES(@AccountID, NEXT value for SiblingsSeq, @SiblingURL);
END;
go

BEGIN Transaction  SiblingsAccount;
EXECUTE  SiblingsAccount 'Lawson','Lu', '01-JUL-2015', 'DiDi','Roy', 'https://xxx.nobi';
EXECUTE  SiblingsAccount 'Nobi','Lu', '12-FEB-2019', 'Sandra','Maj', 'https://xxx.lawson';
EXECUTE  SiblingsAccount 'Mark','Nilla', '24-Mar-2021', 'Rachael','Ducker', 'https://xxx.anu';
EXECUTE  SiblingsAccount 'Anu','Nilla', '24-Mar-2021', 'Rachael','Ducker', 'https://xxx.mark';
COMMIT Transaction SiblingsAccount;

--Populating Milestones
CREATE PROCEDURE PopulateMilestones 
	@cognitive VARCHAR(255), @physical VARCHAR(255), @emotional VARCHAR(255), @language VARCHAR(255)
AS
BEGIN
DECLARE @Counter INT 

SET @Counter=0

	WHILE ( @Counter <= 10)
	BEGIN
		INSERT INTO MILESTONES(MilestoneID, Age,CognitiveURL, PhysicalURL, EmotionalURL, LanguageURL)
		VALUES(NEXT VALUE FOR MilestonesSeq, @Counter, @cognitive, @physical, @emotional, @language);
		SET @Counter  = @Counter  + 1
	END
END;
go

BEGIN Transaction  PopulateMilestones;
EXECUTE  PopulateMilestones 'https://xxx.cognitive', 'https://xxx.physical', 'https://xxx.emotional', 'https://xxx.language';
COMMIT Transaction PopulateMilestones;

--Adding Development Milestone with age filter
CREATE PROCEDURE AddDevelopmentAge 
	@birthDate DATE
AS
BEGIN
DECLARE @DevelopmentID INT = NEXT value for DevelopmentMilestonesSeq;
DECLARE @v_age DECIMAL(12);

SET @v_age = DATEDIFF(month,@birthDate,GETDATE())

	INSERT INTO DevelopmentMilestones(DevelopmentID,Age,MilestoneID)
	VALUES(@DevelopmentID,@v_age, (select MilestoneID from MILESTONES where age =(DATEDIFF(month,@birthDate,GETDATE())/12)));

END;
go

BEGIN Transaction  AddDevelopmentAge;
EXECUTE  AddDevelopmentAge '01-JAN-2020';
EXECUTE  AddDevelopmentAge '09-MAY-2021';
EXECUTE  AddDevelopmentAge '18-Mar-2021';
EXECUTE  AddDevelopmentAge '21-Apr-2019';
EXECUTE  AddDevelopmentAge '01-JUL-2015';
EXECUTE  AddDevelopmentAge '12-FEB-2019';
EXECUTE  AddDevelopmentAge '24-Mar-2021';
EXECUTE  AddDevelopmentAge '24-Mar-2021';
COMMIT Transaction AddDevelopmentAge;

-- Populating Age Grown
CREATE PROCEDURE InsertAgeGrown 
AS
BEGIN
DECLARE @Counter INT 
SET @Counter=1

	WHILE ( @Counter <= 10)
	BEGIN
	DECLARE @GrownID INT;
	SET @GrownID = NEXT value for AgeGrownSeq;
	INSERT INTO AgeGrown(GrownID,AccountId,DevelopmentID,name)
	VALUES(@GrownID,
		(select AccountId from Account where AccountID = @GrownID),
		(select DevelopmentID from DevelopmentMilestones where DevelopmentID = @GrownID),
		(select CONCAT(firstname,' ',lastname) from Account where AccountID = @GrownID));
		SET @Counter  = @Counter  + 1;
	END;
END;
go

BEGIN Transaction  InsertAgeGrown;
EXECUTE  InsertAgeGrown;
COMMIT Transaction InsertAgeGrown;

-- Insert records into Pediatric-Vaccines 
CREATE PROCEDURE InsertPediatricVaccines
AS
BEGIN
DECLARE @Counter INT 
SET @Counter=1

	WHILE ( @Counter <= 6)
	BEGIN
	DECLARE @PVID INT;
	SET @PVID = NEXT value for PediatricVaccinesSeq;
	DECLARE @age DATE;
	SET @age = (select birthDate from ACCOUNT where AccountID = @PVID);
	INSERT INTO PediatricVaccines(PVID,AccountId,VaccineId,PediatricID,name,age)
	VALUES(@PVID,
		(select AccountId from Account where AccountID = @PVID),
		(select VaccineID from VaccineAlerts where VaccineID = @PVID),
		(select PediatricID from PediatricConsultant where PediatricID = @PVID),
		(select CONCAT(firstname,' ',lastname) from Account where AccountID = @PVID),
		DATEDIFF(month,@age,GETDATE()));
		SET @Counter  = @Counter  + 1;
	END;
END;
go

BEGIN Transaction  InsertPediatricVaccines;
EXECUTE  InsertPediatricVaccines;
COMMIT Transaction InsertPediatricVaccines;

--INSERTS
INSERT INTO Forum VALUES(NEXT VALUE FOR ForumSeq, 1, 'Baby Formulas','My baby favorite formula is', 'Fav Formula', '02-JUL-2020');
INSERT INTO Forum VALUES(NEXT VALUE FOR ForumSeq, 3, 'Allergies','Nut Allergy', 'Symptoms', '02-MAR-2022');
INSERT INTO Forum VALUES(NEXT VALUE FOR ForumSeq, 5, 'Allergies','Milk Allergy', 'Home Remedy', '02-MAR-2018');
INSERT INTO Forum VALUES(NEXT VALUE FOR ForumSeq, 8, 'Growth','How to grow tall', 'Healthy Veges', '22-DEC-2021');

INSERT INTO DoctorAppointments VALUES( NEXT VALUE FOR DoctorAppointmentSeq, 1, 'Yearly check up', '04-Apr-2020','04-Jan-2021');
INSERT INTO DoctorAppointments VALUES( NEXT VALUE FOR DoctorAppointmentSeq, 2, 'Weight follow up', '13-AUG-2021','24-Oct-2021');
INSERT INTO DoctorAppointments VALUES( NEXT VALUE FOR DoctorAppointmentSeq, 3, 'Yearly check up', '24-Apr-2021','18-Mar-2022');
INSERT INTO DoctorAppointments VALUES( NEXT VALUE FOR DoctorAppointmentSeq, 4, 'Weight follow up', '13-AUG-2019','21-Apr-2020');
INSERT INTO DoctorAppointments VALUES( NEXT VALUE FOR DoctorAppointmentSeq, 7, 'Yearly check up', '04-Apr-2020','24-Mar-2022');
INSERT INTO DoctorAppointments VALUES( NEXT VALUE FOR DoctorAppointmentSeq, 6, 'Weight follow up', '03-May-2020','24-JUN-2020');

INSERT INTO PediatricConsultant VALUES(NEXT VALUE FOR PediatricConsultantSeq,'Remedy for Allergy', '12-May-2020','15-JUN-2020');
INSERT INTO PediatricConsultant VALUES(NEXT VALUE FOR PediatricConsultantSeq,'Symptoms', '12-Jan-2021','24-JAN-2021');
INSERT INTO PediatricConsultant VALUES(NEXT VALUE FOR PediatricConsultantSeq,'Diaper Rash', '05-FEB-2020','24-Feb-2020');
INSERT INTO PediatricConsultant VALUES(NEXT VALUE FOR PediatricConsultantSeq,'Flu Symptoms', '12-Jul-2021','24-sep-2021');
INSERT INTO PediatricConsultant VALUES(NEXT VALUE FOR PediatricConsultantSeq,'Rashes & cuts', '02-jun-2020','26-jan-2021');
INSERT INTO PediatricConsultant VALUES(NEXT VALUE FOR PediatricConsultantSeq,'Allergies & coughs', '14-sep-2020','19-may-2021');

INSERT INTO TextChat VALUES(1, NEXT VALUE FOR TextChatSeq, 'Remedies', 'Home Made','12-May-2021' );
INSERT INTO TextChat VALUES(2, NEXT VALUE FOR TextChatSeq, 'Symptoms', 'Open air','03-Dec-2021' );
INSERT INTO TextChat VALUES(3, NEXT VALUE FOR TextChatSeq, 'Diaper Rash', 'Recommends','24-Jan-2022' );
INSERT INTO TextChat VALUES(4, NEXT VALUE FOR TextChatSeq, 'Flu Symptoms', 'To do List','08-Jan-2020' );
INSERT INTO TextChat VALUES(6, NEXT VALUE FOR TextChatSeq, 'Rashes', 'Actions Req','17-Apr-2020' );
INSERT INTO TextChat VALUES(5, NEXT VALUE FOR TextChatSeq, 'Allergies', 'Blood tests','12-Feb-2022' );

INSERT INTO VideoChat VALUES(1, NEXT VALUE FOR VideoChatSeq, 'https://xxx.join/1');
INSERT INTO VideoChat VALUES(2, NEXT VALUE FOR VideoChatSeq, 'https://xxx.join/2');
INSERT INTO VideoChat VALUES(3, NEXT VALUE FOR VideoChatSeq, 'https://xxx.join/3');
INSERT INTO VideoChat VALUES(4, NEXT VALUE FOR VideoChatSeq, 'https://xxx.join/4');
INSERT INTO VideoChat VALUES(5, NEXT VALUE FOR VideoChatSeq, 'https://xxx.join/5');
INSERT INTO VideoChat VALUES(6, NEXT VALUE FOR VideoChatSeq, 'https://xxx.join/6');

INSERT INTO VaccineAlerts VALUES(NEXT VALUE FOR VaccineAlertsSeq, 'Flu Shot', 'Yearly Shot', 'https://xxx.flushots');
INSERT INTO VaccineAlerts VALUES(NEXT VALUE FOR VaccineAlertsSeq, 'Polio', 'three doses', 'https://xxx.polio');
INSERT INTO VaccineAlerts VALUES(NEXT VALUE FOR VaccineAlertsSeq, 'DTaP', 'four doses needed', 'https://xxx.DTaP');
INSERT INTO VaccineAlerts VALUES(NEXT VALUE FOR VaccineAlertsSeq, 'Hib', 'three or four doses', 'https://xxx.Hib');
INSERT INTO VaccineAlerts VALUES(NEXT VALUE FOR VaccineAlertsSeq, 'MMR', 'one dose', 'https://xxx.MMR');
INSERT INTO VaccineAlerts VALUES(NEXT VALUE FOR VaccineAlertsSeq, 'IPV', 'three doses needed', 'https://xxx.IPV');
INSERT INTO VaccineAlerts VALUES(NEXT VALUE FOR VaccineAlertsSeq, 'Chickpox', 'two doses', 'https://xxx.IPV');
INSERT INTO VaccineAlerts VALUES(NEXT VALUE FOR VaccineAlertsSeq, 'Influenza', 'every year', 'https://xxx.IPV');

--TRIGGERS
select * from DoctorAppointments;
select * from AppointmentsReference;
CREATE OR ALTER TRIGGER ApptsReferenceTrigger
ON DoctorAppointments
AFTER UPDATE
AS 
BEGIN 
	DECLARE @OldApptDate DATE = (SELECT appointment_date from DELETED);
	DECLARE @NewApptDate DATE = (SELECT appointment_date from INSERTED);

	IF (@OldApptDate <> @NewApptDate)
		INSERT INTO AppointmentsReference
		(ReferenceAppointmentID, DoctorAppOintmentID, Old_Appt_date, New_Appt_date, change_created_on)
		VALUES(NEXT VALUE FOR ReferenceAppointmentsSeq,
		(SELECT DoctorAppOintmentID from INSERTED),
		@OldApptDate,
		@NewApptDate,
		GETDATE());
END;

UPDATE DoctorAppointments
SET appointment_date = '02-AUG-2020'
WHERE DoctorAppOintmentID = 6;

UPDATE DoctorAppointments
SET appointment_date = '28-DEC-2020'
WHERE DoctorAppOintmentID = 6;

UPDATE DoctorAppointments
SET appointment_date = '10-May-2020'
WHERE DoctorAppOintmentID = 4;

UPDATE DoctorAppointments
SET appointment_date = '30-JUN-2020'
WHERE DoctorAppOintmentID = 4;

select * from AppointmentsReference;
--QUERIES
/*
--Query 1:
--How many Account holders have used forum, what is the topic discussed and 
--give the development details for the member?
-- Tables used -- > Account, Forum, Development Miletones and Age grown
*/
Select AgeGrown.name As Account_Name , 
		birthDate as Date_of_Birth, 
		CONCAT('Dr.',pediatricDocFirstName,' ',pediatricDocLasttName) AS Doctor_Name,
		Forum.title As Title_Discussed, DevelopmentMilestones.age As Age_In_Months
FROM Account
JOIN Forum On Forum.AccountID = ACCOUNT.AccountID
JOIN AgeGrown On AgeGrown.AccountID = ACCOUNT.AccountID
JOIN DevelopmentMilestones On DevelopmentMilestones.DevelopmentID = ACCOUNT.AccountID
ORDER BY AgeGrown.name;

--Query 2:
--Super types and Sub types
-- Are account holders connected with their pediatrician and their sibling accounts?
Select NoSibling.AccountID ,CONCAT(firstname, lastname) As Account_Name, 
	SIBLINGS.SiblingURL AS Link_to_Siblings, 
	CONCAT('Dr.',pediatricDocFirstName,' ',pediatricDocLasttName) AS Doctor_Name,
	PediatricVaccines.age As Age_In_Months, 
	PediatricConsultant.title as Title_Discussed
FROM ACCOUNT
FULL JOIN NoSibling On NoSibling.AccountID = ACCOUNT.AccountID
FULL JOIN SIBLINGS On SIBLINGS.AccountID = ACCOUNT.AccountID
JOIN PediatricVaccines On PediatricVaccines.AccountId = ACCOUNT.AccountID
JOIN PediatricConsultant On PediatricConsultant.PediatricID = PediatricVaccines.PediatricID
ORDER BY pediatricDocFirstName;

--Query 3:
-- USe where with condition and order by
--Filter records of children ages b/w 25 and 36 month old? What are their develeopment milestones?
Select CONCAT(firstname, lastname) As Account_Name, MILESTONES.age As Age_In_Years,
	CONCAT('Dr.',pediatricDocFirstName,' ',pediatricDocLasttName) AS Doctor_Name,  
	CognitiveURL, 
	PhysicalURL, 
	EmotionalURL, 
	LanguageURL
From ACCOUNT
join AgeGrown on AgeGrown.AccountId = ACCOUNT.AccountID
join DevelopmentMilestones on DevelopmentMilestones.DevelopmentID = AgeGrown.AccountId
join MILESTONES on MILESTONES.MilestoneID = DevelopmentMilestones.MilestoneID
where DevelopmentMilestones.age BETWEEN 25 AND 36
order by DevelopmentMilestones.age;

--Query 4: (History Table)
--How many updated appointments have been booked in a year?
SELECT CASE
		WHEN  DATEDIFF(month,'01-Jan-2020',AppointmentsReference.New_Appt_date) <= 5 THEN 'Before May'
		WHEN DATEDIFF(month,'01-Jan-2020',AppointmentsReference.New_Appt_date) >= 5 
			AND 
			DATEDIFF(month,'01-Jan-2020',AppointmentsReference.New_Appt_date) <= 7 THEN 'May-July'
		Else 'After July'
		END as Conditions,
		COUNT(*) AS No_Of_Appoitments
From DoctorAppointments
JOIN AppointmentsReference On AppointmentsReference.DoctorAppOintmentID = DoctorAppointments.DoctorAppOintmentID
GROUP BY CASE
		WHEN DATEDIFF(month,'01-Jan-2020',AppointmentsReference.New_Appt_date) <= 5 THEN 'Before May'
		WHEN DATEDIFF(month,'01-Jan-2020',AppointmentsReference.New_Appt_date) >= 5 
			AND 
			DATEDIFF(month,'01-Jan-2020',AppointmentsReference.New_Appt_date) <= 7 THEN 'May-July'
		Else 'After July'
END

Select * 
From DoctorAppointments
JOIN AppointmentsReference On AppointmentsReference.DoctorAppOintmentID = DoctorAppointments.DoctorAppOintmentID;

--Query 5: (History Table)
--Average Month difference between Old appointment date and new appointment date?
select Avg(DATEDIFF(month,Old_Appt_date,GETDATE())- DATEDIFF(month,New_Appt_date,GETDATE())) 
		as Average_difference
from AppointmentsReference;

--Data Visualization
-- Which majority age groups that popularly uses our application?
select case
	when DATEDIFF(year,birthDate,GETDATE()) <= 2 then 'Infant & Todders'
	when DATEDIFF(year,birthDate,GETDATE()) > 2 AND DATEDIFF(year,birthDate,GETDATE()) <= 5 then 'Pre Schoolers'
	else 'Five years and Above'
	END as Age_Conditions,
	COUNT(*) AS Number_of_Ages
from account
GROUP BY CASE
	when DATEDIFF(year,birthDate,GETDATE()) <= 2 then 'Infant & Todders'
	when DATEDIFF(year,birthDate,GETDATE()) > 2 AND DATEDIFF(year,birthDate,GETDATE()) <= 5 then 'Pre Schoolers'
	else 'Five years and Above'
END;
