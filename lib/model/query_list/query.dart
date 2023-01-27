/// IsResult : 1
/// Message : "Data Found"
/// ResultList : [{"QueryID":1046,"Query":"Write a query to list all tables of a database in SQL SERVER","QueryAns":"select * from [INFORMAION_SCHEMA].[TABLES]\r\n<br/><br/>OR<br/><br/>\r\nselect * from sys.tables\r\n<br/><br/>OR<br/><br/>\r\nselect * from sysobjects where xtype='u'","QueryInsertDate":"2021-06-02T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":64,"Description":null},{"QueryID":1043,"Query":"Query to fetch the name which contains % as per below. (Table name is Person)\r\n\r\nInput                   Output\r\nName                  Name\r\nRaj                        R%j  \r\nR%j                       M%t\r\nMeet                    M%%t\r\nM%t          \r\nM%%t","QueryAns":"SELECT * FROM Person <br/>WHERE Name LIKE '%\\%%' ESCAPE '\\'\r\n\r\n<br/><br/>OR<br/><br/>\r\n\r\nSELECT * FROM Person <br/>WHERE Name LIKE '%[%]%'","QueryInsertDate":"2021-05-28T00:00:00","ImagePath":null,"likeCount":2,"dislikeCount":0,"clapCount":15,"Description":null},{"QueryID":1044,"Query":"Query to fetch the name which contains %% (two time %) as per below. (Table name is Person)\r\n\r\nInput                   Output\r\nName                  Name\r\nRaj                        M%%t    \r\nR%j                       \r\nMeet                    \r\nM%t          \r\nM%%t","QueryAns":"SELECT * FROM Person <br/>WHERE Name LIKE '%[%][%]%'","QueryInsertDate":"2021-05-28T00:00:00","ImagePath":null,"likeCount":2,"dislikeCount":0,"clapCount":1,"Description":null},{"QueryID":1045,"Query":"Query to fetch the name which contains _ as per below. (Table name is Person)\r\n\r\nInput                   Output\r\nName                  Name\r\nRaj                        R_j  \r\nR_j                       M_t\r\nMeet                    M__t\r\nM_t          \r\nM__t","QueryAns":"SELECT * FROM Person <br/>WHERE Name LIKE '%[_]%'","QueryInsertDate":"2021-05-28T00:00:00","ImagePath":null,"likeCount":2,"dislikeCount":0,"clapCount":4,"Description":null},{"QueryID":1038,"Query":"Write SQL statements (Query) for following tables:\r\n\r\nEmployeeInfo(EmpID, EmpFname, EmpLname, Department, Project, Address, DOB, Gender)\r\nEmployeePosition(EmpID, EmpPosition, DateOfJoining, Salary)\r\n\r\nWrite a query to find the Nth highest salary from the table without using TOP/LIMIT keyword.","QueryAns":"SELECT Salary <BR/>\r\nFROM EmployeePosition E1<BR/> \r\nWHERE N-1 = ( <BR/>\r\nSELECT COUNT( DISTINCT ( E2.Salary ) )<BR/> \r\nFROM EmployeePosition E2<BR/> \r\nWHERE E2.Salary >  E1.Salary );","QueryInsertDate":"2021-04-30T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":9,"Description":null},{"QueryID":1039,"Query":"Write SQL statements (Query) for following tables:\r\n\r\nEmployeeInfo(EmpID, EmpFname, EmpLname, Department, Project, Address, DOB, Gender)\r\nEmployeePosition(EmpID, EmpPosition, DateOfJoining, Salary)\r\n\r\nWrite a query to find the third-highest salary from the EmpPosition table.","QueryAns":"SELECT TOP 1 salary<br/>\r\nFROM(<br/>\r\nSELECT TOP 3 salary<br/>\r\nFROM employee_table<br/>\r\nORDER BY salary DESC) AS emp<br/>\r\nORDER BY salary ASC;","QueryInsertDate":"2021-04-30T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":4,"Description":null},{"QueryID":1040,"Query":"Write SQL statements (Query) for following tables:\r\n\r\nEmployeeInfo(EmpID, EmpFname, EmpLname, Department, Project, Address, DOB, Gender)\r\nEmployeePosition(EmpID, EmpPosition, DateOfJoining, Salary)\r\n\r\nWrite a query to display the first and the last record from the EmployeeInfo table.","QueryAns":"SELECT * FROM EmployeeInfo <br/>WHERE EmpID = <br/>(SELECT MIN(EmpID) FROM EmployeeInfo);\r\n<br/><br/>\r\nSELECT * FROM EmployeeInfo <br/>WHERE EmpID = <br/>(SELECT MAX(EmpID) FROM EmployeeInfo);","QueryInsertDate":"2021-04-30T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":6,"Description":null},{"QueryID":1041,"Query":"Write SQL statements (Query) for following tables:\r\n\r\nEmployeeInfo(EmpID, EmpFname, EmpLname, Department, Project, Address, DOB, Email)\r\nEmployeePosition(EmpID, EmpPosition, DateOfJoining, Salary)\r\n\r\nWrite a query to add email validation to your database.","QueryAns":"SELECT Email FROM EmployeeInfo <br/>WHERE NOT REGEXP_LIKE(Email, ‘[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}’, ‘i’);","QueryInsertDate":"2021-04-30T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":6,"Description":null},{"QueryID":1042,"Query":"Write SQL statements (Query) for following tables:\r\n\r\nEmployeeInfo(EmpID, EmpFname, EmpLname, Department, Project, Address, DOB, Email)\r\nEmployeePosition(EmpID, EmpPosition, DateOfJoining, Salary)\r\n\r\nWrite a query to fetch 50% records from the EmployeeInfo table.","QueryAns":"SELECT * <br/>\r\nFROM EmployeeInfo <br/>WHERE\r\nEmpID <= <br/>(SELECT COUNT(EmpID)/2 <br/> FROM EmployeeInfo);","QueryInsertDate":"2021-04-30T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":1,"clapCount":0,"Description":null},{"QueryID":1037,"Query":"Write a query to display Employee details who have their birthdays today from below table.\r\n\r\nEmp (EName varchar(50), BirthDate date)","QueryAns":"SELECT *<br/>\r\nFROM Emp<br/>\r\nWHERE DATEPART(d, BirthDate) = DATEPART(d, GETDATE())<br/>\r\n    AND DATEPART(m, BirthDate) = DATEPART(m, GETDATE())","QueryInsertDate":"2021-04-17T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":4,"Description":null},{"QueryID":1034,"Query":"Query to diplay output as per below.\r\n\r\nInput                        Output\r\nCol1   Col2            Col1   Col2\r\n1         A                 1       A\r\n1         A                 2       B\r\n2         A                 3       C\r\n2         A                 \r\n2         B                 \r\n3         A                 \r\n3         B                 \r\n3         C","QueryAns":"select Col1, max(Col2)<br/>\r\nfrom tbl<br/>\r\ngroup by Col1","QueryInsertDate":"2020-09-17T00:00:00","ImagePath":null,"likeCount":1,"dislikeCount":0,"clapCount":65,"Description":null},{"QueryID":27,"Query":"Query to get employee names starting and ending with a vowel?","QueryAns":"SELECT Empname FROM Table_name <br/>\r\nWHERE Empname LIKE '[aeiou]%[aeiou]'","QueryInsertDate":"2020-06-30T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":1,"clapCount":18,"Description":null},{"QueryID":28,"Query":"Query to display all the recored of a table twice as per below.\r\n\r\nInput                   Output\r\nId                           Id\r\n1                            1  \r\n2                            2\r\n3                            3\r\n                              1\r\n                              2\r\n                              3","QueryAns":"SELECT * FROM Table_name t1  <br/>\r\nUNION ALL  <br/>\r\nSELECT * FROM Table_name t2","QueryInsertDate":"2020-06-30T00:00:00","ImagePath":null,"likeCount":2,"dislikeCount":0,"clapCount":7,"Description":null},{"QueryID":29,"Query":"Query to delete records from table t1 whose Id is present in table t2 using join.\r\n\r\n                Input\r\n   t1                         t2\r\nId  Name                Id\r\n1      a                      1  \r\n2      b                      3\r\n3      c                      5\r\n4      d\r\n5      e","QueryAns":"DELETE a <br/>\r\nFROM t1 AS a INNER JOIN t2 AS b<br/>\r\nON a.Id = b.Id","QueryInsertDate":"2020-06-30T00:00:00","ImagePath":null,"likeCount":2,"dislikeCount":2,"clapCount":7,"Description":null},{"QueryID":30,"Query":"Query to find customers that are from the same city from below schema:\r\n\r\nCustomers (CustomerID int, CustomerName varchar(50), ContactName varchar(50), Address varchar(50), City varchar(50), PostalCode varchar(50), Country varchar(50))","QueryAns":"SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City <br/>\r\nFROM Customers A, Customers B <br/>\r\nWHERE A.CustomerID <> B.CustomerID <br/>\r\nAND A.City = B.City <br/>\r\nORDER BY A.City","QueryInsertDate":"2020-06-30T00:00:00","ImagePath":null,"likeCount":2,"dislikeCount":0,"clapCount":3,"Description":null},{"QueryID":31,"Query":"Query to get the list of employees and their supervisor from below schema:\r\n\r\nEmployee(Emp_id int, Emp_name varchar(20), Dt_of_join date, Emp_supv varchar(5))","QueryAns":"SELECT a.Emp_id AS \"Emp_ID\", a.Emp_name AS \"Employee Name\", b.Emp_id AS \"Supervisor ID\", b.Emp_name AS \"Supervisor Name\" <br/>\r\nFROM Employee a, Employee b <br/>\r\nWHERE a.Emp_supv = b.Emp_id;","QueryInsertDate":"2020-06-30T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":1,"clapCount":2,"Description":null},{"QueryID":32,"Query":"Query to delete duplicate records from below table.\r\n\r\n Input\r\n   t1            \r\nId   Item     \r\n1      a         \r\n2      b         \r\n3      c         \r\n4      d\r\n1      a\r\n3      c","QueryAns":"WITH cte AS (<br/>\r\n    SELECT Id, Item, <br/>\r\n        ROW_NUMBER() OVER (<br/>\r\n            PARTITION BY Id, Item<br/>\r\n            ORDER BY Id, Item<br/>\r\n        ) row_num<br/>\r\n     FROM t1<br/>\r\n)<br/>\r\nDELETE FROM cte WHERE row_num > 1;","QueryInsertDate":"2020-06-30T00:00:00","ImagePath":null,"likeCount":3,"dislikeCount":1,"clapCount":3,"Description":null},{"QueryID":22,"Query":"Query to display maximum value from below schema without using MAX function.\r\n\r\nInput\r\nId   Val\r\n1      10 \r\n2      20 \r\n1      30 \r\n3      40\r\n4      30\r\n3      50\r\n1      60       \r\n2      20","QueryAns":"SELECT DISTINCT Val FROM Table_name <br/>\r\nWHERE Val NOT IN (SELECT Val FROM Table_name<br/> \r\nWHERE Val < ANY (SELECT Val FROM Table_name))","QueryInsertDate":"2020-06-29T00:00:00","ImagePath":null,"likeCount":2,"dislikeCount":0,"clapCount":4,"Description":null},{"QueryID":23,"Query":"Query to print numbers from 1 to 100 without using loops.","QueryAns":";with numcte <br/>  \r\nAS  <br/>\r\n(  <br/>\r\nSELECT 1 [SEQUENCE]  <br/>\r\n  UNION ALL  <br/>\r\n  SELECT [SEQUENCE] + 1 <br/>\r\n  FROM numcte WHERE [SEQUENCE] <100 <br/>  \r\n)<br/>  \r\nSELECT * FROM numcte","QueryInsertDate":"2020-06-29T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":1,"Description":null},{"QueryID":24,"Query":"Query to print the expression 'NUMBER' if cell contain valid number else 'NOT NUMBER' as per below.\r\n\r\nInput                        Output\r\nId                           Id     Check\r\n12                          12     NUMBER\r\nab                          ab     NOT NUMBER\r\n1a                          1a     NOT NUMBER\r\na1                          a1     NOT NUMBER\r\n23                          23     NUMBER\r\nbb                          bb     NOT NUMBER","QueryAns":"SELECT Id, 'CHECK' =<br/>\r\nCASE<br/>\r\nWHEN Id LIKE '%[0-9]%[^A-Z]%' THEN 'NUMBER'<br/>\r\nELSE 'NOT NUMBER'<br/>\r\nEND<br/>\r\nFROM Table_name","QueryInsertDate":"2020-06-29T00:00:00","ImagePath":null,"likeCount":2,"dislikeCount":0,"clapCount":0,"Description":null},{"QueryID":25,"Query":"Query to get even Ids as per below.\r\n\r\nInput                   Output\r\nId                           Id\r\n1                            2  \r\n2                            4\r\n3                            6\r\n4               \r\n5\r\n6","QueryAns":"SELECT * FROM Table_name <br/> \r\nWHERE Id % 2 = 0","QueryInsertDate":"2020-06-29T00:00:00","ImagePath":null,"likeCount":2,"dislikeCount":0,"clapCount":1,"Description":null},{"QueryID":26,"Query":"Query to get odd Ids as per below.\r\n\r\nInput                   Output\r\nId                           Id\r\n1                            1  \r\n2                            3\r\n3                            5\r\n4               \r\n5\r\n6","QueryAns":"SELECT * FROM Table_name <br/> \r\nWHERE Id % 2 != 0","QueryInsertDate":"2020-06-29T00:00:00","ImagePath":null,"likeCount":2,"dislikeCount":0,"clapCount":0,"Description":null},{"QueryID":17,"Query":"Query to calculate numbers of hours between two dates.","QueryAns":"SELECT DATEDIFF(HOUR, '01-01-2020 05:00', '01-01-2020 07:00') AS Hours_Difference<br/>\r\nOR<br/>\r\nSELECT DATEDIFF(HH, '01-01-2020 05:00', '01-01-2020 07:00') AS Hours_Difference","QueryInsertDate":"2020-06-28T00:00:00","ImagePath":null,"likeCount":1,"dislikeCount":0,"clapCount":0,"Description":null},{"QueryID":18,"Query":"Query to remove duplicate records from below schema.\r\n\r\nInput                        Output\r\nId   Val                    Id   Val\r\n1      1                      1     1\r\n2      2                      2     2\r\n1      1                      3     3\r\n3      3                      4     4\r\n4      4\r\n3      3\r\n1      1         \r\n2      2","QueryAns":"WITH CTE(Id, Val, DuplicateCount)<br/>\r\nAS (SELECT Id, Val, ROW_NUMBER() OVER(<br/>\r\nPARTITION BY Id, Val ORDER BY Id) AS DuplicateCount<br/>\r\nFROM Table_Name)<br/>\r\nDELETE FROM CTE<br/>\r\nWHERE DuplicateCount > 1","QueryInsertDate":"2020-06-28T00:00:00","ImagePath":null,"likeCount":2,"dislikeCount":0,"clapCount":1,"Description":null},{"QueryID":19,"Query":"Query to diplay namewise squence of all records as per below.\r\n\r\nInput                                         Output\r\nId   Name   Salary          Id   Name  Salary   Seq\r\n1      A          10                1       A         10         1\r\n1      A          10                1       A         10         2\r\n2      B          20                2       B         20         1\r\n2      B          20                2       B         20         2\r\n3      C          10                3       C         10         1\r\n3      C          10                3       C         10         2\r\n3      C          10                3       C         10         3","QueryAns":"SELECT Id, Name, Salary,<br/>\r\nROW_NUMBER() OVER (PARTITION BY Name ORDER BY Salary ASC) AS \"Seq\"<br/>\r\nFROM Table_name","QueryInsertDate":"2020-06-28T00:00:00","ImagePath":null,"likeCount":1,"dislikeCount":0,"clapCount":0,"Description":null},{"QueryID":20,"Query":"Query to diplay a record n times whose value is given in a column.\r\n\r\nInput                                         Output\r\nId   Name   Times                 Id   Name\r\n1      A          1                         1      A    \r\n2      B          2                         2      B    \r\n3      C          3                         2      B     \r\n                                                 3      C    \r\n                                                 3      C    \r\n                                                 3      C","QueryAns":";WITH cte AS<br/>\r\n  (<br/>\r\n    SELECT * FROM Table_name<br/>\r\n    UNION ALL <br/>\r\n    SELECT cte.[Id], cte.Name, (cte.[Times] - 1) [Times]<br/>\r\n    FROM cte INNER JOIN Table_name t <br/>\r\n      ON cte.[Id] = t.[Id]<br/>\r\n    WHERE cte.[Times] > 1<br/>\r\n)<br/>\r\nSELECT Id, Name FROM cte ORDER BY 1","QueryInsertDate":"2020-06-28T00:00:00","ImagePath":null,"likeCount":1,"dislikeCount":0,"clapCount":0,"Description":null},{"QueryID":21,"Query":"Query to display all names in single row with comma separated as per below.\r\n\r\n          Input                                \r\nName      Gender               \r\nRaj              M                   \r\nOm              M                   \r\nJay              M                   \r\nJiya             F                    \r\nRiya            F                    \r\nMira            F                    \r\n\r\nWrite a query to concatenate the Name column like the following:\r\n\r\nRaj, Om, Jay, Jiya, Riya, Mira","QueryAns":"<br/>SELECT Name + ', '<br/>\r\nFrom Table_name<br/>\r\nFor XML PATH('')","QueryInsertDate":"2020-06-28T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":0,"Description":null},{"QueryID":12,"Query":"Query to display Citywise Sales percentage from below schema.\r\n\r\n          Input                                 Output\r\nCity      Sales                        City      Sales \r\nGoa      95                             Goa      20.80\r\nAgra     109                          Agra     55.73\r\nDelhi     292                         Delhi     18.13\r\nSurat     28                          Surat     05.34","QueryAns":"<br/>SELECT City, CONVERT(NUMERIC(10,2), SUM(Sales) * 100.0 / (SELECT SUM(Sales) FROM Table_Name))<br/>\r\nFROM Table_Name<br/>\r\nGROUP BY City;","QueryInsertDate":"2020-06-27T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":0,"Description":null},{"QueryID":13,"Query":"What should be the out of following query?\r\n\r\nA             B\r\n1             1\r\n2             2\r\nNULL     3 \r\n4             NULL\r\n5             4\r\n\r\nSELECT SUM (A + B) FROM Table_Name","QueryAns":"<br/>15","QueryInsertDate":"2020-06-27T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":0,"Description":null},{"QueryID":14,"Query":"What should be the out of following query?\r\n\r\nA             B\r\n1             1\r\n2             2\r\nNULL     3 \r\n4             NULL\r\n5             4\r\n\r\nSELECT COUNT(A + B) FROM Table_Name","QueryAns":"<br/>3","QueryInsertDate":"2020-06-27T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":0,"Description":null},{"QueryID":15,"Query":"Query to update all NULL values by 10.\r\n\r\nA             B\r\n1             1\r\n2             2\r\nNULL     3 \r\n4             NULL\r\n5             4","QueryAns":"<br/>UPDATE ASD<br/>\r\n   SET CITY = COALESCE(CITY, 10),<br/>\r\n       SALES = COALESCE(SALES, 10)","QueryInsertDate":"2020-06-27T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":1,"Description":null},{"QueryID":16,"Query":"Query to count IDwise numeric value's count values.\r\n\r\nInput                       Output\r\nId   Val                    Id   Count\r\n1      1                      1     3\r\n2      a                      2     1\r\n1      b                      4     1\r\n3      a                \r\n4      2\r\n1      5\r\n1      4         \r\n2      2","QueryAns":"SELECT Id, COUNT(Val) FROM Table_Name <br/>\r\nWHERE Val NOT LIKE '%[^0-9]%' <br/>\r\nGROUP BY Id","QueryInsertDate":"2020-06-27T00:00:00","ImagePath":null,"likeCount":1,"dislikeCount":0,"clapCount":0,"Description":null},{"QueryID":7,"Query":"Query to print ODD and EVEN numbers in separate columns.\r\n\r\nInput                         Output\r\nNo                    Odd_nos    Even_nos\r\n1                           1                 2\r\n2                           3                 4\r\n3\r\n4","QueryAns":"<br/>SELECT MIN(No) as Odd_nos, MAX(No) as Even_nos<br/>\r\nFROM Table_Name<br/>\r\nGROUP BY FLOOR((No+1)/2)","QueryInsertDate":"2020-06-26T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":0,"Description":null},{"QueryID":8,"Query":"Query to fill the cell having NULL value from above cell's values.\r\n\r\nInput                       Output\r\nId   Val                    Id   Val\r\n1      1                       1     1\r\n2      NULL                2     1\r\n3      2                        3     2\r\n4      NULL                4     2\r\n5      NULL                5     2\r\n6      3                        6     3","QueryAns":";WITH CTE AS<br/>\r\n(SELECT *, ROW_NUMBER() OVER (ORDER BY Id) rnk <br/>\r\n    FROM Table_Name)<br/>\r\nSELECT <br/>\r\n\tId,<br/>\r\n\t(SELECT TOP 1 Val FROM CTE a WHERE a.rnk = <br/>\r\n\t(SELECT MAX(b.rnk) FROM CTE b WHERE b.rnk <= c.rnk <br/>AND b.Val IS NOT NULL)) Previous_NonNullval         <br/>\r\nFROM CTE c","QueryInsertDate":"2020-06-26T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":0,"Description":null},{"QueryID":9,"Query":"Query to place leading zeros for numbers as per below.\r\n\r\nInput                 Output\r\nId                      Id\r\n1                       00001     \r\n12                     00012\r\n123                   00123 \r\n1234                 01234\r\n12345               12345","QueryAns":"SELECT REPLICATE('0', 5-LEN(RTRIM(No))) + RTRIM(No) <br/> FROM Table_Name","QueryInsertDate":"2020-06-26T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":0,"Description":null},{"QueryID":10,"Query":"Query to display itemwise minimum Start_date and maximum End_date as per below.\r\n\r\n          Input                                 Output\r\nItem   Start       End              Item   Start   End\r\nA        2015      2016               A      2015   2018\r\nA        2017      2018               B      2016   2018\r\nB        2016      2017\r\nB        2017      2018","QueryAns":"<br/>SELECT Item, MIN(StartDate), MAX(EndDate)<br/>\r\nFROM Item<br/>\r\nGROUP BY Item","QueryInsertDate":"2020-06-26T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":6,"Description":null},{"QueryID":11,"Query":"Query to display alternate Genderwise records as per below.\r\n\r\n          Input                                 Output\r\nName      Gender               Name     Gender\r\nRaj              M                     Raj           M\r\nOm              M                    Jiya           F\r\nJay              M                    Om            M\r\nJiya             F                     Riya           F \r\nRiya            F                     Jay             M\r\nMira            F                     Mira            F","QueryAns":"<br/>;WITH PRS (Name, Gender, R)<br/>\r\nAS<br/>\r\n(SELECT Name, Gender, ROW_NUMBER() OVER(PARTITION BY Gender ORDER BY Gender) AS R<br/>\r\nFROM Table_Name)<br/>\r\nSELECT Name, Gender FROM PRS ORDER BY R, Gender DESC","QueryInsertDate":"2020-06-26T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":0,"Description":null},{"QueryID":1,"Query":"Find second highest salary from below schema.         \r\n\r\nEmployee (Name varchar(50), Salary int)","QueryAns":"<br/>SELECT Name, MAX(Salary) AS Salary<br/>\r\n  FROM Employee<br/>\r\n  WHERE Salary < (SELECT MAX(Salary)<br/>\r\n                 FROM Employee);","QueryInsertDate":"2020-06-25T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":4,"Description":null},{"QueryID":3,"Query":"Query to returns all unique departments from below schema.\r\n\r\nSalaries (Professor_Name varchar(50), Department varchar(50), Salary int)","QueryAns":"<br/>SELECT DISTINCT Department FROM Salaries;","QueryInsertDate":"2020-06-25T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":0,"Description":null},{"QueryID":4,"Query":"Query to display citywise total balance from below schema.\r\n\r\nCheque (City varchar(20), Balance int)\r\nCash (City varchar(20), Balance int)","QueryAns":"<br/>SELECT City, SUM(Balance) as Total <br/>\r\nFROM <br/>\r\n(SELECT City, Balance FROM Cash <br/>\r\nUNION ALL <br/>\r\nSELECT City, Balance FROM Cheque) t <br/>\r\nGROUP BY City","QueryInsertDate":"2020-06-25T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":4,"Description":null},{"QueryID":5,"Query":"Query to replace 0 in the place of NULL values in SELECT.\r\n\r\n     Input                              Output\r\nName  Balance                Name   Balance\r\nA        1000                       A       1000\r\nB        NULL                       B       0\r\nC        2000                       C       1000","QueryAns":"<br/>SELECT Name, ISNULL(Balance, 0) as Balance FROM Table_Name","QueryInsertDate":"2020-06-25T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":3,"Description":null},{"QueryID":6,"Query":"What should be the out of following query?\r\nID       Name   DeptID\r\n1            A        1\r\n2            B        2\r\n3            C        3\r\nNULL    D        NULL\r\n\r\nSelect count(a.ID) as Total from Emp as a Left Join Emp as b ON a.ID=b.ID","QueryAns":"<br/>3","QueryInsertDate":"2020-06-25T00:00:00","ImagePath":null,"likeCount":1,"dislikeCount":0,"clapCount":6,"Description":null},{"QueryID":1035,"Query":"Write a query to fetch ALTERNATE records from below table. (EVEN RECORDS)         \r\n\r\nStudent (Rno int, Name varchar(50), City varchar(20))","QueryAns":"SELECT Rno, name<br/>\r\nFROM (<br/>\r\n    SELECT *, Row_Number() OVER(ORDER BY Rno) AS RowNumber <br/>\r\n            FROM student<br/>\r\n) t<br/>\r\nWHERE t.RowNumber % 2 = 0","QueryInsertDate":"2020-06-25T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":2,"Description":null},{"QueryID":1036,"Query":"Write a query to fetch ALTERNATE records from below table. (ODD RECORDS)         \r\n\r\nStudent (Rno int, Name varchar(50), City varchar(20))","QueryAns":"SELECT Rno, name<br/>\r\nFROM (<br/>\r\n    SELECT *, Row_Number() OVER(ORDER BY Rno) AS RowNumber <br/>\r\n            \r\n    FROM student<br/>\r\n) t<br/>\r\n\r\nWHERE t.RowNumber % 2 = 1","QueryInsertDate":"2020-06-25T00:00:00","ImagePath":null,"likeCount":0,"dislikeCount":0,"clapCount":8,"Description":null},{"QueryID":1032,"Query":"Query to list city names from the below table which have vowels as both their first and last characters.\r\n\r\nSTATION(Id, City, Longitude, Latitude)","QueryAns":"SELECT City FROM STATION <br/>\r\nWHERE City LIKE '[AEIOU]%[AEIOU]'<br/><br/>\r\nOR<br/><br/>\r\nSELECT distinct City FROM STATION <br/>\r\nWHERE City LIKE '[A,E,I,O,U]%[A,E,I,O,U]'","QueryInsertDate":"2020-06-03T00:00:00","ImagePath":null,"likeCount":3,"dislikeCount":0,"clapCount":0,"Description":null},{"QueryID":1033,"Query":"Query to diplay output as per below.\r\n\r\nInput                                        Output\r\nEId   Did   Remarks          EId   Did   Remarks\r\n1      1          40                1       A         50   \r\n2      1          50                1       A         50   \r\n3      2          30                2       B         60   \r\n4      2          60                2       B         60","QueryAns":"SELECT Eid, Did,<br/> \r\nCASE WHEN Remarks = 40 THEN 50 <br/>\r\nWHEN Remarks = 30 THEN 60 <br/>\r\nELSE Remarks END <br/>\r\nfrom Table_Name","QueryInsertDate":"2020-06-03T00:00:00","ImagePath":null,"likeCount":1,"dislikeCount":0,"clapCount":2,"Description":null}]

