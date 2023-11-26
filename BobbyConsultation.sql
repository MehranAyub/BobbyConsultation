USE [master]
GO
/****** Object:  Database [BobbyConsultation]    Script Date: 26/11/2023 6:04:16 pm ******/
CREATE DATABASE [BobbyConsultation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BobbyConsultation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BobbyConsultation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BobbyConsultation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BobbyConsultation_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BobbyConsultation] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BobbyConsultation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BobbyConsultation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BobbyConsultation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BobbyConsultation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BobbyConsultation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BobbyConsultation] SET ARITHABORT OFF 
GO
ALTER DATABASE [BobbyConsultation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BobbyConsultation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BobbyConsultation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BobbyConsultation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BobbyConsultation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BobbyConsultation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BobbyConsultation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BobbyConsultation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BobbyConsultation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BobbyConsultation] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BobbyConsultation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BobbyConsultation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BobbyConsultation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BobbyConsultation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BobbyConsultation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BobbyConsultation] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BobbyConsultation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BobbyConsultation] SET RECOVERY FULL 
GO
ALTER DATABASE [BobbyConsultation] SET  MULTI_USER 
GO
ALTER DATABASE [BobbyConsultation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BobbyConsultation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BobbyConsultation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BobbyConsultation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BobbyConsultation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BobbyConsultation] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BobbyConsultation', N'ON'
GO
ALTER DATABASE [BobbyConsultation] SET QUERY_STORE = OFF
GO
USE [BobbyConsultation]
GO
/****** Object:  Schema [Content]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE SCHEMA [Content]
GO
/****** Object:  Schema [Emails]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE SCHEMA [Emails]
GO
/****** Object:  Schema [HangFire]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Schema [Logs]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE SCHEMA [Logs]
GO
/****** Object:  Schema [MAR]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE SCHEMA [MAR]
GO
/****** Object:  Schema [Workers]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE SCHEMA [Workers]
GO
/****** Object:  Table [Content].[AboutUs]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Content].[AboutUs](
	[PortfolioId] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Subtitle] [nvarchar](max) NULL,
	[Section1] [nvarchar](max) NULL,
	[Section2] [nvarchar](max) NULL,
	[Section3] [nvarchar](max) NULL,
	[Section4] [nvarchar](max) NULL,
	[Section5] [nvarchar](max) NULL,
 CONSTRAINT [PK_Content.AboutUs] PRIMARY KEY CLUSTERED 
(
	[PortfolioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Content].[ContactUs]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Content].[ContactUs](
	[PortfolioId] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Subtitle] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
 CONSTRAINT [PK_Content.ContactUs] PRIMARY KEY CLUSTERED 
(
	[PortfolioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Content].[Media]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Content].[Media](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MediaUrl] [nvarchar](max) NULL,
	[FileName] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_Content.Media] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Content].[Portfolio]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Content].[Portfolio](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Language] [nvarchar](max) NULL,
	[HomeTitle] [nvarchar](max) NULL,
	[HomeSubTitle] [nvarchar](max) NULL,
	[WhiteLogo] [nvarchar](max) NULL,
	[BlackLogo] [nvarchar](max) NULL,
	[Services] [nvarchar](max) NULL,
	[TestimonialTitle] [nvarchar](max) NULL,
	[TestimonialSubtitle] [nvarchar](max) NULL,
	[PackagesTitle] [nvarchar](max) NULL,
	[About] [nvarchar](max) NULL,
 CONSTRAINT [PK_Content.Portfolio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Content].[TermsOfService]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Content].[TermsOfService](
	[PortfolioId] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[DateUpdated] [datetime] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Content.TermsOfService] PRIMARY KEY CLUSTERED 
(
	[PortfolioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Content].[Testimonial]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Content].[Testimonial](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
	[ClientName] [nvarchar](max) NULL,
	[ClientOccupation] [nvarchar](max) NULL,
	[Text] [nvarchar](max) NULL,
	[PortfolioId] [int] NOT NULL,
 CONSTRAINT [PK_Content.Testimonial] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[IsSysAdmin] [bit] NOT NULL,
	[RoleDescription] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserNotifications]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserNotifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[DateCreated] [datetime] NOT NULL,
	[IsRead] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsReminder] [bit] NOT NULL,
	[Code] [nvarchar](max) NULL,
	[IsAjaxMessage] [bit] NULL,
	[IsRedirectMessage] [bit] NULL,
	[IsViewMessage] [bit] NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserNotifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[Level] [tinyint] NOT NULL,
	[JoinDate] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[Inactive] [bit] NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
	[SupportedLanguage] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Initials] [nvarchar](max) NULL,
	[Signature] [nvarchar](max) NULL,
	[MedicalRecord_Id] [int] NULL,
	[Gender] [varchar](100) NOT NULL,
	[OnlineStatus] [bit] NOT NULL,
	[LoginTime] [datetime] NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactForm]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactForm](
	[Name] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Phone] [varchar](255) NOT NULL,
	[City] [varchar](255) NOT NULL,
	[Company] [varchar](255) NOT NULL,
	[Candidates] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentPages]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentPages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NavTitle] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[PageId] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[Route] [nvarchar](max) NULL,
	[PageOrder] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ContentPages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentPages2]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentPages2](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NavTitle] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[PageId] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[Route] [nvarchar](max) NULL,
	[PageOrder] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentPages3]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentPages3](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NavTitle] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[PageId] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[Route] [nvarchar](max) NULL,
	[PageOrder] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Controller] [nvarchar](max) NOT NULL,
	[Action] [nvarchar](max) NOT NULL,
	[AllowAll] [bit] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermissionApplicationRoles]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionApplicationRoles](
	[Permission_Id] [int] NOT NULL,
	[ApplicationRole_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PermissionApplicationRoles] PRIMARY KEY CLUSTERED 
(
	[Permission_Id] ASC,
	[ApplicationRole_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[SIN] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[PostalCode] [nvarchar](50) NOT NULL,
	[HomePhone] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[CellPhone] [nvarchar](50) NOT NULL,
	[FullTimeStudent] [nvarchar](50) NOT NULL,
	[HasWorkPermit] [bit] NOT NULL,
	[DriverLicence] [nvarchar](50) NOT NULL,
	[PermanentResidence] [nvarchar](50) NOT NULL,
	[CANCitizen] [nvarchar](50) NOT NULL,
	[CriminalOffense] [nvarchar](50) NOT NULL,
	[PositionType] [nvarchar](50) NOT NULL,
	[EmploymentStatus] [nvarchar](50) NOT NULL,
	[AvailableDate] [date] NULL,
	[JobType] [nvarchar](50) NOT NULL,
	[Education] [nvarchar](50) NOT NULL,
	[IsLegallyAllowedInCanada] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Emails].[EmailTemplate]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Emails].[EmailTemplate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmailTemplateType] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
	[Language] [nvarchar](max) NULL,
 CONSTRAINT [PK_Emails.EmailTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Emails].[TemplateVariable]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Emails].[TemplateVariable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[EmailTemplateId] [int] NOT NULL,
 CONSTRAINT [PK_Emails.TemplateVariable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CX_HangFire_Counter]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE CLUSTERED INDEX [CX_HangFire_Counter] ON [HangFire].[Counter]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Queue] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](200) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Logs].[Log]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Logs].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Thread] [nvarchar](max) NULL,
	[Level] [nvarchar](max) NULL,
	[Logger] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[Exception] [nvarchar](max) NULL,
 CONSTRAINT [PK_Logs.Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [MAR].[AdministeredMedicine]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAR].[AdministeredMedicine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MedicationId] [int] NOT NULL,
	[MarId] [int] NOT NULL,
	[StaffId] [int] NOT NULL,
	[Day] [datetime] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
 CONSTRAINT [PK_MAR.MedicalRecordMedication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [MAR].[Goal]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAR].[Goal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GoalName] [nvarchar](max) NULL,
	[GoalTitle] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[TreatmentPlan_Id] [int] NULL,
 CONSTRAINT [PK_MAR.Goal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [MAR].[MedicalRecord]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAR].[MedicalRecord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Record] [nvarchar](max) NULL,
	[PhysicianId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[AdmissionDate] [nvarchar](max) NULL,
	[StartStopDate] [nvarchar](max) NULL,
	[FacilityName] [nvarchar](max) NULL,
	[Diagnosis] [nvarchar](max) NULL,
	[Comments] [nvarchar](max) NULL,
	[Allergies] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.MedicalRecord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [MAR].[Medication]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAR].[Medication](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Medication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [MAR].[NotAdministeredMedicine]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAR].[NotAdministeredMedicine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MarId] [int] NOT NULL,
	[MedicationId] [int] NOT NULL,
	[StaffId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Initials] [nvarchar](max) NULL,
	[Reason] [nvarchar](max) NULL,
	[Result] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.NotAdministeredMedicine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [MAR].[Patient]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAR].[Patient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Sex] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[InsuranceId] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [MAR].[Physician]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAR].[Physician](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Physician] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [MAR].[TreatmentPlan]    Script Date: 26/11/2023 6:04:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MAR].[TreatmentPlan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Signature] [nvarchar](max) NULL,
	[StaffId] [int] NOT NULL,
	[FirstShift] [bit] NOT NULL,
	[SecondShift] [bit] NOT NULL,
	[ThirdShift] [bit] NOT NULL,
	[FaceToFace] [bit] NOT NULL,
	[Location] [nvarchar](max) NULL,
	[Effectiveness] [nvarchar](max) NULL,
	[Intervention] [nvarchar](max) NULL,
	[Service] [nvarchar](max) NULL,
 CONSTRAINT [PK_MAR.TreatmentPlan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [Content].[ContactUs] ([PortfolioId], [Title], [Subtitle], [Email], [Address], [PhoneNumber]) VALUES (2, N'Contact Us', N'Contact Us', N'temp@temp.com', N'22B Baker Street', N'1281024738743')
GO
SET IDENTITY_INSERT [Content].[Media] ON 

INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (1, N'~/Public/Content/82c9f442-07e0-4119-a7b3-0b4732b11474.png', N'Worker.png', CAST(N'2021-03-01T18:35:47.610' AS DateTime), CAST(N'2021-03-01T18:35:47.610' AS DateTime))
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (2, N'~/Public/Content/27503658-02a3-4245-b864-50d463fabcb0.png', N'Worker.png', CAST(N'2021-03-01T18:55:53.590' AS DateTime), CAST(N'2021-03-01T18:55:53.590' AS DateTime))
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (3, N'~/Public/Content/354d031b-3adb-4e0b-9979-17beadb85a7d.png', N'1.png', CAST(N'2021-03-01T18:56:05.357' AS DateTime), CAST(N'2021-03-01T18:56:05.357' AS DateTime))
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (4, N'~/Public/Content/145f45f6-93d3-4e81-8324-b0c4353eb117.png', N'2.png', CAST(N'2021-03-01T18:56:19.460' AS DateTime), CAST(N'2021-03-01T18:56:19.460' AS DateTime))
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (5, N'~/Public/Content/3ae6b018-3c07-430c-a75f-2eec9bb19875.png', N'4.png', CAST(N'2021-03-01T18:56:27.507' AS DateTime), CAST(N'2021-03-01T18:56:27.507' AS DateTime))
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (6, N'~/Public/Content/af56a97a-625a-457a-a494-51a76057eb8d.jfif', N'517c21aa-908d-49a5-99d3-071c76b2a725.jfif', CAST(N'2021-03-06T13:39:48.537' AS DateTime), CAST(N'2021-03-06T13:39:48.537' AS DateTime))
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (7, N'~/Public/Content/8124071a-22df-427e-9d11-910c3cd9df7d.jfif', N'1d340de6-ab35-48a4-87ad-1eaf2ecd0c3a.jfif', CAST(N'2021-03-06T13:42:13.273' AS DateTime), CAST(N'2021-03-06T13:42:13.273' AS DateTime))
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (8, N'~/Public/Content/98ffdc9e-9fc9-4726-b05b-c0bd6e149b94.jfif', N'87130eb7-3e51-48cd-8bf8-8076b4d1e127.jfif', CAST(N'2021-03-06T13:42:36.863' AS DateTime), CAST(N'2021-03-06T13:42:36.863' AS DateTime))
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (9, N'~/Public/Content/f2df9583-3f8c-4a8e-8a61-d62efa33157d.jfif', N'e091806c-2e20-4ac6-ac6f-0a3d1370317b.jfif', CAST(N'2021-03-06T13:42:48.823' AS DateTime), CAST(N'2021-03-06T13:42:48.823' AS DateTime))
INSERT [Content].[Media] ([Id], [MediaUrl], [FileName], [DateCreated], [DateUpdated]) VALUES (10, N'~/Public/Content/b08320a1-21eb-4d37-b591-e38b4d80d6f1.png', N'mceclip0.png', CAST(N'2021-03-06T13:52:32.207' AS DateTime), CAST(N'2021-03-06T13:52:32.207' AS DateTime))
SET IDENTITY_INSERT [Content].[Media] OFF
GO
SET IDENTITY_INSERT [Content].[Portfolio] ON 

INSERT [Content].[Portfolio] ([Id], [Language], [HomeTitle], [HomeSubTitle], [WhiteLogo], [BlackLogo], [Services], [TestimonialTitle], [TestimonialSubtitle], [PackagesTitle], [About]) VALUES (2, N'en-GB', N'Focus on recruitment', N'Monitor sites for keywords. find a job on your favorite sites', NULL, NULL, N'<div class="row"><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Automated Billing</h3><p class="card-text">ICAN serves as a clearinghouse for our providers. Your billing is automatically sent to your payers.....<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Client Note Entry &amp; Approval</h3><p class="card-text">Our note entry and approval process supports standard formats (i.e. PIE, BIRP, GIRP, SOAP, State Specific) ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div></div><div class="row mt-10"><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Data Backup</h3><p class="card-text">Staff Certified Network Engineers ensure your data is backed up real-time by using SQL Server Clustering ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">24/7 Support</h3><p class="card-text">Our customer service staff is available to answer questions and assist when needed ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div></div><div class="row mt-10"><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Security</h3><p class="card-text">Security isn&rsquo;t just important to your customers, it&rsquo;s the law. My Healthcare Company ensures ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Employee Screening</h3><p class="card-text">Create an applicant pool seperate from your employees to allow credentialing and verification<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div></div><div class="row mt-10"><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Eligibility Checks</h3><p class="card-text">When dealing with multiple payers, let our system perform automated eligibiity checks on your consumers ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Plagiarism Checks</h3><p class="card-text">If you think your staff is coping documentation, the plagiarism checker will let you know how close each note matches ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div></div><div class="row mt-10"><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Real-Time Reporting</h3><p class="card-text">Run real-time reports on financials, outcome measurements, labels, listings, EHR Meaningful Use ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Payroll Generation</h3><p class="card-text">Generate your payroll based on various combinations or customer defined queries ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div></div><div class="row mt-10"><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Multiple locations</h3><p class="card-text">Our system and staff service clients in over 6 states in the Mental and Home Health sectors ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">E-Prescribing</h3><p class="card-text">Use this feature to create, monitor and send prescriptions to your pharmacist with a few clicks ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div></div><div class="row mt-10"><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Lab Results</h3><p class="card-text">Integrate with labs accross the country to submit and receive lab results on your consumers ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div><div class="col-md-6 col-sm-6 post-grid"><div class="card mb-3" style="max-width: 540px;"><div class="row no-gutters"><div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div><div class="col-md-9"><div class="card-body"><h3 class="card-title">Scheduling</h3><p class="card-text">Schedule your case loads so you know which staff are responsible for each consumer ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p></div></div></div></div></div></div>', N'What our users say about us', N'We enable people, small and big companies to automate website checks.', N'Scales with your business', N'Lead Monitor allows you to monitor websites for specific keywords and instantly notifies if anything changes on the website. you can define your user groups and get alerts on your email or inside panel.')
SET IDENTITY_INSERT [Content].[Portfolio] OFF
GO
SET IDENTITY_INSERT [dbo].[AspNetRoles] ON 

INSERT [dbo].[AspNetRoles] ([Id], [LastModified], [IsSysAdmin], [RoleDescription], [Name]) VALUES (1, CAST(N'2021-03-03T17:38:32.607' AS DateTime), 1, N'System Administrator', N'SuperAdmin')
INSERT [dbo].[AspNetRoles] ([Id], [LastModified], [IsSysAdmin], [RoleDescription], [Name]) VALUES (2, CAST(N'2023-02-03T21:46:14.837' AS DateTime), 0, N'Administrator', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [LastModified], [IsSysAdmin], [RoleDescription], [Name]) VALUES (3, CAST(N'2021-02-27T21:29:37.780' AS DateTime), 0, N'User', N'User')
INSERT [dbo].[AspNetRoles] ([Id], [LastModified], [IsSysAdmin], [RoleDescription], [Name]) VALUES (4, CAST(N'2021-06-20T23:41:09.950' AS DateTime), 0, N'Staff', N'Staff')
SET IDENTITY_INSERT [dbo].[AspNetRoles] OFF
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (3, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (5, 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (6, 4)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (7, 4)
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 

INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Level], [JoinDate], [LastModified], [Inactive], [ImagePath], [SupportedLanguage], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Initials], [Signature], [MedicalRecord_Id], [Gender], [OnlineStatus], [LoginTime], [DateOfBirth]) VALUES (3, N'Zawar', N'', 1, CAST(N'2018-03-01T20:24:09.570' AS DateTime), CAST(N'2021-03-01T20:24:09.570' AS DateTime), 0, NULL, NULL, N'zetawars@hotmail.com', 1, N'AI80cYItZ970QgBTYaBAcaJpcLNAh+svFRDfoWfJIlLEbTYjucsd8Qg/NB/UNBUJzA==', N'9a42f78f-95c9-49a1-85ab-9d78f9805cf4', NULL, 0, 0, NULL, 0, 0, N'zetawars', N'Z', NULL, NULL, N'Male', 0, CAST(N'2023-01-30T16:47:25.473' AS DateTime), CAST(N'2023-01-30T16:49:13.750' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Level], [JoinDate], [LastModified], [Inactive], [ImagePath], [SupportedLanguage], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Initials], [Signature], [MedicalRecord_Id], [Gender], [OnlineStatus], [LoginTime], [DateOfBirth]) VALUES (5, N'Staff', N'Staff', 0, CAST(N'2021-06-20T23:47:03.967' AS DateTime), CAST(N'2023-02-03T21:46:26.603' AS DateTime), 0, NULL, N'en-GB', N'staff3@staff.com', 1, N'ABtvJCxuOLOlOrhncp9UNyjJSzTH4uifhua2B4tZV2J3t+YNsxYXIeCrkn13v1EuEg==', N'15e53ea9-c80e-4efe-bd8b-ef3a6459020f', NULL, 0, 0, NULL, 0, 0, N'staff3', N'SS', N'/Public/UserSignatures/staff3_signature.png', NULL, N'Male', 0, CAST(N'2023-01-30T16:47:25.473' AS DateTime), CAST(N'2023-01-30T16:49:13.750' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Level], [JoinDate], [LastModified], [Inactive], [ImagePath], [SupportedLanguage], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Initials], [Signature], [MedicalRecord_Id], [Gender], [OnlineStatus], [LoginTime], [DateOfBirth]) VALUES (6, N'Zawar', N'Mahmood', 0, CAST(N'2021-06-20T23:49:14.737' AS DateTime), CAST(N'2021-06-21T05:42:29.153' AS DateTime), 0, NULL, NULL, N'zetawars@hotmail.com', 1, N'ABtkuGSFNgh51vp+2x/bLzVbEL6cRs9zmfyDbL0i9+d1UkQn5Jt8YnjOClu3SaVKcg==', N'c2f31b98-3384-4ab5-8285-7bd87dea87fa', NULL, 0, 0, NULL, 0, 0, N'Zawar', N'ZM', NULL, NULL, N'Male', 0, CAST(N'2023-01-30T16:47:25.473' AS DateTime), CAST(N'2023-01-30T16:49:13.750' AS DateTime))
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Level], [JoinDate], [LastModified], [Inactive], [ImagePath], [SupportedLanguage], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Initials], [Signature], [MedicalRecord_Id], [Gender], [OnlineStatus], [LoginTime], [DateOfBirth]) VALUES (7, N'Staff', N'Staff2', 0, CAST(N'2021-06-20T23:49:56.920' AS DateTime), CAST(N'2021-06-20T23:49:56.940' AS DateTime), 0, NULL, N'en-GB', N'staff2@staff.com', 1, N'AJecoLVpo6BycceEbN+N13vwzMFI0VMOgnyaTtH21nG/xLFGCWA3RcOUIWUdEu1nKw==', N'a0b6372c-e5e2-45b9-ae4e-7fe3f77e89a1', NULL, 0, 0, NULL, 0, 0, N'zetawars@hotmail.com', N'SS', NULL, NULL, N'Male', 0, CAST(N'2023-01-30T16:47:25.473' AS DateTime), CAST(N'2023-01-30T16:49:13.750' AS DateTime))
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactForm] ON 

INSERT [dbo].[ContactForm] ([Name], [Email], [Phone], [City], [Company], [Candidates], [Id]) VALUES (N'Zawar Mahmood', N'zetawars@hotmail.com', N'+923074665233', N'Lahore', N'Contour Software', 0, 1002)
INSERT [dbo].[ContactForm] ([Name], [Email], [Phone], [City], [Company], [Candidates], [Id]) VALUES (N'Zawar', N'zeeforzawar@hotmail.com', N'8175548462', N'Lahore', N'BobbyConsultation', 10, 1003)
INSERT [dbo].[ContactForm] ([Name], [Email], [Phone], [City], [Company], [Candidates], [Id]) VALUES (N'Rehman Gull', N'zetawars@hotmail.com', N'+923074665233', N'Lahore', N'Contour Software', 8, 1004)
INSERT [dbo].[ContactForm] ([Name], [Email], [Phone], [City], [Company], [Candidates], [Id]) VALUES (N'Rehman Gull', N'zetawars@hotmail.com', N'+923074665233', N'Lahore', N'Contour Software', 8, 1005)
INSERT [dbo].[ContactForm] ([Name], [Email], [Phone], [City], [Company], [Candidates], [Id]) VALUES (N'Zawar Mahmood', N'zetawars@hotmail.com', N'+923074665233', N'Lahore', N'Contour Software', 7, 1006)
SET IDENTITY_INSERT [dbo].[ContactForm] OFF
GO
SET IDENTITY_INSERT [dbo].[ContentPages] ON 

INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (5, N'About Us', N'<main><!--============= pages-hero-area ============-->
<div class="inner-page-hero-area _relative">
<div class="container">
<div class="row">
<div class="col-md-8 m-auto text-center">
<div class="hadding hadding-sec">
<h1>About Us</h1>
<h6>Home &gt; About Us</h6>
</div>
</div>
</div>
</div>
<img class="shape-bottom-right _absolute" src="../../Assets/img/shapes/shape-1.svg" alt="" /> <img class="shape-bottom-left _absolute" src="../../Assets/img/shapes/shape-1.svg" alt="" /></div>
<!--============= pages-hero-area ============--> <!--============= about-page-sec-about-start ============-->
<div class="about-page-about-sec sec-padding">
<div class="container">
<div class="row align-items-center">
<div class="col-md-6">
<div class="about-page-img-all">
<div class="about-page-about-img1 img-border img100"><img src="../../Assets/img/image/about-page-img-1.png" alt="" /></div>
<div class="space20">&nbsp;</div>
<div class="row">
<div class="col-md-6">
<div class="about-page-img-2 img-border img100"><img src="../../Assets/img/image/about-page-img-2.png" alt="" /></div>
</div>
<div class="col-md-6">
<div class="about-page-img-3 img-border img100 space-sm-30"><img src="../../Assets/img/image/about-page-img-3.png" alt="" /></div>
</div>
</div>
</div>
</div>
<div class="col-md-6">
<div class="about-haddings">
<div class="hadding hadding-p space-sm-30"><span class="span">Who we Are</span>
<h1>We Prepare Federal, And <br />State Income Tax Returns <br />Individuals Businesses.</h1>
<p>As tax specialists, we are completely computerized and use e-file services for IRS, California Franchise Tax Board, and out-of-state tax returns to Tax Consultant to Consultore Full Range.</p>
<div class="space20">&nbsp;</div>
<p>Please feel free to browse our website to see the tax services we offer as well as the many helpful resources we provide.</p>
</div>
<div class="check-list-all">
<div class="row">
<div class="col-md-4">
<div class="chek-list">
<p><img src="../../Assets/img/icons/check.svg" alt="" /> IRS Tax Problems</p>
</div>
<div class="space20">&nbsp;</div>
<div class="chek-list">
<p><img src="../../Assets/img/icons/check.svg" alt="" /> Payroll Services</p>
</div>
</div>
<div class="col-md-6">
<div class="chek-list">
<p><img src="../../Assets/img/icons/check.svg" alt="" /> Tax Prepration and Planning</p>
</div>
<div class="space20">&nbsp;</div>
<div class="chek-list">
<p><img src="../../Assets/img/icons/check.svg" alt="" /> Bookkeeping and Virtual CFO</p>
</div>
</div>
</div>
</div>
<div class="header-btn-1 button btn-after home1-button"><a href="#">Explore More About Us</a></div>
</div>
</div>
</div>
</div>
</div>
<!--============= about-page-sec-about-end ============--> <!--============= about-page-sec-what-we-do-start ============-->
<div class="what-we-do sec-padding">
<div class="container">
<div class="row align-items-center">
<div class="col-md-5">
<div class="hadding hadding-p"><span class="span">What We Do</span>
<h1>We Can Help Resolve All Of Your Income Tax Issues.</h1>
<p>As tax specialists, we are completely computerized and use e-file services for IRS, California Franchise Tax Board, and out-of-state.</p>
</div>
<div class="space10">&nbsp;</div>
<div class="row">
<div class="col-md-6 text-center">
<div class="preview-counter text-center hadding-p">
<h1><span class="counter-up">20</span>+</h1>
<p>Years of Experience</p>
</div>
</div>
<div class="col-md-6 text-center">
<div class="preview-counter text-center hadding-p">
<h1><span class="counter-up">25</span>K</h1>
<p>Happy Clients</p>
</div>
</div>
<div class="col-md-6 text-center">
<div class="preview-counter text-center hadding-p">
<h1><span class="counter-up">15</span>K</h1>
<p>Client Served</p>
</div>
</div>
<div class="col-md-6 text-center">
<div class="preview-counter text-center hadding-p">
<h1><span class="counter-up">100</span>%</h1>
<p>Client Satisfaction</p>
</div>
</div>
</div>
</div>
<div class="col-md-7">
<div class="about-page-img img-border space-sm-30"><img src="../../Assets/img/image/about-what-img.png" alt="" /></div>
</div>
</div>
</div>
<img class="shape-top-right _absolute" src="../../Assets/img/shapes/shape-1.svg" alt="" /> <img class="shape-bottom-left _absolute" src="../../Assets/img/shapes/shape-1.svg" alt="" /></div>
<!--============= about-page-sec-what-we-do-end ============--> <!--============= about-page-why-choose-start ============-->
<div class="about-choose sec-padding">
<div class="container">
<div class="row align-items-center">
<div class="col-md-6">
<div class="hadding about-page-hadding hadding-p"><span class="span">Why Choose Us</span>
<h1>Our All-Inclusive Proactive <br />Advising System Saves Money.</h1>
<p>I specialize in helping you pay the absolute legal minimum in taxes and keeping the IRS off your back. I am a seasoned pro with over 20 years of experience helping clients apply the tax code Tax.</p>
<div class="space20">&nbsp;</div>
<p>If you are looking for a blend of personal service and expertise, you have come to the right place! I offer a broad range of services.</p>
<div class="space30">&nbsp;</div>
<div class="header-btn-1 button btn-after home1-button"><a href="#">Explore More About Us</a></div>
</div>
</div>
<div class="col-md-6 space-sm-50">
<div class="about-choose-box">
<div class="about-choose-icon"><img src="../../Assets/img/icons/about-choose-icon-1.svg" alt="" /></div>
<div class="hadding hadding-p">
<h4><a href="#">Cryptocurrency Taxes</a></h4>
<p>Consultore Tax is a service accounting firm Tax.</p>
</div>
</div>
<div class="about-choose-box">
<div class="about-choose-icon"><img src="../../Assets/img/icons/about-choose-icon-2.svg" alt="" /></div>
<div class="hadding hadding-p">
<h4><a href="#">Strategic Planning</a></h4>
<p>Consultore Tax is a service accounting firm Tax.</p>
</div>
</div>
<div class="about-choose-box">
<div class="about-choose-icon"><img src="../../Assets/img/icons/about-choose-icon-3.svg" alt="" /></div>
<div class="hadding hadding-p">
<h4><a href="#">Strategic Planning</a></h4>
<p>Consultore Tax is a service accounting firm Tax.</p>
</div>
</div>
<div class="about-choose-box">
<div class="about-choose-icon"><img src="../../Assets/img/icons/about-choose-icon-4.svg" alt="" /></div>
<div class="hadding hadding-p">
<h4><a href="#">Strategic Planning</a></h4>
<p>Consultore Tax is a service accounting firm Tax.</p>
</div>
</div>
</div>
</div>
</div>
</div>
<!--============= about-page-why-choose-end ============--> <!--============= our-vision-start ============-->
<div class="our-vision sec-padding">
<div class="container">
<div class="row">
<div class="col-md-6 m-auto text-center">
<div class="hadding"><span class="span">Our Vision</span>
<h1>We Review Your Tax Returns To Create a Formal Tax Strategy</h1>
</div>
</div>
<div class="space-30">&nbsp;</div>
<div class="row">
<div class="col-md-6 col-lg-3 text-center">
<div class="about-vision-box box-after">
<div class="about-vision-img"><img src="../../Assets/img/icons/about-vision-icon-1.svg" alt="" /></div>
<div class="space20">&nbsp;</div>
<div class="hadding hadding-p">
<h4><a href="#">More Better Tax <br />Consultant</a></h4>
<div class="space10">&nbsp;</div>
<p>We prepare federal, and state income tax returns for the an small businesses.</p>
</div>
</div>
</div>
<div class="col-md-6 col-lg-3 text-center">
<div class="about-vision-box box-after">
<div class="about-vision-img"><img src="../../Assets/img/icons/about-vision-icon-2.svg" alt="" /></div>
<div class="space20">&nbsp;</div>
<div class="hadding hadding-p">
<h4><a href="#">24/7 All Time Customer Service</a></h4>
<div class="space10">&nbsp;</div>
<p>We prepare federal, and state income tax returns for the an small businesses.</p>
</div>
</div>
</div>
<div class="col-md-6 col-lg-3 text-center">
<div class="about-vision-box box-after">
<div class="about-vision-img"><img src="../../Assets/img/icons/about-vision-icon-3.svg" alt="" /></div>
<div class="space20">&nbsp;</div>
<div class="hadding hadding-p">
<h4><a href="#">Great World Record Awards</a></h4>
<div class="space10">&nbsp;</div>
<p>We prepare federal, and state income tax returns for the an small businesses.</p>
</div>
</div>
</div>
<div class="col-md-6 col-lg-3 text-center">
<div class="about-vision-box box-after">
<div class="about-vision-img"><img src="../../Assets/img/icons/about-vision-icon-4.svg" alt="" /></div>
<div class="space20">&nbsp;</div>
<div class="hadding hadding-p">
<h4><a href="#">Easy Consult Working Process</a></h4>
<div class="space10">&nbsp;</div>
<p>We prepare federal, and state income tax returns for the an small businesses.</p>
</div>
</div>
</div>
</div>
</div>
</div>
<img class="shape-top-right _absolute" src="../../Assets/img/shapes/shape-1.svg" alt="" /> <img class="shape-bottom-left _absolute" src="../../Assets/img/shapes/shape-1.svg" alt="" /></div>
</main>', NULL, N'About Us', N'about', 0)
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (6, N'Contact Us', N'<main><!--============= pages-hero-area ============-->
<div class="inner-page-hero-area">
<div class="container">
<div class="row">
<div class="col-md-8 m-auto text-center">
<div class="hadding hadding-sec">
<h1>Contact Us</h1>
<h6>Home &gt; Contact</h6>
</div>
</div>
</div>
</div>
<img class="shape-bottom-right _absolute" src="../../Assets/img/shapes/shape-1.svg" alt="" /> <img class="shape-bottom-left _absolute" src="../../Assets/img/shapes/shape-1.svg" alt="" /></div>
<!--============= pages-hero-area ============-->
<div class="contact-page-contact sec-padding">
<div class="container">
<div class="row">
<div class="col-md-6 col-lg-4 text-center aos-init" data-aos="fade-up" data-aos-duration="1000">
<div class="home4-contact-box contact-page-box box-after">
<div class="contact-iocn"><img src="../../Assets/img/icons/home4-contact-iocn-1.svg" alt="" /></div>
<h4>Our Location</h4>
<a href="tel:674-493-4289">674-493-4289</a> <a href="tel:606-661-0241">606-661-0241</a></div>
</div>
<div class="col-md-6 col-lg-4 text-center aos-init" data-aos="fade-up" data-aos-duration="1200">
<div class="home4-contact-box contact-page-box box-after">
<div class="contact-iocn"><img src="../../Assets/img/icons/home4-contact-iocn-2.svg" alt="" /></div>
<h4>Phone Number</h4>
<p>984 West College St. Sun City, United States of America</p>
</div>
</div>
<div class="col-md-6 col-lg-4 text-center aos-init" data-aos="fade-up" data-aos-duration="1500">
<div class="home4-contact-box contact-page-box box-after">
<div class="contact-iocn"><img src="../../Assets/img/icons/home4-contact-iocn-3.svg" alt="" /></div>
<h4>Our Location</h4>
<a href="mailto:Maryjane38@gmail.com">Maryjane38@gmail.com</a> <a href="mailto:Businesscoaching@gmail.com">Businesscoaching@gmail.com</a></div>
</div>
</div>
</div>
<div class="space100">&nbsp;</div>
<!--=====contact-start=======--> <!--=====contact-end=======--></div>
<!--=====map-start=======-->
<div class="contact-map"><iframe style="border: 0;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d196064.65881483705!2d88.93201515862421!3d24.061083775097945!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39febca82f6a21ed%3A0x4040980d7c6874f8!2sKushtia%20District!5e0!3m2!1sen!2sbd!4v1673751720794!5m2!1sen!2sbd" width="600" height="450" allowfullscreen="allowfullscreen" loading="lazy"></iframe></div>
</main>', 6, N'Contact Us', N'contact', 0)
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (7, N'Home', N'<main><!--=====hero-area=======-->
<div class="home3-hero-area">
<div class="container">
<div class="row align-items-center">
<div class="col-md-12 col-lg-5 aos-init aos-animate" data-aos="fade-right" data-aos-duration="800">
<div class="home2-main-hadding hadding-space hadding-span home2-padding-after">
<h1>Financial <span class="after">Consulting</span> Solution For You <br />Business.</h1>
<p>We listen and effectively respond to your needs and those of your clients, <br />We are experts at translating those needs into solutions.</p>
<div class="home2-header-button home2-btn"><a href="#">Get Free Consultation <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
</div>
</div>
<!--=====hero-area=======--> <!--=====about-start=======-->
<div class="home2-about sec-padding">
<div class="container">
<div class="row align-items-center">
<div class="col-md-12 col-lg-6 aos-init aos-animate" data-aos="flip-left" data-aos-duration="800">
<div class="home2-about-img"><img src="../../Assets/img/image/home2-about.png" alt="" />
<div class="home2-about-text">
<div class="home2-about-after">
<p>&ldquo;Take your life to Financial Consultant Around The World to a e next level with Rise, built-in financial consultation with our a an expert with 10+ years of experience emitters according.&rdquo;</p>
</div>
</div>
</div>
</div>
<div class="col-md-12 col-lg-6 aos-init aos-animate" data-aos="fade-left" data-aos-duration="800">
<div class="home2-hadding home2-hadding-p hadding-span home2-padding-after"><span class="span">Why Choose Us</span>
<h1>Build A Strategy That Puts <span class="after">An</span> <br />Your Money To Work.</h1>
<p>At Albert Financial, Wealth Management and Insurance Services we simplify your Financial Plan. Build a strategy that puts your money to work, protects the people you care about most, and when you.</p>
</div>
<div class="space30">&nbsp;</div>
<div class="home2-about-list">
<ul>
<li><img src="../../Assets/img/icons/chek-cercle.svg" alt="" />Planing your Future Better</li>
<li><img src="../../Assets/img/icons/chek-cercle.svg" alt="" />Financial planing for safe investment</li>
<li><img src="../../Assets/img/icons/chek-cercle.svg" alt="" />Experience a brand new financial attitude</li>
<li><img src="../../Assets/img/icons/chek-cercle.svg" alt="" />Your financial matters according our plans</li>
</ul>
</div>
<div class="space10">&nbsp;</div>
<div class="home2-btn"><a href="#">More About Us<!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
</div>
<!--=====about-end=======--> <!--=====counter-start=======-->
<div class="home3-counter sec-padding">
<div class="container">
<div class="row">
<div class="col-md-3 col-sm-6 text-center aos-init aos-animate" data-aos="fade-left" data-aos-duration="800">
<div class="home3-counter-box home2-hadding hadding-p white-hadding"><img src="../../Assets/img/image/home3-fact-icon-2.png" alt="" />
<h1><span class="counter-up">1,023</span> +</h1>
<p>Happy Customer</p>
</div>
</div>
<div class="col-md-3 col-sm-6 text-center aos-init aos-animate" data-aos="fade-left" data-aos-duration="1200">
<div class="home3-counter-box home2-hadding hadding-p white-hadding"><img src="../../Assets/img/image/home3-fact-icon-2.png" alt="" />
<h1><span class="counter-up">450</span> +</h1>
<p>Completed Projects</p>
</div>
</div>
<div class="col-md-3 col-sm-6 text-center aos-init aos-animate" data-aos="fade-left" data-aos-duration="1600">
<div class="home3-counter-box home2-hadding hadding-p white-hadding"><img src="../../Assets/img/image/home3-fact-icon-3.png" alt="" />
<h1><span class="counter-up">30</span> +</h1>
<p>Yeras of Experience</p>
</div>
</div>
<div class="col-md-3 col-sm-6 text-center aos-init aos-animate" data-aos="fade-left" data-aos-duration="2000">
<div class="home3-counter-box home2-hadding hadding-p white-hadding"><img src="../../Assets/img/image/home3-fact-icon-4.png" alt="" />
<h1><span class="counter-up">45</span> +</h1>
<p>Professional Team</p>
</div>
</div>
</div>
</div>
</div>
<!--=====counter-end=======--> <!--=====service-start=======-->
<div class="home3-service sec-padding">
<div class="container">
<div class="row">
<div class="col-md-6 m-auto text-center aos-init aos-animate" data-aos="fade-up" data-aos-duration="800">
<div class="home2-hadding home2-hadding-p hadding-span home2-padding-after"><span class="span">SUR SERVICE</span>
<h1>Get Solutions From First <span class="after">Class</span> Financial Consultants.</h1>
</div>
</div>
</div>
<div class="space20">&nbsp;</div>
<div class="row">
<div class="col-md-4 text-center aos-init aos-animate" data-aos="fade-up" data-aos-duration="800">
<div class="home3-service-box home2-all-before">
<div class="home2-hadding home2-hadding-p hadding-span"><img src="../../Assets/img/icons/home2-service-icon.svg" alt="" />
<div class="space10">&nbsp;</div>
<h4><a href="#">Manage Investment</a></h4>
<div class="space10">&nbsp;</div>
<p>Take your life the Financial Consultant Around The World next level with Rise, built in financial consultation with our Team</p>
</div>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
<div class="col-md-4 text-center aos-init aos-animate" data-aos="fade-up" data-aos-duration="1000">
<div class="home3-service-box home2-all-before">
<div class="home2-hadding home2-hadding-p hadding-span"><img src="../../Assets/img/icons/home2-service-icon.svg" alt="" />
<div class="space10">&nbsp;</div>
<h4><a href="#">Corporate Finance</a></h4>
<div class="space10">&nbsp;</div>
<p>Take your life the Financial Consultant Around The World next level with Rise, built in financial consultation with our Team</p>
</div>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
<div class="col-md-4 text-center aos-init aos-animate" data-aos="fade-up" data-aos-duration="1200">
<div class="home3-service-box home2-all-before">
<div class="home2-hadding home3-service-hadding home2-hadding-p hadding-span"><img src="../../Assets/img/icons/home2-service-icon.svg" alt="" />
<div class="space10">&nbsp;</div>
<h4><a href="#">Strategy Consulting</a></h4>
<div class="space10">&nbsp;</div>
<p>Take your life the Financial Consultant Around The World next level with Rise, built in financial consultation with our Team</p>
</div>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
<div class="col-md-4 text-center aos-init aos-animate" data-aos="fade-up" data-aos-duration="1400">
<div class="home3-service-box home2-all-before">
<div class="home2-hadding home2-hadding-p hadding-span"><img src="../../Assets/img/icons/home2-service-icon.svg" alt="" />
<div class="space10">&nbsp;</div>
<h4><a href="#">Financial Plan</a></h4>
<div class="space10">&nbsp;</div>
<p>Take your life the Financial Consultant Around The World next level with Rise, built in financial consultation with our Team</p>
</div>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
<div class="col-md-4 text-center aos-init aos-animate" data-aos="fade-up" data-aos-duration="1600">
<div class="home3-service-box home2-all-before">
<div class="home2-hadding home2-hadding-p hadding-span"><img src="../../Assets/img/icons/home2-service-icon.svg" alt="" />
<div class="space10">&nbsp;</div>
<h4><a href="#">Profit Planning</a></h4>
<div class="space10">&nbsp;</div>
<p>Take your life the Financial Consultant Around The World next level with Rise, built in financial consultation with our Team</p>
</div>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
<div class="col-md-4 text-center aos-init aos-animate" data-aos="fade-up" data-aos-duration="1800">
<div class="home3-service-box home2-all-before">
<div class="home2-hadding home2-hadding-p hadding-span"><img src="../../Assets/img/icons/home2-service-icon.svg" alt="" />
<div class="space10">&nbsp;</div>
<h4><a href="#">Accounting Advisory</a></h4>
<div class="space10">&nbsp;</div>
<p>Take your life the Financial Consultant Around The World next level with Rise, built in financial consultation with our Team</p>
</div>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
</div>
</div>
<!--=====service-end=======--> <!--=====advice-start=======-->
<div class="advice sec-padding">
<div class="container">
<div class="row align-items-center">
<div class="col-md-6 aos-init aos-animate" data-aos="fade-right" data-aos-duration="800">
<div class="home2-hadding home2-padding-after hadding-span advice-padding"><span class="span">teacher ADVICE</span>
<h1>Get Solutions From First <span class="after">Class</span> Financial Consultants.</h1>
<p>&ldquo;We worked with Piedmont Avenue Consulting to implement new sales processes and launch a successful customer loyalty program result, we have dramatically increased revenues from catering events and &ldquo;front of mind: sales on the sales to the money for give.&rdquo;</p>
<div class="advice-comment">
<div class="advice-comment-img"><img src="../../Assets/img/image/advice-img-1.png" alt="" /></div>
<div class="advice-comment-hadding">
<h6><a href="#">Shelia Willms Sr.</a></h6>
<p>Consultant - Financy</p>
</div>
</div>
</div>
</div>
<div class="col-md-6 aos-init aos-animate" data-aos="flip-left" data-aos-duration="800">
<div class="advice-img space-sm-30"><img src="../../Assets/img/image/advice-img.png" alt="" /></div>
</div>
</div>
</div>
</div>
<!--=====advice-end=======--> <!--=====pricing-plan-start=======-->
<div class="home2-pricing-plan sec-padding">
<div class="container">
<div class="row">
<div class="col-md-6 m-auto text-center aos-init aos-animate" data-aos="fade-down" data-aos-duration="800">
<div class="home2-hadding hadding-span home2-padding-after"><span class="span">Pricing Plan</span>
<h1>Our Plan Makes You Feel <span class="after">More</span> Comfortable In Financial</h1>
<p>&nbsp;</p>
</div>
</div>
</div>
<div class="home2-princing-plans">
<div class="container">
<div class="row">
<div class="col-12 text-center aos-init aos-animate" data-aos="fade-down" data-aos-duration="800">
<div class="plan-toggle-wrap active">
<div class="toggle-inner home2-toggle-inner"><input id="ce-toggle" checked="checked" type="checkbox" /> <span class="custom-toggle">.</span> <span class="t-month">Monthly</span> <span class="t-year">Annual</span></div>
</div>
</div>
</div>
<div class="tab-content">
<div id="monthly" style="display: none;">
<div class="row">
<div class="col-md-4 aos-init aos-animate" data-aos="fade-down" data-aos-duration="800">
<div class="home2-pricing-box">
<div class="home2-hadding home2-single-service home2-hadding-p">
<h2>Basic</h2>
<p>Financial planning and coaching is designed to help you have a clear view of your money and your financial goals</p>
<div class="space10">&nbsp;</div>
<h1>$1299/year</h1>
<p>Billed Yearly</p>
<div class="space20">&nbsp;</div>
<div class="home2-price-list">
<ul>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Knowledge Management</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Operational Excellence</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Tax Prepration and Planning</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Next Genaration Accounting</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Financial Freedom Consulting</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Money Management Consulting</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Short-Range Finance Planning</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Purposive Finance Planning</li>
</ul>
</div>
<div class="home2-btn home2-btn-testimonial"><a href="#">Choose a Plan<!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
<div class="col-md-4 aos-init aos-animate" data-aos="fade-down" data-aos-duration="1000">
<div class="home2-pricing-box">
<div class="home2-hadding home2-single-service home2-hadding-p">
<h2>Pro</h2>
<p>Financial planning and coaching is designed to help you have a clear view of your money and your financial goals</p>
<div class="space10">&nbsp;</div>
<h1>$1499/year</h1>
<p>Billed Yearly</p>
<div class="space20">&nbsp;</div>
<div class="home2-price-list">
<ul>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Knowledge Management</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Operational Excellence</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Tax Prepration and Planning</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Next Genaration Accounting</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Financial Freedom Consulting</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Money Management Consulting</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Short-Range Finance Planning</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Purposive Finance Planning</li>
</ul>
</div>
<div class="home2-btn home2-btn-testimonial"><a href="#">Choose a Plan<!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
<div class="col-md-4 aos-init aos-animate" data-aos="fade-down" data-aos-duration="1200">
<div class="home2-pricing-box">
<div class="home2-hadding home2-single-service home2-hadding-p">
<h2>Basic</h2>
<p>Financial planning and coaching is designed to help you have a clear view of your money and your financial goals</p>
<div class="space10">&nbsp;</div>
<h1>$1399/year</h1>
<p>Billed Yearly</p>
<div class="space20">&nbsp;</div>
<div class="home2-price-list">
<ul>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Knowledge Management</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Operational Excellence</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Tax Prepration and Planning</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Next Genaration Accounting</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Financial Freedom Consulting</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Money Management Consulting</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Short-Range Finance Planning</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Purposive Finance Planning</li>
</ul>
</div>
<div class="home2-btn home2-btn-testimonial"><a href="#">Choose a Plan<!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
</div>
</div>
<div id="yearly" style="display: block;">
<div class="row">
<div class="col-md-4 aos-init aos-animate" data-aos="fade-down" data-aos-duration="1400">
<div class="home2-pricing-box">
<div class="home2-hadding home2-single-service home2-hadding-p">
<h2>Basic</h2>
<p>Financial planning and coaching is designed to help you have a clear view of your money and your financial goals</p>
<div class="space10">&nbsp;</div>
<h1>$299/mo</h1>
<p>Billed Monthly</p>
<div class="space20">&nbsp;</div>
<div class="home2-price-list">
<ul>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Knowledge Management</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Operational Excellence</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Tax Prepration and Planning</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Next Genaration Accounting</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Financial Freedom Consulting</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Money Management Consulting</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Short-Range Finance Planning</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Purposive Finance Planning</li>
</ul>
</div>
<div class="home2-btn home2-btn-testimonial"><a href="#">Choose a Plan<!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
<div class="col-md-4 aos-init aos-animate" data-aos="fade-down" data-aos-duration="1600">
<div class="home2-pricing-box">
<div class="home2-hadding home2-single-service home2-hadding-p">
<h2>Pro</h2>
<p>Financial planning and coaching is designed to help you have a clear view of your money and your financial goals</p>
<div class="space10">&nbsp;</div>
<h1>$499/mo</h1>
<p>Billed Monthly</p>
<div class="space20">&nbsp;</div>
<div class="home2-price-list">
<ul>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Knowledge Management</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Operational Excellence</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Tax Prepration and Planning</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Next Genaration Accounting</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Financial Freedom Consulting</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Money Management Consulting</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Short-Range Finance Planning</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Purposive Finance Planning</li>
</ul>
</div>
<div class="home2-btn home2-btn-testimonial"><a href="#">Choose a Plan<!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
<div class="col-md-4 aos-init aos-animate" data-aos="fade-down" data-aos-duration="1800">
<div class="home2-pricing-box">
<div class="home2-hadding home2-single-service home2-hadding-p">
<h2>Basic</h2>
<p>Financial planning and coaching is designed to help you have a clear view of your money and your financial goals</p>
<div class="space10">&nbsp;</div>
<h1>$399/mo</h1>
<p>Billed Monthly</p>
<div class="space20">&nbsp;</div>
<div class="home2-price-list">
<ul>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Knowledge Management</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Operational Excellence</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Tax Prepration and Planning</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Next Genaration Accounting</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Financial Freedom Consulting</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Money Management Consulting</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Short-Range Finance Planning</li>
<li><img src="../../Assets/img/icons/testi-chercle.svg" alt="" /> Purposive Finance Planning</li>
</ul>
</div>
<div class="home2-btn home2-btn-testimonial"><a href="#">Choose a Plan<!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<!--=====pricing-plan-end=======--> <!--=====team-member-start=======-->
<div class="home2-team-member sec-padding">
<div class="container">
<div class="row">
<div class="col-md-6 m-auto text-center aos-init" data-aos="fade-up" data-aos-duration="800">
<div class="hadding-span home2-hadding home2-padding-after"><span class="span">Team Member</span>
<h1>Leading The Way In <span class="after">Financial</span> Management Forever!</h1>
</div>
</div>
</div>
<div class="row">
<div class="col-md-4 text-center aos-init" data-aos="fade-right" data-aos-duration="800">
<div class="team-member-box">
<div class="team-member-img"><img src="../../Assets/img/image/team-member-img-1.png" alt="" /></div>
<div class="home2-all-before team-member-hadding-all">
<div class="team-member-hadding">
<h6>Mrs. Levi Mills</h6>
<p>Techer Financy</p>
</div>
<div class="team-shere">
<ul>
<li><a href="#"><em class="fa-brands fa-twitter">.</em></a></li>
<li><a href="#"><em class="fa-brands fa-facebook-f">.</em></a></li>
<li><a href="#"><em class="fa-brands fa-instagram">.</em></a></li>
</ul>
</div>
</div>
</div>
</div>
<div class="col-md-4 text-center aos-init" data-aos="fade-right" data-aos-duration="1400">
<div class="team-member-box">
<div class="team-member-img"><img src="../../Assets/img/image/team-member-img-2.png" alt="" /></div>
<div class="home2-all-before team-member-hadding-all">
<div class="team-member-hadding">
<h6>Miss Eugene Hettinger</h6>
<p>Founder</p>
</div>
<div class="team-shere">
<ul>
<li><a href="#"><em class="fa-brands fa-twitter">.</em></a></li>
<li><a href="#"><em class="fa-brands fa-facebook-f">.</em></a></li>
<li><a href="#"><em class="fa-brands fa-instagram">.</em></a></li>
</ul>
</div>
</div>
</div>
</div>
<div class="col-md-4 text-center aos-init" data-aos="fade-right" data-aos-duration="1800">
<div class="team-member-box">
<div class="team-member-img"><img src="../../Assets/img/image/team-member-img-3.png" alt="" /></div>
<div class="home2-all-before team-member-hadding-all">
<div class="team-member-hadding">
<h6>Roxanne Schaefer</h6>
<p>Techer Financy</p>
</div>
<div class="team-shere">
<ul>
<li><a href="#"><em class="fa-brands fa-twitter">.</em></a></li>
<li><a href="#"><em class="fa-brands fa-facebook-f">.</em></a></li>
<li><a href="#"><em class="fa-brands fa-instagram">.</em></a></li>
</ul>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<!--=====team-member-end=======--> <!--=====testimonial-start=======-->
<div class="home3-testimonial sec-padding">
<div class="container">
<div class="row">
<div class="col-md-7 m-auto text-center aos-init" data-aos="fade-up" data-aos-duration="800">
<div class="home2-hadding hadding-span home2-padding-after"><span class="span">Testimonial</span>
<h1>The Journey Of Building A <span class="after">Financial</span> <br />Plan That Is Both Successful</h1>
</div>
</div>
</div>
<div class="row">
<div class="testimonial-slider owl-carousel owl-loaded owl-drag">
<div class="owl-stage-outer">
<div class="owl-stage" style="transform: translate3d(-1185px, 0px, 0px); transition: all 0s ease 0s; width: 4349px;">
<div class="owl-item cloned" style="width: 385.333px; margin-right: 10px;">
<div class="all-home-testimonial-slider">
<div class="home3-testimonial-slider-single home2-all-before">
<div class="home3-tesimonial-img"><img src="../../Assets/img/icons/home3-testimonial-img.svg" alt="" /></div>
<div class="home3-testimonial-stars">
<ul>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
</ul>
</div>
<div class="testimonial-hadding">
<p>I&rsquo;m a UC Davis graduate with a BA in Rhetoric and Communications. As an enrolled agent, I an hold the same authority as an attorney and CPA in an IRS audit and can represent you are to an have throughout all levels of the IRS. I&rsquo;m with a available year round if you need assistance with an IRS letter to Tax Consultant.</p>
</div>
<div class="home3-testimonial-slider-bottom">
<div class="home3-tes-bottom-img"><img src="../../Assets/img/image/home3-tes-iocn-3.png" alt="" /></div>
<div class="testimonial-slider-bottom-hadding">
<h6>Sabrina Stamm</h6>
<p>Founder, Vanwirk</p>
</div>
</div>
</div>
</div>
</div>
<div class="owl-item cloned" style="width: 385.333px; margin-right: 10px;">
<div class="all-home-testimonial-slider">
<div class="home3-testimonial-slider-single home2-all-before">
<div class="home3-tesimonial-img"><img src="../../Assets/img/icons/home3-testimonial-img.svg" alt="" /></div>
<div class="home3-testimonial-stars">
<ul>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
</ul>
</div>
<div class="testimonial-hadding">
<p>I&rsquo;m a UC Davis graduate with a BA in Rhetoric and Communications. As an enrolled agent, I an hold the same authority as an attorney and CPA in an IRS audit and can represent you are to an have throughout all levels of the IRS. I&rsquo;m with a available year round if you need assistance with an IRS letter to Tax Consultant.</p>
</div>
<div class="home3-testimonial-slider-bottom">
<div class="home3-tes-bottom-img"><img src="../../Assets/img/image/home3-tes-iocn-2.png" alt="" /></div>
<div class="testimonial-slider-bottom-hadding">
<h6>Sabrina Stamm</h6>
<p>Founder, Vanwirk</p>
</div>
</div>
</div>
</div>
</div>
<div class="owl-item cloned" style="width: 385.333px; margin-right: 10px;">
<div class="all-home-testimonial-slider">
<div class="home3-testimonial-slider-single home2-all-before">
<div class="home3-tesimonial-img"><img src="../../Assets/img/icons/home3-testimonial-img.svg" alt="" /></div>
<div class="home3-testimonial-stars">
<ul>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
</ul>
</div>
<div class="testimonial-hadding">
<p>I&rsquo;m a UC Davis graduate with a BA in Rhetoric and Communications. As an enrolled agent, I an hold the same authority as an attorney and CPA in an IRS audit and can represent you are to an have throughout all levels of the IRS. I&rsquo;m with a available year round if you need assistance with an IRS letter to Tax Consultant.</p>
</div>
<div class="home3-testimonial-slider-bottom">
<div class="home3-tes-bottom-img"><img src="../../Assets/img/image/home3-tes-iocn-3.png" alt="" /></div>
<div class="testimonial-slider-bottom-hadding">
<h6>Sabrina Stamm</h6>
<p>Founder, Vanwirk</p>
</div>
</div>
</div>
</div>
</div>
<div class="owl-item active" style="width: 385.333px; margin-right: 10px;">
<div class="all-home-testimonial-slider">
<div class="home3-testimonial-slider-single home2-all-before">
<div class="home3-tesimonial-img"><img src="../../Assets/img/icons/home3-testimonial-img.svg" alt="" /></div>
<div class="home3-testimonial-stars">
<ul>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
</ul>
</div>
<div class="testimonial-hadding">
<p>I&rsquo;m a UC Davis graduate with a BA in Rhetoric and Communications. As an enrolled agent, I an hold the same authority as an attorney and CPA in an IRS audit and can represent you are to an have throughout all levels of the IRS. I&rsquo;m with a available year round if you need assistance with an IRS letter to Tax Consultant.</p>
</div>
<div class="home3-testimonial-slider-bottom">
<div class="home3-tes-bottom-img"><img src="../../Assets/img/image/home3-tes-iocn-1.png" alt="" /></div>
<div class="testimonial-slider-bottom-hadding">
<h6>Sabrina Stamm</h6>
<p>Founder, Vanwirk</p>
</div>
</div>
</div>
</div>
</div>
<div class="owl-item active" style="width: 385.333px; margin-right: 10px;">
<div class="all-home-testimonial-slider">
<div class="home3-testimonial-slider-single home2-all-before">
<div class="home3-tesimonial-img"><img src="../../Assets/img/icons/home3-testimonial-img.svg" alt="" /></div>
<div class="home3-testimonial-stars">
<ul>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
</ul>
</div>
<div class="testimonial-hadding">
<p>I&rsquo;m a UC Davis graduate with a BA in Rhetoric and Communications. As an enrolled agent, I an hold the same authority as an attorney and CPA in an IRS audit and can represent you are to an have throughout all levels of the IRS. I&rsquo;m with a available year round if you need assistance with an IRS letter to Tax Consultant.</p>
</div>
<div class="home3-testimonial-slider-bottom">
<div class="home3-tes-bottom-img"><img src="../../Assets/img/image/home3-tes-iocn-2.png" alt="" /></div>
<div class="testimonial-slider-bottom-hadding">
<h6>Sabrina Stamm</h6>
<p>Founder, Vanwirk</p>
</div>
</div>
</div>
</div>
</div>
<div class="owl-item active" style="width: 385.333px; margin-right: 10px;">
<div class="all-home-testimonial-slider">
<div class="home3-testimonial-slider-single home2-all-before">
<div class="home3-tesimonial-img"><img src="../../Assets/img/icons/home3-testimonial-img.svg" alt="" /></div>
<div class="home3-testimonial-stars">
<ul>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
</ul>
</div>
<div class="testimonial-hadding">
<p>I&rsquo;m a UC Davis graduate with a BA in Rhetoric and Communications. As an enrolled agent, I an hold the same authority as an attorney and CPA in an IRS audit and can represent you are to an have throughout all levels of the IRS. I&rsquo;m with a available year round if you need assistance with an IRS letter to Tax Consultant.</p>
</div>
<div class="home3-testimonial-slider-bottom">
<div class="home3-tes-bottom-img"><img src="../../Assets/img/image/home3-tes-iocn-3.png" alt="" /></div>
<div class="testimonial-slider-bottom-hadding">
<h6>Sabrina Stamm</h6>
<p>Founder, Vanwirk</p>
</div>
</div>
</div>
</div>
</div>
<div class="owl-item" style="width: 385.333px; margin-right: 10px;">
<div class="all-home-testimonial-slider">
<div class="home3-testimonial-slider-single home2-all-before">
<div class="home3-tesimonial-img"><img src="../../Assets/img/icons/home3-testimonial-img.svg" alt="" /></div>
<div class="home3-testimonial-stars">
<ul>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
</ul>
</div>
<div class="testimonial-hadding">
<p>I&rsquo;m a UC Davis graduate with a BA in Rhetoric and Communications. As an enrolled agent, I an hold the same authority as an attorney and CPA in an IRS audit and can represent you are to an have throughout all levels of the IRS. I&rsquo;m with a available year round if you need assistance with an IRS letter to Tax Consultant.</p>
</div>
<div class="home3-testimonial-slider-bottom">
<div class="home3-tes-bottom-img"><img src="../../Assets/img/image/home3-tes-iocn-2.png" alt="" /></div>
<div class="testimonial-slider-bottom-hadding">
<h6>Sabrina Stamm</h6>
<p>Founder, Vanwirk</p>
</div>
</div>
</div>
</div>
</div>
<div class="owl-item" style="width: 385.333px; margin-right: 10px;">
<div class="all-home-testimonial-slider">
<div class="home3-testimonial-slider-single home2-all-before">
<div class="home3-tesimonial-img"><img src="../../Assets/img/icons/home3-testimonial-img.svg" alt="" /></div>
<div class="home3-testimonial-stars">
<ul>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
</ul>
</div>
<div class="testimonial-hadding">
<p>I&rsquo;m a UC Davis graduate with a BA in Rhetoric and Communications. As an enrolled agent, I an hold the same authority as an attorney and CPA in an IRS audit and can represent you are to an have throughout all levels of the IRS. I&rsquo;m with a available year round if you need assistance with an IRS letter to Tax Consultant.</p>
</div>
<div class="home3-testimonial-slider-bottom">
<div class="home3-tes-bottom-img"><img src="../../Assets/img/image/home3-tes-iocn-3.png" alt="" /></div>
<div class="testimonial-slider-bottom-hadding">
<h6>Sabrina Stamm</h6>
<p>Founder, Vanwirk</p>
</div>
</div>
</div>
</div>
</div>
<div class="owl-item cloned" style="width: 385.333px; margin-right: 10px;">
<div class="all-home-testimonial-slider">
<div class="home3-testimonial-slider-single home2-all-before">
<div class="home3-tesimonial-img"><img src="../../Assets/img/icons/home3-testimonial-img.svg" alt="" /></div>
<div class="home3-testimonial-stars">
<ul>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
</ul>
</div>
<div class="testimonial-hadding">
<p>I&rsquo;m a UC Davis graduate with a BA in Rhetoric and Communications. As an enrolled agent, I an hold the same authority as an attorney and CPA in an IRS audit and can represent you are to an have throughout all levels of the IRS. I&rsquo;m with a available year round if you need assistance with an IRS letter to Tax Consultant.</p>
</div>
<div class="home3-testimonial-slider-bottom">
<div class="home3-tes-bottom-img"><img src="../../Assets/img/image/home3-tes-iocn-1.png" alt="" /></div>
<div class="testimonial-slider-bottom-hadding">
<h6>Sabrina Stamm</h6>
<p>Founder, Vanwirk</p>
</div>
</div>
</div>
</div>
</div>
<div class="owl-item cloned" style="width: 385.333px; margin-right: 10px;">
<div class="all-home-testimonial-slider">
<div class="home3-testimonial-slider-single home2-all-before">
<div class="home3-tesimonial-img"><img src="../../Assets/img/icons/home3-testimonial-img.svg" alt="" /></div>
<div class="home3-testimonial-stars">
<ul>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
</ul>
</div>
<div class="testimonial-hadding">
<p>I&rsquo;m a UC Davis graduate with a BA in Rhetoric and Communications. As an enrolled agent, I an hold the same authority as an attorney and CPA in an IRS audit and can represent you are to an have throughout all levels of the IRS. I&rsquo;m with a available year round if you need assistance with an IRS letter to Tax Consultant.</p>
</div>
<div class="home3-testimonial-slider-bottom">
<div class="home3-tes-bottom-img"><img src="../../Assets/img/image/home3-tes-iocn-2.png" alt="" /></div>
<div class="testimonial-slider-bottom-hadding">
<h6>Sabrina Stamm</h6>
<p>Founder, Vanwirk</p>
</div>
</div>
</div>
</div>
</div>
<div class="owl-item cloned" style="width: 385.333px; margin-right: 10px;">
<div class="all-home-testimonial-slider">
<div class="home3-testimonial-slider-single home2-all-before">
<div class="home3-tesimonial-img"><img src="../../Assets/img/icons/home3-testimonial-img.svg" alt="" /></div>
<div class="home3-testimonial-stars">
<ul>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
<li><!-- <i class="fa-solid fa-star"></i> Font Awesome fontawesome.com --></li>
</ul>
</div>
<div class="testimonial-hadding">
<p>I&rsquo;m a UC Davis graduate with a BA in Rhetoric and Communications. As an enrolled agent, I an hold the same authority as an attorney and CPA in an IRS audit and can represent you are to an have throughout all levels of the IRS. I&rsquo;m with a available year round if you need assistance with an IRS letter to Tax Consultant.</p>
</div>
<div class="home3-testimonial-slider-bottom">
<div class="home3-tes-bottom-img"><img src="../../Assets/img/image/home3-tes-iocn-3.png" alt="" /></div>
<div class="testimonial-slider-bottom-hadding">
<h6>Sabrina Stamm</h6>
<p>Founder, Vanwirk</p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="owl-nav"><button class="owl-prev" role="presentation" type="button"><!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></button><button class="owl-next" role="presentation" type="button"><!-- <i class="fa-solid fa-arrow-left"></i> Font Awesome fontawesome.com --></button></div>
<div class="owl-dots disabled">&nbsp;</div>
</div>
</div>
</div>
</div>
<!--=====testimonial-end=======--> <!--=====our-blog-start=======-->
<div class="home2-blog sec-padding space-sm-30">
<div class="container">
<div class="row">
<div class="col-md-7 text-center m-auto aos-init" data-aos="fade-up" data-aos-duration="800">
<div class="home2-hadding hadding-span home2-padding-after"><span class="span">Our Blog</span>
<h1>Financial Management <span class="after">Insurance</span> <br />Services We Simplify</h1>
</div>
</div>
</div>
<div class="row">
<div class="col-md-6 col-lg-4 aos-init" data-aos="fade-left" data-aos-duration="800">
<div class="home2-service-box">
<div class="home2-service-box-img">
<div class="home2-service-box-img-1"><img src="../../Assets/img/image/home2-blog-img-1.png" alt="" /></div>
</div>
<div class="home2-service-hadding home2-hadding-p home2-hadding home2-all-before">
<h4><a href="blog.html">Financial planning for people who Love financial planning.</a></h4>
<div class="space10">&nbsp;</div>
<p>Take your life the Financial Consultant Around The World next level with Rise, built in financial consultation with our Team</p>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="blog.html">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
<div class="col-md-6 col-lg-4 aos-init" data-aos="fade-left" data-aos-duration="1400">
<div class="home2-service-box">
<div class="home2-service-box-img">
<div class="home2-service-box-img-1"><img src="../../Assets/img/image/home2-blog-img-2.png" alt="" /></div>
</div>
<div class="home2-service-hadding home2-hadding-p home2-hadding home2-all-before">
<h4><a href="blog.html">Ispirations drive the creation your financial plan and your portfolio.</a></h4>
<div class="space10">&nbsp;</div>
<p>Take your life the Financial Consultant Around The World next level with Rise, built in financial consultation with our Team</p>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="blog.html">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
<div class="col-md-6 col-lg-4 aos-init" data-aos="fade-left" data-aos-duration="1800">
<div class="home2-service-box">
<div class="home2-service-box-img">
<div class="home2-service-box-img-1"><img src="../../Assets/img/image/home2-blog-img-3.png" alt="" /></div>
</div>
<div class="home2-service-hadding home2-hadding-p home2-hadding home2-all-before">
<h4><a href="blog.html">Financial advisor that believes everyone deserves the right Team</a></h4>
<div class="space10">&nbsp;</div>
<p>Take your life the Financial Consultant Around The World next level with Rise, built in financial consultation with our Team</p>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
</div>
</div>
</div>
<!--=====our-blog-end=======--></main>', NULL, N'Home', N'home', 0)
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (8, N'Service', N'<main>
<div class="inner-page-hero-area">
<div class="container">
<div class="row">
<div class="col-md-8 m-auto text-center">
<div class="hadding hadding-sec">
<h1>Our Service</h1>
<h6>Home &gt; Our Service</h6>
</div>
</div>
</div>
</div>
<img class="shape-bottom-right _absolute" src="../../Assets/img/shapes/shape-1.svg" alt="" /> <img class="shape-bottom-left _absolute" src="../../Assets/img/shapes/shape-1.svg" alt="" /></div>
<div class="service-page-service sec-padding">
<div class="container">
<div class="row">
<div class="col-md-6 m-auto text-center">
<div class="hadding"><span class="span">Our Service</span>
<h1>We R Offers Multiple Services<br />Throughout The Year.</h1>
</div>
</div>
</div>
<div class="space20">&nbsp;</div>
<div class="row">
<div class="col-md-6 col-lg-4">
<div class="box-after">
<div class="service-box hadding hadding-p"><img src="../../Assets/img/icons/service-icon-1.svg" alt="" />
<div class="space20">&nbsp;</div>
<h2><a href="#">Strategic Planning</a></h2>
<p>We are fortunate to have a team in which a each member is passionate of his work. At HQ Tax &amp; Financial, we are confident of an a what we are <br />doing.</p>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
<div class="col-md-6 col-lg-4">
<div class="box-after">
<div class="service-box hadding hadding-p"><img src="../../Assets/img/icons/service-icon-2.svg" alt="" />
<div class="space20">&nbsp;</div>
<h2><a href="#">Company Formation</a></h2>
<p>We are fortunate to have a team in which a each member is passionate of his work. At HQ Tax &amp; Financial, we are confident of an a what we are <br />doing.</p>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
<div class="col-lg-4 col-md-6">
<div class="box-after">
<div class="service-box hadding hadding-p"><img src="../../Assets/img/icons/service-icon-3.svg" alt="" />
<div class="space20">&nbsp;</div>
<h2><a href="#">Company Formation</a></h2>
<p>We are fortunate to have a team in which a each member is passionate of his work. At HQ Tax &amp; Financial, we are confident of an a what we are <br />doing.</p>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
<div class="col-md-6 col-lg-4">
<div class="box-after">
<div class="service-box hadding hadding-p"><img src="../../Assets/img/icons/service-icon-4.svg" alt="" />
<div class="space20">&nbsp;</div>
<h2><a href="#">Tax Preparation</a></h2>
<p>We are fortunate to have a team in which a each member is passionate of his work. At HQ Tax &amp; Financial, we are confident of an a what we are <br />doing.</p>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
<div class="col-md-6 col-lg-4">
<div class="box-after">
<div class="service-box hadding hadding-p"><img src="../../Assets/img/icons/service-icon-5.svg" alt="" />
<div class="space20">&nbsp;</div>
<h2><a href="#">Cryptoocurrency Taxes</a></h2>
<p>We are fortunate to have a team in which a each member is passionate of his work. At HQ Tax &amp; Financial, we are confident of an a what we are <br />doing.</p>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
<div class="col-md-6 col-lg-4">
<div class="box-after">
<div class="service-box hadding hadding-p"><img src="../../Assets/img/icons/service-icon-6.svg" alt="" />
<div class="space20">&nbsp;</div>
<h2><a href="#">Business Immigration</a></h2>
<p>We are fortunate to have a team in which a each member is passionate of his work. At HQ Tax &amp; Financial, we are confident of an a what we are <br />doing.</p>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
<div class="col-md-6 col-lg-4">
<div class="box-after">
<div class="service-box hadding hadding-p"><img src="../../Assets/img/icons/service-icon-7.svg" alt="" />
<div class="space20">&nbsp;</div>
<h2><a href="#">Corporate &amp; Partnership Tax</a></h2>
<p>We are fortunate to have a team in which a each member is passionate of his work. At HQ Tax &amp; Financial, we are confident of an a what we are <br />doing.</p>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
<div class="col-md-6 col-lg-4">
<div class="box-after">
<div class="service-box hadding hadding-p"><img src="../../Assets/img/icons/service-icon-8.svg" alt="" />
<div class="space20">&nbsp;</div>
<h2><a href="#">Individual Taxation</a></h2>
<p>We are fortunate to have a team in which a each member is passionate of his work. At HQ Tax &amp; Financial, we are confident of an a what we are <br />doing.</p>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
<div class="col-md-6 col-lg-4">
<div class="box-after">
<div class="service-box hadding hadding-p"><img src="../../Assets/img/icons/service-icon-9.svg" alt="" />
<div class="space20">&nbsp;</div>
<h2><a href="#">Estate &amp; Trust Taxation</a></h2>
<p>We are fortunate to have a team in which a each member is passionate of his work. At HQ Tax &amp; Financial, we are confident of an a what we are <br />doing.</p>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="pricing-plan sec-padding">
<div class="container">
<div class="row">
<div class="col-md-6 m-auto text-center">
<div class="hadding hadding-p"><span class="span">Pricing Plan</span>
<h1>Innovative Solutions Satisfied Clients For Tax Consulting</h1>
<p>&nbsp;</p>
</div>
</div>
</div>
<div class="princing-plans">
<div class="container">
<div class="row">
<div class="col-12 text-center">
<div class="plan-toggle-wrap">
<div class="toggle-inner"><input id="ce-toggle" checked="checked" type="checkbox" /> <span class="custom-toggle">.</span><span class="t-month">Monthly</span> <span class="t-year">Annual</span></div>
</div>
</div>
</div>
<div class="tab-content">
<div id="monthly">
<div class="row">
<div class="col-md-6 col-lg-4">
<div class="price-box box-after">
<div class="hadding hadding-p single-price">
<h2>Priemium</h2>
<p>Make your Froms more Beautuful on- a Brand &amp; Analyze</p>
<div class="space20">&nbsp;</div>
<h2>$299/mo</h2>
<p>Billed Monthly</p>
<div class="space20">&nbsp;</div>
<div class="price-button btn-after-price">
<div class="button price-btn text-center"><a href="#">Get a Free Consultaion</a></div>
</div>
<div class="space40">&nbsp;</div>
<div class="price-list">
<ul>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> IRS Tax Problems</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Payroll Services</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Tax Prepration and Planning</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Company Formation</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Business Immigration</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Bookkeeping and Virtual CFO</li>
<li><img src="../../Assets/img/icons/check1.svg" alt="" /> Businessman Consulting</li>
<li><img src="../../Assets/img/icons/check1.svg" alt="" /> Accounting/Virtual Controller</li>
</ul>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-lg-4">
<div class="price-box box-after">
<div class="hadding hadding-p single-price">
<h2>Plus</h2>
<p>Make your Froms more Beautuful on- a Brand &amp; Analyze</p>
<div class="space20">&nbsp;</div>
<h2>$499/mo</h2>
<p>Billed Monthly</p>
<div class="space20">&nbsp;</div>
<div class="price-button btn-after-price">
<div class="button price-btn text-center"><a href="#">Get a Free Consultaion</a></div>
</div>
<div class="space40">&nbsp;</div>
<div class="price-list">
<ul>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> IRS Tax Problems</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Payroll Services</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Tax Prepration and Planning</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Company Formation</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Business Immigration</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Bookkeeping and Virtual CFO</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Businessman Consulting</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Accounting/Virtual Controller</li>
</ul>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-lg-4">
<div class="price-box box-after">
<div class="hadding hadding-p single-price">
<h2>Business</h2>
<p>Make your Froms more Beautuful on- a Brand &amp; Analyze</p>
<div class="space20">&nbsp;</div>
<h2>$399/mo</h2>
<p>Billed Monthly</p>
<div class="space20">&nbsp;</div>
<div class="price-button btn-after-price">
<div class="button price-btn text-center"><a href="#">Get a Free Consultaion</a></div>
</div>
<div class="space40">&nbsp;</div>
<div class="price-list">
<ul>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> IRS Tax Problems</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Payroll Services</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Tax Prepration and Planning</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Company Formation</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Business Immigration</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Bookkeeping and Virtual CFO</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Businessman Consulting</li>
<li><img src="../../Assets/img/icons/check1.svg" alt="" /> Accounting/Virtual Controller</li>
</ul>
</div>
</div>
</div>
</div>
</div>
</div>
<div id="yearly" style="display: none;">
<div class="row">
<div class="col-md-6 col-lg-4">
<div class="price-box box-after">
<div class="hadding hadding-p single-price">
<h2>Priemium</h2>
<p>Make your Froms more Beautuful on- a Brand &amp; Analyze</p>
<div class="space20">&nbsp;</div>
<h2>$999/year</h2>
<p>Billed Yearly</p>
<div class="space20">&nbsp;</div>
<div class="price-button btn-after-price">
<div class="button price-btn text-center"><a href="#">Get a Free Consultaion</a></div>
</div>
<div class="space40">&nbsp;</div>
<div class="price-list">
<ul>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> IRS Tax Problems</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Payroll Services</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Tax Prepration and Planning</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Company Formation</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Business Immigration</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Bookkeeping and Virtual CFO</li>
<li><img src="../../Assets/img/icons/check1.svg" alt="" /> Businessman Consulting</li>
<li><img src="../../Assets/img/icons/check1.svg" alt="" /> Accounting/Virtual Controller</li>
</ul>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-lg-4">
<div class="price-box box-after">
<div class="hadding hadding-p single-price">
<h2>Plus</h2>
<p>Make your Froms more Beautuful on- a Brand &amp; Analyze</p>
<div class="space20">&nbsp;</div>
<h2>$1299/year</h2>
<p>Billed Yearly</p>
<div class="space20">&nbsp;</div>
<div class="price-button btn-after-price">
<div class="button price-btn text-center"><a href="#">Get a Free Consultaion</a></div>
</div>
<div class="space40">&nbsp;</div>
<div class="price-list">
<ul>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> IRS Tax Problems</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Payroll Services</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Tax Prepration and Planning</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Company Formation</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Business Immigration</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Bookkeeping and Virtual CFO</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Businessman Consulting</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Accounting/Virtual Controller</li>
</ul>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-lg-4">
<div class="price-box box-after">
<div class="hadding hadding-p single-price">
<h2>Business</h2>
<p>Make your Froms more Beautuful on- a Brand &amp; Analyze</p>
<div class="space20">&nbsp;</div>
<h2>$1999/year</h2>
<p>Billed Yearly</p>
<div class="space20">&nbsp;</div>
<div class="price-button btn-after-price">
<div class="button price-btn text-center"><a href="#">Get a Free Consultaion</a></div>
</div>
<div class="space40">&nbsp;</div>
<div class="price-list">
<ul>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> IRS Tax Problems</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Payroll Services</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Tax Prepration and Planning</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Company Formation</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Business Immigration</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Bookkeeping and Virtual CFO</li>
<li><img src="../../Assets/img/icons/check.svg" alt="" /> Businessman Consulting</li>
<li><img src="../../Assets/img/icons/check1.svg" alt="" /> Accounting/Virtual Controller</li>
</ul>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<img class="shape-top-right _absolute" src="../../Assets/img/shapes/shape-1.svg" alt="" /> <img class="shape-bottom-left _absolute" src="../../Assets/img/shapes/shape-1.svg" alt="" /></div>
<div class="testimonial sec-padding">
<div class="container">
<div class="row align-items-center">
<div class="col-md-6 m-auto text-center">
<div class="hadding"><span class="span"> Testimonial </span>
<h1>Our Certified Public Accountants Have Knowledge And Experience</h1>
</div>
</div>
</div>
<div class="space-sm-30">&nbsp;</div>
<div class="row">
<div class="col-md-12 col-lg-6">
<div class="slider owl-carousel owl-loaded owl-drag">
<div class="owl-stage-outer">
<div class="owl-stage" style="transform: translate3d(-1160px, 0px, 0px); transition: all 0s ease 0s; width: 4060px;">
<div class="owl-item cloned" style="width: 570px; margin-right: 10px;">
<div class="testimonial-box box-after">
<div class="testimonial-box-img text-center hadding hadding-p"><img src="../../Assets/img/image/testimonial-box-img.png" alt="" />
<h2>Mr. Scott Wyman</h2>
<p>Mobile Developer</p>
</div>
<h6>Our certified public accountants have knowledge and experience in a wide variety of industries. We offer diverse and very unique specialty services that ensure continued growth, success and longevity for decades to Come to Tax Consulting.</h6>
</div>
</div>
<div class="owl-item cloned" style="width: 570px; margin-right: 10px;">
<div class="testimonial-box box-after">
<div class="testimonial-box-img text-center hadding hadding-p"><img src="../../Assets/img/image/testimonial-box-img.png" alt="" />
<h2>Mr. Scott Wyman</h2>
<p>Mobile Developer</p>
</div>
<h6>Our certified public accountants have knowledge and experience in a wide variety of industries. We offer diverse and very unique specialty services that ensure continued growth, success and longevity for decades to Come to Tax Consulting.</h6>
</div>
</div>
<div class="owl-item active" style="width: 570px; margin-right: 10px;">
<div class="testimonial-box box-after">
<div class="testimonial-box-img text-center hadding hadding-p"><img src="../../Assets/img/image/testimonial-box-img.png" alt="" />
<h2>Mr. Scott Wyman</h2>
<p>Mobile Developer</p>
</div>
<h6>Our certified public accountants have knowledge and experience in a wide variety of industries. We offer diverse and very unique specialty services that ensure continued growth, success and longevity for decades to Come to Tax Consulting.</h6>
</div>
</div>
<div class="owl-item" style="width: 570px; margin-right: 10px;">
<div class="testimonial-box box-after">
<div class="testimonial-box-img text-center hadding hadding-p"><img src="../../Assets/img/image/testimonial-box-img.png" alt="" />
<h2>Mr. Scott Wyman</h2>
<p>Mobile Developer</p>
</div>
<h6>Our certified public accountants have knowledge and experience in a wide variety of industries. We offer diverse and very unique specialty services that ensure continued growth, success and longevity for decades to Come to Tax Consulting.</h6>
</div>
</div>
<div class="owl-item" style="width: 570px; margin-right: 10px;">
<div class="testimonial-box box-after">
<div class="testimonial-box-img text-center hadding hadding-p"><img src="../../Assets/img/image/testimonial-box-img.png" alt="" />
<h2>Mr. Scott Wyman</h2>
<p>Mobile Developer</p>
</div>
<h6>Our certified public accountants have knowledge and experience in a wide variety of industries. We offer diverse and very unique specialty services that ensure continued growth, success and longevity for decades to Come to Tax Consulting.</h6>
</div>
</div>
<div class="owl-item cloned" style="width: 570px; margin-right: 10px;">
<div class="testimonial-box box-after">
<div class="testimonial-box-img text-center hadding hadding-p"><img src="../../Assets/img/image/testimonial-box-img.png" alt="" />
<h2>Mr. Scott Wyman</h2>
<p>Mobile Developer</p>
</div>
<h6>Our certified public accountants have knowledge and experience in a wide variety of industries. We offer diverse and very unique specialty services that ensure continued growth, success and longevity for decades to Come to Tax Consulting.</h6>
</div>
</div>
<div class="owl-item cloned" style="width: 570px; margin-right: 10px;">
<div class="testimonial-box box-after">
<div class="testimonial-box-img text-center hadding hadding-p"><img src="../../Assets/img/image/testimonial-box-img.png" alt="" />
<h2>Mr. Scott Wyman</h2>
<p>Mobile Developer</p>
</div>
<h6>Our certified public accountants have knowledge and experience in a wide variety of industries. We offer diverse and very unique specialty services that ensure continued growth, success and longevity for decades to Come to Tax Consulting.</h6>
</div>
</div>
</div>
</div>
<div class="owl-nav"><button class="owl-prev" role="presentation" type="button"><!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></button><button class="owl-next" role="presentation" type="button"><!-- <i class="fa-solid fa-arrow-left"></i> Font Awesome fontawesome.com --></button></div>
<div class="owl-dots disabled">&nbsp;</div>
</div>
</div>
<div class="col-md-12 col-lg-6 space-sm-30">
<div class="testimonial-img text-end"><img src="../../Assets/img/image/testimonial-img.png" alt="" /></div>
</div>
</div>
</div>
</div>
<!--=====testimonial-end=======--></main>', NULL, N'Services', N'services', 0)
INSERT [dbo].[ContentPages] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (9, N'Service Details', N'<main>
<div class="inner-page-hero-area">
<div class="container">
<div class="row">
<div class="col-md-8 m-auto text-center">
<div class="hadding hadding-sec">
<h1>Strategic Planning</h1>
<h6>Home &gt; Strategic Planning</h6>
</div>
</div>
</div>
</div>
<img class="shape-bottom-right _absolute" src="../Assets/img/shapes/shape-1.svg" alt="" /> <img class="shape-bottom-left _absolute" src="../Assets/img/shapes/shape-1.svg" alt="" /></div>
<!--============= pages-hero-area ============--> <!--============= service-details-start ============-->
<div class="service-details sec-padding">
<div class="container">
<div class="row">
<div class="col-md-4">
<div class="details-box">
<div class="hadding details-hadding">
<h2>Search</h2>
</div>
<form action="#">
<div class="service-details-serch">
<div class="service-details-input"><input name="search" type="search" placeholder="Search" /> <button><!-- <i class="fa-solid fa-magnifying-glass"></i> Font Awesome fontawesome.com --></button></div>
</div>
</form></div>
<div class="details-box">
<div class="hadding details-hadding">
<h2>Our Service</h2>
</div>
<div class="service-details-list">
<ul>
<li><a href="#">Strategic Planning <!-- <i class="fa-solid fa-angle-down"></i> Font Awesome fontawesome.com --></a></li>
<li><a href="#">Company Formation <!-- <i class="fa-solid fa-angle-down"></i> Font Awesome fontawesome.com --></a></li>
<li><a href="#">Payroll Services <!-- <i class="fa-solid fa-angle-down"></i> Font Awesome fontawesome.com --></a></li>
<li><a href="#">Tax Preparation <!-- <i class="fa-solid fa-angle-down"></i> Font Awesome fontawesome.com --></a></li>
<li><a href="#">Cryptocurrency Taxes <!-- <i class="fa-solid fa-angle-down"></i> Font Awesome fontawesome.com --></a></li>
<li><a href="#">Business Immigration <!-- <i class="fa-solid fa-angle-down"></i> Font Awesome fontawesome.com --></a></li>
<li><a href="#">Corporate &amp; Partnership Tax <!-- <i class="fa-solid fa-angle-down"></i> Font Awesome fontawesome.com --></a></li>
</ul>
</div>
</div>
<div class="details-box">
<div class="hadding details-hadding">
<h2>Contact</h2>
</div>
<div class="contact-details">
<div class="contact-details-icon"><img src="../Assets/img/icons/contact-details-icon-1.svg" alt="" /></div>
<div class="contact-details-p hadding-p">
<p>3111 West Allegheny Avenue</p>
<p>Pennsylvania 19132</p>
</div>
</div>
<div class="contact-details">
<div class="contact-details-icon"><img src="../Assets/img/icons/contact-details-icon-2.svg" alt="" /></div>
<div class="contact-details-p hadding-p">
<p>0-982-343-4567</p>
<p>1-345-765-0876</p>
</div>
</div>
<div class="contact-details-1">
<div class="contact-details-icon"><img src="../Assets/img/icons/contact-details-icon-3.svg" alt="" /></div>
<div class="contact-details-p hadding-p">
<p>Support@consultore.com</p>
<p>Info@consultore.com</p>
</div>
</div>
</div>
</div>
<div class="col-md-8">
<div class="service-details-all">
<div class="service-details-img img-border"><img src="../Assets/img/image/service-details-img-1.png" alt="" /></div>
<div class="hadding hadding-p">
<div class="space30">&nbsp;</div>
<h2>Strategic Planning</h2>
<div class="space10">&nbsp;</div>
<p>Tax preparation services are great for reducing your financial stress. Instead of gathering your paperwork and sorting through everything on your own, trust Fog City Tax Prep in San to the a Francisco, California to handle it for you. We can handle any step of the tax preparation the consultant process you''re struggling with or manage everything from start to finish.</p>
<div class="space20">&nbsp;</div>
<p>Our process is designed to be friendly, approachable, and fun. Business is important, but we&rsquo;re not about being overwhelming, intimidating, or super serious. We&rsquo;ll start from where you are in your business journey. Our customizable programs can help you.</p>
</div>
<div class="space20">&nbsp;</div>
<div class="service-details-img img-border"><img src="../Assets/img/image/service-details-img-2.png" alt="" /></div>
<div class="space20">&nbsp;</div>
<div class="row">
<div class="col-md-6">
<div class="service-details-img img-border"><img src="../Assets/img/image/service-details-img-3.png" alt="" /></div>
</div>
<div class="col-md-6">
<div class="service-details-img space-sm-30 img-border"><img src="../Assets/img/image/service-details-img-4.png" alt="" /></div>
</div>
</div>
<div class="space30">&nbsp;</div>
<div class="hadding hadding-p">
<h2>Tax preparation services reducing your financial stress.</h2>
<div class="space10">&nbsp;</div>
<p>Tax preparation services are great for reducing your financial stress. Instead of gathering your paperwork and sorting through everything on your own, trust Fog City Tax Prep in San to the a Francisco, California to handle it for you. We can handle any step of the tax preparation the consultant process you''re struggling with or manage everything from start to finish.</p>
<div class="space20">&nbsp;</div>
<p>Our process is designed to be friendly, approachable, and fun. Business is important, but we&rsquo;re not about being overwhelming, intimidating, or super serious. We&rsquo;ll start from where you are in your business journey. Our customizable programs can help you.</p>
</div>
<div class="space40">&nbsp;</div>
<div class="row align-items-center">
<div class="col-md-6">
<div class="service-details-img img-border"><img src="../Assets/img/image/service-details-img-5.png" alt="" /></div>
</div>
<div class="col-md-6">
<div class="hadding hadding-p space-sm-30">
<h2>Service Benefit</h2>
<div class="space10">&nbsp;</div>
<p>After years of serving clients in some of the largest to a metropolitan area of tax consultant.</p>
</div>
<div class="space20">&nbsp;</div>
<div class="price-list">
<ul>
<li><img src="../Assets/img/icons/check.svg" alt="" /> IRS Tax Problems</li>
<li><img src="../Assets/img/icons/check.svg" alt="" /> Payroll Services</li>
<li><img src="../Assets/img/icons/check.svg" alt="" /> Tax Prepration and Planning</li>
<li><img src="../Assets/img/icons/check.svg" alt="" /> Company Formation</li>
</ul>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<!--============= service-details-end ============--> <!--=====service-start=======-->
<div class="service sec-padding">
<div class="container">
<div class="row">
<div class="col-md-6 m-auto text-center">
<div class="hadding">
<h1>Our other Services for you</h1>
</div>
</div>
</div>
<div class="space20">&nbsp;</div>
<div class="row">
<div class="col-md-6 col-lg-4">
<div class="box-after">
<div class="service-box hadding hadding-p"><img src="../Assets/img/icons/service-icon-1.svg" alt="" />
<div class="space20">&nbsp;</div>
<h2>Strategic Planning</h2>
<p>We are fortunate to have a team in which a each member is passionate of his work. At HQ Tax &amp; Financial, we are confident of an a what we are <br />doing.</p>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
<div class="col-md-6 col-lg-4">
<div class="box-after">
<div class="service-box hadding hadding-p"><img src="../Assets/img/icons/service-icon-2.svg" alt="" />
<div class="space20">&nbsp;</div>
<h2>Company Formation</h2>
<p>We are fortunate to have a team in which a each member is passionate of his work. At HQ Tax &amp; Financial, we are confident of an a what we are <br />doing.</p>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
<div class="col-lg-4 col-md-6">
<div class="box-after">
<div class="service-box hadding hadding-p"><img src="../Assets/img/icons/service-icon-3.svg" alt="" />
<div class="space20">&nbsp;</div>
<h2>Payroll Services</h2>
<p>We are fortunate to have a team in which a each member is passionate of his work. At HQ Tax &amp; Financial, we are confident of an a what we are <br />doing.</p>
<div class="space20">&nbsp;</div>
<div class="read-more-btn"><a href="#">Read More <!-- <i class="fa-solid fa-arrow-right"></i> Font Awesome fontawesome.com --></a></div>
</div>
</div>
</div>
</div>
</div>
<img class="shape-top-right _absolute" src="../Assets/img/shapes/shape-1.svg" alt="" /> <img class="shape-bottom-left _absolute" src="../Assets/img/shapes/shape-1.svg" alt="" /></div>
<!--=====service-end=======--> <!--=====service-faq-start=======-->
<div class="service-faq sec-padding">
<div class="container">
<div class="row">
<div class="col-md-6 m-auto text-center">
<div class="hadding">
<h1>Tax Consultant A Selection &amp; Implementation Decisions To FAQ</h1>
</div>
</div>
</div>
<div class="space40">&nbsp;</div>
<div class="row align-items-center">
<div class="col-md-6">
<div class="service-details-img img-border"><img src="../Assets/img/image/service-faq.png" alt="" /></div>
</div>
<div class="col-md-6">
<div class="hadding hadding-p space-sm-30">
<h2>Business acumen and analytical capabilities to help you make the right decisions.</h2>
<p>There is no shortage of accounting software solutions for your to a business. Software as a service (SaaS), cloud computing.</p>
</div>
<div class="space20">&nbsp;</div>
<div id="accordionExample" class="accordion">
<div class="accordion-item">
<h2 id="headingOne" class="accordion-header active-header"><button class="accordion-button accordion-button-active" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"> How to reduce federal, state or local tax ? </button></h2>
<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
<div class="accordion-body">Coaching can be indicative of increased employee engagement; 65% of employees from companies with strong coaching cultures rated themselves as highly engaged. Coaching also has an impact on financial performance, with 60% of respondents from organizations with strong coaching cultures reporting their 2013 revenue to be above average, compared to their peer group.</div>
</div>
</div>
<div class="accordion-item">
<h2 id="headingTwo" class="accordion-header"><button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"> How to help you deal with any business ? </button></h2>
<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
<div class="accordion-body">Coaching can be indicative of increased employee engagement; 65% of employees from companies with strong coaching cultures rated themselves as highly engaged. Coaching also has an impact on financial performance, with 60% of respondents from organizations with strong coaching cultures reporting their 2013 revenue to be above average, compared to their peer group.</div>
</div>
</div>
<div class="accordion-item">
<h2 id="headingThree" class="accordion-header"><button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree"> How your business grows and Changes ? </button></h2>
<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
<div class="accordion-body">Coaching can be indicative of increased employee engagement; 65% of employees from companies with strong coaching cultures rated themselves as highly engaged. Coaching also has an impact on financial performance, with 60% of respondents from organizations with strong coaching cultures reporting their 2013 revenue to be above average, compared to their peer group.</div>
</div>
</div>
<div class="accordion-item">
<h2 id="headingFour" class="accordion-header"><button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour"> How personal and your business tax issues ? </button></h2>
<div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
<div class="accordion-body">Coaching can be indicative of increased employee engagement; 65% of employees from companies with strong coaching cultures rated themselves as highly engaged. Coaching also has an impact on financial performance, with 60% of respondents from organizations with strong coaching cultures reporting their 2013 revenue to be above average, compared to their peer group.</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</main>', NULL, N'Service Details', N'serviceDetails', 0)
SET IDENTITY_INSERT [dbo].[ContentPages] OFF
GO
SET IDENTITY_INSERT [dbo].[ContentPages2] ON 

INSERT [dbo].[ContentPages2] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (26, N'Company Profile', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 5, N'Company Profile', N'Company Profile', 0)
SET IDENTITY_INSERT [dbo].[ContentPages2] OFF
GO
SET IDENTITY_INSERT [dbo].[ContentPages3] ON 

INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (1, N'Pocket $63K', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="../../Public/Content/82c9f442-07e0-4119-a7b3-0b4732b11474.png" width="367" height="197" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost:</p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', NULL, N'Pocket 63K', N'pocket-63k', 2)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (2, N'Features', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', NULL, N'Features', N'features', 3)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (3, N'Pricing', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', NULL, N'Pricing', N'pricing', 4)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (4, N'FAQ', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', NULL, N'FAQ', N'faq', 5)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (5, N'About Us', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', NULL, N'About Us', N'about', 6)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (6, N'Contact Us', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', NULL, N'Contact Us', N'contact', 7)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (7, N'Home', N'<div class="container">
<div class="top-content">
<div class="slider-wrapper">
<div class="row">
<div class="col-md-3">
<div class="subscribe-form">
<h3 class="widget-title">Login</h3>
<form action="/Account/Login" method="post"><fieldset><input id="Email" class="form-control" name="Email" type="email" value="" data-val="true" data-val-email="The Email field is not a valid e-mail address." data-val-required="The Email field is required." /></fieldset><fieldset><input id="Password" class="form-control" name="Password" type="password" value="" data-val="true" data-val-required="The Password field is required." /></fieldset><fieldset><button id="send-button" class="btn main-btn" type="submit">Login</button></fieldset></form></div>
</div>
<div class="col-md-9">
<div id="owl-demo" class="owl-carousel owl-theme">
<div class="item">
<div class="row h-100">
<div class="col-md-5">
<p class="img"><img class="img-thumbnail" src="../../Public/Content/82c9f442-07e0-4119-a7b3-0b4732b11474.png" alt="Worker.png" width="308" height="169" /></p>
</div>
<div class="col-md-7">
<h4 class="owl-crousel-heading">Our System</h4>
<p class="owl-crousel-body">My Healthcare Company is a 100% web-based solution designed to simplify and organize many of the processes required to operate a Behavioral or Home Healthcare Organization. Mental Health, Developmental Disabilities, and Substance Abuse services can be a daunting task full of documentation and state regulations. My Healthcare Company is designed to combine all of those processes into one intuitive user interface to afford its users on-demand, secure, and controlled access to critical company data, client data, and documentation.</p>
</div>
</div>
</div>
<div class="item">
<div class="row">
<div class="col-md-5">
<p class="img"><img class="img-thumbnail" src="../../Public/Content/27503658-02a3-4245-b864-50d463fabcb0.png" alt="" width="1600" height="860" /></p>
</div>
<div class="col-md-7">
<h4 class="owl-crousel-heading">Support and Training</h4>
<div class="owl-crousel-body">Customer Support is critical to the success of any company that provides software and/or services. Customer support is available 24/7 from trained staff that have background and experience in the healthcare industry.
<ul>
<li>FREE 24 / 7 support</li>
<li>$0 set Up and training</li>
<li>No contracts to sign</li>
</ul>
<a href="#">Read More</a></div>
</div>
</div>
</div>
<div class="item">
<div class="row">
<div class="col-md-5">
<p class="img"><img class="img-thumbnail" src="../../Public/Content/354d031b-3adb-4e0b-9979-17beadb85a7d.png" alt="" width="1920" height="1030" /></p>
</div>
<div class="col-md-7">
<h4 class="owl-crousel-heading">EHR Incentives</h4>
<div class="owl-crousel-body">Our staff will help to ensure that your company receives the maximum incentive dollars allowed for each eligible provider. You do not have to exclusively use our system to receive incentive dollars Summer 2012. Please contact us so you can register for your share of the stimulus dollars.</div>
</div>
</div>
</div>
<div class="item">
<div class="row">
<div class="col-md-5">
<p class="img"><img class="img-thumbnail" src="../../Public/Content/145f45f6-93d3-4e81-8324-b0c4353eb117.png" alt="" width="1920" height="1030" /></p>
</div>
<div class="col-md-7">
<h4 class="owl-crousel-heading">We Want To Hear Your Ideas</h4>
<div class="owl-crousel-body">Four times a year we have user group meetings, so be sure that you and your company are on our mailing list so that you can participate in these meetings. During these meetings we provide breakfast, lunch or dinner depending on the time and location, while our clients'' along with our staff and other consultants provide feedback on items that make the system better. Our focus is to continue making the system better for our clients and auditors as we comply with components of the Health Information Exchange.</div>
</div>
</div>
</div>
<div class="item">
<div class="row">
<div class="col-md-5">
<p class="img"><img class="img-thumbnail" src="../../Public/Content/3ae6b018-3c07-430c-a75f-2eec9bb19875.png" alt="" width="1920" height="1030" /></p>
</div>
<div class="col-md-7">
<h4 class="owl-crousel-heading">No 3rd Party Billers</h4>
<div class="owl-crousel-body">Our company is set up as a clearinghouse in every state that we provide notes, documentation, EHR Incentives and Automated Billing. Our billing is purely automated since we have been working with various state sources, consultants for over 9 years now.</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row">
<div class="col-md-9">
<div class="box-content">
<div class="row">
<div class="col-md-12">
<h4 class="widget-title">&nbsp;</h4>
<h4 class="widget-title">Features</h4>
</div>
</div>
<div class="row">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Automated Billing</h3>
<p class="card-text">ICAN serves as a clearinghouse for our providers. Your billing is automatically sent to your payers.....<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Client Note Entry &amp; Approval</h3>
<p class="card-text">Our note entry and approval process supports standard formats (i.e. PIE, BIRP, GIRP, SOAP, State Specific) ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row mt-10">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Data Backup</h3>
<p class="card-text">Staff Certified Network Engineers ensure your data is backed up real-time by using SQL Server Clustering ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">24/7 Support</h3>
<p class="card-text">Our customer service staff is available to answer questions and assist when needed ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row mt-10">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Security</h3>
<p class="card-text">Security isn&rsquo;t just important to your customers, it&rsquo;s the law. My Healthcare Company ensures ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Employee Screening</h3>
<p class="card-text">Create an applicant pool seperate from your employees to allow credentialing and verification<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row mt-10">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Eligibility Checks</h3>
<p class="card-text">When dealing with multiple payers, let our system perform automated eligibiity checks on your consumers ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Plagiarism Checks</h3>
<p class="card-text">If you think your staff is coping documentation, the plagiarism checker will let you know how close each note matches ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row mt-10">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Real-Time Reporting</h3>
<p class="card-text">Run real-time reports on financials, outcome measurements, labels, listings, EHR Meaningful Use ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Payroll Generation</h3>
<p class="card-text">Generate your payroll based on various combinations or customer defined queries ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row mt-10">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Multiple locations</h3>
<p class="card-text">Our system and staff service clients in over 6 states in the Mental and Home Health sectors ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">E-Prescribing</h3>
<p class="card-text">Use this feature to create, monitor and send prescriptions to your pharmacist with a few clicks ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row mt-10">
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Lab Results</h3>
<p class="card-text">Integrate with labs accross the country to submit and receive lab results on your consumers ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6 post-grid">
<div class="card mb-3" style="max-width: 540px;">
<div class="row no-gutters">
<div class="col-md-3"><img class="img-thumbnail" src="https://via.placeholder.com/80" alt="..." /></div>
<div class="col-md-9">
<div class="card-body">
<h3 class="card-title">Scheduling</h3>
<p class="card-text">Schedule your case loads so you know which staff are responsible for each consumer ...<small class="text-muted float-right"><a class="btn btn-primary" href="#">View more</a></small></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-3">
<div class="box-content">
<div class="events-sidebar">
<ul>
<li class="event-item"><img class="img-thumbnail" src="https://via.placeholder.com/231x202.png?text=live+demo" alt="" /></li>
<li class="event-item">
<h3 class="text-purple" style="font-size: 2rem;">Testimonials</h3>
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.</p>
</li>
</ul>
<a class="read-more" href="events-list.html">More Events &rarr;</a></div>
</div>
</div>
</div>
</div>', NULL, N'Home', N'home', 1)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (8, N'How it works', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 1, N'How It works', N'how-it-works', 1)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (9, N'Guaranteed Payment', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 1, N'Guaranteed Payment', N'guaranteed-payment', 2)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (10, N'HITECH Guarantee Q&A', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 1, N'HITECH Guarantee Q&A', N'hitech-guarantee-qa', 3)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (11, N'Client Note Entry & Approval', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Client Note Entry & Approval', N'client-note-entry-and-approval', 1)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (12, N'Automate Billing', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Automate Billing', N'automate-billing', 2)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (13, N'Security', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Security', N'security', 3)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (14, N'24/7 Support', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'24/7 Support', N'24-7-support', 4)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (15, N'Data Backup', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Data Backup', N'data-backup', 5)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (16, N'Employee Screening', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Employee Screening', N'employee-screening', 6)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (17, N'Eligibility Checks', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Eligibility Checks', N'eligibility-checks', 7)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (18, N'Plagiarism Checks', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Plagiarism Checks', N'plagiarism-checks', 8)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (19, N'Real-Time Reporting', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Real-Time Reporting', N'real-time-reporting', 9)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (20, N'Payroll Generation', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Payroll Generation', N'payroll-generation', 10)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (21, N'Multiple Locations', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Multiple Locations', N'multiple-locations', 11)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (22, N'E-Prescribing', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'E-Prescribing', N'E-prescribing', 12)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (23, N'Lab Results', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Lab Results', N'lab-results', 13)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (24, N'Scheduling', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 2, N'Scheduling', N'Scheduling', 14)
INSERT [dbo].[ContentPages3] ([Id], [NavTitle], [Content], [PageId], [Title], [Route], [PageOrder]) VALUES (26, N'Company Profile', N'<div class="blog-single">
<div class="post-content">
<h3 class="post-title">Achieving Meaningful Use with ICAN</h3>
<div class="row">
<div class="col-md-8">According to the 2009 HITECH Act, physicians are eligible to receive up to $44,000 in total incentives per physician from Medicaid for "Meaningful Use" of a certified Electronic Health Record (EHR) starting this year (2011). (Note: Physicians reimbursed by Medicaid can receive up to approximately $63,750 starting in 2011 based on state-defined guidelines.) In July 2010, the Center for Medicare and Medicaid Services (CMS) released their rule for the Stage 1 Meaningful Use requirements that physicians need to meet in order to receive their Meaningful Use incentives. For our in-depth analysis of the rule, <a>click here</a>.</div>
<div class="col-md-4"><img style="margin-right: 5px;" src="https://via.placeholder.com/250x173.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide" /></div>
</div>
<p><br />Medicaid payments have been coming in and beginning in late May our first physician clients began receiving their year one Medicare Meaningful Use checks for up to $18,000. You can read on our blog about the first ICAN client to get paid. These payments represent the first step in the validation and fulfillment of ICAN''s Federal Stimulus Bonus Payment Guarantee Program, unique in the industry for guaranteeing federal Meaningful Use incentive payments, not just Meaningful Use certification. To learn more about our Guarantee. <a href="guaranteedpayment.aspx">click here</a></p>
<h3 class="post-title">Guaranteed Incentives, Nimble Technology</h3>
<p>How can we be so confident in our ability to meet Meaningful Use that we are willing to put our own money on the line?* And why do 100% of our clients share that confidence, according to our surveys, "Ambulatory EMR: On Track for Meaningful Use?" <br />Unlike traditional software or ASP-based EHRs, where all the work involved in meeting and tracking Meaningful Use performance falls on the practice, HITS provides a full-service solution with no extra or hidden costs. Our service includes, at no extra cost: </p>
<ul>
<li>Administrative support that takes on cumbersome tasks of registration and attestation with government agencies</li>
<li>Fully certified clinical quality measures built into the workflow with our proprietary HITS&reg;</li>
<li>A Meaningful Use Resource Center website where clients have access to all the information they need&mdash;at their fingertips</li>
<li>Expert performance coaching to guide and support clients through every stage of the process</li>
</ul>
<p>Here is a more detailed breakdown of how ICAN is addressing key Meaningful Use measures:</p>
<h3 class="post-title">Improved outcomes</h3>
<ul>
<li>Care Coordination (Electronically exchange information): Unlike most EHR offerings, <a href="#">athenaCommunicator&reg;</a>, with its Patient Portal and automated patient messaging, is designed to enhance patient involvement in their health care, enabling practices to meet these Meaningful Use measures.</li>
</ul>
<h3 class="post-title">Advanced clinical processes</h3>
<ul>
<li><strong>Use of e-Prescribing:</strong> BobbyConsultationCompany is Surescripts&reg; certified for Prescription Benefit Eligibility, Formulary, and Reporting; Medication History (payer); Prescription Renewals (retail); and Prescription Routing for New Prescriptions (retail and mail-order).</li>
<li><strong>Closed Order Management: </strong>Because our EHR includes document management services, we make it easy for providers to create and send electronic orders from the encounter. Users can also track and close orders within the application for better follow-up and quality reporting.</li>
</ul>
<h3 class="post-title">Data capture and sharing</h3>
<ul>
<li><strong>Quality care and population management: </strong>BobbyConsultationCompany&rsquo;s rules database provides a set of payer-specific quality measures and also allows for comprehensive and automatic demographic reporting.</li>
<li>Meaningful use offers an important opportunity for physicians to be financially rewarded for adopting an EHR that can effectively achieve measures. We at ICAN are here to help you navigate through the complexities of Meaningful Use, help you get all the incentive dollars you deserve, and free you from administrative red tape so you can focus on quality patient care.</li>
</ul>
<h3 class="post-title">Your Partner Through Reform and Change</h3>
<p>The HITECH Act and Meaningful Use is just one of many huge changes impacting physician practices today. Last year''s historic passage of the Patient Protection and Affordable Care Act set the stage for what will be some of the most significant changes to the U.S. health care system in a generation. To read in more detail about our perspective on the health care reform bill and our response to the challenges it presents, <a>click here</a></p>
<p>One recent manifestation of the reform bill was the release in March of the proposed rules for Accountable Care Organizations, or ACOs. To learn more about ACOs, what they might mean for your practice or organization, and how ICAN can help you navigate any payment future, <a href="cmp/ACO/_doc/ACO_NPRM_Summary.pdf">click here</a></p>
</div>
</div>', 5, N'Company Profile', N'Company Profile', 0)
SET IDENTITY_INSERT [dbo].[ContentPages3] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (315, N'Chat', N'Chat', 1, N'Chat => Chat')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (316, N'Chat', N'GetMoreMessages', 1, N'Chat => Get more messages')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (317, N'Chat', N'GetPrivateChat', 1, N'Chat => Get private chat')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (318, N'Chat', N'GetUserData', 1, N'Chat => Get user data')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (319, N'Chat', N'LoadFile', 1, N'Chat => Load file')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (320, N'Chat', N'UploadFile', 1, N'Chat => Upload file')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (321, N'Chat', N'UploadFilePrivate', 1, N'Chat => Upload file private')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (322, N'Person', N'PersonList', 1, N'Persons => PersonList')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (323, N'Person', N'AddPerson', 1, N'Persons => Add/Edit Person')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (324, N'Person', N'DeletePerson', 1, N'Persons => Delete Person')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (325, N'ContentPage', N'ContentPages', 1, N'ContentPage => ContentPage List')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (326, N'ContentPage', N'AddContentPage', 1, N'ContentPage => Add/Edit ContentPage')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (327, N'ContentPage', N'DeleteContentPage', 1, N'ContentPage => Delete ContentPage')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (328, N'Dashboard', N'Index', 1, N'Dashboard => Index')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (329, N'Dashboard', N'DeleteContact', 1, N'Dashboard => Delete contact')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (330, N'Document', N'DocumentList', 1, N'Document => Document list')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (331, N'Document', N'AddDocument', 1, N'Document => Add document')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (332, N'Appointment', N'AppointmentList', 1, N'Appointments => AppointmentList')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (333, N'Appointment', N'DeleteAppointment', 1, N'Appointments => Delete Appointment')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (334, N'Contact', N'ContactList', 1, N'Contacts => ContactList')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (335, N'Contact', N'AddContact', 1, N'Contacts => Add/Edit Contact')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (336, N'Contact', N'DeleteContact', 1, N'Contacts => Delete Contact')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (337, N'Medication', N'MedicationList', 1, N'Medications => MedicationList')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (338, N'Medication', N'AddMedication', 1, N'Medications => Add/Edit Medication')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (339, N'Medication', N'DeleteMedication', 1, N'Medications => Delete Medication')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (340, N'Goal', N'GoalList', 1, N'Goal => Goal list')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (341, N'Goal', N'AddGoal', 1, N'Goal => Add goal')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (342, N'Goal', N'DeleteGoal', 1, N'Goal => Delete goal')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (343, N'NightLog', N'NightLogList', 1, N'NightLog => Night log list')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (344, N'NightLog', N'AddNightLog', 1, N'NightLog => Add night log')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (345, N'NightLog', N'DeleteNightLog', 1, N'NightLog => Delete night log')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (346, N'ClinicalSummary', N'ClinicalSummaryList', 1, N'ClinicalSummary => Clinical summary list')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (347, N'ClinicalSummary', N'AddClinicalSummary', 1, N'ClinicalSummary => Add clinical summary')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (348, N'ClinicalSummary', N'DeleteClinicalSummary', 1, N'ClinicalSummary => Delete clinical summary')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (349, N'TreatmentPlan', N'TreatmentPlanList', 1, N'TreatmentPlan => Treatment plan list')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (350, N'TreatmentPlan', N'AddTreatmentPlan', 1, N'TreatmentPlan => Add treatment plan')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (351, N'TreatmentPlan', N'DeleteTreatmentPlan', 1, N'TreatmentPlan => Delete treatment plan')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (352, N'Physician', N'PhysicianList', 1, N'Physician => Physician list')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (353, N'Print', N'BlankISP', 1, N'Print => Blank ISP')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (354, N'Print', N'ClinicalSummary', 1, N'Print => Clinical summary')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (355, N'Print', N'ClinicalSummarytwo', 1, N'Print => Clinical summarytwo')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (356, N'Print', N'COFSDischargeSummary', 1, N'Print => COFS discharge summary')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (357, N'Print', N'COFSINCISP', 1, N'Print => COFSINCISP')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (358, N'Print', N'COFSInternationalIncidentForm', 1, N'Print => COFS international incident form')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (359, N'Print', N'DischargeSummary', 1, N'Print => Discharge summary')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (360, N'Print', N'MarCofSinc', 1, N'Print => Mar cof sinc')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (361, N'Print', N'NightLog', 1, N'Print => Night log')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (362, N'Print', N'TreatmentPlan', 1, N'Print => Treatment plan')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (363, N'Print', N'ContinuedStayForm', 1, N'Print => Continued stay form')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (364, N'Print', N'BehaviorPlan', 1, N'Print => Behavior plan')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (365, N'Print', N'BehaviorModification', 1, N'Print => Behavior modification')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (366, N'Print', N'RiskAssessment', 1, N'Print => Risk assessment')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (367, N'Patient', N'PatientList', 1, N'Patients => PatientList')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (368, N'Patient', N'DeletePatient', 1, N'Patients => Delete Patient')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (369, N'Content', N'Portfolios', 1, N'Content => Company Portfolio')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (370, N'Content', N'EmailTemplates', 1, N'Content => Email Templates')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (371, N'Content', N'AddEmailTemplate', 1, N'Content => Edit Email Templates')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (372, N'Permission', N'Index', 1, N'Permission => Permission List')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (373, N'Permission', N'Create', 1, N'Permission => Permission Update')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (374, N'Role', N'RoleIndex', 1, N'Roles => Role List')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (375, N'Role', N'RoleCreate', 1, N'Roles => Create Role')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (376, N'Role', N'RoleDelete', 1, N'Roles => Delete Role')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (377, N'User', N'Users', 1, N'Users => User List')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (378, N'User', N'AddUser', 1, N'Users => Add/Edit User')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (379, N'User', N'ToggleUserActivation', 1, N'Users => Enable/Disable User')
INSERT [dbo].[Permission] ([Id], [Controller], [Action], [AllowAll], [Description]) VALUES (380, N'User', N'DeleteUser', 1, N'Users => Delete User')
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
INSERT [dbo].[PermissionApplicationRoles] ([Permission_Id], [ApplicationRole_Id]) VALUES (374, 2)
INSERT [dbo].[PermissionApplicationRoles] ([Permission_Id], [ApplicationRole_Id]) VALUES (375, 2)
INSERT [dbo].[PermissionApplicationRoles] ([Permission_Id], [ApplicationRole_Id]) VALUES (376, 2)
INSERT [dbo].[PermissionApplicationRoles] ([Permission_Id], [ApplicationRole_Id]) VALUES (378, 2)
INSERT [dbo].[PermissionApplicationRoles] ([Permission_Id], [ApplicationRole_Id]) VALUES (379, 2)
INSERT [dbo].[PermissionApplicationRoles] ([Permission_Id], [ApplicationRole_Id]) VALUES (380, 2)
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [SIN], [DateOfBirth], [Email], [Address], [City], [PostalCode], [HomePhone], [Gender], [CellPhone], [FullTimeStudent], [HasWorkPermit], [DriverLicence], [PermanentResidence], [CANCitizen], [CriminalOffense], [PositionType], [EmploymentStatus], [AvailableDate], [JobType], [Education], [IsLegallyAllowedInCanada]) VALUES (1, N'Zawar', N'Mahmood', N'Lorem', CAST(N'2023-02-02' AS Date), N'zetawars@hotmail.com', N'H#13 St#39 Islampura Karishan Nagar Lahore', N'Lahore', N'54000', N'+923074665233', N'Male', N'+923074665233', N'Yes', 0, N'Yes', N'Yes', N'Yes', N'Lorem', N'General Labour', N'Yes', CAST(N'2023-02-01' AS Date), N'Part Time', N'High School', N'Yes')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [SIN], [DateOfBirth], [Email], [Address], [City], [PostalCode], [HomePhone], [Gender], [CellPhone], [FullTimeStudent], [HasWorkPermit], [DriverLicence], [PermanentResidence], [CANCitizen], [CriminalOffense], [PositionType], [EmploymentStatus], [AvailableDate], [JobType], [Education], [IsLegallyAllowedInCanada]) VALUES (2, N'Zawar', N'Mahmood', N'Lorem', CAST(N'2023-02-15' AS Date), N'zetawars@hotmail.com', N'H#13 St#39 Islampura Karishan Nagar Lahore', N'Lahore', N'54000', N'+923074665233', N'Male', N'+923074665233', N'Yes', 0, N'Yes', N'Yes', N'Yes', N'Lorem', N'General Labour', N'Yes', CAST(N'2023-02-21' AS Date), N'Part Time', N'High School', N'Yes')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [SIN], [DateOfBirth], [Email], [Address], [City], [PostalCode], [HomePhone], [Gender], [CellPhone], [FullTimeStudent], [HasWorkPermit], [DriverLicence], [PermanentResidence], [CANCitizen], [CriminalOffense], [PositionType], [EmploymentStatus], [AvailableDate], [JobType], [Education], [IsLegallyAllowedInCanada]) VALUES (3, N'Zawar', N'Mahmood', N'Lorem', CAST(N'2023-02-15' AS Date), N'zetawars@hotmail.com', N'H#13 St#39 Islampura Karishan Nagar Lahore', N'Lahore', N'54000', N'+923074665233', N'Male', N'+923074665233', N'Yes', 0, N'Yes', N'Yes', N'Yes', N'Lorem ipsum', N'General Labour', N'Yes', CAST(N'2023-02-08' AS Date), N'Part Time', N'High School', N'Yes')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [SIN], [DateOfBirth], [Email], [Address], [City], [PostalCode], [HomePhone], [Gender], [CellPhone], [FullTimeStudent], [HasWorkPermit], [DriverLicence], [PermanentResidence], [CANCitizen], [CriminalOffense], [PositionType], [EmploymentStatus], [AvailableDate], [JobType], [Education], [IsLegallyAllowedInCanada]) VALUES (4, N'Athar', N'Athar', N'Lorem', CAST(N'2023-02-15' AS Date), N'zetawars@hotmail.com', N'H#13 St#39 Islampura Karishan Nagar Lahore', N'Lahore', N'54000', N'+923074665233', N'Male', N'+923074665233', N'Yes', 0, N'Yes', N'Yes', N'Yes', N'lipsum', N'General Labour', N'Yes', CAST(N'2023-02-06' AS Date), N'Part Time', N'High School', N'Yes')
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [Emails].[EmailTemplate] ON 

INSERT [Emails].[EmailTemplate] ([Id], [EmailTemplateType], [Title], [Subject], [Body], [Language]) VALUES (1, 1, N'Email Confirmation', N'Confirm your Email', N'Please confirm your account by clicking <a href="{CallbackUrl}">here</a>', N'en-GB')
INSERT [Emails].[EmailTemplate] ([Id], [EmailTemplateType], [Title], [Subject], [Body], [Language]) VALUES (2, 2, N'Reset Password', N'Reset Password', N'Please reset your password by clicking <a href="{CallbackUrl}">here</a>', N'en-GB')
SET IDENTITY_INSERT [Emails].[EmailTemplate] OFF
GO
SET IDENTITY_INSERT [Emails].[TemplateVariable] ON 

INSERT [Emails].[TemplateVariable] ([Id], [Title], [EmailTemplateId]) VALUES (1, N'CallbackUrl', 1)
INSERT [Emails].[TemplateVariable] ([Id], [Title], [EmailTemplateId]) VALUES (2, N'CallbackUrl', 2)
SET IDENTITY_INSERT [Emails].[TemplateVariable] OFF
GO
INSERT [HangFire].[Schema] ([Version]) VALUES (7)
GO
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'crlhl-ayubbmeh1:26632:712e29d8-a549-418a-a77b-85d200002062', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2023-11-24T08:08:27.6956298Z"}', CAST(N'2023-11-24T08:31:28.537' AS DateTime))
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'crlhl-ayubbmeh1:26632:b41d1d15-a3dc-4f99-9367-0a6fc5375dcd', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2023-11-24T08:08:27.7273866Z"}', CAST(N'2023-11-24T08:31:28.537' AS DateTime))
GO
SET IDENTITY_INSERT [MAR].[Goal] ON 

INSERT [MAR].[Goal] ([Id], [GoalName], [GoalTitle], [Description], [TreatmentPlan_Id]) VALUES (1, N'Abuse/Neglect', N'Explore and resolve issues relating to history of abuse/neglect victimization', N'<ul><li>Share details of the abuse/neglect with therapist as able to do so</li><li>Learn about typical long term/residual effects of traumatic life experiences</li><li>Develop two strategies to help cope with stressful reminders/memories</li></ul>', 6)
INSERT [MAR].[Goal] ([Id], [GoalName], [GoalTitle], [Description], [TreatmentPlan_Id]) VALUES (2, N'Alcohol/Drugs and Other Addictions', N'Be free of drug/alcohol use/abuse', N'<ul><li>Avoid people, places and situations where temptation might be overwhelming</li><li>Explore dynamics relating to being the [child/husband/wife] of an [alcoholic/addict] and discuss them each week at support group meetings</li><li>Learn five triggers for alcohol &amp; drug use</li><li>Reach ____ days/months/years of clean/sober living</li></ul>', NULL)
INSERT [MAR].[Goal] ([Id], [GoalName], [GoalTitle], [Description], [TreatmentPlan_Id]) VALUES (3, N'Adoption/Foster Care Placement', N'Explore and resolve issues related to adoption/out-of-home placement', N'<ul><li>Discuss ongoing concerns and issues related to adoptive and/or biological parents during weekly sessions</li><li>Talk about his/her wishes with regard to permanency planning</li></ul>', 6)
INSERT [MAR].[Goal] ([Id], [GoalName], [GoalTitle], [Description], [TreatmentPlan_Id]) VALUES (4, N'Anger', N'Increase and practice ability to manage anger', N'<ul><li>Walk away from situations that trigger strong emotions (100%)</li><li>Be free of tantrums/explosive episodes</li><li>Learn two positive anger management skills</li><li>Learn three ways to communicate verbally when angry</li><li>Be able to express anger in a productive manner without destroying property or personal belongings</li><li>Be able to express anger without yelling and using foul language</li><li>Explore and resolve conflict with ____ (list triggers)</li><li>Get through an entire day without an angry mood swing (or breaking/punching&hellip;)</li><li>Get through a whole week without fighting with ____</li><li>Take a time-out when things get upsetting</li><li>Learn and practice anger management skills especially in situations where people are not treating him/her respectfully</li></ul>', 6)
INSERT [MAR].[Goal] ([Id], [GoalName], [GoalTitle], [Description], [TreatmentPlan_Id]) VALUES (5, N'Anxiety', N'Develop strategies to reduce symptoms, or  Reduce anxiety and improve coping skills', N'<ul><li>Be free of panic episodes (100%)</li><li>Recognize and plan for top five anxiety-provoking situations</li><li>Learn two new ways of coping with routine stressors</li><li>Report feeling more positive about self and abilities during therapy sessions</li><li>Develop strategies for thought distraction when fixating on the future</li></ul>', 6)
INSERT [MAR].[Goal] ([Id], [GoalName], [GoalTitle], [Description], [TreatmentPlan_Id]) VALUES (6, N'Behavior Problems', N'Improve overall behavior (and attitude/mood), or  Maintain positive behavior (and attitude/mood)', N'<ul><li>Be free of _____ behavior</li><li>Develop a reward system to address ___ (target problem)</li><li>Learn two ways to manage frustration in a positive manner</li><li>Share two positive experiences each week in which X is proud of how he/she has behaved</li><li>Stay free of fights</li><li>Stay free of drug &amp; alcohol use and abuse (100%)</li><li>Be free of violent behavior</li><li>Be able to keep hands and feet to self</li><li>Be able to express anger in a productive manner without destroying property or personal belongings</li><li>Be free of threats to self and others</li><li>Complete daily tasks (e.g. chores, pet care, self care, etc.)</li><li>Avoid leaving clothing/toys/personal stuff all around the house</li><li>Listen to parent and follow simple directions with one prompt</li><li>Put all dishes, glasses, cups, and food items back in the kitchen after meals/snacks</li><li>Clean up after himself/herself</li><li>Admit and accept personal responsibility for own actions/behavior</li><li>Be respectful of adults and avoid talking back</li><li>Get through a whole week without fighting with ____</li><li>Avoid behavior that would result in a loss of custody</li><li>Be able to play with others peacefully for ____ minutes</li><li>Come home each day by ______ (time)</li><li>Keep parents informed about where you are and when you will be home</li><li>Be in bed by _____ each night</li><li>Be free of bedwetting</li><li>Be free of wet/soiled underwear</li><li>If an accident happens, be responsible and clean it up</li><li>Be free of any behavior that could result in loss of job</li><li>Remain free of behaviors which would lead to arrest</li><li>Comply with all aspects of probation/parole and avoid behavior that could violate</li><li>Eat/swallow only items intended to be food</li></ul>', NULL)
INSERT [MAR].[Goal] ([Id], [GoalName], [GoalTitle], [Description], [TreatmentPlan_Id]) VALUES (7, N'Communication Skills', N'Learn and use effective communication strategies', N'<ul><li>Talk nice or do not say anything at all</li><li>Learn three ways to communicate verbally when angry</li><li>Be able to express anger in a productive manner without destroying property or personal belongings</li><li>Be able to express anger without yelling and using foul language</li><li>Be able to express wants and needs through spoken language</li><li>Be able to ask questions and tell about instances</li><li>Be able to stick up for self assertively</li><li>Speak in a clear and concise manner so others fully understand him/her</li><li>Learn to express feelings verbally without acting out</li></ul>', NULL)
INSERT [MAR].[Goal] ([Id], [GoalName], [GoalTitle], [Description], [TreatmentPlan_Id]) VALUES (8, N'Crime', N'Remain free of behaviors which would lead to arrest/violation', N'<ul><li>Keep working and comply with all aspects of probation</li><li>Be able to express anger in a productive manner without destroying property or personal belongings</li><li>Be free of threats to self and others</li><li>Comply with all aspects of probation/parole and avoid behavior that could violate</li><li>Be free of violent behavior</li><li>Stay free of drug &amp; alcohol use and abuse (100%)</li></ul>', NULL)
SET IDENTITY_INSERT [MAR].[Goal] OFF
GO
SET IDENTITY_INSERT [MAR].[Medication] ON 

INSERT [MAR].[Medication] ([Id], [Name]) VALUES (1, N'Med1')
INSERT [MAR].[Medication] ([Id], [Name]) VALUES (2, N'Med2')
INSERT [MAR].[Medication] ([Id], [Name]) VALUES (3, N'Med3')
SET IDENTITY_INSERT [MAR].[Medication] OFF
GO
SET IDENTITY_INSERT [MAR].[Patient] ON 

INSERT [MAR].[Patient] ([Id], [Name], [DateOfBirth], [Sex], [PhoneNumber], [Email], [InsuranceId]) VALUES (1, N'Zawar Mahmood', CAST(N'2021-06-15T00:00:00.000' AS DateTime), N'Male', N'+923074665233', N'zetawars@hotmail.com', NULL)
INSERT [MAR].[Patient] ([Id], [Name], [DateOfBirth], [Sex], [PhoneNumber], [Email], [InsuranceId]) VALUES (3, N'Zawar Mahmood', CAST(N'2021-06-23T00:00:00.000' AS DateTime), NULL, N'+923074665233', N'zetawars@hotmail.com', NULL)
SET IDENTITY_INSERT [MAR].[Patient] OFF
GO
SET IDENTITY_INSERT [MAR].[Physician] ON 

INSERT [MAR].[Physician] ([Id], [PhoneNumber], [Name], [Email]) VALUES (1, N'+923074665233', N'Zawar Mahmood', N'zetawars@hotmail.com')
INSERT [MAR].[Physician] ([Id], [PhoneNumber], [Name], [Email]) VALUES (2, N'3074665233', N'Abdul', N'andrew@monarchtesting.com')
SET IDENTITY_INSERT [MAR].[Physician] OFF
GO
SET IDENTITY_INSERT [MAR].[TreatmentPlan] ON 

INSERT [MAR].[TreatmentPlan] ([Id], [PatientId], [Date], [Signature], [StaffId], [FirstShift], [SecondShift], [ThirdShift], [FaceToFace], [Location], [Effectiveness], [Intervention], [Service]) VALUES (6, 1, CAST(N'2021-06-26T00:00:00.000' AS DateTime), NULL, 6, 0, 0, 0, 0, N'Office', N'<p>Lorem ipsum dollor</p>', N'<p>lorem ipsum dollor</p>', N'<ol><li>Date of Service</li><li>Identification of client</li><li>Purpose of Contact</li><li>Description of Intervention/Activity</li><li>Effectiveness of the intervention/Activity</li><li>Duration of Services</li><li>Signature and Credentials</li></ol>')
SET IDENTITY_INSERT [MAR].[TreatmentPlan] OFF
GO
/****** Object:  Index [IX_PortfolioId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_PortfolioId] ON [Content].[AboutUs]
(
	[PortfolioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PortfolioId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_PortfolioId] ON [Content].[ContactUs]
(
	[PortfolioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PortfolioId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_PortfolioId] ON [Content].[TermsOfService]
(
	[PortfolioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PortfolioId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_PortfolioId] ON [Content].[Testimonial]
(
	[PortfolioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserNotifications]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MedicalRecord_Id]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_MedicalRecord_Id] ON [dbo].[AspNetUsers]
(
	[MedicalRecord_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PageId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_PageId] ON [dbo].[ContentPages]
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApplicationRole_Id]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_ApplicationRole_Id] ON [dbo].[PermissionApplicationRoles]
(
	[ApplicationRole_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Permission_Id]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_Permission_Id] ON [dbo].[PermissionApplicationRoles]
(
	[Permission_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmailTemplateId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_EmailTemplateId] ON [Emails].[TemplateVariable]
(
	[EmailTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
(
	[ExpireAt] ASC
)
INCLUDE([StateName]) 
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MarId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_MarId] ON [MAR].[AdministeredMedicine]
(
	[MarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MedicationId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_MedicationId] ON [MAR].[AdministeredMedicine]
(
	[MedicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StaffId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_StaffId] ON [MAR].[AdministeredMedicine]
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TreatmentPlan_Id]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_TreatmentPlan_Id] ON [MAR].[Goal]
(
	[TreatmentPlan_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_PatientId] ON [MAR].[MedicalRecord]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PhysicianId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_PhysicianId] ON [MAR].[MedicalRecord]
(
	[PhysicianId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MarId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_MarId] ON [MAR].[NotAdministeredMedicine]
(
	[MarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MedicationId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_MedicationId] ON [MAR].[NotAdministeredMedicine]
(
	[MedicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StaffId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_StaffId] ON [MAR].[NotAdministeredMedicine]
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PatientId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_PatientId] ON [MAR].[TreatmentPlan]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StaffId]    Script Date: 26/11/2023 6:04:17 pm ******/
CREATE NONCLUSTERED INDEX [IX_StaffId] ON [MAR].[TreatmentPlan]
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ('Male') FOR [Gender]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ((0)) FOR [OnlineStatus]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (getdate()) FOR [LoginTime]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (getdate()) FOR [DateOfBirth]
GO
ALTER TABLE [dbo].[ContactForm] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[ContactForm] ADD  DEFAULT ('') FOR [Email]
GO
ALTER TABLE [dbo].[ContactForm] ADD  DEFAULT ('') FOR [Phone]
GO
ALTER TABLE [dbo].[ContactForm] ADD  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[ContactForm] ADD  DEFAULT ('') FOR [Company]
GO
ALTER TABLE [dbo].[ContactForm] ADD  DEFAULT ((0)) FOR [Candidates]
GO
ALTER TABLE [dbo].[ContentPages] ADD  DEFAULT ((0)) FOR [PageOrder]
GO
ALTER TABLE [MAR].[TreatmentPlan] ADD  DEFAULT ((0)) FOR [FirstShift]
GO
ALTER TABLE [MAR].[TreatmentPlan] ADD  DEFAULT ((0)) FOR [SecondShift]
GO
ALTER TABLE [MAR].[TreatmentPlan] ADD  DEFAULT ((0)) FOR [ThirdShift]
GO
ALTER TABLE [MAR].[TreatmentPlan] ADD  DEFAULT ((0)) FOR [FaceToFace]
GO
ALTER TABLE [Content].[AboutUs]  WITH CHECK ADD  CONSTRAINT [FK_Content.AboutUs_Content.Portfolio_PortfolioId] FOREIGN KEY([PortfolioId])
REFERENCES [Content].[Portfolio] ([Id])
GO
ALTER TABLE [Content].[AboutUs] CHECK CONSTRAINT [FK_Content.AboutUs_Content.Portfolio_PortfolioId]
GO
ALTER TABLE [Content].[ContactUs]  WITH CHECK ADD  CONSTRAINT [FK_Content.ContactUs_Content.Portfolio_PortfolioId] FOREIGN KEY([PortfolioId])
REFERENCES [Content].[Portfolio] ([Id])
GO
ALTER TABLE [Content].[ContactUs] CHECK CONSTRAINT [FK_Content.ContactUs_Content.Portfolio_PortfolioId]
GO
ALTER TABLE [Content].[TermsOfService]  WITH CHECK ADD  CONSTRAINT [FK_Content.TermsOfService_Content.Portfolio_PortfolioId] FOREIGN KEY([PortfolioId])
REFERENCES [Content].[Portfolio] ([Id])
GO
ALTER TABLE [Content].[TermsOfService] CHECK CONSTRAINT [FK_Content.TermsOfService_Content.Portfolio_PortfolioId]
GO
ALTER TABLE [Content].[Testimonial]  WITH CHECK ADD  CONSTRAINT [FK_Content.Testimonial_Content.Portfolio_PortfolioId] FOREIGN KEY([PortfolioId])
REFERENCES [Content].[Portfolio] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Content].[Testimonial] CHECK CONSTRAINT [FK_Content.Testimonial_Content.Portfolio_PortfolioId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserNotifications]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserNotifications_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserNotifications] CHECK CONSTRAINT [FK_dbo.AspNetUserNotifications_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUsers_dbo.MedicalRecords_MedicalRecord_Id] FOREIGN KEY([MedicalRecord_Id])
REFERENCES [MAR].[MedicalRecord] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_dbo.AspNetUsers_dbo.MedicalRecords_MedicalRecord_Id]
GO
ALTER TABLE [dbo].[ContentPages]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ContentPages_dbo.ContentPages_PageId] FOREIGN KEY([PageId])
REFERENCES [dbo].[ContentPages] ([Id])
GO
ALTER TABLE [dbo].[ContentPages] CHECK CONSTRAINT [FK_dbo.ContentPages_dbo.ContentPages_PageId]
GO
ALTER TABLE [dbo].[PermissionApplicationRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PermissionApplicationRoles_dbo.AspNetRoles_ApplicationRole_Id] FOREIGN KEY([ApplicationRole_Id])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PermissionApplicationRoles] CHECK CONSTRAINT [FK_dbo.PermissionApplicationRoles_dbo.AspNetRoles_ApplicationRole_Id]
GO
ALTER TABLE [dbo].[PermissionApplicationRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PermissionApplicationRoles_dbo.Permission_Permission_Id] FOREIGN KEY([Permission_Id])
REFERENCES [dbo].[Permission] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PermissionApplicationRoles] CHECK CONSTRAINT [FK_dbo.PermissionApplicationRoles_dbo.Permission_Permission_Id]
GO
ALTER TABLE [Emails].[TemplateVariable]  WITH CHECK ADD  CONSTRAINT [FK_Emails.TemplateVariable_Emails.EmailTemplate_EmailTemplateId] FOREIGN KEY([EmailTemplateId])
REFERENCES [Emails].[EmailTemplate] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Emails].[TemplateVariable] CHECK CONSTRAINT [FK_Emails.TemplateVariable_Emails.EmailTemplate_EmailTemplateId]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
ALTER TABLE [MAR].[AdministeredMedicine]  WITH CHECK ADD  CONSTRAINT [FK_MAR.MedicalRecordMedication_dbo.AspNetUsers_StaffId] FOREIGN KEY([StaffId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [MAR].[AdministeredMedicine] CHECK CONSTRAINT [FK_MAR.MedicalRecordMedication_dbo.AspNetUsers_StaffId]
GO
ALTER TABLE [MAR].[AdministeredMedicine]  WITH CHECK ADD  CONSTRAINT [FK_MAR.MedicalRecordMedication_MAR.MedicalRecord_MarId] FOREIGN KEY([MarId])
REFERENCES [MAR].[MedicalRecord] ([Id])
GO
ALTER TABLE [MAR].[AdministeredMedicine] CHECK CONSTRAINT [FK_MAR.MedicalRecordMedication_MAR.MedicalRecord_MarId]
GO
ALTER TABLE [MAR].[AdministeredMedicine]  WITH CHECK ADD  CONSTRAINT [FK_MAR.MedicalRecordMedication_MAR.Medication_MedicationId] FOREIGN KEY([MedicationId])
REFERENCES [MAR].[Medication] ([Id])
GO
ALTER TABLE [MAR].[AdministeredMedicine] CHECK CONSTRAINT [FK_MAR.MedicalRecordMedication_MAR.Medication_MedicationId]
GO
ALTER TABLE [MAR].[Goal]  WITH CHECK ADD  CONSTRAINT [FK_MAR.Goal_MAR.TreatmentPlan_TreatmentPlan_Id] FOREIGN KEY([TreatmentPlan_Id])
REFERENCES [MAR].[TreatmentPlan] ([Id])
GO
ALTER TABLE [MAR].[Goal] CHECK CONSTRAINT [FK_MAR.Goal_MAR.TreatmentPlan_TreatmentPlan_Id]
GO
ALTER TABLE [MAR].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MedicalRecords_dbo.Patients_PatientId] FOREIGN KEY([PatientId])
REFERENCES [MAR].[Patient] ([Id])
GO
ALTER TABLE [MAR].[MedicalRecord] CHECK CONSTRAINT [FK_dbo.MedicalRecords_dbo.Patients_PatientId]
GO
ALTER TABLE [MAR].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MedicalRecords_dbo.Physicians_PhysicianId] FOREIGN KEY([PhysicianId])
REFERENCES [MAR].[Physician] ([Id])
GO
ALTER TABLE [MAR].[MedicalRecord] CHECK CONSTRAINT [FK_dbo.MedicalRecords_dbo.Physicians_PhysicianId]
GO
ALTER TABLE [MAR].[NotAdministeredMedicine]  WITH CHECK ADD  CONSTRAINT [FK_dbo.NotAdministeredMedicines_dbo.AspNetUsers_StaffId] FOREIGN KEY([StaffId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [MAR].[NotAdministeredMedicine] CHECK CONSTRAINT [FK_dbo.NotAdministeredMedicines_dbo.AspNetUsers_StaffId]
GO
ALTER TABLE [MAR].[NotAdministeredMedicine]  WITH CHECK ADD  CONSTRAINT [FK_dbo.NotAdministeredMedicines_dbo.MedicalRecords_MarId] FOREIGN KEY([MarId])
REFERENCES [MAR].[MedicalRecord] ([Id])
GO
ALTER TABLE [MAR].[NotAdministeredMedicine] CHECK CONSTRAINT [FK_dbo.NotAdministeredMedicines_dbo.MedicalRecords_MarId]
GO
ALTER TABLE [MAR].[NotAdministeredMedicine]  WITH CHECK ADD  CONSTRAINT [FK_dbo.NotAdministeredMedicines_dbo.Medications_MedicationId] FOREIGN KEY([MedicationId])
REFERENCES [MAR].[Medication] ([Id])
GO
ALTER TABLE [MAR].[NotAdministeredMedicine] CHECK CONSTRAINT [FK_dbo.NotAdministeredMedicines_dbo.Medications_MedicationId]
GO
ALTER TABLE [MAR].[TreatmentPlan]  WITH CHECK ADD  CONSTRAINT [FK_MAR.TreatmentPlan_dbo.AspNetUsers_StaffId] FOREIGN KEY([StaffId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [MAR].[TreatmentPlan] CHECK CONSTRAINT [FK_MAR.TreatmentPlan_dbo.AspNetUsers_StaffId]
GO
ALTER TABLE [MAR].[TreatmentPlan]  WITH CHECK ADD  CONSTRAINT [FK_MAR.TreatmentPlan_MAR.Patient_PatientId] FOREIGN KEY([PatientId])
REFERENCES [MAR].[Patient] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [MAR].[TreatmentPlan] CHECK CONSTRAINT [FK_MAR.TreatmentPlan_MAR.Patient_PatientId]
GO
USE [master]
GO
ALTER DATABASE [BobbyConsultation] SET  READ_WRITE 
GO
