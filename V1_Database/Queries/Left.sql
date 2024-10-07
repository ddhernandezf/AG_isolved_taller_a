WITH TeacherSchools AS (
	SELECT	tsr.PersonID, s.SchoolName, s.Country[SchoolCountry]
	  FROM	TeacherSchoolRel tsr
			INNER JOIN School s
				ON	s.SchoolID = tsr.SchoolID
)
SELECT	p.FirstName, p.LastName, p.Country, ts.SchoolName, ts.SchoolCountry
  FROM	Person p
		LEFT JOIN TeacherSchools ts
			ON	p.PersonID = ts.PersonID;