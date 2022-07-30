CREATE TABLE [dbo].[User] (
    [UserID]   INT           IDENTITY (1, 1) NOT NULL,
    [UserName] VARCHAR (400) NULL,
    [Email]    VARCHAR (500) NULL,
    [Password] VARCHAR (16)  NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC)
);

