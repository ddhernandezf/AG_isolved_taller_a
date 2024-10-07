IF NOT EXISTS(SELECT * FROM Person)
BEGIN
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Alex', 'Brown', 'Australia');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('James', 'Jackson', 'Brazil');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Alex', 'Harris', 'Germany');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Isabella', 'Jones', 'Argentina');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Isabella', 'Wilson', 'Spain');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Jane', 'Thomas', 'Egypt');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Olivia', 'Jones', 'France');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('William', 'Johnson', 'Australia');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('David', 'Wilson', 'Sweden');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Sophia', 'Taylor', 'Australia');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Sophia', 'Jones', 'France');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Michael', 'Robinson', 'Brazil');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Thomas', 'Jackson', 'China');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Olivia', 'Johnson', 'Egypt');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Thomas', 'Anderson', 'Norway');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Jane', 'Thompson', 'Japan');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Emily', 'Smith', 'Australia');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Olivia', 'Thompson', 'Japan');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Jane', 'Williams', 'South Africa');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Emma', 'Garcia', 'China');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Sophia', 'Robinson', 'Russia');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Laura', 'Miller', 'France');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Alex', 'Taylor', 'Japan');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Robert', 'Thompson', 'Nigeria');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Liam', 'Garcia', 'Germany');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Henry', 'Brown', 'India');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Emily', 'Jackson', 'Italy');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('Daniel', 'Anderson', 'Argentina');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('David', 'Miller', 'China');
	INSERT INTO [Person] (FirstName, LastName, Country) VALUES ('William', 'Johnson', 'Canada');
END;

IF NOT EXISTS(SELECT * FROM School)
BEGIN
	INSERT INTO [School] (SchoolName, FoundedON, Country) VALUES ('Springfield High', '1990-02-21', 'USA');
	INSERT INTO [School] (SchoolName, FoundedON, Country) VALUES ('Green Valley Academy', '1959-01-15', 'Canada');
	INSERT INTO [School] (SchoolName, FoundedON, Country) VALUES ('Sunset Elementary', '2005-07-12', 'Mexico');
	INSERT INTO [School] (SchoolName, FoundedON, Country) VALUES ('Lakeside College', '1966-05-31', 'Germany');
	INSERT INTO [School] (SchoolName, FoundedON, Country) VALUES ('Riverside Prep', '1971-03-07', 'France');
	INSERT INTO [School] (SchoolName, FoundedON, Country) VALUES ('Mountainview School', '1993-11-17', 'Italy');
	INSERT INTO [School] (SchoolName, FoundedON, Country) VALUES ('Oakwood Academy', '1987-03-08', 'Spain');
	INSERT INTO [School] (SchoolName, FoundedON, Country) VALUES ('Hilltop High', '1996-02-19', 'Brazil');
	INSERT INTO [School] (SchoolName, FoundedON, Country) VALUES ('Riverdale High', '1984-07-28', 'Argentina');
	INSERT INTO [School] (SchoolName, FoundedON, Country) VALUES ('Pinecrest School', '2004-10-28', 'Australia');
END;

WITH NumberedPersons AS
(
	SELECT  PersonID, FirstName,LastName,Country, ROW_NUMBER() OVER (ORDER BY PersonID) AS RowNum
      FROM	Person
),
NumberedSchools AS
(
    SELECT	SchoolID, SchoolName, ROW_NUMBER() OVER (ORDER BY SchoolID) AS RowNum
      FROM	School
)
INSERT	INTO [TeacherSchoolRel]
SELECT	ns.SchoolID, np.PersonID,
		CASE WHEN CAST(NEWID() AS VARBINARY) % 2 = 0
			THEN 0 
			ELSE 1 
		END AS IsTeacher,
		CASE WHEN CAST(NEWID() AS VARBINARY) % 2 = 0
			THEN 0 
			ELSE 1 
		END AS IsRetired
  FROM	NumberedPersons np
		INNER JOIN NumberedSchools ns
			ON	((np.RowNum - 1) / 3) + 1 = ns.RowNum
 ORDER	BY np.PersonID;

IF EXISTS(SELECT * FROM Person HAVING COUNT(PersonID) = 30)
BEGIN
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('Luca', 'Rossi', 'Italy');
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('Emma', 'Müller', 'Germany');
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('Sofia', 'Kowalski', 'Poland');
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('Liam', 'Peterson', 'Denmark');
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('Amelia', 'Nielsen', 'Norway');
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('Noah', 'Smith', 'Sweden');
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('Mia', 'Johnson', 'Finland');
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('Oliver', 'Brown', 'France');
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('Isabella', 'Garcia', 'Spain');
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('Ethan', 'Martinez', 'Portugal');
END

IF EXISTS(SELECT * FROM Person HAVING COUNT(PersonID) = 40)
BEGIN
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('Carlos', 'Hernández', 'Mexico');
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('María', 'García', 'Mexico');
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('Luis', 'Martínez', 'Mexico');
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('Ana', 'López', 'Mexico');
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('Juan', 'González', 'Mexico');
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('Guadalupe', 'Rodríguez', 'Mexico');
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('Sofía', 'Pérez', 'Mexico');
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('José', 'Ramírez', 'Mexico');
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('Carmen', 'Sánchez', 'Mexico');
	INSERT INTO [dbo].[Person] (FirstName, LastName, Country) VALUES ('Miguel', 'Torres', 'Mexico');

	WITH NewPerson AS (
		SELECT	TOP 10 PersonID
		  FROM	Person
		 ORDER	BY PersonID DESC
	), MexicoSchool AS (
		SELECT	*
		  FROM	School
		 WHERE	Country = 'Mexico'
	)
	INSERT	INTO [TeacherSchoolRel]
	SELECT	ms.SchoolID, np.PersonID,
			CASE WHEN CAST(NEWID() AS VARBINARY) % 2 = 0
				THEN 0 
				ELSE 1 
			END AS IsTeacher,
			CASE WHEN CAST(NEWID() AS VARBINARY) % 2 = 0
				THEN 0 
				ELSE 1 
			END AS IsRetired
	  FROM	NewPerson np
			CROSS JOIN	MexicoSchool ms;
END