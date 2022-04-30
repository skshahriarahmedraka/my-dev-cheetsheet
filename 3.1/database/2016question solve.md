# 2016
## Part A 
### 1(a)(1) 
  There are lots of situations where we need to alter and need to update existing data.
  add,remove, or change information with SQL
  
  1. Deletion

    A delete request is expressed in much the same way as a query. We can delete only
    whole tuples; we cannot delete values on only particular attributes. SQL expresses
    a deletion by

    delete from r
    where P;

    where P represents a predicate and r represents a relation. The delete statement
    first finds all tuples t in r for which P(t) is true, and then deletes them from r. The
    where clause can be omitted, in which case all tuples in r are deleted.

    Note that a delete command operates on only one relation. If we want to delete
    tuples from several relations, we must use one delete command for each relation.
    The predicate in the where clause may be as complex as a select command’s
    where clause. At the other extreme, the where clause may be empty. The request

    delete from instructor;

    deletes all tuples from the instructor relation. The instructor relation itself still
    exists, but it is empty.

    Here are examples of SQL delete requests:

    • Delete all tuples in the instructor relation pertaining to instructors in the
    Finance department.

    delete from instructor
    where dept_name= ’Finance’;

    • Delete all instructors with a salary between $13,000 and $15,000.

    delete from instructor
    where salary between 13000 and 15000;

    • Delete all tuples in the instructor relation for those instructors associated with
    a department located in the Watson building.

    delete from instructor
    where dept_name in (select dept_name

    from department
    where building = ’Watson’);

    This delete request first finds all departments located in Watson, and then
    deletes all instructor tuples pertaining to those departments.

    Note that, although we may delete tuples from only one relation at a time,
    we may reference any number of relations in a select-from-where nested in the
    where clause of a delete. The delete request can contain a nested select that
    references the relation from which tuples are to be deleted. For example, suppose
    that we want to delete the records of all instructors with salary below the average
    at the university. We could write:

    delete from instructor
    where salary< (select avg (salary)

    from instructor);

    The delete statement first tests each tuple in the relation instructor to check
    whether the salary is less than the average salary of instructors in the univer?sity. Then, all tuples that fail the test— that is, represent an instructor with a
    lower-than-average salary—are deleted. Performing all the tests before perform?ing any deletion is important—if some tuples are deleted before other tuples have been tested, the average salary may change, and the final result of the delete
    would depend on the order in which the tuples were processed!
  
    2. Insertion

    To insert data into a relation, we either specify a tuple to be inserted or write a
    query whose result is a set of tuples to be inserted. Obviously, the attribute values
    for inserted tuples must be members of the corresponding attribute’s domain.
    Similarly, tuples inserted must have the correct number of attributes.

    The simplest insert statement is a request to insert one tuple. Suppose that
    we wish to insert the fact that there is a course CS-437 in the Computer Science
    department with title “Database Systems”, and 4 credit hours. We write:

    insert into course

    values (’CS-437’, ’Database Systems’, ’Comp. Sci.’, 4);

    In this example, the values are specified in the order in which the corresponding
    attributes are listed in the relation schema. For the benefit of users who may not
    remember the order of the attributes, SQL allows the attributes to be specified as
    part of the insert statement. For example, the following SQL insert statements are
    identical in function to the preceding one:

    insert into course (course_id, title, dept_name, credits)

    values (’CS-437’, ’Database Systems’, ’Comp. Sci.’, 4);

     

    insert into course (title, course_id, credits, dept_name)

    values (’Database Systems’, ’CS-437’, 4, ’Comp. Sci.’);

    More generally, we might want to insert tuples on the basis of the result of a
    query. Suppose that we want to make each student in the Music department who
    has earned more than 144 credit hours, an instructor in the Music department,
    with a salary of $18,000. We write:

    insert into instructor

    select ID, name, dept_name, 18000
    from student
    where dept_name = ’Music’ and tot_cred > 144;

    Instead of specifying a tuple as we did earlier in this section, we use a select to
    specify a set of tuples. SQL evaluates the select statement first, giving a set of
    tuples that is then inserted into the instructor relation. Each tuple has an ID, a
    name, a dept name (Music), and an salary of $18,000.

    It is important that we evaluate the select statement fully before we carry
    out any insertions. If we carry out some insertions even as the select statement is
    being evaluated, a request such as:

    insert into student

    select *
    from student;

    might insert an infinite number of tuples, if the primary key constraint on student
    were absent. Without the primary key constraint, the request would insert the
    first tuple in student again, creating a second copy of the tuple. Since this second
    copy is part of student now, the select statement may find it, and a third copy
    would be inserted into student. The select statement may then find this third
    copy and insert a fourth copy, and so on, forever. Evaluating the select statement
    completely before performing insertions avoids such problems. Thus, the above
    insert statement would simply duplicate every tuple in the student relation, if the
    relation did not have a primary key constraint.

    Our discussion of the insert statement considered only examples in which
    a value is given for every attribute in inserted tuples. It is possible for inserted
    tuples to be given values on only some attributes of the schema. The remaining
    attributes are assigned a null value denoted by null. Consider the request:

    insert into student

    values (’3003’, ’Green’, ’Finance’, null);

    The tuple inserted by this request specified that a student with ID “3003” is in the
    Finance department, but the tot cred value for this student is not known. Consider
    the query:

    select student
    from student
    where tot_cred > 45;

    Since the tot_cred value of student “3003” is not known, we cannot determine
    whether it is greater than 45.

    Most relational database products have special “bulk loader” utilities to insert
    a large set of tuples into a relation. These utilities allow data to be read from
    formatted text files, and can execute much faster than an equivalent sequence of
    insert statements.
      3. Updates

    In certain situations, we may wish to change a value in a tuple without changing
    all values in the tuple. For this purpose, the update statement can be used. As we
    could for insert and delete, we can choose the tuples to be updated by using a
    query.

    Suppose that annual salary increases are being made, and salaries of all in?structors are to be increased by 5 percent. We write:

    update instructor
    set salary= salary * 1.05;

    The preceding update statement is applied once to each of the tuples in instructor
    relation.

    If a salary increase is to be paid only to instructors with salary of less than
    $70,000, we can write:

    update instructor
    set salary = salary * 1.05
    where salary < 70000;

    In general, the where clause of the update statement may contain any construct
    legal in the where clause of the select statement (including nested selects). As
    with insert and delete, a nested select within an update statement may reference
    the relation that is being updated. As before, SQL first tests all tuples in the relation
    to see whether they should be updated, and carries out the updates afterward.
    For example, we can write the request “Give a 5 percent salary raise to instructors
    whose salary is less than average” as follows:

    update instructor
    set salary = salary * 1.05
    where salary < (select avg (salary)

    from instructor);

    Let us now suppose that all instructors with salary over $100,000 receive a
    3 percent raise, whereas all others receive a 5 percent raise. We could write two
    update statements:

    update instructor
    set salary = salary * 1.03
    where salary > 100000;

    update instructor
    set salary = salary * 1.05
    where salary <= 100000;

    Note that the order of the two update statements is important. If we changed the
    order of the two statements, an instructor with a salary just under $100,000 would
    receive an over 8 percent raise.

    SQL provides a case construct that we can use to perform both the updates
    with a single update statement, avoiding the problem with the order of updates.

    update instructor
    set salary = case
    when salary <= 100000 then salary * 1.05
    else salary * 1.03
    end

    The general form of the case statement is as follows.

    case
    when pred1 then result1
    when pred2 then result2
    ...
    when predn then resultn
    else result0
    end
    The operation returns resulti , where i is the first of pred1, pred2,..., predn that is
    satisfied; if none of the predicates is satisfied, the operation returns result0. Case
    statements can be used in any place where a value is expected.

    Scalar subqueries are also useful in SQL update statements, where they can be
    used in the set clause. Consider an update where we set the tot cred attribute of
    each student tuple to the sum of the credits of courses successfully completed by
    the student. We assume that a course is successfully completed if the student has
    a grade that is not ’F’ or null. To specify this update, we need to use a subquery
    in the set clause, as shown below:

    update student S
    set tot_cred = (
    select sum(credits)
    from takes natural join course
    where S.ID= takes.ID and
    takes.grade <> ’F’ and
    takes.grade is not null);

    Observe that the subquery uses a correlation variable S from the update statement.
    In case a student has not successfully completed any course, the above update
    statement would set the tot cred attribute value to null. To set the value to 0
    instead, we could use another update statement to replace null values by 0; a
    better alternative is to replace the clause “select sum(credits)” in the preceding
    subquery by the following select clause using a case expression:

    select case
    when sum(credits) is not null then sum(credits)
    else 0
    end

