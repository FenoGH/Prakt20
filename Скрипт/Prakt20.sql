USE [master]
GO
/****** Object:  Database [Детали]    Script Date: 09.05.2023 15:39:37 ******/
CREATE DATABASE [Детали]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Детали', FILENAME = N'D:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\Детали.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Детали_log', FILENAME = N'D:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\Детали_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Детали] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Детали].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Детали] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Детали] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Детали] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Детали] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Детали] SET ARITHABORT OFF 
GO
ALTER DATABASE [Детали] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Детали] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Детали] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Детали] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Детали] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Детали] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Детали] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Детали] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Детали] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Детали] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Детали] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Детали] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Детали] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Детали] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Детали] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Детали] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Детали] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Детали] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Детали] SET  MULTI_USER 
GO
ALTER DATABASE [Детали] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Детали] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Детали] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Детали] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Детали] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Детали] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Детали] SET QUERY_STORE = OFF
GO
USE [Детали]
GO
/****** Object:  Table [dbo].[Накладная_на_поступление]    Script Date: 09.05.2023 15:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Накладная_на_поступление](
	[Номер_накладной] [int] IDENTITY(1,1) NOT NULL,
	[Код_детали] [int] NOT NULL,
	[Количество_поступило] [int] NOT NULL,
	[Дата_прихода] [date] NOT NULL,
 CONSTRAINT [PK_Накладная_на_поступление_1] PRIMARY KEY CLUSTERED 
(
	[Номер_накладной] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Склад]    Script Date: 09.05.2023 15:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Склад](
	[Код_детали] [int] NOT NULL,
	[Количество] [int] NOT NULL,
 CONSTRAINT [PK_Склад] PRIMARY KEY CLUSTERED 
(
	[Код_детали] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Справочник_цен]    Script Date: 09.05.2023 15:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Справочник_цен](
	[Код_детали] [int] IDENTITY(1,1) NOT NULL,
	[Наименование_детали] [nvarchar](50) NOT NULL,
	[Цена] [float] NOT NULL,
 CONSTRAINT [PK_Справочник цен.] PRIMARY KEY CLUSTERED 
(
	[Код_детали] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Требование_на_выдачу]    Script Date: 09.05.2023 15:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Требование_на_выдачу](
	[Номер_требования] [int] IDENTITY(1,1) NOT NULL,
	[Код_детали] [int] NOT NULL,
	[Количество_выдано] [int] NOT NULL,
	[Дата_выдачи] [date] NOT NULL,
 CONSTRAINT [PK_Требование_на_выдачу_1] PRIMARY KEY CLUSTERED 
(
	[Номер_требования] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Накладная_на_поступление] ON 

INSERT [dbo].[Накладная_на_поступление] ([Номер_накладной], [Код_детали], [Количество_поступило], [Дата_прихода]) VALUES (4, 2, 500, CAST(N'2021-05-05' AS Date))
INSERT [dbo].[Накладная_на_поступление] ([Номер_накладной], [Код_детали], [Количество_поступило], [Дата_прихода]) VALUES (5, 3, 400, CAST(N'2021-05-05' AS Date))
INSERT [dbo].[Накладная_на_поступление] ([Номер_накладной], [Код_детали], [Количество_поступило], [Дата_прихода]) VALUES (6, 6, 50, CAST(N'2021-03-20' AS Date))
INSERT [dbo].[Накладная_на_поступление] ([Номер_накладной], [Код_детали], [Количество_поступило], [Дата_прихода]) VALUES (7, 7, 10, CAST(N'2021-02-21' AS Date))
INSERT [dbo].[Накладная_на_поступление] ([Номер_накладной], [Код_детали], [Количество_поступило], [Дата_прихода]) VALUES (8, 8, 400, CAST(N'2021-01-20' AS Date))
SET IDENTITY_INSERT [dbo].[Накладная_на_поступление] OFF
GO
INSERT [dbo].[Склад] ([Код_детали], [Количество]) VALUES (2, 500)
INSERT [dbo].[Склад] ([Код_детали], [Количество]) VALUES (3, 600)
INSERT [dbo].[Склад] ([Код_детали], [Количество]) VALUES (6, 700)
INSERT [dbo].[Склад] ([Код_детали], [Количество]) VALUES (7, 200)
INSERT [dbo].[Склад] ([Код_детали], [Количество]) VALUES (8, 0)
INSERT [dbo].[Склад] ([Код_детали], [Количество]) VALUES (9, 400)
INSERT [dbo].[Склад] ([Код_детали], [Количество]) VALUES (10, 250)
INSERT [dbo].[Склад] ([Код_детали], [Количество]) VALUES (11, 400)
INSERT [dbo].[Склад] ([Код_детали], [Количество]) VALUES (12, 700)
INSERT [dbo].[Склад] ([Код_детали], [Количество]) VALUES (13, 500)
INSERT [dbo].[Склад] ([Код_детали], [Количество]) VALUES (14, 540)
INSERT [dbo].[Склад] ([Код_детали], [Количество]) VALUES (16, 220)
INSERT [dbo].[Склад] ([Код_детали], [Количество]) VALUES (17, 5000)
GO
SET IDENTITY_INSERT [dbo].[Справочник_цен] ON 

INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (2, N'Болт', 300)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (3, N'Гвоздь', 31)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (6, N'Вал', 400)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (7, N'Поршень', 312)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (8, N'Осператор', 124)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (9, N'Винт', 500)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (10, N'Балка', 2000)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (11, N'Барабан', 600)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (12, N'Боковина', 50)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (13, N'Вал', 1200)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (14, N'Венец зубчатый', 200)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (15, N'Вилка', 330)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (16, N'Веретено', 120)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (17, N'Вертлюга', 100)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (18, N'Воронка', 700)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (19, N'Втулка', 20)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (20, N'Вышка', 231)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (21, N'Гильза', 40)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (24, N'Демпфер', 25)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (25, N'Держатель', 421)
INSERT [dbo].[Справочник_цен] ([Код_детали], [Наименование_детали], [Цена]) VALUES (26, N'Дюбель', 240)
SET IDENTITY_INSERT [dbo].[Справочник_цен] OFF
GO
SET IDENTITY_INSERT [dbo].[Требование_на_выдачу] ON 

INSERT [dbo].[Требование_на_выдачу] ([Номер_требования], [Код_детали], [Количество_выдано], [Дата_выдачи]) VALUES (5, 2, 50, CAST(N'2022-05-05' AS Date))
INSERT [dbo].[Требование_на_выдачу] ([Номер_требования], [Код_детали], [Количество_выдано], [Дата_выдачи]) VALUES (6, 3, 40, CAST(N'2023-05-05' AS Date))
INSERT [dbo].[Требование_на_выдачу] ([Номер_требования], [Код_детали], [Количество_выдано], [Дата_выдачи]) VALUES (7, 6, 100, CAST(N'2023-08-05' AS Date))
INSERT [dbo].[Требование_на_выдачу] ([Номер_требования], [Код_детали], [Количество_выдано], [Дата_выдачи]) VALUES (8, 7, 50, CAST(N'2023-06-05' AS Date))
INSERT [dbo].[Требование_на_выдачу] ([Номер_требования], [Код_детали], [Количество_выдано], [Дата_выдачи]) VALUES (9, 8, 10, CAST(N'2023-04-03' AS Date))
SET IDENTITY_INSERT [dbo].[Требование_на_выдачу] OFF
GO
ALTER TABLE [dbo].[Накладная_на_поступление]  WITH CHECK ADD  CONSTRAINT [FK_Накладная_на_поступление_Склад] FOREIGN KEY([Код_детали])
REFERENCES [dbo].[Склад] ([Код_детали])
GO
ALTER TABLE [dbo].[Накладная_на_поступление] CHECK CONSTRAINT [FK_Накладная_на_поступление_Склад]
GO
ALTER TABLE [dbo].[Накладная_на_поступление]  WITH CHECK ADD  CONSTRAINT [FK_Накладная_на_поступление_Справочник_цен] FOREIGN KEY([Код_детали])
REFERENCES [dbo].[Справочник_цен] ([Код_детали])
GO
ALTER TABLE [dbo].[Накладная_на_поступление] CHECK CONSTRAINT [FK_Накладная_на_поступление_Справочник_цен]
GO
ALTER TABLE [dbo].[Склад]  WITH CHECK ADD  CONSTRAINT [FK_Склад_Справочник_цен] FOREIGN KEY([Код_детали])
REFERENCES [dbo].[Справочник_цен] ([Код_детали])
GO
ALTER TABLE [dbo].[Склад] CHECK CONSTRAINT [FK_Склад_Справочник_цен]
GO
ALTER TABLE [dbo].[Требование_на_выдачу]  WITH CHECK ADD  CONSTRAINT [FK_Требование_на_выдачу_Склад] FOREIGN KEY([Код_детали])
REFERENCES [dbo].[Склад] ([Код_детали])
GO
ALTER TABLE [dbo].[Требование_на_выдачу] CHECK CONSTRAINT [FK_Требование_на_выдачу_Склад]
GO
ALTER TABLE [dbo].[Требование_на_выдачу]  WITH CHECK ADD  CONSTRAINT [FK_Требование_на_выдачу_Справочник_цен] FOREIGN KEY([Код_детали])
REFERENCES [dbo].[Справочник_цен] ([Код_детали])
GO
ALTER TABLE [dbo].[Требование_на_выдачу] CHECK CONSTRAINT [FK_Требование_на_выдачу_Справочник_цен]
GO
/****** Object:  StoredProcedure [dbo].[ДобавитьДеталь]    Script Date: 09.05.2023 15:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ДобавитьДеталь]
@name NVARCHAR(50),
@price INT
AS
BEGIN
INSERT INTO Справочник_цен (Цена,Наименование_детали)
VALUES(@price,@name)
END
GO
/****** Object:  StoredProcedure [dbo].[Задание2]    Script Date: 09.05.2023 15:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Задание2]
@month int
AS
BEGIN
  SELECT Код_детали, Количество_поступило FROM Накладная_на_поступление WHERE MONTH(Дата_прихода)=@month
END
GO
/****** Object:  StoredProcedure [dbo].[Количество]    Script Date: 09.05.2023 15:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Количество]
@month int
AS
BEGIN
DECLARE @count int
SELECT @count = SUM(Количество_Поступило) FROM Накладная_на_Поступление WHERE MONTH(Дата_Прихода) = @month
RETURN @count
END
GO
/****** Object:  StoredProcedure [dbo].[Количество_Деталей_По_Месяцу]    Script Date: 09.05.2023 15:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Количество_Деталей_По_Месяцу]
    @Month INT
AS
BEGIN
    SELECT SUM(Количество_Поступило) AS 'Количество'
    FROM Накладная_на_Поступление
    WHERE MONTH(Дата_Прихода) = @Month
END
GO
/****** Object:  StoredProcedure [dbo].[ОбновитьДеталь]    Script Date: 09.05.2023 15:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ОбновитьДеталь]
@name NVARCHAR(50),
@price INT,
@code int
AS
BEGIN
UPDATE Справочник_цен 
SET Цена=@price,Наименование_детали=@name WHERE Код_детали=@code
END
GO
/****** Object:  StoredProcedure [dbo].[Стоимость]    Script Date: 09.05.2023 15:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Стоимость]
    @trebid int
AS
BEGIN
    SELECT SUM(Количество_выдано*Цена) AS 'Стоимость'
    FROM Требование_на_выдачу,Справочник_цен
    WHERE Номер_требования=@trebid and Требование_на_выдачу.Код_детали = Справочник_цен.Код_детали
END
GO
/****** Object:  StoredProcedure [dbo].[ТребованиеСтоимость]    Script Date: 09.05.2023 15:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ТребованиеСтоимость]
@numtreb int
AS
BEGIN
SELECT Требование_на_выдачу.Номер_требования,Справочник_цен.Цена
FROM Требование_на_выдачу
JOIN Справочник_цен on Справочник_цен.Код_детали = Требование_на_выдачу.Код_детали and Номер_требования = @numtreb
END
GO
/****** Object:  StoredProcedure [dbo].[УдалитьДеталь]    Script Date: 09.05.2023 15:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[УдалитьДеталь]
@iddetail int
AS
BEGIN
DELETE FROM Справочник_цен WHERE Код_детали = @iddetail
END
GO
USE [master]
GO
ALTER DATABASE [Детали] SET  READ_WRITE 
GO
