USE [master]
GO
/****** Object:  Database [MyMusic]    Script Date: 30-07-2022 16:28:23 ******/
CREATE DATABASE [MyMusic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyMusic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyMusic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyMusic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyMusic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MyMusic] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyMusic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyMusic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyMusic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyMusic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyMusic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyMusic] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyMusic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyMusic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyMusic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyMusic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyMusic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyMusic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyMusic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyMusic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyMusic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyMusic] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyMusic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyMusic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyMusic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyMusic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyMusic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyMusic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyMusic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyMusic] SET RECOVERY FULL 
GO
ALTER DATABASE [MyMusic] SET  MULTI_USER 
GO
ALTER DATABASE [MyMusic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyMusic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyMusic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyMusic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyMusic] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyMusic] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyMusic', N'ON'
GO
ALTER DATABASE [MyMusic] SET QUERY_STORE = OFF
GO
USE [MyMusic]
GO
/****** Object:  Table [dbo].[Artists]    Script Date: 30-07-2022 16:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artists](
	[ArtistId] [int] IDENTITY(1,1) NOT NULL,
	[ArtistName] [varchar](300) NULL,
	[DOB] [datetime] NULL,
	[BIO] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SongByArtists]    Script Date: 30-07-2022 16:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SongByArtists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArtistId] [int] NULL,
	[SongId] [int] NULL,
	[AvgRating] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Songs]    Script Date: 30-07-2022 16:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Songs](
	[SongID] [int] IDENTITY(1,1) NOT NULL,
	[SongName] [varchar](300) NULL,
	[DOR] [datetime] NULL,
	[CoverImage] [varchar](300) NULL,
	[Rating] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SongID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 30-07-2022 16:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](400) NULL,
	[Email] [varchar](500) NULL,
	[Password] [varchar](16) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSongRating]    Script Date: 30-07-2022 16:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSongRating](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[SongID] [int] NULL,
	[Rating] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Artists] ON 
GO
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [DOB], [BIO]) VALUES (1, N'Shreya Ghoshal', CAST(N'1984-03-12T00:00:00.000' AS DateTime), N'Shreya Ghoshal is an Indian singer and television personality. One of the highest-paid and most well-established playback singers of Hindi cinema, she has received four National Film Awards, four Kerala State Film Awards, two Tamil Nadu State Film Awards, seven Filmfare Awards and ten Filmfare Awards South. ')
GO
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [DOB], [BIO]) VALUES (2, N'A R Rahman', CAST(N'1967-01-06T00:00:00.000' AS DateTime), N'Allah Rakha Rahman is an Indian film composer, record producer, singer and songwriter who works predominantly in Indian cinema and occasionally international cinema. In 2010, the Indian government awarded him the Padma Bhushan, the nation''s third-highest civilian award. ')
GO
INSERT [dbo].[Artists] ([ArtistId], [ArtistName], [DOB], [BIO]) VALUES (4, N'sukvindar singh', CAST(N'1971-01-01T00:00:00.000' AS DateTime), N'Sukhwinder Singh is an internationally acclaimed Indian playback singer who primarily sings Bollywood songs.')
GO
SET IDENTITY_INSERT [dbo].[Artists] OFF
GO
SET IDENTITY_INSERT [dbo].[SongByArtists] ON 
GO
INSERT [dbo].[SongByArtists] ([Id], [ArtistId], [SongId], [AvgRating]) VALUES (1, 1, 1, CAST(4 AS Decimal(18, 0)))
GO
INSERT [dbo].[SongByArtists] ([Id], [ArtistId], [SongId], [AvgRating]) VALUES (2, 2, 2, NULL)
GO
INSERT [dbo].[SongByArtists] ([Id], [ArtistId], [SongId], [AvgRating]) VALUES (3, 3, 3, NULL)
GO
INSERT [dbo].[SongByArtists] ([Id], [ArtistId], [SongId], [AvgRating]) VALUES (4, 3, 4, NULL)
GO
SET IDENTITY_INSERT [dbo].[SongByArtists] OFF
GO
SET IDENTITY_INSERT [dbo].[Songs] ON 
GO
INSERT [dbo].[Songs] ([SongID], [SongName], [DOR], [CoverImage], [Rating]) VALUES (1, N'Manwa Laage', CAST(N'2014-09-10T00:00:00.000' AS DateTime), N'Resources\CoverImages\mavwa laage cover image.jpg', CAST(4 AS Decimal(18, 0)))
GO
INSERT [dbo].[Songs] ([SongID], [SongName], [DOR], [CoverImage], [Rating]) VALUES (2, N'test', CAST(N'2022-07-28T00:00:00.000' AS DateTime), N'Resources\CoverImages\james-cover-image.webp', CAST(3 AS Decimal(18, 0)))
GO
INSERT [dbo].[Songs] ([SongID], [SongName], [DOR], [CoverImage], [Rating]) VALUES (4, N'anisutide yaako indu', CAST(N'2022-11-11T00:00:00.000' AS DateTime), N'Resources\CoverImages\anisutide yaako indu.jpg', CAST(5 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Songs] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password]) VALUES (1, N'akhilaHegde', N'akhilahegde@gmail.com', N'R3gularP@ss')
GO
INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password]) VALUES (2, N'Hegde', N'ahegde@gmail.com', N'R3gularPa55')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserSongRating] ON 
GO
INSERT [dbo].[UserSongRating] ([id], [UserID], [SongID], [Rating]) VALUES (1, 1, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[UserSongRating] OFF
GO
ALTER TABLE [dbo].[Songs] ADD  DEFAULT ((5)) FOR [Rating]
GO
ALTER TABLE [dbo].[SongByArtists]  WITH CHECK ADD FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artists] ([ArtistId])
GO
ALTER TABLE [dbo].[SongByArtists]  WITH CHECK ADD FOREIGN KEY([SongId])
REFERENCES [dbo].[Songs] ([SongID])
GO
ALTER TABLE [dbo].[UserSongRating]  WITH CHECK ADD FOREIGN KEY([SongID])
REFERENCES [dbo].[Songs] ([SongID])
GO
ALTER TABLE [dbo].[UserSongRating]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
/****** Object:  StoredProcedure [dbo].[AddArtist]    Script Date: 30-07-2022 16:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddArtist]
 @ArtistName varchar(300)
,@DOB datetime
,@Bio nvarchar(max)
AS
BEGIN
 INSERT INTO Artists(ArtistName,DOB,Bio)
 VALUES (@ArtistName,@DOB,@Bio)
END
GO
/****** Object:  StoredProcedure [dbo].[AddSongs]    Script Date: 30-07-2022 16:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddSongs]
 @SongsName varchar(300)
,@ArtistID int
,@CoverImage varchar(300)
,@DOR datetime
AS
BEGIN
DECLARE @SongID int 

	INSERT INTO SONGS(SongName,DOR,CoverImage)
	VALUES (@SongsName,@DOR,@CoverImage)

	set @SongID= SCOPE_IDENTITY()

	if(@SongID>0)
	BEGIN 
	INSERT INTO SongByArtists(ArtistId,SongId)
	VALUES (@ArtistID,@SongID)
	END

END
GO
/****** Object:  StoredProcedure [dbo].[AddSongss]    Script Date: 30-07-2022 16:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[AddSongss]
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
GO
/****** Object:  StoredProcedure [dbo].[DeleteArtist]    Script Date: 30-07-2022 16:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteArtist]
	
	@ArtistId int

AS
BEGIN
	DELETE Artists where ArtistId=@ArtistId
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteSongs]    Script Date: 30-07-2022 16:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteSongs]
	
	@Id int

AS
BEGIN
	DELETE
	FROM Songs
	WHERE SongID=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllArtists]    Script Date: 30-07-2022 16:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllArtists]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT A.ArtistId,A.ArtistName,A.BIO,A.DOB
	FROM Artists A
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllSongs]    Script Date: 30-07-2022 16:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetAllSongs]
as
BEGIN
SELECT SA.SongID ,SongName ,DOR ,CoverImage, SA.ArtistId, ArtistName [ArtistsName],SA.AvgRating,S.Rating
FROM SongByArtists SA
INNER JOIN Songs S ON S.SongId =  SA.songID
INNER JOIN  Artists A ON SA.ArtistID = A.artistID
ORDER BY SA.AvgRating,S.Rating desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 30-07-2022 16:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllUsers]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT U.UserID,U.UserName,U.Email[emailId],U.Password
	FROM [User] U
END
GO
/****** Object:  StoredProcedure [dbo].[GetArtistById]    Script Date: 30-07-2022 16:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetArtistById]
	
	@ArtistId int

AS
BEGIN
	SELECT ArtistId,ArtistName,DOB,BIO
	FROM Artists
	WHERE ArtistId=@ArtistId
END
GO
/****** Object:  StoredProcedure [dbo].[GetSongsByID]    Script Date: 30-07-2022 16:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSongsByID]
	
	@Id int

AS
BEGIN
	SELECT S.SongID,S.SongName, S.DOR, A.ArtistName,S.CoverImage
	FROM Songs S
	INNER JOIN SongByArtists SA ON SA.SongId=S.SongID
	INNER JOIN Artists A ON A.ArtistId=SA.ArtistId
	WHERE S.SongID=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateArtist]    Script Date: 30-07-2022 16:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateArtist]
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
GO
/****** Object:  StoredProcedure [dbo].[UpdateSongRating]    Script Date: 30-07-2022 16:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSongRating]
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
GO
/****** Object:  StoredProcedure [dbo].[UpdateSongs]    Script Date: 30-07-2022 16:28:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
USE [master]
GO
ALTER DATABASE [MyMusic] SET  READ_WRITE 
GO
