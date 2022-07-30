-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE DeleteArtist
	
	@ArtistId int

AS
BEGIN
	DELETE Artists where ArtistId=@ArtistId
END
