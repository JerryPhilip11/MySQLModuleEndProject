/*Create a database named library and create following TABLES in the database:
1. Branch
2. Employee
3. Customer
4. IssueStatus
5. ReturnStatus
6. Books
*/

CREATE DATABASE library;


USE library;

/*
Attributes for the tables:
1. Branch
∙ Branch_no - Set as PRIMARY KEY
∙ Manager_Id
∙ Branch_address
∙ Contact_no
*/

CREATE TABLE Branch (
    Branch_No INT PRIMARY KEY,
    Manager_Id INT,
    Branch_Address VARCHAR(200),
    Contact_No VARCHAR(20)
);

DESC Branch;

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, 'ABC City,Kannur', '+91 5644567890'),
(2, 102, 'CVT City,Kochi', '+91 98006543210'),
(3, 103, 'RGP Nagar,Kozhikode', '+91 87654321111'),
(4, 104, 'QRT Squre,Kollam', '+91 7698574364'),
(5, 105, 'NLR City Malapuram', '+91 6544527987');

SELECT * FROM Branch;

/*
2. Employee
∙ Emp_Id – Set as PRIMARY KEY
∙ Emp_name
∙ Position
∙ Salary
∙ Branch_no - Set as FOREIGN KEY and it should refer branch_no in
EMPLOYEE table
*/

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

DESC Employee;

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(101, 'Alex Johnson', 'Librarian', 50000, 1),
(102, 'Aleena Paul', 'Assistant Librarian', 45000, 2),
(103, 'Jomon Thomas', 'Clerk', 35000, 3),
(104, 'Kiran Kumar', 'Manager', 60000, 4),
(105, 'Saji K', 'Security', 30000, 5),
(106, 'Blessy Isac', 'Cataloguer', 48000, 1),
(107, 'Priyanka Kumari', 'Janitor', 32000, 2),
(108, 'Suvarna Gowda', 'IT Specialist', 55000, 3),
(109, 'Ajeena AJ', 'Assistant Manager', 52000, 4),
(110, 'Alfin Jills', 'Maintenance', 25000, 5);

SELECT * FROM Employee;

/*
3. Customer
∙ Customer_Id - Set as PRIMARY KEY
∙ Customer_name
∙ Customer_address
∙ Reg_date
*/


CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(200),
    Customer_address VARCHAR(200),
    Reg_date DATE
);

DESC Customer;


INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(201, 'Raneesh ram', 'csd Kannur', '2023-11-26'),
(202, 'Preethi Philip', 'zxd Iritty', '2022-10-14'),
(203, 'Rosmin Antony', 'qwd Kozhikode', '2023-05-02'),
(204, 'Riya Maria', 'mnb Kakkad', '2023-07-01'),
(205, 'Alex Antony', 'rte Peravoor', '2024-01-10'),
(206, 'Sowmya sunny', 'bvc Manjeri', '2023-02-15'),
(207, 'Vipin Vinod', 'xzu kannapuram', '2023-12-18'),
(208, 'Prasanth K', 'dsa Mahi', '2023-05-30'),
(209, 'Baiju N Nair', 'tty Kochi', '2023-07-12'),
(210, 'Gokul K', 'aqw Kottayam', '2024-01-05'),
(211, 'Prince Santhosh', 'ert Majeri', '2023-05-05');

SELECT * FROM Customer;

/*
4. Books
∙ ISBN - Set as PRIMARY KEY
∙ Book_title
∙ Category
∙ Rental_Price
∙ Status [Give yes if book available and no if book not available] ∙
Author
∙ Publisher
*/

CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(200),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(200),
    Publisher VARCHAR(200)
);

