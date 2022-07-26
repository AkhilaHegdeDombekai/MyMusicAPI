CREATE PROC [dbo].[AddSongs]
 @SongName varchar(300)
,@ArtistID int
,@CoverImage varchar(300)
,@DOR datetime
AS
BEGIN
DECLARE @SongID int 

	INSERT INTO SONGS(SongName,DOR,CoverImage)
	VALUES (@SongName,@DOR,@CoverImage)

	set @SongID= SCOPE_IDENTITY()

	if(@SongID>0)
	BEGIN 
	INSERT INTO SongByArtists(ArtistId,SongId)
	VALUES (@ArtistID,@SongID)
	END

END
