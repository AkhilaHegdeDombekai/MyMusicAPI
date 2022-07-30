CREATE PROC [dbo].[AddArtist]
 @ArtistName varchar(300)
,@DOB datetime
,@Bio nvarchar(max)
AS
BEGIN
 INSERT INTO Artists(ArtistName,DOB,Bio)
 VALUES (@ArtistName,@DOB,@Bio)
END
