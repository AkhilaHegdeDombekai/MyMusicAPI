CREATE TABLE [dbo].[UserSongRating] (
    [id]     INT IDENTITY (1, 1) NOT NULL,
    [UserID] INT NULL,
    [SongID] INT NULL,
    [Rating] INT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    FOREIGN KEY ([SongID]) REFERENCES [dbo].[Songs] ([SongID]),
    FOREIGN KEY ([UserID]) REFERENCES [dbo].[User] ([UserID])
);

