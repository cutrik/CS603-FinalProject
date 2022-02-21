create database if not exists diaryManagementSystem;
use diaryManagementSystem;

create table if not exists faculty(staffID int(8), 
title varchar(15), 
stat varchar(15), 
tenured char(1),
CONSTRAINT pk_faculty_SID PRIMARY KEY(staffID));

INSERT INTO faculty (staffID, title, stat, tenured)
VALUES (‘0216659’, ‘Instructor’, ‘Activ’, ‘n’);

INSERT INTO faculty (staffID, title, status, tenured)
VALUES (‘0326598’, ‘Professor’, ‘Activ’, ‘y’);

INSERT INTO faculty (staffID, title, status, tenured)
VALUES (‘0445678’, ‘AssociateProfessor’, ‘Inactiv’, ‘n’);

create table if not exists staff(staffID int(8), 
staffFirstName varchar(15), 
staffLastName varchar(15),
staffPhoneNumber int(10),
salary int(7),
dateHired int(8),
position varchar(15),
CONSTRAINT pk_staff_SID PRIMARY KEY(staffID));

INSERT INTO staff (staffID, staffFirstName, staffLastName, staffPhoneNumber, salary, dateHired, position)
VALUES (‘0216659’, ‘Benett’, ‘Beril’, ‘9148885948’, ‘80000’, ‘06071996’, ‘Instructor’);

INSERT INTO staff (staffID, staffFirstName, staffLastName, staffPhoneNumber, salary, dateHired, position)
VALUES (‘0326598’, ‘Hope’, ‘Jerker’, ‘2035945948’, ‘85000’, ‘08121999’, ‘Professor’);

INSERT INTO staff (staffID, staffFirstName, staffLastName, staffPhoneNumber, salary, dateHired, position)
VALUES (‘0458894’, ‘Lex’, ‘Long’, ‘2035845948’, ‘65000’, ‘01222010’, ‘Secretary’);

create table if not exists departments(departmentID int(8),
deptName varchar(45),
deptChair varchar(30),
CONSTRAINT pk_departments_SID PRIMARY KEY(departmentID));

INSERT INTO departments (departmentID, deptName, deptChair)
VALUES (‘50000000’, ‘Biology’, ‘HopeJerker’);

create table if not exists falcultyClasses(staffID int(8),
classID int(8),
subjectID int(8));

INSERT INTO falcultyClasses (staffID, classID, subjectID)
VALUES (‘0216659’, ‘52910000’, ‘52911225’);

INSERT INTO falcultyClasses (staffID, classID, subjectID)
VALUES (‘0326598’, ‘52911226’, ‘52910000’);

create table if not exists subjects(subjectID int(8),
categoryID int(8),
subjectCode varchar(15),
subjectName varchar(15),
subjectPreReq varchar(15), 
subjectDescription varchar(45),
CONSTRAINT pk_subjects_SID PRIMARY KEY(subjectID),
CONSTRAINT fk_categoryID FOREIGN KEY (categoryID) REFERENCES categories(categoryID));

INSERT INTO subjects(subjectID, categoryID, subjectCode, subjectName, subjectPreReq, subjectDescription)
VALUES (‘52910000’, ‘500000022’, ‘BIO’, ‘Cytology’, ‘No’, ‘ToExamineCellTypesForAbnormality’);

create table if not exists categories(categoryID int(8),
categoryDescription varchar(45),
departmentID int(8),											
CONSTRAINT pk_categories_SID PRIMARY KEY(categoryID));

INSERT INTO categories(categoryID, categoryDescription, departmentID)
VALUES(‘500000022’, ‘CellWork, Biology’, ‘50000000’);

create table if not exists classes(classID int(8), 
subjectID int(8),
classRoomID int(8),
credits int(1),
startDate int(6),
startTime int(4),
duration varchar(10),
mondaySchedule varchar(45),
tuesdayScheudle varchar(45),
wednesdaySchedule varchar(45),
thursdaySchedule varchar(45),
fridaySchedule varchar(45),										 
saturdaySchedule varchar(45),
CONSTRAINT pk_class_SID PRIMARY KEY(classID),
CONSTRAINT fk_subjectID FOREIGN KEY (subjectID) REFERENCES categories(subjectID),
CONSTRAINT fk_classRoomID FOREIGN KEY (classRoomID) REFERENCES categories(classRoomID));

INSERT INTO classes(classID, subjectID, classRoomID, credits, startDate, startTime, duration, mondaySchedule, tuesdaySchedule, wednesdaySchedule, thursdaySchedule, fridaySchedule, saturdaySchedule)
VALUES (‘0216659’, ‘52910000’,  ‘00001456’, ‘3’, ‘01032023’, ‘0123’, ‘2300000’, ‘Non’, ‘2-430’, ‘Non’, ‘2-430’, ‘2-430’, ‘Non’);

create table if not exists classrooms(classRoomID int(8),
buildingCode varchar(8),
phoneAvailable char(1),
CONSTRAINT pk_classrooms_SID PRIMARY KEY(classRoomID),
CONSTRAINT fk_buildingCode FOREIGN KEY (buildingCode) REFERENCES categories(buildingCode));

INSERT INTO classrooms(classRoomID, buildingCode, phoneAvailable)
VALUES (‘00001456’, ‘00000515’, ‘y’);

create table if not exists building(buildingCode int(8),
buildingName varchar(45),
numberOfFloors int(2),
elevatorAccess char(1),
siteParkingAvailable char(1),
CONSTRAINT pk_building_SID PRIMARY KEY(buildingCode));

INSERT INTO building(buildingCode, buildingName, numberOfFloors, elevatorAccess, siteParkingAvailable)
VALUES (‘00000515’, ‘BioBuilding’, ‘06’, ‘y’, ‘y’);

create table if not exists studentSchedule(classID int(8),
studentID int(8),
classStatus varchar(15),
grade float(4),
CONSTRAINT fk_classStatus FOREIGN KEY (classStatus) REFERENCES categories(classStatus));

INSERT INTO studentSchedule(classID, studentID, classStatus, grade)
VALUES (‘0216659’, ‘0835561’, ‘Activ’, ‘0000’);

create table if not exists students(studentID int(8),
studentFirstName varchar(15),
studentLastName varchar(15),
studentPhoneNumber int(10),
studentGPA float(4),
studentMajor varchar(45),
CONSTRAINT pk_students_SID PRIMARY KEY(studentID));

INSERT INTO students(studentID, studentFirstName, studentLastName, studentPhoneNumber, studentGPA, studentMajor)
VALUES (‘0835561’, ‘Vikram’, ‘Manlio’, ‘2035694788’, ‘3445’, ‘Biology’);

create table if not exists subjectsHaveStudents(subjectID int(8),
studentID int(8),
majorID int(8));

INSERT INTO subjectsHaveStudents (subjectID, studentID, majorID)
VALUES (‘52910000’, ‘0835561’, ‘55000000’);

create table if not exists studentClassStatus(categoryID int(8),
categoryDescription varchar(45),
CONSTRAINT pk_studentClassStatus_SID PRIMARY KEY(categoryID));

INSERT INTO studentClassStatus(categoryID, categoryDescription)
VALUES (‘500000022’, ‘BiologyCategory’);

create table if not exists majors(majorID int(8),
major varchar(45),
CONSTRAINT pk_majors_SID PRIMARY KEY(majorID));

INSERT INTO majors(majorID, major)
VALUES (‘55000000’, ‘Biochemistry’);
