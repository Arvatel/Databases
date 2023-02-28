SELECT school, publisher, COUNT(Loan_books.bookid) as loans
FROM Teachers 
JOIN Subjects
ON Teachers.teacherid = Subjects.teacherid
JOIN Loan_books
ON Loan_books.subjectsid = Subjects.subjectsid
JOIN Books
ON Loan_books.bookid = Books.bookid
GROUP BY Teachers.school, Books.publisher;
