CREATE TABLE [dbo].[Songs] (
    [SongID]     INT           IDENTITY (1, 1) NOT NULL,
    [SongName]   VARCHAR (300) NULL,
    [DOR]        DATETIME      NULL,
    [CoverImage] VARCHAR (300) NULL,
    [Rating]     DECIMAL (18)  DEFAULT ((5)) NOT NULL,
    PRIMARY KEY CLUSTERED ([SongID] ASC)
);

