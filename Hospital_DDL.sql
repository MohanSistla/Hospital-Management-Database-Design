CREATE TABLE Hospital_Employees(
     Employee_id INT NOT NULL,
     givename Varchar(10) NOT NULL,
     surname Varchar(10) NOT NULL,
     Address Varchar(20),
     Gender Varchar(1),
     email varchar(25),
     PRIMARY KEY(Employee_id)
 );
 
CREATE TABLE DEPARTMENT(
      Dept_ID Varchar(10) NOT NULL,
      Department_name Varchar(10),
      PRIMARY KEY (Dept_ID)
);

CREATE TABLE Doctors(
      Doctor_id INT NOT NULL,
      Employee_id INT NOT NULL,
      Dept_ID Varchar(10),
      Date_of_join DATE,
      Working_hours INT,
      Primary key (Doctor_id),
      Foreign key (Employee_id) references Hospital_Employees (Employee_id),
      Foreign key (Dept_ID) references DEPARTMENT (Dept_ID)
  );
  
DROP table IF EXISTS Doctors;
  
CREATE TABLE ROOMS(
      Room_no Varchar(10) NOT NULL,
      Dept_id Varchar(10) NOT NULL,
      Ward_Name varchar(15) NOT NULL,
      Bed_no INT DEFAULT 0,
      Occupied_no INT DEFAULT 0,
      Primary key ( Room_no,Dept_id,Ward_Name),
      Foreign key (Dept_ID) references DEPARTMENT (Dept_ID)
);
 
CREATE TABLE Patient_Records(
       Patient_ID INT NOT NULL,
       Name Varchar(10) NOT NULL,
       Surname Varchar(10) NOT NULL,
       Date_of_Birth DATE,
       Gender Varchar(8),
       email Varchar(30),
       Medical_Issue Varchar(30) NOT NULL,
       Primary key (Patient_ID)
);

CREATE TABLE Patient_Admission(
       Patient_ID INT NOT NULL,
       Dept_ID Varchar(10) NOT NULL,
       Primary key (Patient_ID,Dept_ID),
       Foreign key (Dept_ID) references DEPARTMENT (Dept_ID)
);

CREATE TABLE Inpatient(
       Patient_ID INT NOT NULL,
       Nurse_incharge varchar(15),
       Stay_days INT NOT NULL,
       Discharge_date DATE,
       primary key (Patient_ID)
);

CREATE TABLE BILL(
       Billno INT NOT NULL,
       Patient_ID INT NOT NULL,
       TotalAmount INT DEFAULT 500,
       Payment_Mode Varchar(15),
       Primary key (Billno),
       Foreign key (Patient_ID) references Patient_Records(Patient_ID)
); 

CREATE TABLE Outpatient(
       Patient_ID INT NOT NULL,
       Prescribed_Medication varchar(60),
       Revisit_Date DATE,
       primary key (Patient_ID)
);

drop table if exists outpatient;

CREATE TABLE DEPARTMENT(
      Dept_ID Varchar(10) NOT NULL,
      Department_name Varchar(30),
      Ward_Name varchar(25) NOT NULL,
      PRIMARY KEY (Dept_ID,Ward_Name)
);

insert into Hospital_Employees values (10001,'Alex','John','221 Baker Street','Male','a.john@gmail.com');
insert into Hospital_Employees values (10002,'Jeff','Corey','112 Latrobe Street Victoria','Male','Jeff_corey@outlook.com');
insert into Hospital_Employees values (10003,'Lisa','Gary','112 Highland Street','Female','Lisa92@hotmail.com');
insert into Hospital_Employees values (10004,'Corey','Anderson','226 Denvert Street Victoria','Male','corey@gmail.com');
insert into Hospital_Employees values (10005,'Mary','Jones','890 Gendry Park Melbourne Victoria','female','mary.jones@gmail.com');
insert into Hospital_Employees values (10006,'Alice','Kane','675 Hans Front Melbourne Victoria','Female','A_kane@outlook.com');
insert into Hospital_Employees values (10007,'Mohan','Vaishnav','432 University Street Melbourne Victoria','Male','m_vaishnav98@hotmail.com'); 
insert into Hospital_Employees values (10008,'Max','Kimbal','098 Jackson Street Southbank','Male','max1994@gmail.com');  
insert into Hospital_Employees values (10009,'Emma','Turing','123 Newell Road Palo Alto','Female','emma_t@hotmail.com');  
insert into Hospital_Employees values (100010,'Sherin','James','723 Building 40 New York','Female','sherinJames@outlook.com'); 
insert into Hospital_Employees values (100011,'Steven','Strange','865 Jeremy Street San Jose','Male','StevenSt@outlook.com');
insert into Hospital_Employees values (100012,'Tony','Godman','908 Kode Street Palo alto','Male','godmantony@hotmail.com');
insert into Hospital_Employees values (100013,'Natasha','Weasley','167 lotus road northbank tasmania','Female','Weasley.Natasha@gmail.com');
insert into Hospital_Employees values (100014,'Nidhi','Mehra','098 Shivam Road Manyata Bangalore','Female','Nidhi.M@outlook.com');
insert into Hospital_Employees values (100015,'Rahul','Malhotra','560 Chandini Chowk Delhi','Male','rahulmalhotra@hotmail.com');


