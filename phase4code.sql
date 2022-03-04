create database if not exists universityManagement;
use universityManagement;

drop table staff;

create table if not exists staff(staffID char(8), 
staffFirstName varchar(15), 
staffLastName varchar(15),
staffPhoneNumber int(11),
salary int(7),
dateHired datetime(6),
position varchar(20),
CONSTRAINT pk_staff_SID PRIMARY KEY(staffID));

ALTER TABLE staff
MODIFY staffPhoneNumber char(10);

INSERT INTO staff (staffID, staffFirstName, staffLastName, staffPhoneNumber, salary, dateHired, position)
VALUES ("0216659", "Benett", "Beril", "9148885948", 80000, "1996/07/06", "Instructor");

INSERT INTO staff (staffID, staffFirstName, staffLastName, staffPhoneNumber, salary, dateHired, position)
VALUES ("0326598", "Hope", "Jerker", "2035945948", 85000, "1999/02/21", "Professor");

INSERT INTO staff (staffID, staffFirstName, staffLastName, staffPhoneNumber, salary, dateHired, position)
VALUES ("0458894", "Lex", "Long", "2035845948", 75000, "1998/12/22", "Secretary");

INSERT INTO staff (staffID, staffFirstName, staffLastName, staffPhoneNumber, salary, dateHired, position)
VALUES ("0468994", "Racquel", "Hollis", "2055875148", 65000, "2015/10/22", "Secretary");

INSERT INTO staff (staffID, staffFirstName, staffLastName, staffPhoneNumber, salary, dateHired, position)
VALUES ("0469994", "Marju", "Danni", "2059895178", 80500, "2017/12/03", "Professor");

INSERT INTO staff (staffID, staffFirstName, staffLastName, staffPhoneNumber, salary, dateHired, position)
VALUES ("0528464", "Lucretia", "Erika", "2036689457", 80000, "2018/10/22", "Associate Professor");

INSERT INTO staff (staffID, staffFirstName, staffLastName, staffPhoneNumber, salary, dateHired, position)
VALUES ("0648464", "Modesta", "Jonatan", "2098469958", 85000, "2019/12/11", "Professor");

INSERT INTO staff (staffID, staffFirstName, staffLastName, staffPhoneNumber, salary, dateHired, position)
VALUES ("0828164", "Sundar", "Malena", "2994859162", 80000, "2020/01/03",  'Assistant Professor' );

INSERT INTO staff (staffID, staffFirstName, staffLastName, staffPhoneNumber, salary, dateHired, position)
VALUES ("0864761", "Adela", "Euthymius", "9564855574", 75000, "2022/01/15", "Instructor");

INSERT INTO staff (staffID, staffFirstName, staffLastName, staffPhoneNumber, salary, dateHired, position)
VALUES ("0854864", "Zaahir", "Halcyone", "3694581596", 60000, "2021/01/16", "Instructor");

INSERT INTO staff (staffID, staffFirstName, staffLastName, staffPhoneNumber, salary, dateHired, position)
VALUES ("0445678", "Erna", "Hanne", "8895694581", 81000, "1999/09/03", "Associate Professor" );

INSERT INTO staff (staffID, staffFirstName, staffLastName, staffPhoneNumber, salary, dateHired, position)
VALUES ("0554864", "Affan", "Eukleides", "5946581265", 90000 , "2003/05/06", "Professor");

ALTER TABLE staff
ADD dateOfBirth datetime(6);

UPDATE staff 
SET dateOfBirth = CAST('1989/01/22' AS DATETIME)
WHERE staffID = 0216659;

UPDATE staff 
SET dateOfBirth = CAST('1999/03/06' AS DATETIME)
WHERE staffID = 0326598;

UPDATE staff 
SET dateOfBirth = CAST('1966/08/15' AS DATETIME)
WHERE staffID = 0458894;

UPDATE staff 
SET dateOfBirth = CAST('1987/08/11' AS DATETIME)
WHERE staffID = 0468994;

UPDATE staff 
SET dateOfBirth = CAST('1974/07/12' AS DATETIME)
WHERE staffID = 0469994;

UPDATE staff 
SET dateOfBirth = CAST('1980/09/12' AS DATETIME)
WHERE staffID = 0528464;

UPDATE staff 
SET dateOfBirth = CAST('1989/10/02' AS DATETIME)
WHERE staffID = 0648464;