class Query {
  Query({
    num? isResult,
    String? message,
    List<ResultList>? resultList,
  }) {
    _isResult = isResult;
    _message = message;
    _resultList = resultList;
  }

  Query.fromJson(dynamic json) {
    _isResult = json['IsResult'];
    _message = json['Message'];
    if (json['ResultList'] != null) {
      _resultList = [];
      json['ResultList'].forEach((v) {
        _resultList?.add(ResultList.fromJson(v));
      });
    }
  }
  num? _isResult;
  String? _message;
  List<ResultList>? _resultList;
  Query copyWith({
    num? isResult,
    String? message,
    List<ResultList>? resultList,
  }) =>
      Query(
        isResult: isResult ?? _isResult,
        message: message ?? _message,
        resultList: resultList ?? _resultList,
      );
  num? get isResult => _isResult;
  String? get message => _message;
  List<ResultList>? get resultList => _resultList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['IsResult'] = _isResult;
    map['Message'] = _message;
    if (_resultList != null) {
      map['ResultList'] = _resultList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// QueryID : 1046
/// Query : "Write a query to list all tables of a database in SQL SERVER"
/// QueryAns : "select * from [INFORMAION_SCHEMA].[TABLES]\r\n<br/><br/>OR<br/><br/>\r\nselect * from sys.tables\r\n<br/><br/>OR<br/><br/>\r\nselect * from sysobjects where xtype='u'"
/// QueryInsertDate : "2021-06-02T00:00:00"
/// ImagePath : null
/// likeCount : 0
/// dislikeCount : 0
/// clapCount : 64
/// Description : null

class ResultList {
  ResultList({
    num? queryID,
    String? query,
    String? queryAns,
    String? queryInsertDate,
    dynamic imagePath,
    num? likeCount,
    num? dislikeCount,
    num? clapCount,
    dynamic description,
  }) {
    _queryID = queryID;
    _query = query;
    _queryAns = queryAns;
    _queryInsertDate = queryInsertDate;
    _imagePath = imagePath;
    _likeCount = likeCount;
    _dislikeCount = dislikeCount;
    _clapCount = clapCount;
    _description = description;
  }

  ResultList.fromJson(dynamic json) {
    _queryID = json['QueryID'];
    _query = json['Query'];
    _queryAns = json['QueryAns'];
    _queryInsertDate = json['QueryInsertDate'];
    _imagePath = json['ImagePath'];
    _likeCount = json['likeCount'];
    _dislikeCount = json['dislikeCount'];
    _clapCount = json['clapCount'];
    _description = json['Description'];
  }
  num? _queryID;
  String? _query;
  String? _queryAns;
  String? _queryInsertDate;
  dynamic _imagePath;
  num? _likeCount;
  num? _dislikeCount;
  num? _clapCount;
  dynamic _description;
  ResultList copyWith({
    num? queryID,
    String? query,
    String? queryAns,
    String? queryInsertDate,
    dynamic imagePath,
    num? likeCount,
    num? dislikeCount,
    num? clapCount,
    dynamic description,
  }) =>
      ResultList(
        queryID: queryID ?? _queryID,
        query: query ?? _query,
        queryAns: queryAns ?? _queryAns,
        queryInsertDate: queryInsertDate ?? _queryInsertDate,
        imagePath: imagePath ?? _imagePath,
        likeCount: likeCount ?? _likeCount,
        dislikeCount: dislikeCount ?? _dislikeCount,
        clapCount: clapCount ?? _clapCount,
        description: description ?? _description,
      );
  num? get queryID => _queryID;
  String? get query => _query;
  String? get queryAns => _queryAns;
  String? get queryInsertDate => _queryInsertDate;
  dynamic get imagePath => _imagePath;
  num? get likeCount => _likeCount;
  num? get dislikeCount => _dislikeCount;
  num? get clapCount => _clapCount;
  dynamic get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['QueryID'] = _queryID;
    map['Query'] = _query;
    map['QueryAns'] = _queryAns;
    map['QueryInsertDate'] = _queryInsertDate;
    map['ImagePath'] = _imagePath;
    map['likeCount'] = _likeCount;
    map['dislikeCount'] = _dislikeCount;
    map['clapCount'] = _clapCount;
    map['Description'] = _description;
    return map;
  }
}
