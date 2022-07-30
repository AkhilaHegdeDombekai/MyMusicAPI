CREATE TABLE [dbo].[SongByArtists] (
    [Id]        INT          IDENTITY (1, 1) NOT NULL,
    [ArtistId]  INT          NULL,
    [SongId]    INT          NULL,
    [AvgRating] DECIMAL (18) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([ArtistId]) REFERENCES [dbo].[Artists] ([ArtistId]),
    FOREIGN KEY ([SongId]) REFERENCES [dbo].[Songs] ([SongID])
);