UPDATE staff 
SET dateOfBirth = CAST('1978/07/12' AS DATETIME)
WHERE staffID = 0828164;

UPDATE staff 
SET dateOfBirth = CAST('1994/06/09' AS DATETIME)
WHERE staffID = 0864761;

UPDATE staff 
SET dateOfBirth = CAST('1997/02/06' AS DATETIME)
WHERE staffID = 0854864;

UPDATE staff 
SET dateOfBirth = CAST('1966/12/22' AS DATETIME)
WHERE staffID = 0445678;

UPDATE staff 
SET dateOfBirth = CAST('1969/07/30' AS DATETIME)
WHERE staffID = 0554864;

#Right Join
SELECT faculty.staffID, staff.staffLastName, staff.staffFirstName
FROM faculty
RIGHT JOIN staff ON faculty.staffID = staff.staffID
ORDER BY faculty.staffID;

create table if not exists faculty(staffID char(8), 
title varchar(20), 
status varchar(15),
tenured char(1),
CONSTRAINT pk_faculty_SID PRIMARY KEY(title));

#Does not allow duplicate title entry
INSERT INTO faculty (staffID, title, status, tenured)
VALUES ("0326598", "Professor", "Active", "y");

INSERT INTO faculty (staffID, title, status, tenured)
VALUES ("0216659", "Instructor", "Active", "n");

INSERT INTO faculty (staffID, title, status, tenured)
VALUES ("0469994", "Professor.", "Active", "y");

INSERT INTO faculty (staffID, title, status, tenured)
VALUES ("0445678", "Associate Professor", "Inactive", "n");

INSERT INTO faculty (staffID, title, status, tenured)
VALUES ("0528464", "Associate_Professor", "Active", "n");

INSERT INTO faculty (staffID, title, status, tenured)
VALUES ("0648464", "Professor_", "Active", "n");

INSERT INTO faculty (staffID, title, status, tenured)
VALUES ("0828164", 'Assistant-Professor', 'Active', 'n');

INSERT INTO faculty (staffID, title, status, tenured)
VALUES (0854864, 'Instructor_', 'Active', 'n');

INSERT INTO faculty (staffID, title, status, tenured)
VALUES (0864761, 'Instructor.', 'Inactive', 'n');

INSERT INTO faculty (staffID, title, status, tenured)
VALUES (0554864, 'Prof', 'Active', 'y');

create table if not exists departments(departmentID int(8),
deptName varchar(25),
deptChair varchar(60),
CONSTRAINT pk_departments_SID PRIMARY KEY(departmentID));

#We have only allowed people with the position of professor or associate professor to be dept chairs
INSERT INTO departments (departmentID, deptName, deptChair)
VALUES (10000000, "Astronomy", "Modesta Jonatan");

INSERT INTO departments (departmentID, deptName, deptChair)
VALUES (20000000, "Medicine", "Affan Eukleides");

INSERT INTO departments (departmentID, deptName, deptChair)
VALUES (30000000, "Chemistry", "Marju Danni");

INSERT INTO departments (departmentID, deptName, deptChair)
VALUES (40000000, "Biology", "Hope Jerker");

INSERT INTO departments (departmentID, deptName, deptChair)
VALUES (50000000, "Physics" ,"Lucretia Erika");

INSERT INTO departments (departmentID, deptName, deptChair)
VALUES (60000000, "Psychology", "Erna Hanne");

create table if not exists falcultyClasses(staffID char(8),
classID int(8));

ALTER TABLE falcultyClasses
ADD subjectID varchar(8);

INSERT INTO falcultyClasses (staffID, classID, subjectID)
VALUES ("0216659", 1011, "ASTRO");

INSERT INTO falcultyClasses (staffID, classID, subjectID)
VALUES ("0648464", 1021, "ASTRO");

INSERT INTO falcultyClasses (staffID, classID, subjectID)
VALUES ("0554864", 2021, "MED");

INSERT INTO falcultyClasses (staffID, classID, subjectID)
VALUES ("0854864", 3021, "CHEM");

INSERT INTO falcultyClasses (staffID, classID, subjectID)
VALUES ("0469994", 3022, "CHEM");

INSERT INTO falcultyClasses (staffID, classID, subjectID)
VALUES ("0326598", 4021, "BIO");

