CREATE SCHEMA `sqlAssignment`;    -- Creation of Schema
USE `sqlAssignment`;           -- Using the created schema

-- Question - 1
-- Creation of Table 

create table employees (
  EmpID integer(4) not null unique, 
  -- As employee id cannot be null and need to be unique
  EmpName varchar(30), 
  Gender varchar(10), 
  Department varchar(30), 
  -- Check constraint for preventing invalid enetries
  check(
    Gender in ("Male", "Female")
  )
);
-- Insertion of given data
Insert into employees 
values 
  (1, 'X', 'Female', 'Finance'), 
  (2, 'Y', 'Male', 'IT'), 
  (3, 'Z', 'Male', 'HR'), 
  (4, 'W', 'Female', 'IT');

-- Data insertion to highlight the Not Assigned row
Insert into employees 
values 
  (5, 'V', 'Male', null);
 
-- Procedure holding Query to find the number of male and female employees in each department
DELIMITER &&  
CREATE PROCEDURE getNumMaleFemale()
BEGIN  
SELECT 
  IFNULL(Department, 'Not Assigned') as Department, 
  COUNT(
    CASE WHEN UPPER(Gender)= 'MALE' THEN 1 END
  ) AS 'Num of Male', 
  COUNT(
    CASE WHEN UPPER(Gender)= 'FEMALE' THEN 1 END
  ) AS 'Num of Female' 
FROM 
  employees 
GROUP BY 
  Department 
order by 
  Department;
END &&  
DELIMITER ;    
CALL getNumMaleFemale();