### 1(a)(ii)
  https://www.geeksforgeeks.org/domain-constraints-in-dbms/ 
  
  In DBMS, constraints are the set of rules that ensures that when an authorized user modifies the database they do not disturb the data consistency and the constraints are specified within the DDL commands like “alter” and “create” command. There are several types of constraints available in DBMS and they are:

  Domain constraints
  Entity Integrity constraints
  Referential Integrity constraints
  Key constraints
  In this article, we will only discuss domain constraints.
    
  Domain Constraints
  Domain Constraints are user-defined columns that help the user to enter the value according to the data type. And if it encounters a wrong input it gives the message to the user that the column is not fulfilled properly. Or in other words, it is an attribute that specifies all the possible values that the attribute can hold like integer, character, date, time, string, etc. It defines the domain or the set of values for an attribute and ensures that the value taken by the attribute must be an atomic value(Can’t be divided) from its domain.
  
  Domain Constraint = data type(integer / character/date / time / string / etc.) + 
                    Constraints(NOT NULL / UNIQUE / PRIMARY KEY / 
                                FOREIGN KEY / CHECK / DEFAULT)
  
  Type of domain constraints:

There are two types of constraints that come under domain constraint and they are:

1. Domain Constraints – Not Null: Null values are the values that are unassigned or we can also say that which are unknown or the missing attribute values and by default, a column can hold the null values. Now as we know that the Not Null constraint restricts a column to not accept the null values which means it only restricts a field to always contain a value which means you cannot insert a new record or update a record without adding a value into the field.

Example: In the ’employee’ database, every employee must have a name associated with them.

Create table employee
(employee_id varchar(30),
employee_name varchar(30) not null,
salary NUMBER);

  2. Domain Constraints – Check: It defines a condition that each row must satisfy which means it restricts the value of a column between ranges or we can say that it is just like a condition or filter checking before saving data into a column. It ensures that when a tuple is inserted inside the relation must satisfy the predicate given in the check clause.

Example: We need to check whether the entered id number is greater than 0 or not for the employee table.

Create table employee
(employee_id varchar(30) not null check(employee_id > 0),
employee_name varchar(30),
salary NUMBER);
The above example creates CHECK constraints on the employee_id column and specifies that the column employee_id must only include integers greater than 0.

Note: In DBMS a table is a combination of rows and columns in which we have some unique attribute names associated with it. And basically, a domain is a unique set of values present in a table. Let’s take an example, suppose we have a table student which consists of 3 attributes as NAME, ROLL NO, and MARKS. Now ROLL NO attributes can have only numbers associated with them and they won’t contain any alphabet. So we can say that it contains the domain of integer only and it can be only a positive number greater than 0.


### 1(a)(iii)


Database Schema
A database schema is the skeleton structure that represents the logical view of the entire database. It defines how the data is organized and how the relations among them are associated. It formulates all the constraints that are to be applied on the data.

A database schema defines its entities and the relationship among them. It contains a descriptive detail of the database, which can be depicted by means of schema diagrams. It’s the database designers who design the schema to help programmers understand the database and make it useful.




A database schema can be divided broadly into two categories −

Physical Database Schema − This schema pertains to the actual storage of data and its form of storage like files, indices, etc. It defines how the data will be stored in a secondary storage.

Logical Database Schema − This schema defines all the logical constraints that need to be applied on the data stored. It defines tables, views, and integrity constraints.


Database Instance
It is important that we distinguish these two terms individually. Database schema is the skeleton of database. It is designed when the database doesn't exist at all. Once the database is operational, it is very difficult to make any changes to it. A database schema does not contain any data or information.

A database instance is a state of operational database with data at any given time. It contains a snapshot of the database. Database instances tend to change with time. A DBMS ensures that its every instance (state) is in a valid state, by diligently following all the validations, constraints, and conditions that the database designers have imposed.


### 1(b)
  CREATE TABLE  employee (
    Person_name VARCHAR(100) NOT NULL,
    Street VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL 
  ) 
  CREATE TABLE works (
    FOREIGN KEY (Person_name) REFERENCES employee(Person_name) 
    Company_name VARCHAR(100) NOT NULL 
    Salary int NOT NULL  
  )
  CREATE TABLE Company (
    FOREIGN KEY (Company_name) REFERENCES works(Company_name)
    city VARCHAR(100) NOT NULL
  )

