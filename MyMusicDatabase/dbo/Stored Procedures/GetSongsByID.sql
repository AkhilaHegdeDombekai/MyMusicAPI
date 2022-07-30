-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetSongsByID
	
	@Id int

AS
BEGIN
	SELECT S.SongID,S.SongName, S.DOR, A.ArtistName,S.CoverImage
	FROM Songs S
	INNER JOIN SongByArtists SA ON SA.SongId=S.SongID
	INNER JOIN Artists A ON A.ArtistId=SA.ArtistId
	WHERE S.SongID=@Id
END
