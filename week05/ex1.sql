----- TASK 1	 -----
SELECT MAX(COALESCE(enrol, 0))
AS max_enrol, MIN(COALESCE(enrol, 0)) AS min_enrol
FROM(
	SELECT COUNT(*) AS enrol
	FROM takes
	GROUP BY course_id, sec_id, semester, year
) AS enrol