### 1(b)(i)
  SELECT employee.Person_name , works.Company_name , employee.City 
  FROM employee INNER JOIN works ON employee.City = 'Dhaka';

### 1(b)(ii) 
  INSERT INTO City ='Khulna' FROM company WHERE Company_name='MRCP' and
  City ='Dhaka';

  INSERT INTO employee.City='Khulna' FROM employee INNER JOIN works ON
  employee.Person_name=works.Person_name AND works.Company_name='MRCP';


### 2(a)

### 2(b)
https://www.tutorialspoint.com/dbms/dbms_indexing.htm
https://www.geeksforgeeks.org/primary-indexing-in-databases/

What is Indexing?
Indexing is a data structure technique which allows you to quickly retrieve records from a database file. An Index is a small table having only two columns. The first column comprises a copy of the primary or candidate key of a table. Its second column contains a set of pointers for holding the address of the disk block where that specific key value stored.

Indexing is a way to optimize the performance of a database by minimizing the number of disk accesses required when a query is processed. It is a data structure technique that is used to quickly locate and access the data in a database.

Types of Indexing :
There are two ways as following below.

1. Single-level Indexing –

Primary indexing
Clustering Indexing
Secondary Indexing
2. Multilevel Indexing –

B Trees
B+ Trees
Primary indexing is defined mainly on the primary key of the data-file, in which the data-file is already ordered based on the primary key.

Primary Index is an ordered file whose records are of fixed length with two fields. The first field of the index replicates the primary key of the data file in an ordered manner, and the second field of the ordered file contains a pointer that points to the data-block where a record containing the key is available.

The first record of each block is called the Anchor record or Block anchor. There exists a record in the primary index file for every block of the data-file.

The average number of blocks using the Primary Index is = log2B + 1, where B is the number of index blocks. 

What is difference between primary index and secondary index?

Primary Index

a) It is an ordered file whose records are of fixed length along with two fields.

b) Only based upon the primary key.

c) The total number of entries in the index is similar as the number of disk blocks in the ordered data file.

d) Primary index is a king of nondense (sparse) index.

e) There might be at most one primary index for a file

f) Requires less storage space.

Secondary index

a) It offers a secondary means of accessing a file for which a few primary access already exists.

b) May be relies on candidate key or secondary key.

c) It comprises large number entries because of duplication.

d) Secondary index is a type of dense index.

e) There may be much more than one secondary indexes for the same file.

f) Requires more storage space and longer search time.

We know that data is stored in the form of records. Every record has a key field, which helps it to be recognized uniquely.

Indexing is a data structure technique to efficiently retrieve records from the database files based on some attributes on which the indexing has been done. Indexing in database systems is similar to what we see in books.

Indexing is defined based on its indexing attributes. Indexing can be of the following types −

Primary Index − Primary index is defined on an ordered data file. The data file is ordered on a key field. The key field is generally the primary key of the relation.

Secondary Index − Secondary index may be generated from a field which is a candidate key and has a unique value in every record, or a non-key with duplicate values.

Clustering Index − Clustering index is defined on an ordered data file. The data file is ordered on a non-key field.

Ordered Indexing is of two types −

Dense Index
Sparse Index
Dense Index
In dense index, there is an index record for every search key value in the database. This makes searching faster but requires more space to store index records itself. Index records contain search key value and a pointer to the actual record on the disk.

Dense Index
Sparse Index
In sparse index, index records are not created for every search key. An index record here contains a search key and an actual pointer to the data on the disk. To search a record, we first proceed by index record and reach at the actual location of the data. If the data we are looking for is not where we directly reach by following the index, then the system starts sequential search until the desired data is found.

Sparse Index
Multilevel Index
Index records comprise search-key values and data pointers. Multilevel index is stored on the disk along with the actual database files. As the size of the database grows, so does the size of the indices. There is an immense need to keep the index records in the main memory so as to speed up the search operations. If single-level index is used, then a large size index cannot be kept in memory which leads to multiple disk accesses.

Multi-level Index
Multi-level Index helps in breaking down the index into several smaller indices in order to make the outermost level so small that it can be saved in a single disk block, which can easily be accommodated anywhere in the main memory.

B+ Tree
A B+ tree is a balanced binary search tree that follows a multi-level index format. The leaf nodes of a B+ tree denote actual data pointers. B+ tree ensures that all leaf nodes remain at the same height, thus balanced. Additionally, the leaf nodes are linked using a link list; therefore, a B+ tree can support random access as well as sequential access.

Structure of B+ Tree
Every leaf node is at equal distance from the root node. A B+ tree is of the order n where n is fixed for every B+ tree.

B+ tree
Internal nodes −

Internal (non-leaf) nodes contain at least ⌈n/2⌉ pointers, except the root node.
At most, an internal node can contain n pointers.
Leaf nodes −

Leaf nodes contain at least ⌈n/2⌉ record pointers and ⌈n/2⌉ key values.
At most, a leaf node can contain n record pointers and n key values.
Every leaf node contains one block pointer P to point to next leaf node and forms a linked list.
B+ Tree Insertion
B+ trees are filled from bottom and each entry is done at the leaf node.

If a leaf node overflows −
Split node into two parts.

Partition at i = ⌊(m+1)/2⌋.

First i entries are stored in one node.

Rest of the entries (i+1 onwards) are moved to a new node.

ith key is duplicated at the parent of the leaf.

If a non-leaf node overflows −

Split node into two parts.

Partition the node at i = ⌈(m+1)/2⌉.

Entries up to i are kept in one node.

Rest of the entries are moved to a new node.

B+ Tree Deletion
B+ tree entries are deleted at the leaf nodes.

The target entry is searched and deleted.

If it is an internal node, delete and replace with the entry from the left position.

After deletion, underflow is tested,

If underflow occurs, distribute the entries from the nodes left to it.

If distribution is not possible from left, then

Distribute from the nodes right to it.

If distribution is not possible from left or from right, then

Merge the node with left and right to it.


Multi-level indexes in an index sequential file structure
Consider a bank with 100 million customers. They all have their own account number, which is an 8-digit number. Sometimes, the whole file holding the customers' details is accessed in batch processing mode, for example to print statements every month and sometimes individual records are retrieved, for example, when a customer has a query about their account. Because of this, the index sequential method of organising these records has been selected. The records are organised by putting the account numbers in sequential order. An index is then designed.  Imagine we didn't have an index, just one big sequential file. To find a particular account, you would go to the beginning of the file, and search one record after another until you either find the record or come to the end of the file. This is a simple system but with so many records it would take a long time. You could end up checking 100 million records before you found the one you wanted!