insert into DEPARTMENT values ('ONC','Oncology');
insert into DEPARTMENT values ('ORTO','Orthopedician');
insert into DEPARTMENT values ('OPTO','Opthamology');
insert into DEPARTMENT values ('PAD','Paediatric');
insert into DEPARTMENT values ('GMED','General Medicine');
insert into DEPARTMENT values ('GASENT','Gastroenterology');
insert into DEPARTMENT values ('GSUG','General surgery');
insert into DEPARTMENT values ('GYNE','Gynaecology');
insert into DEPARTMENT values ('HAEM','Haematology');
insert into DEPARTMENT values ('NEURO','Neurology');
insert into DEPARTMENT values ('NEPHRO','Nephrology');
insert into DEPARTMENT values ('OBS','Obstetrics');


insert into Doctors values (59674,10001,'ONC','2016-08-30',50);
insert into Doctors values (89765,10002,'ORTO','2016-01-15',40);
insert into Doctors values (48960,10004,'OPTO','2016-01-15',45);
insert into Doctors values (30684,10005,'PAD','2015-10-20',45);
insert into Doctors values (58472,10006,'GMED','2014-09-14',40);
insert into Doctors values (73957,10008,'GASENT','2012-04-14',45);
insert into Doctors values (39573,10003,'GSUG','2011-04-14',55);
insert into Doctors values (37472,10007,'GYNE','2011-06-23',45);
insert into Doctors values (58934,100011,'HAEM','2009-07-15',40);
insert into Doctors values (93753,100013,'NEURO','2012-06-05',55);
insert into Doctors values (74638,100014,'GSUG','2010-03-12',60);
insert into Doctors values (94032,100015,'NEURO','2011-04-13',60);
insert into Doctors values (48505,100010,'GYNE','2015-07-30',60);


insert into Patient_Records values (88389473489,'Ram','Krishna','1982-09-10','Male','Ram9876@gmail.com','Blood infection');
insert into Patient_Records values (76668844689,'Harry','Potter','1980-05-31','Male','James.Harry@outlook.com','Right hand Fracture');
insert into Patient_Records values (99573895738,'Jean','Gordon','1990-09-06','Female','JeanG@yahoo.com','Eye Infection');
insert into Patient_Records values (45734870355,'Lisa','Kim','1994-05-06','Female','Kimlisa@hotmail.com','Body weakness with fever');
insert into Patient_Records values (53753495003,'Robin','Kane','1998-09-08','Male','kane343@gmail.com','Fever and body pains');
insert into Patient_Records values (58395395373,'Vanessa','Fowler','1992-08-08','Female','VFowler847@outlook.com','Stomach pain with vomitting');
insert into Patient_Records values (55445654131,'Nicholas','Robinsom','1991-07-18','Male','nickrob@yahoo.com','Blood clot in the leg');
insert into Patient_Records values (95748955975,'Nancy','Mendez','1990-02-25','Female','nancymendez@yahoo.com','Pregnancy issue');
insert into Patient_Records values (58457495454,'Randall','Fisher','1980-03-26','Male','randall80@outlook.com','Blood sugar fluctuation');
insert into Patient_Records values (33908347593,'Maria','Thompson','1970-04-10','Female','maria_thompson@hotmail.com','Brain tumor');
insert into Patient_Records values (94539743875,'Norris','Newton','1985-05-11','Male','newton876@yahoo.com','Pain due to kidney stones');
insert into Patient_Records values (45858555456,'Jessica','Pearson','1980-10-11','Female','jessica345@gmail.com','leg injury');
insert into Patient_Records values (35465667893,'Jim','Parson','1972-07-22','Male','jimpars@gmail.com','Hernia in lower abdomen');
insert into Patient_Records values (93758946499,'Patrick','Adams','1970-04-16','Male','p.adams@outlook.com','Blood plasma therapy');
insert into Patient_Records values (43579854300,'Amanda','Paulson','1990-12-23','Female','palson_amanda@outlook.com','Red eye issue');
insert into Patient_Records values (17676774534,'Zoya','Jha','1989-10-09','Female','zh980@outlook.com','Headache with mild cold');

