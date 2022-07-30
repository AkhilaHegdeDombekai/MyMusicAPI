-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE UpdateArtist
	@ArtistName varchar(300),
	@DOB DATETIME,
	@Bio varchar(1000),
	@ArtistId int

AS
BEGIN
	UPDATE Artists
	SET ArtistName=@ArtistName, Bio=@Bio,DOB=@DOB
	where ArtistId=@ArtistId
END
