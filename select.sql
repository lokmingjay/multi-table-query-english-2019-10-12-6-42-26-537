# 1.Query the existence of 1 course
select * from course where id=1;
# 2.Query the presence of both 1 and 2 courses
select * from course where id=1 or id =2;
# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select * from (select studentID,s.name, avg(score) as avg_score from student_course sc inner join student s on s.id=sc.studentID group by studentID,s.name ) a where a.avg_score >=60;
# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student where ID not in (select distinct(studentID) from student_course) 
# 5.Query all SQL with grades
select * from student_course inner join student on student.id = student_course.studentID
# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select a.studentID from student_course a where courseID=1 and exists(  select studentID from student_course where  courseID=2 and studentID = a.studentID);
# 7.Retrieve 1 student score with less than 60 scores in descending order
select score from student_course where score < 60 order by score desc
# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select courseID,avg(score) from student_course group by courseID order by avg(score),courseID desc
# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select s.name,courseID,score from student_course sc inner join course c on sc.courseID = c.id inner join student s on s.id = sc.studentID where c.name ='MATH' and score < 60