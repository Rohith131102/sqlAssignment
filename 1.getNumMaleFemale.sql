CREATE SCHEMA `sqlAssignment`;    -- Creation of Schema
USE `sqlAssignment`;           -- Using the created schema

-- Question - 1
-- Creation of Table 

CREATE TABLE employees (
  EmpID integer(4) NOT NULL UNIQUE,  -- As employee id needs to be unique and not null
  EmpName VARCHAR(30), 
  Gender VARCHAR(10), 
  Department VARCHAR(30), 
  -- Check constraint for preventing invalid enetries
  CHECK(
    Gender IN ("Male", "Female")
  )
);
-- Insertion of given data
INSERT INTO employees 
values 
  (1, 'X', 'Female', 'Finance'), 
  (2, 'Y', 'Male', 'IT'), 
  (3, 'Z', 'Male', 'HR'), 
  (4, 'W', 'Female', 'IT');

-- Insering a example where department entry is NULL 
Insert into employees 
values 
  (5, 'V', 'Male', null);
 
-- Procedure holding Query to find the number of male and female employees in each department
DELIMITER &&  
CREATE PROCEDURE getNumMaleFemale()     -- creating a procedure 
BEGIN  
SELECT 
  IFNULL(Department, 'Not Assigned') as Department, --if Department entry in employees table is null,then we add gender details in Not Assigned
  COUNT(
    CASE WHEN Gender= 'Male' THEN 1 END        --incrementing the count by 1 whenever male entry is found
  ) AS 'Num of Male', 
  COUNT(
    CASE WHEN Gender= 'Female' THEN 1 END      --incrementing the count by 1 whenever female entry is found
  ) AS 'Num of Female' 
FROM employees 
GROUP BY Department 
order by Department;
END &&  
DELIMITER ;    

-- calling procedure to get number of male and female detains department wise
CALL getNumMaleFemale();
