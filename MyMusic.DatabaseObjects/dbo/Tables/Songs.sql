CREATE TABLE [dbo].[Songs] (
    [SongID]     INT           IDENTITY (1, 1) NOT NULL,
    [SongName]   VARCHAR (300) NULL,
    [DOR]        DATETIME      NULL,
    [CoverImage] VARCHAR (300) NULL,
    PRIMARY KEY CLUSTERED ([SongID] ASC)
);

