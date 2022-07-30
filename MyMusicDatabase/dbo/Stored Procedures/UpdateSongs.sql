-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSongs]
@SongsId int,
	@SongsName varchar(300)
,@ArtistID int
,@CoverImage varchar(300)
,@DOR datetime

AS
BEGIN
	UPDATE Songs SET SongName=@SongsName,DOR=@DOR,CoverImage=@CoverImage
	where SongID=@SongsId
	UPDATE SongByArtists set ArtistId =  @ArtistID
	where SongId=@SongsId
END
