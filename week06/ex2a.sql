CREATE TABLE Teachers
(
    teacherid INT,
    teacher VARCHAR(100),
    school VARCHAR(100),
    PRIMARY KEY (teacherid)
);

INSERT INTO teachers VALUES (1, 'Chad Russell', 'Horizon Education Institute');
INSERT INTO teachers VALUES (2, 'E.F.Codd', 'Horizon Education Institute');
INSERT INTO teachers VALUES (3, 'Jones Smith', 'Horizon Education Institute');
INSERT INTO teachers VALUES (4, 'Adam Baker', 'Bright Institution');


CREATE TABLE Rooms
(
    roomid INT,
    room VARCHAR(100),
    PRIMARY KEY (roomid)
);

INSERT INTO Rooms VALUES (1, '1.A01');
INSERT INTO Rooms VALUES (2, '1.B01');
INSERT INTO Rooms VALUES (3, '2.B01');

CREATE TABLE Grades
(
    gradeid INT,
    grade VARCHAR(100),
    PRIMARY KEY (gradeid)
);

INSERT INTO Grades VALUES (1, '1st grade');
INSERT INTO Grades VALUES (2, '2nd grade');

CREATE TABLE Courses
(
    courseid INT,
    course VARCHAR(100),
    PRIMARY KEY (courseid)
);

INSERT INTO Courses VALUES (1, 'Logical Thinking');
INSERT INTO Courses VALUES (2, 'Writing');
INSERT INTO Courses VALUES (3, 'Numerical thinking');
INSERT INTO Courses VALUES (4, 'Spatial, Temporal and Causal Thinking');
INSERT INTO Courses VALUES (5, 'English');


CREATE TABLE Subjects
(
    subjectsid INT,
    teacherid INT,
    courseid INT,
    roomid INT,
    gradeid INT,
    FOREIGN KEY (teacherid) REFERENCES teachers(teacherid),
    FOREIGN KEY (roomid) REFERENCES Rooms(roomid),
    FOREIGN KEY (gradeid) REFERENCES Grades(gradeid),
    FOREIGN KEY (courseid) REFERENCES Courses(courseid),
    PRIMARY KEY (subjectsid)
);

INSERT INTO Subjects VALUES (1, 1, 1, 1, 1);
INSERT INTO Subjects VALUES (2, 1, 2, 1, 1);
INSERT INTO Subjects VALUES (3, 1, 3, 1, 1);
INSERT INTO Subjects VALUES (4, 2, 4, 2, 1);
INSERT INTO Subjects VALUES (5, 2, 3, 2, 1);
INSERT INTO Subjects VALUES (6, 3, 2, 1, 2);
INSERT INTO Subjects VALUES (7, 3, 5, 1, 2);
INSERT INTO Subjects VALUES (8, 4, 1, 3, 1);
INSERT INTO Subjects VALUES (9, 4, 3, 3, 1);


CREATE TABLE Books
(
    bookid INT,
    book VARCHAR(100),
    publisher VARCHAR(100),
    PRIMARY KEY (bookid)
);

INSERT INTO Books VALUES (1, 'Learning and teaching in early childhood education', 'BOA Editions');
INSERT INTO Books VALUES (2, 'Preschool, N56', 'Taylor & Francis Publishing');
INSERT INTO Books VALUES (3, 'Early Childhood Education N9', 'Prentice Hall');
INSERT INTO Books VALUES (4, 'Know how to educate: guide for Parents and Teachers', 'McGraw Hill');


CREATE TABLE Loan_books
(
    loanid INT,
    subjectsid INT,
    bookid INT,
    loanDate DATE,
    PRIMARY KEY (loanid),
    FOREIGN KEY (subjectsid) REFERENCES Subjects(subjectsid),
    FOREIGN KEY (bookid) REFERENCES Books(bookid)
);

INSERT INTO Loan_books VALUES (1, 1, 1, '2010-09-09');
INSERT INTO Loan_books VALUES (2, 2, 2, '2010-05-05');
INSERT INTO Loan_books VALUES (3, 3, 1, '2010-05-05');
INSERT INTO Loan_books VALUES (4, 4, 3, '2010-05-06');
INSERT INTO Loan_books VALUES (5, 5, 1, '2010-05-06');
INSERT INTO Loan_books VALUES (6, 6, 1, '2010-09-09');
INSERT INTO Loan_books VALUES (7, 7, 4, '2010-05-05');
INSERT INTO Loan_books VALUES (8, 8, 4, '2010-12-18');
INSERT INTO Loan_books VALUES (9, 9, 1, '2010-05-06');

