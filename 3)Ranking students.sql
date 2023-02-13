 USE `sqlAssignment`; 
DROP TABLE Test;
CREATE TABLE Test (
  Candidate_ID INTEGER(10) NOT NULL UNIQUE, -- As candidate id cannot be null and need to be unique 
  Marks FLOAT(5,2) DEFAULT 0.00  
);

-- Insertion of given data
INSERT INTO Test 
VALUES 
  (1, 98), 
  (2, 78), 
  (3, 87), 
  (4, 98), 
  (5, 78);
  
 
  
  
  
-- Procedure  to rank students in proper order.
DELIMITER &&  
CREATE PROCEDURE getRank()  
BEGIN  
SELECT Marks, 
  DENSE_RANK() OVER (ORDER BY Marks DESC)   
  AS 'Rank', 
  GROUP_CONCAT(Candidate_ID) AS Candidate_ID    -- concat the ids if students marks is same
FROM Test 
GROUP BY Marks;
END &&  
DELIMITER ;  

-- calling getRank() to rank students in proper order
CALL getRank();