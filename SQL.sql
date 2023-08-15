create database employee_management;
USE employee_management;
CREATE TABLE Department (
  Department_id INT NOT NULL AUTO_INCREMENT,
  Department_name VARCHAR(225) NOT NULL,
  HOD_Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Department_id)
);

CREATE TABLE Employee (
  Employee_id INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(255) NOT NULL,
  DoB DATE NOT NULL,
  Age INT NOT NULL,
  Salary DECIMAL(10,2) NOT NULL,
  Department_id INT NOT NULL,
  PRIMARY KEY (Employee_id),
  FOREIGN KEY (Department_id) REFERENCES Department(Department_id)
);
SHOW TABLES;

DESCRIBE employee;
DESCRIBE department;

insert into department (department_name,HOD_Name) values 
('Sales','Sravya'),('HR','Gayathri'),
('IT','Sravika'),('Marketing','Deepika');
select*from department;

INSERT INTO Employee(Name,DoB,Salary,Department_id,Age)
 VALUES ('Mahithi','2000-12-25',50000,1,23),
 ('Bhavani','2000-12-20',50000,1,32),
 ('Shravika','1999-12-20',45000,1,25),
 ('Deepthi','2002-06-12',45000,1,43),
 ('Bhavani','2000-09-14',55000,1,29),
 ('Vennala','1990-06-12',45000,2,34),
 ('Gayathri','2002-06-30',75000,2,33),
 ('Anand','1995-07-25',60000,2,34),
 ('Shayaan','1999-12-30',50000,2,35),
 ('Bhargav','1997-01-01',45000,2,34),
 ('Shravi','1998-08-14',35000,3,23),
 ('Raghav','1997-09-30',45000,3,28),
 ('Shyam','1992-07-12',35000,3,30),
 ('Sanjay','2000-09-28',65000,3,39),
 ('Monika','1990-03-30',40000,3,28),
 ('Swapna','1995-05-26',45000,4,34),
 ('Harika','1990-09-29',25000,4,33),
 ('Sandhya','1998-05-30',45000,4,27),
 ('Sahasra','2002-01-25',70000,4,56),
 ('Kavitha','2000-07-28',40000,4,30);
 select*from employee;

select department_name , avg(Salary) as avgsal
 from department join employee 
 using (department_id)
 group by department_name;
 
 select de.HOD_Name ,em.Salary from department de
join employee em
where de.HOD_Name=em.Name
group by em.Salary,de.HOD_Name
having (em.Salary)>= avg(em.Salary)
order by avg(em.Salary)desc;


select d.Department_id,d.HOD_Name,e.Age,avg(e.Age),
(case when e.Age >= 20 and e.Age<=40 then "young employee"
when e.Age >40 and e.Age <=65 then "oldest employee"
else "others" end) as EmployeeAge
from employee e join department d
group by d.Department_id ,d.HOD_Name,e.Age;


select d.Department_name,avg(e.Salary)from department d
join employee e
where d.HOD_Name =e.Name
group by d.Department_name
having avg(e.Salary)<=2*(avg(Salary));



 
 
 
 