DESC Books;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
  (1001, 'shadow and bone', 'Fiction',315, 'yes', 'Leigh Bardugo', 'Macmillan Publishers'),
  (1002, 'Aadujeevitham', 'Bildungsroman',188, 'yes', 'Benyamin', 'Green Books'),
  (1003, "Harry Potter and the Sorcerer's Stone", 'Fantasy',255, 'yes', 'J.K. Rowling', 'Scholastic'),
  (1004, 'Aarachaar', 'Novel',255, 'No', 'K. R. Meera', 'DC Books'),
  (1005, 'The Alchemist', 'Fantasy Fiction', 200, 'yes','Paulo Coelho','HarperCollins Publishers'),
  (1006, 'On Writing : A Memoir of the Craft','Non Fiction',200,'No','Stephen King','Hodder and Stoughton'),
  (1007, '1984','Political fiction',299,'No','George Orwell','VSecker & Warburg'),
  (1008, 'Aalahayude Penmakkal','novel',199,'yes','Sarah Joseph','Current Books'),
  (1009, 'Sugandhi Enna Andal Devanayaki','Post Morden Novel',199,'no','T. D. Ramakrishnan','DC Books'),
  (1010,'The Kite Runner','Drama',200,'no','Khaled Hosseini','Riverhead Books'),
  (1011, 'Wings of Fire','Autobiography',99,'yes',' A. P. J. Abdul Kalam, Arun Tiwari','Universities Press');
  
  SELECT * FROM Books;
  
  /*
5. IssueStatus
∙ Issue_Id - Set as PRIMARY KEY
∙ Issued_cust – Set as FOREIGN KEY and it refer customer_id in
CUSTOMER table
∙ Issued_book_name
∙ Issue_date
∙ Isbn_book – Set as FOREIGN KEY and it should refer isbn in
BOOKS table
*/
  
  CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(200),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(Isbn)
);

DESC IssueStatus;

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES 
  (3001, 201, 'Aarachaar', '2023-02-10', 1004),
  (3002, 202, 'On Writing : A Memoir of the Craft', '2023-01-20', 1006),
  (3003, 203, '1984', '2023-03-05', 1007),
  (3004, 204, 'Sugandhi Enna Andal Devanayaki', '2023-06-15', 1009),
  (3005, 205, 'The Kite Runner', '2023-09-01', 1010);
  
  SELECT * FROM IssueStatus;
  
  /*
6. ReturnStatus
∙ Return_Id - Set as PRIMARY KEY
∙ Return_cust
∙ Return_book_name
∙ Return_date
∙ Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in
BOOKS table
*/

  
  CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(200),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Isbn_book2) REFERENCES Books(Isbn)
);

DESC ReturnStatus;

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES 
  (4001, 201, 'shadow and bone', '2023-03-05', 1001),
  (4002, 202, 'Wings of Fire', '2023-02-15', 1011),
  (4003, 203, 'Harry Potter and the Sorcerer''s Stone', '2023-04-20', 1003),
  (4004, 204, 'Aadujeevitham', '2023-07-01', 1002),
  (4005, 205, 'Aalahayude Penmakkal', '2023-09-30', 1008);
  
  SELECT * FROM ReturnStatus;
  
  -- Write the queries for the following:

-- 1. Retrieve the book title, category, and rental price of all available books.

SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
	  
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.

SELECT B.Book_title, C.Customer_name FROM Books B JOIN IssueStatus I ON B.ISBN = I.Isbn_book JOIN Customer C ON I.Issued_cust = C.Customer_Id;

-- 4. Display the total count of books in each category.

SELECT Category, COUNT(*) AS BookCount FROM Books GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
	
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch.

SELECT Branch_no, COUNT(*) AS EmployeeCount FROM Employee GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.
	
SELECT DISTINCT C.Customer_name FROM Customer C JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust WHERE MONTH(I.Issue_date) = 6 AND YEAR(I.Issue_date) = 2023;

-- 9. Retrieve book_title from book table containing history. 

SELECT Book_title FROM Books WHERE Category LIKE '%history%';

-- 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
	
SELECT Branch_no, COUNT(*) AS EmployeeCount FROM Employee GROUP BY Branch_no HAVING COUNT(*) > 5;
  
  




