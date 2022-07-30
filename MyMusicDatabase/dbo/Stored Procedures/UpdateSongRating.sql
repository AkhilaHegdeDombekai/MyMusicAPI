-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE UpdateSongRating
	-- Add the parameters for the stored procedure here
	@rating int,
	@userId int,
	@songId int
AS
BEGIN
declare @currentrating int
declare @avgRating  int
select @currentrating= rating from Songs S where s.SongID=@songId
select @avgRating = (@currentrating+@rating)/2

UPDATE S set S.Rating= @avgRating
FROM Songs S 
WHERE SongID=@songId
INSERT INTO UserSongRating (SongID,UserID,Rating)
VALUES (@songId,@userId,@rating)

DECLARE @songByUserRating decimal
SELECT @songByUserRating=AVG(USR.Rating)
FROM SongByArtists SA 
INNER JOIN UserSongRating USR on USR.SongID=SA.SongId
INNER JOIN Songs S on USR.SongID=S.SongID 
INNER JOIN [User] U on USR.UserID=U.UserID
WHERE U.UserID=@userId AND S.SongID=@songId
UPDATE  SA SET SA.AvgRating=@avgRating
FROM SongByArtists SA 
INNER JOIN UserSongRating USR on USR.SongID=SA.SongId
INNER JOIN Songs S on USR.SongID=S.SongID 
INNER JOIN [User] U on USR.UserID=U.UserID
WHERE U.UserID=@userId AND S.SongID=@songId

END
