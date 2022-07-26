CREATE TABLE [dbo].[Artists] (
    [ArtistId]   INT            IDENTITY (1, 1) NOT NULL,
    [ArtistName] VARCHAR (300)  NULL,
    [DOB]        DATETIME       NULL,
    [BIO]        NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([ArtistId] ASC)
);