### 2(c)
Difference between Deferred update and Immediate update
1. Deferred Update : 
It is a technique for the maintenance of the transaction log files of the DBMS. It is also called NO-UNDO/REDO technique. It is used for the recovery of the transaction failures which occur due to power, memory or OS failures. Whenever any transaction is executed, the updates are not made immediately to the database. They are first recorded on the log file and then those changes are applied once commit is done. This is called “Re-doing” process. Once the rollback is done none of the changes are applied to the database and the changes in the log file are also discarded. If commit is done before crashing of the system, then after restarting of the system the changes that have been recorded in the log file are thus applied to the database. 

2. Immediate Update : 
It is a technique for the maintenance of the transaction log files of the DBMS.It is also called UNDO/REDO technique. It is used for the recovery of the transaction failures which occur due to power, memory or OS failures. Whenever any transaction is executed, the updates are made directly to the database and the log file is also maintained which contains both old and new values. Once commit is done, all the changes get stored permanently into the database and records in log file are thus discarded.Once rollback is done the old values get restored in the database and all the changes made to the database are also discarded. This is called “Un-doing” process. If commit is done before crashing of the system, then after restarting of the system the changes are stored permanently in the database. 

Difference between Deferred update and Immediate update: 
 

S.NO.	Deferred Update	Immediate Update
1.	In deferred update, the changes are not applied immediately to the database.	In immediate update, the changes are applied directly to the database.
2.	The log file contains all the changes that are to be applied to the database.	The log file contains both old as well as new values.
3.	In this method once rollback is done all the records of log file are discarded and no changes are applied to the database.	In this method once rollback is done the old values are restored into the database using the records of the log file.
4.	Concepts of buffering and caching are used in deferred update method.	Concept of shadow paging is used in immediate update method.
5.	The major disadvantage of this method is that it requires a lot of time for recovery in case of system failure.	The major disadvantage of this method is that there are frequent I/O operations while the transaction is active.

## 3(a)
https://opentextbc.ca/dbdesign01/chapter/chapter-9-integrity-rules-and-constraints/
https://www.simplilearn.com/tutorials/sql-tutorial/integrity-constraints
https://www.geeksforgeeks.org/violation-of-constraints-in-relational-database/
  
Constraints are a very important feature in a relational model. In fact, the relational model supports the well-defined theory of constraints on attributes or tables. Constraints are useful because they allow a designer to specify the semantics of data in the database. Constraints are the rules that force DBMSs to check that data satisfies the semantics.

Domain Integrity
Domain restricts the values of attributes in the relation and is a constraint of the relational model. However, there are real-world semantics for data that cannot be specified if used only with domain constraints. We need more specific ways to state what data values are or are not allowed and which format is suitable for an attribute. For example, the Employee ID (EID) must be unique or the employee Birthdate is in the range [Jan 1, 1950, Jan 1, 2000]. Such information is provided in logical statements called integrity constraints.

There are several kinds of integrity constraints, described below.

Entity integrity
To ensure entity integrity, it is required that every table have a primary key. Neither the PK nor any part of it can contain null values. This is because null values for the primary key mean we cannot identify some rows. For example, in the EMPLOYEE table, Phone cannot be a primary key since some people may not have a telephone.

Referential integrity
Referential integrity requires that a foreign key must have a matching primary key or it must be null. This constraint is specified between two tables (parent and child); it maintains the correspondence between rows in these tables.  It means the reference from a row in one table to another table must be valid.

Examples of referential integrity constraint in the Customer/Order database of the Company:

Customer(CustID, CustName)
Order(OrderID, CustID, OrderDate)
To ensure that there are no orphan records, we need to enforce referential integrity. An orphan record is one whose foreign key FK value is not found in the corresponding entity – the entity where the PK is located. Recall that a typical join is between a PK and FK.

The referential integrity constraint states that the customer ID (CustID) in the Order table must match a valid CustID in the Customer table. Most relational databases have declarative referential integrity. In other words, when the tables are created the referential integrity constraints are set up.

Here is another example from a Course/Class database:

Course(CrsCode, DeptCode, Description)
Class(CrsCode, Section, ClassTime)
The referential integrity constraint states that CrsCode in the Class table must match a valid CrsCode in the Course table. In this situation, it’s not enough that the CrsCode and Section in the Class table make up the PK, we must also enforce referential integrity.

When setting up referential integrity it is important that the PK and FK have the same data types and come from the same domain, otherwise the relational database management system (RDBMS) will not allow the join. RDBMS is a popular database system that is based on the relational model introduced by E. F. Codd of IBM’s San Jose Research Laboratory. Relational database systems are easier to use and understand than other database systems.

Referential integrity in Microsoft Access
In Microsoft (MS) Access, referential integrity is set up by joining the PK in the Customer table to the CustID in the Order table. See Figure 9.1 for a view of how this is done on the Edit Relationships screen in MS Access.

A screenshot of the Edit Relationships commend in MS Access.
Figure 9.1. Referential access in MS Access, by A. Watt.
Referential integrity using Transact-SQL (MS SQL Server)
When using Transact-SQL, the referential integrity is set when creating the Order table with the FK. Listed below are the statements showing the FK in the Order table referencing the PK in the Customer table.

CREATE TABLE Customer
( CustID INTEGER PRIMARY KEY,
CustName CHAR(35) )
CREATE TABLE Orders
( OrderID INTEGER PRIMARY KEY,
CustID INTEGER REFERENCES Customer(CustID),
OrderDate DATETIME )
Foreign key rules
Additional foreign key rules may be added when setting referential integrity, such as what to do with the child rows (in the Orders table) when the record with the PK, part of the parent (Customer), is deleted or changed (updated). For example, the Edit Relationships window in MS Access (see Figure 9.1) shows two additional options for FK rules: Cascade Update and Cascade Delete. If these are not selected, the system will prevent the deletion or update of PK values in the parent table (Customer table) if a child record exists. The child record is any record with a matching PK.

In some databases, an additional option exists when selecting the Delete option called Set to Null. In this is chosen, the PK row is deleted, but the FK in the child table is set to NULL. Though this creates an orphan row, it is acceptable.

Enterprise Constraints
Enterprise constraints – sometimes referred to as semantic constraints – are additional rules specified by users or database administrators and can be based on multiple tables.

Here are some examples.