INSERT INTO falcultyClasses (staffID, classID, subjectID)
VALUES ("0326598", 4022, "BIO");

INSERT INTO falcultyClasses (staffID, classID, subjectID)
VALUES ("0528464", 5021, "PHYS");

INSERT INTO falcultyClasses (staffID, classID, subjectID)
VALUES ("0445678", 6021, "PSYCH");

INSERT INTO falcultyClasses (staffID, classID, subjectID)
VALUES ("0445678", 6022, "PSYCH");

#Inner Join
SELECT falcultyClasses.subjectID, categories.categoryID
FROM falcultyClasses
INNER JOIN categories ON falcultyClasses.subjectID = categories.subjectID;

create table if not exists categories(categoryID char(8),
subjectID char(8),
categoryDescription varchar(120),
departmentID int(8),											
CONSTRAINT pk_categories_SID PRIMARY KEY(categoryID));

ALTER TABLE categories
MODIFY subjectID char(8);

INSERT INTO categories(categoryID, subjectID, categoryDescription, departmentID)
VALUES("ASTR1265", "ASTRO", "Study of the universe", 10000000);

INSERT INTO categories(categoryID, subjectID, categoryDescription, departmentID)
VALUES("MEDI2294", "MED", "Substance preparation to treat disease", 20000000);

INSERT INTO categories(categoryID, subjectID, categoryDescription, departmentID)
VALUES("CHEM3364", "CHEM", "Properties, composition, and structure of elemental compounds", 30000000);

INSERT INTO categories(categoryID, subjectID, categoryDescription, departmentID)
VALUES("BIOL4489", "BIO", "Living organisms", 40000000);

INSERT INTO categories(categoryID, subjectID, categoryDescription, departmentID)
VALUES("PHYS5591", "PHYS", "Properties of matter and energy", 50000000);

INSERT INTO categories(categoryID, subjectID, categoryDescription, departmentID)
VALUES("PSYC6684", "PSYCH", "Human mind and its functions", 60000000);

create table if not exists subjects(subjectID varchar(8),
categoryID char(8),
subjectCode varchar(15),
subjectName varchar(25),
subjectPreReq varchar(25), 
subjectDescription varchar(120),
CONSTRAINT pk_subjects_SID PRIMARY KEY(subjectID),
CONSTRAINT fk_categoryID FOREIGN KEY (categoryID) REFERENCES categories(categoryID));

INSERT INTO subjects(subjectID, categoryID, subjectCode, subjectName, subjectPreReq, subjectDescription)
VALUES ("ASTRO", "ASTR1265", "10000001", "Astrometry", "N/A", "How celestial bodies are positionsed and move in space");

INSERT INTO subjects(subjectID, categoryID, subjectCode, subjectName, subjectPreReq, subjectDescription)
VALUES ("ASTRO.", "ASTR1265", "10000002", "Planetology", "Astrometry", "How planets form in the solar system including composition and dynamics");

INSERT INTO subjects(subjectID, categoryID, subjectCode, subjectName, subjectPreReq, subjectDescription)
VALUES ("MED", "MEDI2294", "20000001", "Pharmacology", "N/A", "Drug and medication actions");

INSERT INTO subjects(subjectID, categoryID, subjectCode, subjectName, subjectPreReq, subjectDescription)
VALUES ("CHEM", "CHEM3364", "30000001", "Chemical Thermodynamics", "N/A", "The relationship between heat and other forms of chemical energy");

INSERT INTO subjects(subjectID, categoryID, subjectCode, subjectName, subjectPreReq, subjectDescription)
VALUES ("CHEM.", "CHEM3364", "30000002", "Electrochemistry", "Chemical Thermodynamics", "How electricity relates to chemical reactions");

INSERT INTO subjects(subjectID, categoryID, subjectCode, subjectName, subjectPreReq, subjectDescription)
VALUES ("BIO", "BIOL4489", "40000001", "Microbiology", "N/A", "How biology exists in microorganisms");

INSERT INTO subjects(subjectID, categoryID, subjectCode, subjectName, subjectPreReq, subjectDescription)
VALUES ("BIO.", "BIOL4489", "40000002", "Cytology", "Microbiology", "To examine cell types for abnormality");

