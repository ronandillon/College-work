Drop Table Lab2Application;
Drop Table Lab2Reference;
Drop Table Lab2Address;
Drop Table Lab2PriorSchool;
Drop Table Lab2Student;

Create Table Lab2Student(
	StudentID integer ,
	StudentName varchar(50),
	Primary Key(StudentID)
);

Create Table Lab2Address(
	StudentID integer,
	Street varchar(100),
	StateID varchar(30),
	ZipCode varchar(7),
	Primary Key(StudentID,Street),
	Foreign Key(StudentID) references Lab2Student(StudentID)
);
Create Table Lab2Reference( 
	ReferenceName varchar(100),
	RefInstitution  varchar(100),
	ReferenceStatement varchar(500),
	Primary Key(ReferenceName,RefInstitution)
);
Create Table Lab2Application(
	App_No integer, 
	App_Year integer,
	StudentID integer,
	ReferenceName varchar(100),
	RefInstitution  varchar(100),
	Primary Key(App_No,App_Year,StudentID),
  Foreign Key(StudentID) references Lab2Student(StudentID),
  Foreign Key(RefInstitution,ReferenceName) references Lab2Reference(RefInstitution,ReferenceName)
);

Create Table Lab2PriorSchool(
	PriorSchoolID integer,
	PriorSchoolAddr varchar(100),
	GPA number(2),
	Primary Key(PriorSchoolID)
);


