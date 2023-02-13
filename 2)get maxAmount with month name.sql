 USE `sqlAssignment`; 
  
  
  CREATE TABLE empSalaries (
  EmpName VARCHAR(30) NOT NULL ,   -- Name cannot be null
   -- Salary cannot be null and its default value is zero
  Jan FLOAT(10, 2) NOT NULL DEFAULT 0, 
  Feb FLOAT(10, 2) NOT NULL DEFAULT 0, 
  March FLOAT(10, 2) NOT NULL DEFAULT 0, 
-- Check constraint to ensure that the salary is not negative.
  CHECK(
    Jan >= 0 
    AND Feb >= 0 
    AND March >= 0
  )
);
-- Insertion of given data
INSERT INTO empSalaries 
VALUES
  ('X', 5200, 9093, 3832), 
  ('Y', 9023, 8942, 4000), 
  ('Z', 9834, 8197, 9903), 
  ('W', 3244, 4321, 0293);

-- Procedure to find the max amount from the rows with month name
DELIMITER &&  
CREATE PROCEDURE maxAmount()  
BEGIN  
SELECT 
  EmpName AS Name, 
  VALUE, 
  CASE 
  WHEN monthNum = 1 THEN 'Jan' 	
  WHEN MonthNum = 2 THEN 'Feb'      -- as field gives index, to get month name we have used Case
  WHEN monthNum = 3 THEN 'Mar' 
  END 
  AS Month
FROM 
  (
    SELECT EmpName, 
      GREATEST(Jan, Feb, March) AS value, 
      FIELD( GREATEST(Jan, Feb, March), Jan, Feb, March) AS monthNum
    FROM empSalaries
  ) empSalary;
END &&  
DELIMITER ;  


-- calling procedure to get max amount from the rows with month name
CALL maxAmount();