INSERT INTO subjects(subjectID, categoryID, subjectCode, subjectName, subjectPreReq, subjectDescription)
VALUES ("PHYS", "PHYS5591", "50000001", "Thermodynamics", "N/A", "Energys impact in a system");

INSERT INTO subjects(subjectID, categoryID, subjectCode, subjectName, subjectPreReq, subjectDescription)
VALUES ("PSYCH", "PSYC6684", "60000001", "Psychological Research", "N/A", "Systemic study and analysis of experience and behavior");

INSERT INTO subjects(subjectID, categoryID, subjectCode, subjectName, subjectPreReq, subjectDescription)
VALUES ("PSYCH.", "PSYC6684", "60000002", "Forensic Psychology", "Psychological Research", "Application of research and experimentation through psychological assessment");

create table if not exists classes(classID int(8), 
subjectID varchar(8),
categoryID varchar(8),
classRoomID varchar(8),
credits int(1),
startDate datetime(6),
startTime time(4),
duration varchar(10),
mondaySchedule varchar(45),
tuesdayScheudle varchar(45),
wednesdaySchedule varchar(45),
thursdaySchedule varchar(45),
fridaySchedule varchar(45),										 
saturdaySchedule varchar(45),
CONSTRAINT pk_class_SID PRIMARY KEY(classID),
CONSTRAINT fk_subjectID FOREIGN KEY (subjectID) REFERENCES subjects(subjectID));

INSERT INTO classes(classID, subjectID, categoryID, classRoomID, credits, startDate, startTime, duration, mondaySchedule, tuesdayScheudle, wednesdaySchedule, thursdaySchedule, fridaySchedule, saturdaySchedule)
VALUES (1011, "ASTRO", "ASTR1265", "A4-158", 3, "2022/03/01", "02:30:00", "3 hours", "N/A", "2:30-5:30", "N/A", "N/A", "N/A", "N/A");

INSERT INTO classes(classID, subjectID, categoryID, classRoomID, credits, startDate, startTime, duration, mondaySchedule, tuesdayScheudle, wednesdaySchedule, thursdaySchedule, fridaySchedule, saturdaySchedule)
VALUES (1021, "ASTRO", "ASTR1265", "A3-155", 3, "2022/03/03", "06:30:00", "3 hours", "N/A", "N/A", "N/A", "2:30-5:30", "N/A", "N/A");

INSERT INTO classes(classID, subjectID, categoryID, classRoomID, credits, startDate, startTime, duration, mondaySchedule, tuesdayScheudle, wednesdaySchedule, thursdaySchedule, fridaySchedule, saturdaySchedule)
VALUES (2021, "MED", "MEDI2294", "B1-167", 3, "2022/03/07", "01:30:00", "1 hour", "1:30-2:30", "N/A", "1:30-2:30", "1:30-2:30", "N/A", "N/A");

INSERT INTO classes(classID, subjectID, categoryID, classRoomID, credits, startDate, startTime, duration, mondaySchedule, tuesdayScheudle, wednesdaySchedule, thursdaySchedule, fridaySchedule, saturdaySchedule)
VALUES (3021, "CHEM", "CHEM3364", "C1-122", 3, "2022/03/07", "09:30:00", "1 hour", "9:30-10:30", "N/A", "N/A", "9:30-10:30", "9:30-10:30", "N/A");

INSERT INTO classes(classID, subjectID, categoryID, classRoomID, credits, startDate, startTime, duration, mondaySchedule, tuesdayScheudle, wednesdaySchedule, thursdaySchedule, fridaySchedule, saturdaySchedule)
VALUES (3022, "CHEM", "CHEM3364", "C2-143", 3, "2022/03/08", "12:30:00", "1.5 hours", "N/A", "12:30-2:00", "N/A", "12:30-2:00", "N/A", "N/A");

INSERT INTO classes(classID, subjectID, categoryID, classRoomID, credits, startDate, startTime, duration, mondaySchedule, tuesdayScheudle, wednesdaySchedule, thursdaySchedule, fridaySchedule, saturdaySchedule)
VALUES (4021, "BIO", "BIOL4489", "D1-122", 3, "2022/03/08", "12:30:00", "1.5 hours", "N/A", "12:30-2:00", "N/A", "12:30-2:00", "N/A", "N/A");