A class can have a maximum of 30 students.
A teacher can teach a maximum of four classes per semester.
An employee cannot take part in more than five projects.
The salary of an employee cannot exceed the salary of the employee’s manager.
Business Rules
Business rules are obtained from users when gathering requirements. The requirements-gathering process is very important, and its results should be verified by the user before the database design is built. If the business rules are incorrect, the design will be incorrect, and ultimately the application built will not function as expected by the users.

Some examples of business rules are:

A teacher can teach many students.
A class can have a maximum of 35 students.
A course can be taught many times, but by only one instructor.
Not all teachers teach classes.
Cardinality and connectivity
Business rules are used to determine cardinality and connectivity. Cardinality describes the relationship between two data tables by expressing the minimum and maximum number of entity occurrences associated with one occurrence of a related entity. In Figure 9.2, you can see that cardinality is represented by the innermost markings on the relationship symbol. In this figure, the cardinality is 0 (zero) on the right and 1 (one) on the left.

Connectivity-and-Cardinality-300x202
Figure 9.2. Position of connectivity and cardinality on a relationship symbol, by A. Watt.
The outermost symbol of the relationship symbol, on the other hand, represents the connectivity between the two tables. Connectivity is the relationship between two tables, e.g., one to one or one to many. The only time it is zero is when the FK can be null. When it comes to participation, there are three options to the relationship between these entities: either 0 (zero), 1 (one) or many. In Figure 9.2, for example, the connectivity is 1 (one) on the outer, left-hand side of this line and many on the outer, right-hand side.

Figure 9.3. shows the symbol that represents a one to many relationship.

Ch-9-oneToMany-1
Figure 9.3.
In Figure 9.4, both inner (representing cardinality) and outer (representing connectivity) markers are shown. The left side of this symbol  is read as minimum 1 and maximum 1. On the right side, it is read as: minimum 1 and maximum many.

Ch-9-oneToMany-2
Figure 9.4.
Relationship Types
The line that connects two tables, in an ERD, indicates the relationship type between the tables: either identifying or non-identifying. An identifying relationship will have a solid line (where the PK contains the FK). A non-identifying relationship is indicated by a broken line and does not contain the FK in the PK. See the section in Chapter 8 that discusses weak and strong relationships for more explanation.

Figure 9.5. Identifying and non-identifying relationship.
Figure 9.5. Identifying and non-identifying relationship, by A. Watt.
Optional relationships
In an optional relationship, the FK can be null or the parent table does not need to have a corresponding child table occurrence. The symbol, shown in Figure 9.6, illustrates one type with a zero and three prongs (indicating many) which is interpreted as zero OR many.

Ch-9-Zero-or-Many-1
Figure 9.6.
For example, if you look at the Order table on  the right-hand side of Figure 9.7, you’ll notice that a customer doesn’t need to place an order to be a customer. In other words, the many side is optional.

Cardinality-Optional-0-or-more-300x189
Figure 9.7. Example usage of a zero to many optional relationship symbol, by A. Watt.
The relationship symbol in Figure 9.7 can also be read as follows:

Left side: The order entity must contain a minimum of one related entity in the Customer table and a maximum of one related entity.
Right side: A customer can place a minimum of zero orders or a maximum of many orders.
Figure 9.8  shows another type of optional relationship symbol with a zero and one, meaning zero OR one.  The one side is optional.

Ch-9-Optional-Arrow-2
Figure 9.8.
Figure 9.9 gives an example of how a zero to one symbol might be used.

Cardinality-Optional-0-or-1-300x188
Figure 9.9. Example usage of a zero to one optional relationship symbol, by A. Watt.
 

Mandatory relationships
In a mandatory relationship, one entity occurrence requires a corresponding entity occurrence. The symbol for this relationship shows one and only one as shown in Figure 9.10. The one side is mandatory.

Ch-9-oneToOne-1
Figure 9.10
See Figure 9.11 for an example of how the one and only one mandatory symbol is used.

Ch-9-Mandatory-Cardinality-one-to-one-300x188
Figure 9.11. Example of a one and only one mandatory relationship symbol, by A. Watt.
Figure 9.12 illustrates what a one to many relationship symbol looks like where the many side is mandatory.

Ch-9-oneToMany-3
Figure 9.12.
Refer to Figure 9.13 for an example of how the one to many symbol may be used.

Ch-9-Mandatory-Cardinality-one-to-Many-300x188
Figure 9.13. Example of a one to many mandatory relationship symbol, by A. Watt.
So far we have seen that the innermost side of a relationship symbol (on the left-side of the symbol in Figure 9.14) can have a 0 (zero) cardinality and a connectivity of many (shown on the right-side of the symbol in Figure 9.14), or one (not shown).

Ch-9-Zero-or-Many-1
Figure 9.14
However,  it cannot have a connectivity of 0 (zero), as displayed in Figure 9.15. The connectivity can only be 1.

Ch-9-Zero-or-Many-2
Figure 9.15.
The connectivity symbols show maximums. So if you think about it logically, if the connectivity symbol on the left side shows 0 (zero), then there would be no connection between the tables.

The way to read a relationship symbol, such as the one in Figure 9.16, is as follows.

The CustID in the Order table must also be found in the Customer table a minimum of 0 and a maximum of 1 times.
The 0 means that the CustID in the Order table may be null.
The left-most 1 (right before the 0 representing connectivity) says that if there is a CustID in the Order table, it can only be in the Customer table once.
When you see the 0 symbol for cardinality, you can assume two things: T
the FK in the Order table allows nulls, and
the FK is not part of the PK since PKs must not contain null values.

Key Terms

business rules: obtained from users when gathering requirements and are used to determine cardinality
cardinality: expresses the minimum and maximum number of entity occurrences associated with one occurrence of a related entity

connectivity: the relationship between two tables, e.g., one to one or one to many

constraints: the rules that force DBMSs to check that data satisfies the semantics

entity integrity: requires that every table have a primary key; neither the primary key, nor any part of it, can contain null values

identifying relationship: where the primary key contains the foreign key; indicated in an ERD by a solid line

integrity constraints: logical statements that state what data values are or are not allowed and which format is suitable for an attribute

mandatory relationship:one entity occurrence requires a corresponding entity occurrence.

non-identifying relationship: does not contain the foreign key in the primary key; indicated in an ERD by a dotted line

optional relationship: the FK can be null or the parent table does not need to have a corresponding child table occurrence

orphan record: a record whose foreign key value is not found in the corresponding entity –  the entity where the primary key is located

referential integrity: requires that a foreign key must have a matching primary key or it must be null

