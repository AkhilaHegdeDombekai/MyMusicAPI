CREATE procedure [dbo].[GetAllSongs]
as
BEGIN
SELECT SA.SongID ,SongName ,DOR ,CoverImage, SA.ArtistId, ArtistName,SA.AvgRating
FROM SongByArtists SA
INNER JOIN Songs S ON S.SongId =  SA.songID
INNER JOIN  Artists A ON SA.ArtistID = A.artistID
ORDER BY SA.AvgRating
END