INSERT INTO classes(classID, subjectID, categoryID, classRoomID, credits, startDate, startTime, duration, mondaySchedule, tuesdayScheudle, wednesdaySchedule, thursdaySchedule, fridaySchedule, saturdaySchedule)
VALUES (4022, "BIO", "BIOL4489", "D1-156", 3, "2022/03/07", "12:30:00", "1.5 hours", "N/A", "N/A", "12:30-2:00", "N/A", "12:30-2:00", "N/A");

INSERT INTO classes(classID, subjectID, categoryID, classRoomID, credits, startDate, startTime, duration, mondaySchedule, tuesdayScheudle, wednesdaySchedule, thursdaySchedule, fridaySchedule, saturdaySchedule)
VALUES (5021, "PHYS", "PHYS5591", "E1-149", 3, "2022/03/11", "2:00:00", "3 hours", "N/A", "N/A", "N/A", "N/A", "N/A", "2:00-5:00");

INSERT INTO classes(classID, subjectID, categoryID, classRoomID, credits, startDate, startTime, duration, mondaySchedule, tuesdayScheudle, wednesdaySchedule, thursdaySchedule, fridaySchedule, saturdaySchedule)
VALUES (6021, "PSYCH", "PSYC6684", "F1-166", 3, "2022/03/11", "2:00:00", "3 hours", "N/A", "N/A", "2:00-5:00", "N/A", "N/A", "N/A");

INSERT INTO classes(classID, subjectID, categoryID, classRoomID, credits, startDate, startTime, duration, mondaySchedule, tuesdayScheudle, wednesdaySchedule, thursdaySchedule, fridaySchedule, saturdaySchedule)
VALUES (6022, "PSYCH", "PSYC6684", "F1-152", 3, "2022/03/11", "6:30:00", "3 hours", "N/A", "N/A", "6:30-9:30", "N/A", "N/A", "N/A");

#Left Join
select classes.classID, studentSchedule.classStatus
from classes
LEFT JOIN studentSchedule ON classes.classID = studentSchedule.classID
ORDER BY classes.classID;

create table if not exists classrooms(classRoomID varchar(8),
buildingCode varchar(8),
phoneAvailable char(1),
CONSTRAINT pk_classrooms_SID PRIMARY KEY(classRoomID));

INSERT INTO classrooms(classRoomID, buildingCode, phoneAvailable)
VALUES ("A4-158", "AST-A152", "y");

INSERT INTO classrooms(classRoomID, buildingCode, phoneAvailable)
VALUES ("A3-155", "AST-A152", "y");

INSERT INTO classrooms(classRoomID, buildingCode, phoneAvailable)
VALUES ("B1-167", "MED-B295", "n");

INSERT INTO classrooms(classRoomID, buildingCode, phoneAvailable)
VALUES ("C1-122", "CHE-C371", "y");

INSERT INTO classrooms(classRoomID, buildingCode, phoneAvailable)
VALUES ("C2-143", "CHE-C371", "y");

INSERT INTO classrooms(classRoomID, buildingCode, phoneAvailable)
VALUES ("D1-122", "BIO-D465", "n");

INSERT INTO classrooms(classRoomID, buildingCode, phoneAvailable)
VALUES ("D1-156", "BIO-D465", "y");

INSERT INTO classrooms(classRoomID, buildingCode, phoneAvailable)
VALUES ("E1-149", "PHY-E578", "y");

INSERT INTO classrooms(classRoomID, buildingCode, phoneAvailable)
VALUES ("F1-166", "PSY-F699", "n");

INSERT INTO classrooms(classRoomID, buildingCode, phoneAvailable)
VALUES ("F1-152", "PSY-F699", "y");

create table if not exists building(buildingCode int(6),
buildingName varchar(45),
numberOfFloors int(2),
elevatorAccess char(1),
siteParkingAvailable char(1),
CONSTRAINT pk_building_SID PRIMARY KEY(buildingCode));

ALTER TABLE building
MODIFY buildingCode varchar(6);

INSERT INTO building(buildingCode, buildingName, numberOfFloors, elevatorAccess, siteParkingAvailable)
VALUES ("1945-A", "Astronomy Building", 5, "y", "y");

INSERT INTO building(buildingCode, buildingName, numberOfFloors, elevatorAccess, siteParkingAvailable)
VALUES ("2234-B", "Medicine Building", 3, "y", "y");

