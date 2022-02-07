create database if not exists diaryManagementSystem;
use diaryManagementSystem;

create table if not exists faculty(staffID int(8), 
title varchar(15), 
status varchar(15), 
tenured varchar(1),
CONSTRAINT pk_faculty_SID PRIMARY KEY(staffID));

create table if not exists staff(staffID int(8), 
staffFirstName varchar(15), 
staffLastName varchar(15),
staffPhoneNumber int(10),
salary int(7),
dateHired int(8),
position varchar(15),
CONSTRAINT pk_staff_SID PRIMARY KEY(staffID));

create table if not exists departments(departmentID int(8),
deptName varchar(45),
deptChair varchar(30),
CONSTRAINT pk_departments_SID PRIMARY KEY(departmentID));

create table if not exists falcultyClasses(staffID int(8),
classID int(8),
subjectID int(8));

create table if not exists subjects(subjectID int(8),
categoryID int(8),
subjectCode varchar(15),
subjectName varchar(15),
subjectPreReq varchar(15), 
subjectDescription varchar(45),
CONSTRAINT pk_subjects_SID PRIMARY KEY(subjectID),
CONSTRAINT fk_categoryID FOREIGN KEY (categoryID) REFERENCES categories(categoryID));

create table if not exists categories(categoryID int(8),
categoryDescription varchar(45),
departmentID int(8),
CONSTRAINT pk_categories_SID PRIMARY KEY(categoryID));

create table if not exists classes(classID int(8), 
subjectID int(8),
classRoomID int(8),
credits int(1),
startDate int(6),
startTime int(4),
duration int(6),
mondaySchedule varchar(45),
tuesdayScheudle varchar(45),
wednesdaySchedule varchar(45),
thursdaySchedule varchar(45),
fridaySchedule varchar(45),
saturdaySchedule varchar(45),
CONSTRAINT pk_class_SID PRIMARY KEY(classID),
CONSTRAINT fk_subjectID FOREIGN KEY (subjectID) REFERENCES categories(subjectID),
CONSTRAINT fk_classRoomID FOREIGN KEY (classRoomID) REFERENCES categories(classRoomID));

create table if not exists classrooms(classRoomID int(8),
buildingCode varchar(8),
phoneAvailable varchar(1),
CONSTRAINT pk_classrooms_SID PRIMARY KEY(classRoomID),
CONSTRAINT fk_buildingCode FOREIGN KEY (buildingCode) REFERENCES categories(buildingCode));

create table if not exists building(buildingCode int(8),
buildingName varchar(45),
numberOfFloors int(2),
elevatorAccess varchar(1),
siteParkingAvailable varchar(1),
CONSTRAINT pk_building_SID PRIMARY KEY(buildingCode));

create table if not exists studentSchedule(classID int(8),
studentID int(8),
classStatus varchar(15),
grade float(4),
CONSTRAINT fk_classStatus FOREIGN KEY (classStatus) REFERENCES categories(classStatus)
);

create table if not exists students(studentID int(8),
studentFirstName varchar(15),
studentLastName varchar(15),
studentPhoneNumber int(10),
studentGPA float(4),
studentMajor varchar(45),
CONSTRAINT pk_students_SID PRIMARY KEY(studentID));

create table if not exists subjectsHaveStudents(subjectID int(8),
studentID int(8),
majorID int(8));

create table if not exists studentClassStatus(categoryID int(8),
categoryDescription varchar(45),
CONSTRAINT pk_studentClassStatus_SID PRIMARY KEY(categoryID));

create table if not exists majors(majorID int(8),
Major varchar(45),
CONSTRAINT pk_majors_SID PRIMARY KEY(majorID));




