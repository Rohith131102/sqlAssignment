  USE `sqlAssignment`;  

-- Question - 4
-- Creation of Table 
CREATE TABLE EmailIDs (
  candidate_id INTEGER(10) NOT NULL UNIQUE, -- As candidate id cannot be null and need to be unique
  mail VARCHAR(50) NOT NULL
);
-- Insertion of given data
INSERT INTO EmailIDs
VALUES
  (45, 'abc@gmail.com'), 
  (23, 'def@yahoo.com'), 
  (34, 'abc@gmail.com'), 
  (21, 'bcf@gmail.com'), 
  (94, 'def@yahoo.com');
  
  
-- Procedure to keep the value that has smallest id and delete all the other rows having same value.
DELIMITER &&  
CREATE PROCEDURE DelDuplicateExceptSmallestID ()  
BEGIN  
DELETE FROM EmailIDs 
WHERE candidate_id IN (
    SELECT RepeatIDs 
    FROM 
      (
      SELECT DISTINCT a.candidate_id AS RepeatIDs
        FROM 
          EmailIDs a 
          INNER JOIN EmailIDs b 
        WHERE 
          a.mail = b.mail 
          AND a.candidate_id > b.candidate_id
      )   Temp
  ); 
-- Display the table after deletion
SELECT * 
FROM EmailIDs 
ORDER BY candidate_id DESC;
END &&  
DELIMITER ;  

CALL DelDuplicateExceptSmallestID();