INSERT INTO building(buildingCode, buildingName, numberOfFloors, elevatorAccess, siteParkingAvailable)
VALUES ("3017-C", "Chemistry Building", 2, "n", "y");

INSERT INTO building(buildingCode, buildingName, numberOfFloors, elevatorAccess, siteParkingAvailable)
VALUES ("4885-D", "Biology Building", 2, "n", "y");

INSERT INTO building(buildingCode, buildingName, numberOfFloors, elevatorAccess, siteParkingAvailable)
VALUES ("5675-E", "Physics Building", 1, "n", "y");

INSERT INTO building(buildingCode, buildingName, numberOfFloors, elevatorAccess, siteParkingAvailable)
VALUES ("6841-F", "Psychology Building", 2, "y", "y");

create table if not exists studentSchedule(classID int(8),
studentID int(8),
classStatus varchar(15),
grade char(4),
CONSTRAINT fk_classID FOREIGN KEY (classID) REFERENCES classes(classID),
CONSTRAINT fk_studentID FOREIGN KEY (studentID) REFERENCES students(studentID));

ALTER TABLE studentSchedule
MODIFY studentID char(8);

INSERT INTO studentSchedule(classID, studentID, classStatus, grade)
VALUES (4021, "0835561", "Active", "N/A");

INSERT INTO studentSchedule(classID, studentID, classStatus, grade)
VALUES (4022, "0815948", "Active", "N/A");

INSERT INTO studentSchedule(classID, studentID, classStatus, grade)
VALUES (3022, "0715849", "Active", "N/A");

INSERT INTO studentSchedule(classID, studentID, classStatus, grade)
VALUES (3022, "08269458", "Active", "N/A");

INSERT INTO studentSchedule(classID, studentID, classStatus, grade)
VALUES (5021, "0835945", "Active", "N/A");

INSERT INTO studentSchedule(classID, studentID, classStatus, grade)
VALUES (5021, "0819481", "Active", "N/A");

INSERT INTO studentSchedule(classID, studentID, classStatus, grade)
VALUES (2021, "0835019", "Active", "N/A");

INSERT INTO studentSchedule(classID, studentID, classStatus, grade)
VALUES (1011, "0835447", "Active", "N/A");

INSERT INTO studentSchedule(classID, studentID, classStatus, grade)
VALUES (5021, "0801594", "Active", "N/A");

INSERT INTO studentSchedule(classID, studentID, classStatus, grade)
VALUES (4022, "0835011", "Active", "N/A");

create table if not exists students(studentID char(8),
studentFirstName varchar(15),
studentLastName varchar(15),
studentPhoneNumber char(10),
studentGPA float(4),
studentMajor varchar(45),
CONSTRAINT pk_students_SID PRIMARY KEY(studentID));

INSERT INTO students(studentID, studentFirstName, studentLastName, studentPhoneNumber, studentGPA, studentMajor)
VALUES ("0835561", "Vikram", "Manlio", "2035694788", 3.445, "Biology");

INSERT INTO students(studentID, studentFirstName, studentLastName, studentPhoneNumber, studentGPA, studentMajor)
VALUES ("0815948", "Sabrina", "Adolf", "2035514975", 3.052, "Biology");

INSERT INTO students(studentID, studentFirstName, studentLastName, studentPhoneNumber, studentGPA, studentMajor)
VALUES ("0715849", "Yiannis", "Melania", "2059436184", 2.997, "Chemistry");

INSERT INTO students(studentID, studentFirstName, studentLastName, studentPhoneNumber, studentGPA, studentMajor)
VALUES ("08269458", "Frankie", "Sabriye", "9148769102", 3.845, "Chemistry");

INSERT INTO students(studentID, studentFirstName, studentLastName, studentPhoneNumber, studentGPA, studentMajor)
VALUES ("0835945", "Laxmi", "Alexis", "2779485125", 3.956, "Physics");

INSERT INTO students(studentID, studentFirstName, studentLastName, studentPhoneNumber, studentGPA, studentMajor)
VALUES ("0819481", "Sindri", "Jolanta", "2016548271", 3.248, "Physics");

INSERT INTO students(studentID, studentFirstName, studentLastName, studentPhoneNumber, studentGPA, studentMajor)
VALUES ("0835019", "Dakarai", "Nida", "6025187956", 3.150, "Medicine");

