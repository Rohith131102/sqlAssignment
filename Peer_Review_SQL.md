 ## SQL ASSIGNMENT
### Peer Learning Document
<p>&nbsp;</p>

### Amit Shukla's Approach
#### *Question 1*
 he used aggregated function  **SUM**  and  he used **CASE**  statement inside it for finding number of male and female employees. Sum is increased by 1 when 'Male' is encountered and 1 when 'Female' is encountered in separate columns. Then Used  **GROUP BY**   clause for grouping the table according to the Department and **ORDER BY** to display table in ascending order according to the Department.
#### *Question 2*
He Used  **CASE**  for finding the greatest in the following manner.if jan salary is greater than feb and march salary then jan salary is stored.if feb salary greater than jan and march salary then feb salary is stored ,else march salary is stored as value.similarly stored 'Jan' or 'Feb' or 'March' as month
 #### *Question 3*
He used  **RANK()**  function over DISTINCT marks rows  and **ORDER BY**  Marks in descending order to fetch ranks in desc order of marks
He used  **GROUP_CONCAT()**  by candidate_id for displaying multiple id of students with same marks Used  **GROUP BY**  clause and  **ORDER BY**  clause for grouping the table according to the Marks and display table in descending order according to Marks.
#### *Question 4*
He created a virtual table Temp_info  using **VIEW** which contains only the smallest candidate id if email is same.
He grouped the data by email id and used **MIN** to fetch the smallest candidate id and then deleted the candidate_id which are **NOT IN** Temp_info
<p>&nbsp;</p>
<p>&nbsp;</p>
### Raj Keshav's Approach
#### *Question 1*
 In the main query, he used aggregated function  **SUM**  and  he used **CASE**  statement inside it for finding number of male and female employees. Sum is increased by 1 when 'Male' is encountered and 1 when 'Female' is encountered in separate columns. Then Used  **GROUP BY**  clause for grouping the table according to the Department.
#### *Question 2*
He Used  **CASE**  and  **GREATEST**  statement for finding the maximum salary between Jan, Feb and Mar as Value.And ANY_VALUE and CASE , GREATEST to fetch month ,If Jan is greatest then returning Jan, if Feb is greatest then returning Feb else Mar will be greatest.
- **ANY_VALUE**-returns any value from the input expression values nondeterministically. This function can return NULL if the input expression doesn't result in any rows being returned or contains a NULL value.
  
 #### *Question 3*
He used  **DENSE_RANK()**  function over individual rows  and **ORDER BY**  Marks in descending order to fetch ranks in desc order of marks
He used  **GROUP_CONCAT()**  by candidate_id for displaying multiple id of students with same marks Used  **GROUP BY**  clause and  **ORDER BY**  clause for grouping the table according to the Marks and display table in descending order according to Marks.
#### *Question 4*
Candidate_email table is self joined using  **JOIN**  Clause.
Then, deleting the rows, which have same email and c1's id is greater than c2's id, it will keep the lowest id's value in the table



