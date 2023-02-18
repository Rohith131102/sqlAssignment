##  SQL-Assignment
We have stored Queries in Procedures so that we can reuse and call for procedure whenever required
### Question-1
Given a table of employees, find the number of male and female employees in each department 
#### Table Employees and its constraints
The table employees has four columns:
1.  "EmpID" - An integer column with a maximum size of 4 digits. It cannot be NULL and must be unique across all records in the table.
2.  "EmpName" - A string column with a maximum length of 30 characters.
3.  "Gender" - A string column with a maximum length of 10 characters and also added a check constraint which allows only the values "Male" and "Female"  in the "Gender" column.
4.  "Department" - A string column with a maximum length of 30 characters.

#### Approach
 Count the number of occurrences of "Male" and "Female" in the "Gender" column and returns the results as two separate columns named "Num of Male" and "Num of Female".
 #### Exception Handling
  If Department column is Null for a entry in employees Table.Then we handle that by creating 'Not Assigned' Row in Department column of output Table
#### Functions and Statements Used
1. DELIMITER - The "DELIMITER" statement is used to change the default SQL statement delimiter, which is a semicolon, to the "&&" symbol. This is necessary because the procedure body contains semicolons, which would otherwise cause issues with execution.
2. CASE WHEN - The "CASE WHEN" statement is used to conditionally count the number of occurrences of "Male" and "Female" in the "Gender" column.
3. IFNULL - The "IFNULL" function is used to handle cases where the "Department" column has a NULL value.
#### TestRun
<img width="465" alt="Screenshot 2023-02-18 at 8 53 00 PM" src="https://user-images.githubusercontent.com/123619674/219874063-82ab8123-ff97-46a0-a45a-799facb848dd.png">

### Question-2
Given a table with salaries of employees for different month, find the max amount from the rows with month name
#### Table empSalaries and its constraints
The table has four columns:
1.  "EmpName" - A string column with a maximum length of 30 characters, and it cannot be NULL.
2.  "Jan" - A floating-point column with a maximum precision of 10 digits and 2 decimal places, and it cannot be NULL. The default value for this column is 0.
3.  "Feb" - A floating-point column with a maximum precision of 10 digits and 2 decimal places, and it cannot be NULL. The default value for this column is 0.
4.  "March" - A floating-point column with a maximum precision of 10 digits and 2 decimal places, and it cannot be NULL. The default value for this column is 0.
Check constraint for Jan,Feb and March row which allows only positive values for Salary(salary cannot be negative)
#### Approach
-   Find the maximum value from the columns "Jan", "Feb", and "March" and store it in the "value" column 
-  Determine the month corresponding to the maximum value using the "field" function, which returns the index of a value in a list of values, and stores the result in the "MonthNum" column.
- Using a "CASE WHEN" statement to convert the "MonthNum" column into the month name (Jan, Feb, or March) and return the result in the "Month" column.
#### Functions and Statements used
1.  Greatest - The "greatest" function is used to determine the maximum value from the columns "Jan", "Feb", and "March".
2.  Field - The "field" function is used to determine the position of the maximum value in the list.
#### TestRun
<img width="220" alt="Screenshot 2023-02-18 at 8 58 12 PM" src="https://user-images.githubusercontent.com/123619674/219874187-b2b61cb3-4ebf-4884-81ed-1cd19c84ec7e.png">

### Question-3
Given the marks obtained by candidates in a test, rank them in proper order
#### Table Test and its Constraints
1.  "CandidateID" - An integer column with a maximum length of 10 digits, and it cannot be NULL and has to be UNIQUE
2.  "Marks" - A floating-point column with a maximum precision of 5 digits and 2 decimal places. The default value for this column is 0.
#### Approach
Ranking the students based on their marks  using "dense_rank()" function and group by marks and "GROUP_CONCAT()" function concatenates the candidate IDs for each group.
#### Functions and Statements used
1.  dense_rank() - The "dense_rank()" function is used to calculate the rank of each candidate based on their marks,
2.  GROUP_CONCAT() - The "GROUP_CONCAT()" function is used to concatenate the candidate IDs of all candidates with the same marks into a single string.
#### TestRun
<img width="271" alt="Screenshot 2023-02-18 at 9 00 45 PM" src="https://user-images.githubusercontent.com/123619674/219874339-3f20e8ad-771c-4efc-a90c-f1ae60c86204.png">

### Question-4
#### Table EmailIDs and its Constraints
The table has two columns:
1.  "candidate_id" - An integer column with a maximum length of 10 digits, and it cannot be NULL and UNIQUE.
2.  "mail" - A string column with a maximum length of 50 characters, and it cannot be NULL.

#### Approach
Using Inner Join and fetching the candidate_id's which has same email id and larger candidate_id and deleting them from table "EmailIDs"
#### TestRun
<img width="235" alt="Screenshot 2023-02-18 at 9 01 45 PM" src="https://user-images.githubusercontent.com/123619674/219874395-90dfcef9-df23-46f6-9f28-0d3e98bddc85.png">