relational database management system (RDBMS): a popular database system based on the relational model introduced by E. F. Codd of IBM’s San Jose Research Laboratory

relationship type: the type of relationship between two tables in an ERD (either identifying or non-identifying); this relationship is indicated by a line drawn between the two tables. 

## 3(b)

Fixed-length and Variable-length Records
A file can contain:

Fixed-length records - all the records are exactly the same length
Variable-length records - the length of each record varies
Fixed length records:-
1.All the records in the file are of same size.
2. Leads to memory wastage.
3. Access of the records is easier and faster.
4. Exact location of the records can be determined: location of ith record would be.n*(i-1), where n is the size of every record.


Variable length records:-
1.Different records in the file have different sizes.
2. Memory efficient.
3. Access of the records is slo

A fixed length record is one where the length of the fields in each record has been set to be a certain maximum number of characters long. Suppose a field that was going to contain a name was set to be 25 characters long. This means that the field could only ever contain up to 25 characters. If all the fields in the record have a fixed length like this then the record is said to be a fixed length record. The problem with fixed length records is that each field very rarely contains the maximum number of characters allowed. This means that a lot of space is needlessly set aside and wasted. Also, values sometimes cannot be entered because they are too large to fit inside the allowed space in a field. The advantage of fixed length records is that they make file processing much easier because the start and end of each record is always a fixed number of characters apart. This makes it much easier to locate both indicidual records and fields. 
A variable length record is one where the length of a field can change to allow data of any size to fit. The advantage of variable length records is that space is not wasted, only the space needed is ever used. The main problem with variable length records is that it is much more difficult to locate the start and end of individual records and fields. This is because they are not separated by a fixed amount of characters. To separate variable length recordseach field has a special character to mark where it ends- called an end- of- field marker. When records need to be located the computer must count through the end- of- field markers to locate individual records and fields. 


## 3(c)
https://www.javatpoint.com/dbms-raid#:~:text=RAID%20refers%20to%20redundancy%20array,upon%20the%20RAID%20level%20used.
https://www.tutorialspoint.com/what-is-raid-in-dbms

## 4(a)
https://www.guru99.com/dbms-transaction-management.html#:~:text=A%20transaction%20is%20a%20program,called%20a%20read%2Donly%20transaction.
https://www.tutorialspoint.com/dbms/dbms_transaction.htm
https://www.javatpoint.com/dbms-transaction-property
https://www.geeksforgeeks.org/transaction-management/

## 1(a)
https://siliconvalleygazette.com/en/traditional-file-system-vs-a-database-approach/
https://anydifferencebetween.com/file-processing-system-vs-database-approach/
https://quizlet.com/228757083/file-processing-approach-vs-database-approach-flash-cards/

File Processing System vs Database Approach
Summary: Difference Between File Processing System and Database Approach is that in the past, many organizations exclusively used file processing systems to store and manage data. In a typical file processing system, each department or area within an organization has its own set of files. The records in one file may not relate to the records in any other file. Organizations have used file processing systems for many years. While When an organization uses the database approach, many programs and users share the data in the database. A school’s database most likely at a minimum contains data about students, instructors, schedule of classes, and student schedules.
File Processing System
In the past, many organizations exclusively used file processing systems to store and manage data. In a typical file processing system, each department or area within an organization has its own set of files. The records in one file may not relate to the records in any other file. Organizations have used file processing systems for many years. Many of these systems, however, have two major weaknesses: they have redundant data and they isolate data.

1: Data Redundancy – Each department or area in an organization has its own files in a file processing system. Thus, the same fields are stored in multiple files. If a file processing system is used at a school, for example, the Student file and the Student Schedule file both might store the same students’ names and addresses.

Duplicating data in this manner wastes resources such as storage space and people’s time. When new students are added or student data is modified, file maintenance tasks consume additional time because people must update multiple files that contain the same data.

Data redundancy also can increase the chance of errors. If a student changes his or her address, for example, the school must update the address wherever it appears. If the Address field is not changed in all the files where it is stored, then discrepancies among the files exist.

2: Isolated Data – Often it is difficult to access data stored in separate files in different departments. Sharing data from multiple, separate files is a complicated procedure and usually requires the experience of a computer programmer.


Database Approach

When an organization uses the database approach, many programs and users share the data in the database. A school’s database most likely at a minimum contains data about students, instructors, schedule of classes, and student schedules. As shown in the above image, various areas within the school share and interact with the data in this database. The database does secure its data, however, so that only authorized users can access certain data items. While a user is working with the database, the DBMS resides in the memory of the computer.

The database approach addresses many of the weaknesses associated with file processing systems. The following list presents some strengths of the database approach.

difference between file processing and database

Reduced Data Redundancy – Most data items are stored in only one file, which greatly reduces duplicate data. The above image demonstrates the differences between how a file processing application and a database application might store data.
Improved Data Integrity – When users modify data in the database, they make changes to one file instead of multiple files. Thus, the database approach increases the data’s integrity by reducing the possibility of introducing inconsistencies.
Shared Data –  The data in a database environment belongs to and is shared, usually over a network, by the entire organization. Organizations that use databases typically have security settings to define who can access, add, modify, and delete the data in a database.
Easier Access – The database approach allows nontechnical users to access and maintain data, providing they have the necessary privileges.
Reduced Development Time – It often is easier and faster to develop programs that use the database approach.


## 1(b)

A Database Administrator (DBA) is individual or person responsible for controlling, maintenance, coordinating, and operation of database management system. Managing, securing, and taking care of database system is prime responsibility.

They are responsible and in charge for authorizing access to database, coordinating, capacity, planning, installation, and monitoring uses and for acquiring and gathering software and hardware resources as and when needed. Their role also varies from configuration, database design, migration, security, troubleshooting, backup, and data recovery. Database administration is major and key function in any firm or organization that is relying on one or more databases. They are overall commander of Database system.

Types of Database Administrator (DBA) :

Administrative DBA –
Their job is to maintain server and keep it functional. They are concerned with data backups, security, trouble shooting, replication, migration etc.
Data Warehouse DBA –
Assigned earlier roles, but held accountable for merging data from various sources into data warehouse. They also design warehouse, with cleaning and scrubs data prior to loading.
Development DBA –
They build and develop queries, stores procedure, etc. that meets firm or organization needs. They are par at programmer.
Application DBA –
They particularly manages all requirements of application components that interact with database and accomplish activities such as application installation and coordinating, application upgrades, database cloning, data load process management, etc.
Architect –
They are held responsible for designing schemas like building tables. They work to build structure that meets organisation needs. The design is further used by developers and development DBAs to design and implement real application.
OLAP DBA –
They design and builds multi-dimensional cubes for determination support or OLAP systems.
Importance of Database Administrator (DBA) :

