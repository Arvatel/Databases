WITH 
cte AS (
  SELECT Teachers.school, Books.book, Teachers.teacher, MIN(Loan_books.loanDate) AS max_loan_date
  FROM Teachers
  JOIN Subjects ON Teachers.teacherid = Subjects.teacherid
  JOIN Loan_books ON Subjects.subjectsid = Loan_books.subjectsid
  JOIN Books ON Loan_books.bookid = Books.bookid
  GROUP BY Teachers.school, Books.book, Teachers.teacher
),
cte1 AS (
  SELECT school, MIN(max_loan_date) as max_loan
  FROM cte
  GROUP BY school
)
SELECT cte.school, book, teacher, max_loan_date FROM cte
WHERE max_loan_date IN (SELECT max_loan FROM cte1 WHERE cte1.school = cte.school);
