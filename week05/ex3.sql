----- Task 3 -----
	
SELECT 
	MAX(COALESCE(enrol, 0)) AS max_enrol,
	MIN(COALESCE(enrol, 0)) AS min_enrol
FROM(
	SELECT 
		(SELECT COUNT(*) 
		 FROM takes
		 WHERE course_id = s.course_id
		 	and sec_id = s.sec_id
		 	and semester = s.semester
		 	and year = s.year) as enrol
	FROM section s
	) as enrol


	