INSERT INTO students(studentID, studentFirstName, studentLastName, studentPhoneNumber, studentGPA, studentMajor)
VALUES ("0835447", "Magnus", "Marissa", "4587946185", 3.758, "Astronomy");

INSERT INTO students(studentID, studentFirstName, studentLastName, studentPhoneNumber, studentGPA, studentMajor)
VALUES ("0801594", "Marcela", "Slaven", "3518495794", 2.894, "Physics");

INSERT INTO students(studentID, studentFirstName, studentLastName, studentPhoneNumber, studentGPA, studentMajor)
VALUES ("0835011", "Lena", "Cruz", "3152094816", 4.000, "Biology");

create table if not exists subjectsHaveStudents(subjectID varchar(8),
studentID char(8),
majorID int(8),
CONSTRAINT fkstudentID FOREIGN KEY (studentID) REFERENCES students(studentID),
CONSTRAINT fksubjectID FOREIGN KEY (subjectID) REFERENCES subjects(subjectID),
CONSTRAINT fk_majorID FOREIGN KEY (majorID) REFERENCES majors(majorID));

INSERT INTO subjectsHaveStudents (subjectID, studentID, majorID)
VALUES ("BIO" , "0835561", 44958);

INSERT INTO subjectsHaveStudents (subjectID, studentID, majorID)
VALUES ("BIO" , "0815948", 44958);

INSERT INTO subjectsHaveStudents (subjectID, studentID, majorID)
VALUES ("CHEM" , "0715849", 33764);

INSERT INTO subjectsHaveStudents (subjectID, studentID, majorID)
VALUES ("CHEM" , "08269458", 33764);

INSERT INTO subjectsHaveStudents (subjectID, studentID, majorID)
VALUES ("PHYS" , "08269458", 55481);

INSERT INTO subjectsHaveStudents (subjectID, studentID, majorID)
VALUES ("PHYS" , "0835945", 55481);

INSERT INTO subjectsHaveStudents (subjectID, studentID, majorID)
VALUES ("MED" , "0819481", 22481);

#12:50:26	INSERT INTO subjectsHaveStudents (subjectID, studentID, majorID) VALUES ("ASTO" , "0835019", 11650)	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`universitymanagement`.`subjectshavestudents`, CONSTRAINT `fksubjectID` FOREIGN KEY (`subjectID`) REFERENCES `subjects` (`subjectID`))	0.016 sec
INSERT INTO subjectsHaveStudents (subjectID, studentID, majorID)
VALUES ("ASTO" , "0835019", 11650);

INSERT INTO subjectsHaveStudents (subjectID, studentID, majorID)
VALUES ("PHYS" , "0835447", 55481);

INSERT INTO subjectsHaveStudents (subjectID, studentID, majorID)
VALUES ("BIO" , "0801594", 44958);

create table if not exists studentClassStatus(categoryID int(4),
categoryDescription varchar(45),
CONSTRAINT pk_studentClassStatus_SID PRIMARY KEY(categoryID));

INSERT INTO studentClassStatus(categoryID, categoryDescription)
VALUES (1, "Astronomy Category");

INSERT INTO studentClassStatus(categoryID, categoryDescription)
VALUES (2, "Medicine Category");

INSERT INTO studentClassStatus(categoryID, categoryDescription)
VALUES (3, "Chemistry Category");

INSERT INTO studentClassStatus(categoryID, categoryDescription)
VALUES (4, "Biology Category");

INSERT INTO studentClassStatus(categoryID, categoryDescription)
VALUES (5, "Physics Category");

INSERT INTO studentClassStatus(categoryID, categoryDescription)
VALUES (6, "Psychology Category");

create table if not exists majors(majorID int(8),
major varchar(45),
CONSTRAINT pk_majors_SID PRIMARY KEY(majorID));

INSERT INTO majors(majorID, major)
VALUES (11650, "Astronomy");

INSERT INTO majors(majorID, major)
VALUES (22481, "Medicine");

INSERT INTO majors(majorID, major)
VALUES (33764, "Chemistry");

INSERT INTO majors(majorID, major)
VALUES (44958, "Biology");

INSERT INTO majors(majorID, major)
VALUES (55481, "Physics");

INSERT INTO majors(majorID, major)
VALUES (66590, "Psychology");