Database Administrator manages and controls three levels of database like internal level, conceptual level, and external level of Database management system architecture and in discussion with comprehensive user community, gives definition of world view of database. It then provides external view of different users and applications.
Database Administrator ensures held responsible to maintain integrity and security of database restricting from unauthorized users. It grants permission to users of database and contains profile of each and every user in database.
Database Administrator also held accountable that database is protected and secured and that any chance of data loss keeps at minimum.
Role and Duties of Database Administrator (DBA) :

Decides hardware –
They decides economical hardware, based upon cost, performance and efficiency of hardware, and best suits organisation. It is hardware which is interface between end users and database.
Manages data integrity and security –
Data integrity need to be checked and managed accurately as it protects and restricts data from unauthorized use. DBA eyes on relationship within data to maintain data integrity.
Database design –
DBA is held responsible and accountable for logical, physical design, external model design, and integrity and security control.
Database implementation –
DBA implements DBMS and checks database loading at time of its implementation.
Query processing performance –
DBA enhances query processing by improving their speed, performance and accuracy.
Tuning Database Performance –
If user is not able to get data speedily and accurately then it may loss organization business. So by tuning SQL commands DBA can enhance performance of database.


## 1(c)
  https://www.learntek.org/blog/types-of-databases/
  https://www.datamation.com/big-data/what-is-data-modeling/
  https://www.studytonight.com/dbms/database-model.php
  https://www.educba.com/types-of-database-models/

  A database model shows the logical structure of a database, including the relationships and constraints that determine how data can be stored and accessed. Individual database models are designed based on the rules and concepts of whichever broader data model the designers adopt. Most data models can be represented by an accompanying database diagram.
  Database : Database is an organized collection of interrelated data stored in a computer.

Importance of Database:
• It gives us a highly efficient method for handling large amount of different types of data with ease.

• It allows large amount of data to be stored systematically and these data to be easily retrieved, filtered, sorted and updated efficiently and accurately.

Types of Database Model

Database Model: It determines the logical structure of a database and fundamentally determines in which manner data can be stored, organized and manipulated.

There are four common types of database model that are useful for different types of data or information. Depending upon your specific needs, one of these models can be used.

1. Hierarchical databases.
2. Network databases.
3. Relational databases.
4. Object-oriented databases.

## 2(a)
  data abstraction
  https://www.tutorialspoint.com/what-is-data-abstraction-in-dbms
  https://beginnersbook.com/2015/04/levels-of-abstraction-in-dbms/
  https://www.geeksforgeeks.org/data-abstraction-and-data-independence/
  
  DDL & DML 
  https://www.tutorialspoint.com/difference-between-ddl-and-dml-in-dbms#:~:text=DDL%20stands%20for%20Data%20Definition,stands%20for%20Data%20Manipulation%20Language.&text=DDL%20statements%20are%20used%20to,update%20or%20delete%20the%20records.
  https://www.geeksforgeeks.org/difference-between-ddl-and-dml-in-dbms/
  https://www.geeksforgeeks.org/sql-ddl-dql-dml-dcl-tcl-commands/
  https://www.javatpoint.com/ddl-vs-dml
  https://www.guru99.com/difference-between-ddl-and-dml.html
  

  Data Abstraction is a process of hiding unwanted or irrelevant details from the end user. It provides a different view and helps in achieving data independence which is used to enhance the security of data.

The database systems consist of complicated data structures and relations. For users to access the data easily, these complications are kept hidden, and only the relevant part of the database is made accessible to the users through data abstraction.


DDL
DDL is Data Definition Language and is used to define the structures like schema, database, tables, constraints etc. Examples of DDL are create and alter statements.


DML is Data Manipulation Language and is used to manipulate data. Examples of DML are insert, update and delete statements.

## 2(b)
  https://www.geeksforgeeks.org/types-of-attributes-in-er-model/
  https://www.tutorialspoint.com/dbms/er_model_basic_concepts.htm
  https://www.gatevidyalay.com/types-of-attributes/


  Simple attribute : 
An attribute that cannot be further subdivided into components is a simple attribute. 
Example: The roll number of a student, the id number of an employee. 

Composite attribute : 
An attribute that can be split into components is a composite attribute. 

Example: The address can be further split into house number, street number, city, state, country, and pin code, the name can also be split into first name middle name, and last name. 

Single-valued attribute : 
The attribute which takes up only a single value for each entity instance is a single-valued attribute. 

Example: The age of a student. 

Multi-valued attribute : 
The attribute which takes up more than a single value for each entity instance is a multi-valued attribute. 

Example: Phone number of a student: Landline and mobile. 

Derived attribute : 
An attribute that can be derived from other attributes is derived attributes. 

Example: Total and average marks of a student. 

Complex attribute : 
Those attributes, which can be formed by the nesting of composite and multi-valued attributes, are called “Complex                 Attributes“. These attributes are rarely used in DBMS(DataBase Management System). That’s why they are not so popular.

## 2(c)
  https://www.guru99.com/dbms-keys.html#:~:text=Super%20Key%20%E2%80%93%20A%20super%20key,every%20row%20in%20that%20table.
  https://www.javatpoint.com/dbms-keys
  https://www.geeksforgeeks.org/types-of-keys-in-relational-model-candidate-super-primary-alternate-and-foreign/



Types of Keys in DBMS (Database Management System)
There are mainly Eight different types of Keys in DBMS and each key has it’s different functionality:

Super Key
Primary Key
Candidate Key
Alternate Key
Foreign Key
Compound Key
Composite Key
Surrogate Key
Let’s look at each of the keys in DBMS with example:

Super Key – A super key is a group of single or multiple keys which identifies rows in a table.
Primary Key – is a column or group of columns in a table that uniquely identify every row in that table.
Candidate Key – is a set of attributes that uniquely identify tuples in a table. Candidate Key is a super key with no repeated attributes.
Alternate Key – is a column or group of columns in a table that uniquely identify every row in that table.
Foreign Key – is a column that creates a relationship between two tables. The purpose of Foreign keys is to maintain data integrity and allow navigation between two different instances of an entity.
Compound Key – has two or more attributes that allow you to uniquely recognize a specific record. It is possible that each column may not be unique by itself within the database.
Composite Key – is a combination of two or more columns that uniquely identify rows in a table. The combination of columns guarantees uniqueness, though individual uniqueness is not guaranteed.
Surrogate Key – An artificial key which aims to uniquely identify each record is called a surrogate key. These kind of key are unique because they are created when you don’t have any natural primary key.

