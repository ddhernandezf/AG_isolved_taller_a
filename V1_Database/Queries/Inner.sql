SELECT	p.FirstName, p.LastName, p.Country, s.SchoolName, s.Country[SchoolCountry]
  FROM	TeacherSchoolRel tsr
		INNER JOIN Person p
			ON	p.PersonID = tsr.PersonID
		INNER JOIN School s
			ON	s.SchoolID = tsr.SchoolID