insert into Patient_Admission values (88389473489,'ONC');
insert into Patient_Admission values (76668844689,'ORTO');
insert into Patient_Admission values (99573895738,'OPTO');
insert into Patient_Admission values (45734870355,'PAD');
insert into Patient_Admission values (53753495003,'GMED');
insert into Patient_Admission values (58395395373,'GASENT');
insert into Patient_Admission values (55445654131,'GSUG');
insert into Patient_Admission values (95748955975,'GYNE');
insert into Patient_Admission values (58457495454,'HAEM');
insert into Patient_Admission values (33908347593,'NEURO');
insert into Patient_Admission values (94539743875,'NEPHRO');
insert into Patient_Admission values (45858555456,'OBS');
insert into Patient_Admission values (35465667893,'GSUG');
insert into Patient_Admission values (93758946499,'ONC');
insert into Patient_Admission values (43579854300,'OPTO');
insert into Patient_Admission values (17676774534,'GMED');

insert into Bill values (3243, 88389473489,5000,'Card');
insert into Bill values (5768,76668844689,2000,'Cash');
insert into Bill values (4968,99573895738,1000,'Card');
insert into Bill values (6264,45734870355,800,'Cash');
insert into Bill values (8990,53753495003,800,'Card');
insert into Bill values (3654,58395395373,1500,'Cash');
insert into Bill values (7395,55445654131,10000,'Insurance');
insert into Bill values (5395,95748955975,8000,'Insurance');
insert into Bill values (1980,58457495454,800,'Cash');
insert into Bill values (8979,33908347593,20000,'Insurance');
insert into Bill values (9899,94539743875,12000,'Insurance');
insert into Bill values (9890,45858555456,1000,'Card');
insert into Bill values (1457,35465667893,15000,'Insurance');
insert into Bill values (1857,93758946499,20000,'Insurance');
insert into Bill values (7365,43579854300,1500,'Card');
insert into Bill values (7001,17676774534,900,'Card');

insert into Inpatient values (88389473489,'Norma',7,'2020-08-18');
insert into Inpatient values (76668844689,'Wendy',5,'2020-08-13');
insert into Inpatient values (55445654131,'Lisa',10,'2020-08-21');
insert into Inpatient values (95748955975,'Molly',3,'2020-08-14');
insert into Inpatient values (33908347593,'John',20,'2020-09-01');
insert into Inpatient values (94539743875,'James',6,'2020-08-17');
insert into Inpatient values (35465667893,'Dolly',6,'2020-08-17');
insert into Inpatient values (93758946499,'Rama',8,'2020-08-19');

insert into Outpatient values (99573895738,'Washing the eye and applying eye drops','2020-09-10');
insert into Outpatient ('Patient_ID','Prescribed_Medication') values (45734870355,'Body pains pills and rest');
insert into Outpatient values (53753495003,'Aspirine,Bed rest','2020-08-21');
insert into Outpatient ('Patient_ID','Prescribed_Medication') values (58395395373,'Dietary restriction and pills');
insert into Outpatient values (58457495454,'Insulin Shots','2020-12-12');
insert into Outpatient values (45858555456,'Dialysis each month','2020-10-12');
insert into Outpatient values (43579854300,'Wearing dark shades','2020-10-10');
insert into Outpatient ('Patient_ID','Prescribed_Medication') values (17676774534,'Steam inhalation');

insert into ROOMS values ('1200.01.09','ONC',60,20);
insert into ROOMS values ('1400.09.08','ORTO',50,30);
insert into ROOMS values ('1500.08.07','OPTO',80,80);
insert into ROOMS values ('1400.07.08','PAD',50,25);
insert into ROOMS values ('1659.01.02','GMED',30,30);
insert into ROOMS values ('3856.09.83','GASENT',70,20);
insert into ROOMS values ('45698.32.54','GSUG',80,30);
insert into ROOMS values ('1254.32.98','GYNE',50,10);
insert into ROOMS values ('2563.24.89','HAEM',15,15);
insert into ROOMS values ('9850.32.54','NEURO',50,32);
insert into ROOMS values ('9453.74.10','NEPHRO',40,5);
insert into ROOMS values ('1025.32.69','OBS',20,8);
