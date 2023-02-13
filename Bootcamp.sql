-- create a Database --

CREATE DATABASE "Bootcamp"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
/* 

create a table students
Add the following columns:
id
last_name
first_name
birth_date
The id must be auto_incremented.
Make sure to choose the correct data type for each column.
To help, here is the data that you will have to insert. (How do we insert a date to a table?)

 */

 CREATE TABLE students(
 students_id SERIAL PRIMARY KEY,
 first_name VARCHAR (50) NOT NULL,
 last_name VARCHAR (100) NOT NULL,
 birth_date DATE NOT NULL
)

/* Insert the data seen above to the students table. Find the most efficient way to insert the data.*/

INSERT INTO students(first_name,last_name,birth_date)
VALUES
        ('Marc','Benichou','02/11/1998'),
        ('Yoan','Cohen','03/12/2010'),
        ('Lea','Benichou','27/07/1987'),
        ('Amelia','Dux','07/04/1996'),
        ('David','Grez','14/06/2003'),
        ('Omer','Simpson','03/10/1980')
        ;

/**Insert your last_name, first_name and birth_date to the students table (Take a look at the id given).**/

INSERT INTO students(first_name,last_name,birth_date)
VALUES
        ('Magara','Ngouan','03/04/1994')
        ;

/* Fetch all of the data from the table */

select * from students;

/*Fetch all of the students first_names and last_names.*/

select first_name, last_name from students;

/**  Fetch the student which id is equal to 2 **/

select first_name, last_name from students where students_id = 2;

/**Fetch the student whose last_name is Benichou AND first_name is Marc.**/

select first_name, last_name from students where last_name = 'Benichou' and first_name = 'Marc';

/*Fetch the students whose last_names are Benichou OR first_names are Marc*/

select first_name, last_name from students where last_name = 'Benichou' or first_name = 'Marc';

/*Fetch the students whose first_names contain the letter a.*/

select first_name from students where first_name like '%a';

/**Fetch the students whose first_names start with the letter a.**/

select first_name from students where first_name ilike 'a%';

/**Fetch the students whose first_names end with the letter a.**/

select first_name from students where first_name ilike '%a';

/*Fetch the students whose second to last letter of their first_names are a (Example: Leah).*/

select students.first_name, students.last_name from students
where substring(students.first_name, length(students.first_name)-1,1) like 'a';

/*** Fetch the students whose id’s are equal to 1 AND 3 .***/

select * from students where students_id = 1 or students_id = 3;  

/*Fetch the students whose birth_dates are equal to or come after 1/01/2000. (show all their info).*/

select * from students where students.birth_date >='1/01/2000';

/*Fetch the first four students. You have to order the four students alphabetically by last_name.*/

select first_name,last_name,birth_date from students limit 4;

/*Fetch the details of the youngest student.*/

select * from students where birth_date = (select MAX(students.birth_date) from students);

/*Fetch three students skipping the first two students.*/

select * from students limit 3 OFFSET 2;











