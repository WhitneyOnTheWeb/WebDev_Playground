
USE Dorknozzle

DROP TABLE Employees
CREATE TABLE Employees
	(EmployeeID int NOT NULL IDENTITY(1,1)
		CONSTRAINT PK_Employees PRIMARY KEY,
	 DepartmentID int NOT NULL,
	 Name nvarchar(50) NOT NULL,
	 Username nvarchar(50) NOT NULL,
	 Password nvarchar(50),
	 Address nvarchar(50),
	 City nvarchar(50),
	 State nvarchar(50),
	 Zip nvarchar(50),
	 HomePhone nvarchar(50),
	 Extension nvarchar(50),
	 MobilePhone nvarchar(50))
INSERT INTO Employees
	(DepartmentID, Name, Username, Password, City, State, MobilePhone)
VALUES('5', 'Ruvalcaba Zak', 'zak', 'zak', 'San Diego', 'CA', '555-555-5551'),
	  ('9', 'Ruvalcaba Jessica', 'jessica', 'jessica', 'San Diego', 'CA', '555-555-5552'),
	  ('6', 'Lindsey Ted', 'ted', 'ted', 'San Diego', 'CA', '555-555-5553'),
	  ('6', 'Shane Weebe', 'shane', 'shane', 'San Diego', 'CA', '555-555-5554'),
	  ('9', 'Levinson David', 'david', 'david', 'San Diego', 'CA', '555-555-5555'),
	  ('1', 'Geoff Kim', 'geoff', 'geoff', 'San Diego', 'CA', '555-555-5556');

DROP TABLE Departments
CREATE TABLE Departments
	(DepartmentID int NOT NULL IDENTITY(1,1)
		CONSTRAINT PK_Departments PRIMARY KEY,
	 Department nvarchar(50) NOT NULL)
INSERT INTO Departments
	(Department)
VALUES ('Accounting'),
	   ('Administration'),
	   ('Business Development'),
	   ('Customer Support'),
	   ('Exeuctive'),
	   ('Engineering'),
	   ('Facilities'),
	   ('IT'),
	   ('Marketing'),
	   ('Operations');

DROP TABLE HelpDesk
CREATE TABLE HelpDesk
	(RequestID int NOT NULL IDENTITY(1,1)
		CONSTRAINT PK_Requests PRIMARY KEY,
	 EmployeeID int NOT NULL,
	 StationNumber int,
	 CategoryID int NOT NULL,
	 SubjectID int NOT NULL,
	 Description nvarchar(50),
	 StatusID int NOT NULL)

DROP TABLE HelpDeskCategories
CREATE TABLE HelpDeskCategories
	(CategoryID int NOT NULL IDENTITY(1,1)
		CONSTRAINT PK_HelpDeskCategories PRIMARY KEY,
	 Category nvarchar(50) NOT NULL)

DROP TABLE HelpDeskSubjects
CREATE TABLE HelpDeskSubjects
	(SubjectID int NOT NULL IDENTITY(1,1)
		CONSTRAINT PK_HelpDeskSubjects PRIMARY KEY,
	 Subject nvarchar(50) NOT NULL)

DROP TABLE HelpDeskStatus
CREATE TABLE HelpDeskStatus
	(StatusID int NOT NULL IDENTITY(1,1)
		CONSTRAINT PK_HelpDeskStatus PRIMARY KEY,
	 Status nvarchar(50) NOT NULL)

