CREATE TABLE [dbo].[TeacherSchoolRel]
(
	[SchoolID] INT NOT NULL,
	[PersonID] INT NOT NULL,
	[IsTeacher] BIT NOT NULL DEFAULT 0,
	[IsRetired] BIT NOT NULL DEFAULT 1,
	CONSTRAINT [PK_TeacherSchoolRel] PRIMARY KEY CLUSTERED([SchoolID], [PersonID]),
	CONSTRAINT [FK_TeacherSchoolRel_School] FOREIGN KEY([SchoolID]) REFERENCES [School]([SchoolID]),
	CONSTRAINT [FK_TeacherSchoolRel_Teacher] FOREIGN KEY([PersonID]) REFERENCES [Person]([PersonID])
)
