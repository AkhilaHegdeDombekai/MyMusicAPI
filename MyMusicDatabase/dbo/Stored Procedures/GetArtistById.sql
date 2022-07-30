-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetArtistById
	
	@ArtistId int

AS
BEGIN
	SELECT ArtistId,ArtistName,DOB,BIO
	FROM Artists
	WHERE ArtistId=@ArtistId
END
