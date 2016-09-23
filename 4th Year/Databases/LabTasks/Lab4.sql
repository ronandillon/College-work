DROP TABLE Lab4Marks;
DROP TABLE Lab4Weighting;
DROP TABLE Lab4Student;
DROP TABLE Lab4Exam;

CREATE TABLE Lab4Student(
  StudentID integer,
  StudentName varchar(20),
  StudentSurname varchar(20),
  Primary Key(StudentID)
);
CREATE TABLE Lab4Boards(
  StudentID integer,
  ExamCode integer,
  eResult float,
  Decision varchar(3),
  PRIMARY KEY(studentID,ExamCode),
  FOREIGN KEY(studentid) references Lab4Student(studentid),
  Foreign Key(ExamCode) references Lab4Exam(ExamCode)
);


CREATE TABLE Lab4Exam(
  ExamCode integer,
  ExamName varchar(20),
  Primary Key(ExamCode)
);

CREATE TABLE Lab4Weighting(
  ExamCode integer,
  ExamWeight float,
  CAWeight float,
  Primary Key(ExamCode),
  Foreign Key(ExamCode) references Lab4Exam(ExamCode)
);

CREATE TABLE Lab4Marks(
  ExamCode integer,
  StudentID integer,
  ExamMarks integer,
  CAMarks integer,
  Primary Key(ExamCode,StudentID),
  Foreign Key(StudentID) references Lab4Student(StudentID),
  Foreign Key(ExamCode) references Lab4Exam(ExamCode)
);



CREATE OR REPLACE TRIGGER weighting
BEFORE INSERT OR UPDATE of CAWeight, ExamWeight 
on Lab4Weighting
FOR EACH ROW
declare    
   weightingEXPT EXCEPTION;
   caweight lab4weighting.CAWeight%TYPE;
   examweight lab4weighting.ExamWeight%TYPE;
   PRAGMA EXCEPTION_INIT( weightingEXPT, -20001 );
BEGIN
  if :new.caweight + :new.examweight!=1 THEN
    RAISE weightingEXPT;
  END IF ;
END;



DECLARE

s_id Lab4Student.StudentID%type;

CURSOR all_students IS
   SELECT STUDENTID FROM Lab4Student;

PROCEDURE FillBoards(s_id IN Lab4Student.StudentID%Type) IS
e_code LAB4EXAM.EXAMCode%TYPE;
ca_w Lab4Weighting.CAWeight%TYPE;
e_w Lab4Weighting.EXAMWEIGHT%TYPE;
ca_m Lab4Marks.CAMARKS%TYPE;
e_m Lab4Marks.EXAMMARKS%TYPE;
w_average FLOAT;
decision VARCHAR2(3);
	CURSOR s_result is SELECT Lab4Exam.ExamCode, Lab4Weighting.CAWeight, Lab4Weighting.ExamWeight, Lab4Marks.CAMarks, Lab4Marks.ExamMarks INTO e_code, ca_w, e_w, ca_m, e_m FROM Lab4Exam,Lab4Marks,Lab4Weighting
		WHERE StudentID = s_id;
BEGIN
		open s_result;
		LOOP
			FETCH s_result INTO e_code, ca_w, e_w, ca_m, e_m;
			EXIT WHEN s_result%notfound;
      w_average := ((ca_m / 100) * ca_w) + (e_w * (e_m / 100));
      IF (ca_m > 39) AND (e_m > 39) THEN
        IF (w_average > 0.69) THEN
          decision := 'A';
        ELSIF (w_average > 0.59) THEN
          decision := 'B';
        ELSIF (w_average > 0.49) THEN
          decision := 'C';
        ELSIF (w_average > 0.39) THEN
          decision := 'D';
        END IF;
      ELSIF (ca_m > 39) AND (e_m < 40) THEN
        decision := 'RE';
      ELSIF (e_m > 39) AND (ca_m < 40) THEN
        decision := 'RCA';
      ELSIF (ca_m < 40) AND (e_m < 40) THEN
        decision := 'RAC';
      END IF;
			--dbms_output.put_line('Exam code: ' || e_code || ' CA Weight: ' || ca_w || ' Exam Weight: ' || e_w || ' CA marks: ' || ca_m || '  Exam marks: ' || e_m || '  Weighted Average: ' || w_average || ' Decision: ' || decision);
      Insert into Lab4Boards(STUDENTID, ExamCode, eResult, Decision) Values (s_id, e_code, w_average, decision);
		END LOOP;
		CLOSE s_result;
END;

BEGIN -- BEGIN MAIN BLOCK

open all_students;
LOOP
  FETCH all_students INTO s_id;
    EXIT WHEN all_students%notfound;
    FillBoards(s_id);
  END LOOP;
CLOSE all_students;

END;

