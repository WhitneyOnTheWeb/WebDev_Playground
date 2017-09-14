USE Dorknozzle

ALTER TABLE Employees WITH CHECK ADD CONSTRAINT FK_Employees_Departments
	FOREIGN KEY(DepartmentID) REFERENCES Departments (DepartmentID)
ALTER TABLE HelpDesk WITH CHECK ADD CONSTRAINT FK_HelpDesk_Employees
	FOREIGN KEY(EmployeeID) REFERENCES Employees (EmployeeID)
ALTER TABLE HelpDesk WITH CHECK ADD CONSTRAINT FK_HelpDesk_HelpDeskCategories
	FOREIGN KEY(CategoryID) REFERENCES HelpDeskCategories (CategoryID)
ALTER TABLE HelpDesk WITH CHECK ADD CONSTRAINT FK_HelpDesk_HelpDeskSubjects
	FOREIGN KEY(SubjectID) REFERENCES HelpDeskSubjects (SubjectID)
ALTER TABLE HelpDesk WITH CHECK ADD CONSTRAINT FK_HelpDesk_HelpDeskStatus
	FOREIGN KEY(StatusID) REFERENCES HelpDeskStatus (StatusID)