-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE DeleteSongs
	
	@Id int

AS
BEGIN
	DELETE
	FROM Songs
	WHERE SongID=@Id
END
