WITH SchoolCounter AS (
	SELECT	SchoolID, COUNT(SchoolID)[People]
	  FROM	TeacherSchoolRel
	 GROUP	BY	SchoolID
	HAVING	COUNT(SchoolID) > 3
)
SELECT	s.SchoolName, s.Country, sc.People
  FROM	SchoolCounter sc
		JOIN School s
			ON	sc.SchoolID = s.SchoolID;