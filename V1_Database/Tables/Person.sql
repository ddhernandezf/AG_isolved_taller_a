﻿CREATE TABLE [dbo].[Person]
(
	[PersonID] INT NOT NULL IDENTITY(1,1),
	[FirstName] VARCHAR(120) NOT NULL,
	[LastName] VARCHAR(120) NOT NULL,
	[Country] VARCHAR(120) NOT NULL,
	CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED([PersonID])
)