## 3(a)
  https://www.guru99.com/er-diagram-tutorial-dbms.html
  https://beginnersbook.com/2015/04/e-r-model-in-dbms/
  https://www.smartdraw.com/entity-relationship-diagram/
  https://www.geeksforgeeks.org/difference-between-strong-and-weak-entity/
  https://www.tutorialspoint.com/explain-difference-between-strong-entity-and-weak-entity


What is ER Model?
ER Model stands for Entity Relationship Model is a high-level conceptual data model diagram. ER model helps to systematically analyze data requirements to produce a well-designed database. The ER Model represents real-world entities and the relationships between them. Creating an ER Model in DBMS is considered as a best practice before implementing your database.

ER Modeling helps you to analyze data requirements systematically to produce a well-designed database. So, it is considered a best practice to complete ER modeling before implementing your database.

Strong Entity: 
A strong entity is not dependent on any other entity in the schema. A strong entity will always have a primary key. Strong entities are represented by a single rectangle. The relationship of two strong entities is represented by a single diamond. 
Various strong entities, when combined together, create a strong entity set. 

Weak Entity: 
A weak entity is dependent on a strong entity to ensure its existence. Unlike a strong entity, a weak entity does not have any primary key. It instead has a partial discriminator key. A weak entity is represented by a double rectangle. 

## 3(b)
  https://www.tutorialspoint.com/explain-cartesian-product-in-relational-algebra-dbms
  https://www.geeksforgeeks.org/cartesian-product-operation-in-relational-algebra/
  https://www.sciencedirect.com/topics/computer-science/cartesian-product
  http://www.expertsmind.com/questions/explain-the-cartesian-product-30161936.aspx




Query is a question or requesting information. Query language is a language which is used to retrieve information from a database.

Query language is divided into two types −

Procedural language

Non-procedural language

Procedural language
Information is retrieved from the database by specifying the sequence of operations to be performed.

For Example − Relational algebra.

Structure Query language (SQL) is based on relational algebra.

Relational algebra consists of a set of operations that take one or two relations as an input and produces a new relation as output.

Types of Relational Algebra operations
The different types of relational algebra operations are as follows −

Select operation

Project operation

Rename operation

Union operation

Intersection operation

Difference operation

Cartesian product operation

Join operation

Division operation

Union, intersection, difference, cartesian, join, division comes under binary operation (operate on two tables).

Cartesian product operation
It combines R1 and R2 without any condition. It is denoted by X.

Degree of R1 XR2 = degree of R1 + degree of R2

{degree = total no of columns}

## 3(c)
 https://www.guru99.com/joins-sql-left-right.html 
https://www.geeksforgeeks.org/sql-join-set-1-inner-left-right-and-full-joins/
https://www.studytonight.com/dbms/joining-in-sql.php

  Join in DBMS is a binary operation which allows you to combine join product and selection in one single statement. The goal of creating a join condition is that it helps you to combine the data from two or more DBMS tables. The tables in DBMS are associated using the primary key and foreign keys.


## 4(a)
  https://www.javatpoint.com/query-processing-in-dbms
https://www.geeksforgeeks.org/structure-of-database-management-system/
https://www.sciencedirect.com/topics/computer-science/query-processor
https://www.ibm.com/docs/en/icfsfz/11.3.0?topic=functions-query-processors


Query Processor: As query is very much necessary to find out only the data user need from tons of data of the database, query processor is very important to process these query requests. Query processors come with the following components,

DDL Interpreter: It interprets the DDL statements and records the definitions in data dictionary. 
DML Compiler: It translates the DML statements in a query language into an evaluation plan consisting of low-level instructions that the query evaluation understands. It also performs query optimization which actually picks up the lowest cost evaluation plan from various alternatives.
Query Evaluation Engine: It executes the low level instruction compiled by the DML compiler. 


## 4(b)
https://www.geeksforgeeks.org/difference-between-procedural-and-non-procedural-language/
https://www.tutorialspoint.com/difference-between-procedural-and-non-procedural-language
https://byjus.com/gate/difference-between-procedural-and-non-procedural-language/
https://t4tutorials.com/what-is-procedural-language-and-non-procedural-language/
https://techdifferences.com/difference-between-procedural-and-non-procedural-language.html

RElational algebra
https://www.geeksforgeeks.org/introduction-of-relational-algebra-in-dbms/
https://www.tutorialspoint.com/dbms/relational_algebra.htm#:~:text=Relational%20algebra%20is%20a%20procedural,yield%20relations%20as%20their%20output.
https://www.javatpoint.com/dbms-relational-algebra
https://www.guru99.com/relational-algebra-dbms.html

Procedural Language:
In procedural languages, the program code is written as a sequence of instructions. User has to specify “what to do” and also “how to do” (step by step procedure). These instructions are executed in the sequential order. These instructions are written to solve specific problems.

Examples of Procedural languages:
FORTRAN, COBOL, ALGOL, BASIC, C and Pascal.
Non-Procedural Language:
In the non-procedural languages, the user has to specify only “what to do” and not “how to do”. It is also known as an applicative or functional language. It involves the development of the functions from other functions to construct more complex functions.

Examples of Non-Procedural languages:
SQL, PROLOG, LISP.

Relational Algebra
Relational algebra is a procedural query language, which takes instances of relations as input and yields instances of relations as output. It uses operators to perform queries. An operator can be either unary or binary. They accept relations as their input and yield relations as their output. Relational algebra is performed recursively on a relation and intermediate results are also considered relations.

## 4(c) 
https://www.ibm.com/docs/en/informix-servers/12.10?topic=SSGU8G_12.1.0/com.ibm.dbdk.doc/ids_dbdk_028.htm
https://padakuu.com/basic-structure-of-sql-queries-372-article
https://www.geeksforgeeks.org/structured-query-language/




SQL includes Data Definition Language (DDL) statements and Data Manipulation Language (DML) statements.

DDL statements, such as CREATE, ALTER, and DROP, modify the schema of a database. DML statements, such as SELECT, INSERT, UPDATE, and DELETE, manipulate data in tables.

Most SQL queries use DML statements. When you design a DataBlade® module, consider DML statements in the abstract. DML statements can be in either of the following two forms:
SELECT something FROM some table
   WHERE some conditions are satisfied

UPDATE some table SET something
   WHERE some conditions are satisfied










