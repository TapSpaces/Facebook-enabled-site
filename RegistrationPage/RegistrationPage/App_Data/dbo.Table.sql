CREATE TABLE [dbo].[Table]
(
    [UserName] NCHAR(20) NOT NULL, 
    [Email] NCHAR(50) NULL, 
    [Password] NCHAR(20) NULL, 
    [Country] NCHAR(15) NULL, 
    CONSTRAINT [PK_Table] PRIMARY KEY ([UserName])
)
