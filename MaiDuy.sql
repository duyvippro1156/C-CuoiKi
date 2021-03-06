USE [master]
GO
/****** Object:  Database [MaiXuanDuyDB]    Script Date: 20/06/21 11:37:36 PM ******/
CREATE DATABASE [MaiXuanDuyDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MaiXuanDuyDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MaiXuanDuyDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MaiXuanDuyDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MaiXuanDuyDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MaiXuanDuyDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MaiXuanDuyDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MaiXuanDuyDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MaiXuanDuyDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MaiXuanDuyDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MaiXuanDuyDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MaiXuanDuyDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MaiXuanDuyDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MaiXuanDuyDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MaiXuanDuyDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MaiXuanDuyDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MaiXuanDuyDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MaiXuanDuyDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MaiXuanDuyDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MaiXuanDuyDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MaiXuanDuyDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MaiXuanDuyDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MaiXuanDuyDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MaiXuanDuyDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MaiXuanDuyDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MaiXuanDuyDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MaiXuanDuyDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MaiXuanDuyDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MaiXuanDuyDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MaiXuanDuyDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MaiXuanDuyDB] SET  MULTI_USER 
GO
ALTER DATABASE [MaiXuanDuyDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MaiXuanDuyDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MaiXuanDuyDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MaiXuanDuyDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MaiXuanDuyDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MaiXuanDuyDB] SET QUERY_STORE = OFF
GO
USE [MaiXuanDuyDB]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](200) NOT NULL,
	[DanhMucImg] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MaDanhMuc] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[LayDanhMucView]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------------------/// THỦ TỤC ///-----------------------------------
--------------- ===THAO TÁC QUẢN TRỊ====----------------
-------------- [Bảng DanhMuc] -------------
-- Lấy danh mục view
create view [dbo].[LayDanhMucView]
as
select * from DanhMuc

GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[MaDanhMuc] [int] NOT NULL,
	[TenLoaiSP] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_MaLoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[LayLoaiSPView]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------- [Bảng LoaiSP] -------------
-- Lấy loại sản phẩm view
create view [dbo].[LayLoaiSPView]
as
select * from LoaiSP

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1000,1) NOT NULL,
	[MaLoaiSP] [int] NOT NULL,
	[MaThuongHieu] [int] NOT NULL,
	[TenSP] [nvarchar](500) NOT NULL,
	[ThongSoKyTHuat] [nvarchar](max) NULL,
	[Gia] [money] NOT NULL,
	[Discount] [int] NOT NULL,
	[SoLuongSP] [int] NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[NgayThem] [datetime] NULL,
	[TinhTrang] [bit] NULL,
 CONSTRAINT [PK_MaSP] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[LaySanPhamView]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------- [Bảng SanPham] -------------
-- Lấy sản phẩm view
create view [dbo].[LaySanPhamView]
as
select * from SanPham

GO
/****** Object:  View [dbo].[LaySanPhamHetHangView]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Lấy sản phẩm hết hàng View
create view [dbo].[LaySanPhamHetHangView]
as
select * from SanPham where TinhTrang=0

GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[MaThuongHieu] [int] IDENTITY(1,1) NOT NULL,
	[TenTH] [nvarchar](200) NOT NULL,
	[Photo] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[DienTHoai] [nvarchar](max) NULL,
 CONSTRAINT [PK_MaThuongHieu] PRIMARY KEY CLUSTERED 
(
	[MaThuongHieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[LayThuongHieuView]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------- [Bảng ThuongHieu] -------------
-- Lấy thương hiệu view
create view [dbo].[LayThuongHieuView]
as
select * from ThuongHieu

GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccount](
	[Id] [int] NOT NULL,
	[TaiKhoan] [nvarchar](100) NULL,
	[MatKhau] [varchar](200) NULL,
	[Status] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[LayUserAccontView]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Lấy UserAccount view
create view [dbo].[LayUserAccontView]
as
select * from UserAccount

GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [DanhMucImg]) VALUES (1, N'Đồng hồ nam', N'/Images/Đồng-Hồ-Nam-FNGEEN-DÂY-HỢP-KIM-5.jpg')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [DanhMucImg]) VALUES (2, N'Đồng hồ nữ', N'/Images/dong-ho-nu-thoi-trang-hieu-guou-1461-1-1461M-GO-4.jpg')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [DanhMucImg]) VALUES (3, N'Phụ kiện', N'/Images/Day-da-be-da-bo-dong-ho-chinh-hang.jpg')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiSP] ON 

INSERT [dbo].[LoaiSP] ([MaLoaiSP], [MaDanhMuc], [TenLoaiSP]) VALUES (1, 1, N'Đồng hồ nam Casio')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [MaDanhMuc], [TenLoaiSP]) VALUES (2, 1, N'Đồng hồ nam Daniel Wellington')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [MaDanhMuc], [TenLoaiSP]) VALUES (3, 1, N'Đồng hồ nam Fossil')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [MaDanhMuc], [TenLoaiSP]) VALUES (4, 2, N'Đồng hồ nữ Anne Klein')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [MaDanhMuc], [TenLoaiSP]) VALUES (5, 2, N'Đồng hồ nữ Bulova')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [MaDanhMuc], [TenLoaiSP]) VALUES (6, 2, N'Đồng hồ nữ Caravelle')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [MaDanhMuc], [TenLoaiSP]) VALUES (7, 2, N'Đồng hồ nữ Casio')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [MaDanhMuc], [TenLoaiSP]) VALUES (8, 2, N'Đồng hồ nữ Daniel Wellington')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [MaDanhMuc], [TenLoaiSP]) VALUES (9, 2, N'Đồng hồ nữ Fossil')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [MaDanhMuc], [TenLoaiSP]) VALUES (10, 2, N'Đồng hồ nữ Marc Jacobs')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [MaDanhMuc], [TenLoaiSP]) VALUES (11, 2, N'Đồng hồ nữ Micheal Kors')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [MaDanhMuc], [TenLoaiSP]) VALUES (12, 2, N'Đồng hồ nữ Skagen')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [MaDanhMuc], [TenLoaiSP]) VALUES (13, 3, N'Dây đồng hồ nam')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [MaDanhMuc], [TenLoaiSP]) VALUES (14, 3, N'Dây đồng hồ nữ')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [MaDanhMuc], [TenLoaiSP]) VALUES (15, 3, N'Vòng tay')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [MaDanhMuc], [TenLoaiSP]) VALUES (16, 1, N'Đồng hồ nam Skagen')
SET IDENTITY_INSERT [dbo].[LoaiSP] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1000, 1, 4, N'Đồng hồ nam dây cao su Casio W-218H-2AVDF 44.4 mm x 43.2 mm - Đen Đỏ', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 1000000.0000, 5, 999, N'/Images/Đồng hồ nam dây cao su Casio W-218H-2AVDF 44.4 mm x 43.2 mm - Đen Đỏ.jpg', CAST(N'2021-06-19T14:13:52.740' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1001, 1, 4, N'Đồng hồ nam dây cao su Casio W-218H-2AVDF 44.4 mm x 43.2 mm - Xanh Đen', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 1200000.0000, 0, 999, N'/Images/Đồng hồ nam dây cao su Casio W-218H-2AVDF 44.4 mm x 43.2 mm - Xanh Đen.jpg', CAST(N'2021-06-19T14:13:52.740' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1002, 1, 4, N'Đồng hồ nam dây cao su Casio W-W218H-1AVDF 44,4×43,2mm - Đen', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 1000000.0000, 0, 999, N'/Images/Đồng hồ nam dây cao su Casio W-W218H-1AVDF 44,4×43,2mm - Đen.jpg', CAST(N'2021-06-19T14:13:52.740' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1003, 1, 4, N'Đồng hồ nam dây Inox Casio AQ-230GA-9DMQ 38mm - Vàng', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 2200000.0000, 0, 999, N'/Images/Đồng hồ nam dây Inox Casio AQ-230GA-9DMQ 38mm - Vàng.jpg', CAST(N'2021-06-19T14:13:52.743' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1004, 1, 4, N'Đồng hồ nam dây Inox Casio AQ-230A-7DMQ 38mm - Bạc', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 2200000.0000, 10, 999, N'/Images/Đồng hồ nam dây Inox Casio AQ-230A-7DMQ 38mm - Bạc.jpg', CAST(N'2021-06-19T14:13:52.743' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1005, 2, 5, N'Đồng hồ nam dây da Daniel Wellington Classic Black York 40mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 3000000.0000, 15, 999, N'/Images/Đồng hồ nam dây da Daniel Wellington Classic Black York 40mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.743' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1006, 2, 5, N'Đồng hồ nam dây da Daniel Wellington Classic Black Reading 40mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 3200000.0000, 0, 999, N'/Images/Đồng hồ nam dây da Daniel Wellington Classic Black Reading 40mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.743' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1007, 2, 5, N'Đồng hồ nam dây da Daniel Wellington Classic Black Bristol 40mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 2000000.0000, 0, 999, N'/Images/Đồng hồ nam dây da Daniel Wellington Classic Black Bristol 40mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.743' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1008, 2, 5, N'Đồng hồ nam dây da Daniel Wellington Classic Black St Mawes 40mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 5000000.0000, 20, 999, N'/Images/Đồng hồ nam dây da Daniel Wellington Classic Black St Mawes 40mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.743' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1009, 2, 5, N'Đồng hồ nam dây da Daniel Wellington Classic Black Sheffield 40mm - Vàng Hong', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 3000000.0000, 0, 999, N'/Images/Đồng hồ nam dây da Daniel Wellington Classic Black Sheffield 40mm - Vàng Hong.jpg', CAST(N'2021-06-19T14:13:52.743' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1010, 2, 5, N'Đồng hồ nam dây da Daniel Wellington Classic St Mawes 40mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 4000000.0000, 0, 999, N'/Images/Đồng hồ nam dây da Daniel Wellington Classic St Mawes 40mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.743' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1011, 2, 5, N'Đồng hồ nam dây da Daniel Wellington Classic York 40mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 1000000.0000, 0, 999, N'/Images/Đồng hồ nam dây da Daniel Wellington Classic York 40mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.743' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1012, 2, 5, N'Đồng hồ nam dây da Daniel Wellington Classic Reading 40mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 2350000.0000, 0, 999, N'/Images/Đồng hồ nam dây da Daniel Wellington Classic Reading 40mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.743' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1013, 2, 5, N'Đồng hồ nam dây da Daniel Wellington Classic Bristol 40mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 2200000.0000, 0, 999, N'/Images/Đồng hồ nam dây da Daniel Wellington Classic Bristol 40mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.743' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1014, 2, 5, N'Đồng hồ nam dây da Daniel Wellington Classic Sheffield 40mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 1000000.0000, 0, 999, N'/Images/Đồng hồ nam dây da Daniel Wellington Classic Sheffield 40mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.743' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1015, 3, 6, N'Đồng hồ nam dây da Fossil FS5268 44mm - Vàng', N'+Thương hiệu: Fossil; +Xuất xứ: Mỹ', 1500000.0000, 5, 999, N'/Images/Đồng hồ nam dây da Fossil FS5268 44mm - Vàng.jpg', CAST(N'2021-06-19T14:13:52.747' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1016, 3, 6, N'Đồng hồ nam dây kim loại Fossil FS5236 44mm - Bạc', N'+Thương hiệu: Fossil; +Xuất xứ: Mỹ', 2000000.0000, 5, 999, N'/Images/Đồng hồ nam dây kim loại Fossil FS5236 44mm - Bạc.jpg', CAST(N'2021-06-19T14:13:52.747' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1017, 3, 6, N'Đồng hồ nam dây da Fossil FS5237 44mm - Vàng Hồng', N'+Thương hiệu: Fossil; +Xuất xứ: Mỹ', 3000000.0000, 0, 999, N'/Images/Đồng hồ nam dây da Fossil FS5237 44mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.747' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1018, 3, 6, N'Đồng hồ nam dây kim loại Fossil FS5238 44mm - Bạc', N'+Thương hiệu: Fossil; +Xuất xứ: Mỹ', 4000000.0000, 0, 999, N'/Images/Đồng hồ nam dây kim loại Fossil FS5238 44mm - Bạc.jpg', CAST(N'2021-06-19T14:13:52.747' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1019, 3, 6, N'Đồng hồ nam dây da Fossil FS5159 45mm - Vàng Hồng', N'+Thương hiệu: Fossil; +Xuất xứ: Mỹ', 5000000.0000, 0, 999, N'/Images/Đồng hồ nam dây da Fossil FS5159 45mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.747' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1020, 3, 6, N'Đồng hồ nam dây da Fossil FSBQ2064 45mm - Bạc', N'+Thương hiệu: Fossil; +Xuất xứ: Mỹ', 7000000.0000, 10, 999, N'/Images/Đồng hồ nam dây da Fossil FSBQ2064 45mm - Bạc.jpg', CAST(N'2021-06-19T14:13:52.747' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1021, 3, 6, N'Đồng hồ nam dây da Fossil FSME3041 44mm - Bạc', N'+Thương hiệu: Fossil; +Xuất xứ: Mỹ', 6000000.0000, 8, 999, N'/Images/Đồng hồ nam dây da Fossil FSME3041 44mm - Bạc.jpg', CAST(N'2021-06-19T14:13:52.747' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1022, 16, 9, N'Đồng hồ nam dây da Skagen SKW6217 40mm - Vàng', N'+Thương hiệu: Skagen; +Xuất xứ: Đan Mạch', 500000.0000, 10, 999, N'/Images/Đồng hồ nam dây da Skagen SKW6217 40mm - Vàng.jpg', CAST(N'2021-06-19T14:13:52.747' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1023, 16, 9, N'Đồng hồ nam dây da Skagen SKW6210 40mm - Đen', N'+Thương hiệu: Skagen; +Xuất xứ: Đan Mạch', 2200000.0000, 0, 999, N'/Images/Đồng hồ nam dây da Skagen SKW6210 40mm - Đen.jpg', CAST(N'2021-06-19T14:13:52.747' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1024, 16, 9, N'Đồng hồ nam dây da Skagen SKW6086 40mm - Bạc', N'+Thương hiệu: Skagen; +Xuất xứ: Đan Mạch', 6200000.0000, 0, 999, N'/Images/Đồng hồ nam dây da Skagen SKW6086 40mm - Bạc.jpg', CAST(N'2021-06-19T14:13:52.747' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1025, 16, 9, N'Đồng hồ nam dây da Skagen SKW6066 40mm - Vàng', N'+Thương hiệu: Skagen; +Xuất xứ: Đan Mạch', 3500000.0000, 0, 999, N'/Images/Đồng hồ nam dây da Skagen SKW6066 40mm - Vàng.jpg', CAST(N'2021-06-19T14:13:52.747' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1026, 16, 9, N'Đồng hồ nam dây lưới Skagen SKW6053 45mm - Đen', N'+Thương hiệu: Skagen; +Xuất xứ: Đan Mạch', 100000.0000, 0, 999, N'/Images/Đồng hồ nam dây lưới Skagen SKW6053 45mm - Đen.jpg', CAST(N'2021-06-19T14:13:52.747' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1027, 16, 9, N'Đồng hồ nam dây lưới Skagen SKW6052 45mm - Bạc', N'+Thương hiệu: Skagen; +Xuất xứ: Đan Mạch', 200000.0000, 0, 999, N'/Images/Đồng hồ nam dây lưới Skagen SKW6052 45mm - Bạc.jpg', CAST(N'2021-06-19T14:13:52.750' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1028, 16, 9, N'Đồng hồ nam dây lưới Skagen SKW6296 40mm - Vàng Hồng', N'+Thương hiệu: Skagen; +Xuất xứ: Đan Mạch', 2800000.0000, 0, 999, N'/Images/Đồng hồ nam dây lưới Skagen SKW6296 40mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.750' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1029, 16, 9, N'Đồng hồ nam dây da Skagen SKW6215 40mm - Bạc', N'+Thương hiệu: Skagen; +Xuất xứ: Đan Mạch', 4200000.0000, 5, 999, N'/Images/Đồng hồ nam dây da Skagen SKW6215 40mm - Bạc.jpg', CAST(N'2021-06-19T14:13:52.750' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1030, 4, 1, N'Combo đồng hồ nữ dây kim loại Anne Klein AK1470GBST 32mm - Vàng', N'+Thương hiệu: Anne Klein; +Xuất xứ: Mỹ', 1800000.0000, 5, 999, N'/Images/Combo đồng hồ nữ dây kim loại Anne Klein AK1470GBST 32mm - Vàng.jpg', CAST(N'2021-06-19T14:13:52.750' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1031, 4, 1, N'Combo đồng hồ nữ dây kim loại Anne Klein AK2245RTST 26mm - Vàng Hồng', N'+Thương hiệu: Anne Klein; +Xuất xứ: Mỹ', 1500000.0000, 0, 999, N'/Images/Combo đồng hồ nữ dây kim loại Anne Klein AK2245RTST 26mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.750' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1032, 4, 1, N'Combo đồng hồ nữ dây kim loại Anne Klein AK2716RNST 26mm - Vàng Hồng', N'+Thương hiệu: Anne Klein; +Xuất xứ: Mỹ', 1500000.0000, 0, 999, N'/Images/Combo đồng hồ nữ dây kim loại Anne Klein AK2716RNST 26mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.750' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1033, 4, 1, N'Combo đồng hồ nữ dây kim loại Anne Klein AK3140INST 28mm - Vàng', N'+Thương hiệu: Anne Klein; +Xuất xứ: Mỹ', 1500000.0000, 0, 999, N'/Images/Combo đồng hồ nữ dây kim loại Anne Klein AK3140INST 28mm - Vàng.jpg', CAST(N'2021-06-19T14:13:52.750' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1034, 4, 1, N'Đồng hồ nữ dây da Anne Klein AK1396BMBK 34mm - Vàng', N'+Thương hiệu: Anne Klein; +Xuất xứ: Mỹ', 2500000.0000, 0, 999, N'/Images/Đồng hồ nữ dây da Anne Klein AK1396BMBK 34mm - Vàng.jpg', CAST(N'2021-06-19T14:13:52.750' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1035, 4, 1, N'Đồng hồ nữ dây kim loại Anne Klein 12-2269MPTT 35mm - Vàng, Bạc', N'+Thương hiệu: Anne Klein; +Xuất xứ: Mỹ', 3000000.0000, 5, 999, N'/Images/Đồng hồ nữ dây kim loại Anne Klein 12-2269MPTT 35mm - Vàng, Bạc.jpg', CAST(N'2021-06-19T14:13:52.750' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1036, 4, 1, N'Đồng hồ nữ dây kim loại Anne Klein 1980BMRG 34mm - Vàng Hồng', N'+Thương hiệu: Anne Klein; +Xuất xứ: Mỹ', 3500000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Anne Klein 1980BMRG 34mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.750' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1037, 4, 1, N'Đồng hồ nữ dây kim loại Anne Klein AK1362RGRG 32mm - Vàng Hồng', N'+Thương hiệu: Anne Klein; +Xuất xứ: Mỹ', 2000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Anne Klein AK1362RGRG 32mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.750' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1038, 4, 1, N'Đồng hồ nữ dây kim loại Anne Klein AK1980BKGB 28mm - Vàng, Đen', N'+Thương hiệu: Anne Klein; +Xuất xứ: Mỹ', 21000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Anne Klein AK1980BKGB 28mm - Vàng, Đen.jpg', CAST(N'2021-06-19T14:13:52.750' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1039, 4, 1, N'Đồng hồ nữ dây kim loại Anne Klein AK2158RGRG 30mm - Vàng Hồng', N'+Thương hiệu: Anne Klein; +Xuất xứ: Mỹ', 1000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Anne Klein AK2158RGRG 30mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.750' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1040, 4, 1, N'Đồng hồ nữ dây kim loại Anne Klein AK2159SVSV 30mm - Bạc', N'+Thương hiệu: Anne Klein; +Xuất xứ: Mỹ', 1000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Anne Klein AK2159SVSV 30mm - Bạc.jpg', CAST(N'2021-06-19T14:13:52.750' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1041, 4, 1, N'Đồng hồ nữ dây kim loại Anne Klein AK2435SVTT 28mm - Vàng, Bạc', N'+Thương hiệu: Anne Klein; +Xuất xứ: Mỹ', 1200000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Anne Klein AK2435SVTT 28mm - Vàng, Bạc.jpg', CAST(N'2021-06-19T14:13:52.753' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1042, 4, 1, N'Đồng hồ nữ dây kim loại Anne Klein AK2677MPRT 28mm - Vàng Hồng, Bạc', N'+Thương hiệu: Anne Klein; +Xuất xứ: Mỹ', 1000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Anne Klein AK2677MPRT 28mm - Vàng Hồng, Bạc.jpg', CAST(N'2021-06-19T14:13:52.753' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1043, 4, 1, N'Đồng hồ nữ dây kim loại Anne Klein AK3070MPRG 28mm - Vàng Hồng', N'+Thương hiệu: Anne Klein; +Xuất xứ: Mỹ', 8000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Anne Klein AK3070MPRG 28mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.753' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1044, 5, 2, N'Đồng hồ nữ dây kim loại Bulova 97P111 27mm - Vàng Hồng', N'+Thương hiệu: Bulova; +Xuất xứ: Mỹ', 4000000.0000, 5, 999, N'/Images/Đồng hồ nữ dây kim loại Bulova 97P111 27mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.753' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1045, 5, 2, N'Đồng hồ nữ dây kim loại Bulova 98L212 23mm - Vàng Hồng', N'+Thương hiệu: Bulova; +Xuất xứ: Mỹ', 2000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Bulova 98L212 23mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.753' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1046, 5, 2, N'Đồng hồ nữ dây kim loại Bulova 98L213 23mm - Vàng', N'+Thương hiệu: Bulova; +Xuất xứ: Mỹ', 3000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Bulova 98L213 23mm - Vàng.jpg', CAST(N'2021-06-19T14:13:52.753' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1047, 6, 3, N'Đồng hồ nữ dây da Caravelle 43I167 36mm - Bạc', N'+Thương hiệu: Caravella; +Xuất xứ: Mỹ', 8000000.0000, 5, 999, N'/Images/Đồng hồ nữ dây da Caravelle 43I167 36mm - Bạc.jpg', CAST(N'2021-06-19T14:13:52.753' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1048, 6, 3, N'Đồng hồ nữ dây da Caravelle 43N103 30mm - Bạc', N'+Thương hiệu: Caravella; +Xuất xứ: Mỹ', 4000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây da Caravelle 43N103 30mm - Bạc.jpg', CAST(N'2021-06-19T14:13:52.753' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1049, 6, 3, N'Đồng hồ nữ dây kim loại Caravelle 43L165 37mm - Bạc', N'+Thương hiệu: Caravella; +Xuất xứ: Mỹ', 2000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Caravelle 43L165 37mm - Bạc.jpg', CAST(N'2021-06-19T14:13:52.757' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1050, 6, 3, N'Đồng hồ nữ dây kim loại Caravelle 43L186 36mm - Bạc', N'+Thương hiệu: Caravella; +Xuất xứ: Mỹ', 3000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Caravelle 43L186 36mm - Bạc.jpg', CAST(N'2021-06-19T14:13:52.757' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1051, 6, 3, N'Đồng hồ nữ dây kim loại Caravelle 43L193 30mm - Bạc', N'+Thương hiệu: Caravella; +Xuất xứ: Mỹ', 3000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Caravelle 43L193 30mm - Bạc.jpg', CAST(N'2021-06-19T14:13:52.757' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1052, 6, 3, N'Đồng hồ nữ dây kim loại Caravelle 43M112 36mm - Bạc', N'+Thương hiệu: Caravella; +Xuất xứ: Mỹ', 1000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Caravelle 43M112 36mm - Bạc.jpg', CAST(N'2021-06-19T14:13:52.757' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1053, 6, 3, N'Đồng hồ nữ dây kim loại Caravelle 44L170 36mm - Vàng', N'+Thương hiệu: Caravella; +Xuất xứ: Mỹ', 5000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Caravelle 44L170 36mm - Vàng.jpg', CAST(N'2021-06-19T14:13:52.757' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1054, 6, 3, N'Đồng hồ nữ dây kim loại Caravelle 44L175 30mm - Vàng Hồng', N'+Thương hiệu: Caravella; +Xuất xứ: Mỹ', 2000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Caravelle 44L175 30mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.757' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1055, 6, 3, N'Đồng hồ nữ dây kim loại Caravelle 44L179 36mm - Vàng', N'+Thương hiệu: Caravella; +Xuất xứ: Mỹ', 9000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Caravelle 44L179 36mm - Vàng.jpg', CAST(N'2021-06-19T14:13:52.757' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1056, 6, 3, N'Đồng hồ nữ dây kim loại Caravelle 44L214 36mm - Vàng Hồng', N'+Thương hiệu: Caravella; +Xuất xứ: Mỹ', 1000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Caravelle 44L214 36mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.757' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1057, 6, 3, N'Đồng hồ nữ dây kim loại Caravelle 44L215 36mm - Vàng', N'+Thương hiệu: Caravella; +Xuất xứ: Mỹ', 7000000.0000, 10, 999, N'/Images/Đồng hồ nữ dây kim loại Caravelle 44L215 36mm - Vàng.jpg', CAST(N'2021-06-19T14:13:52.757' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1058, 6, 3, N'Đồng hồ nữ dây kim loại Caravelle 44L218 36mm - Vàng', N'+Thương hiệu: Caravella; +Xuất xứ: Mỹ', 2000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Caravelle 44L218 36mm - Vàng.jpg', CAST(N'2021-06-19T14:13:52.757' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1059, 6, 3, N'Đồng hồ nữ dây kim loại Caravelle 44L233 36mm - Vàng Hồng', N'+Thương hiệu: Caravella; +Xuất xứ: Mỹ', 6000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Caravelle 44L233 36mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.757' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1060, 6, 3, N'Đồng hồ nữ dây kim loại Caravelle 44N109 38mm - Vàng', N'+Thương hiệu: Caravella; +Xuất xứ: Mỹ', 7000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Caravelle 44N109 38mm - Vàng.jpg', CAST(N'2021-06-19T14:13:52.757' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1061, 6, 3, N'Đồng hồ nữ dây kim loại Caravelle 45L157 28mm - Vàng Hồng,Bạc', N'+Thương hiệu: Caravella; +Xuất xứ: Mỹ', 2000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Caravelle 45L157 28mm - Vàng Hồng,Bạc.jpg', CAST(N'2021-06-19T14:13:52.760' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1062, 7, 4, N'Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110GA-1A1 46,3×43,4mm - Đen', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 2000000.0000, 10, 999, N'/Images/Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110GA-1A1 46,3×43,4mm - Đen.jpg', CAST(N'2021-06-19T14:13:52.760' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1063, 7, 4, N'Đồng Hồ Nữ Vải Jean Casio BABY-G BA-110DC-2A2 46,3×43,4mm - Xanh', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 5000000.0000, 5, 999, N'/Images/Đồng Hồ Nữ Vải Jean Casio BABY-G BA-110DC-2A2 46,3×43,4mm - Xanh.jpg', CAST(N'2021-06-19T14:13:52.760' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1064, 7, 4, N'Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110CR-7A 46,3×43,4mm - Trắng', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 4000000.0000, 0, 999, N'/Images/Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110CR-7A 46,3×43,4mm - Trắng.jpg', CAST(N'2021-06-19T14:13:52.760' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1065, 7, 4, N'Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110CR-4A 46,3×43,4mm - Đỏ Đen', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 1000000.0000, 0, 999, N'/Images/Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110CR-4A 46,3×43,4mm - Đỏ Đen.jpg', CAST(N'2021-06-19T14:13:52.760' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1066, 7, 4, N'Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110CR-2A 46,3×43,4mm - Xanh', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 3000000.0000, 0, 999, N'/Images/Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110CR-2A 46,3×43,4mm - Xanh.jpg', CAST(N'2021-06-19T14:13:52.760' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1067, 7, 4, N'Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110CP-4A 46,3×43,4mm - Hồng', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 6000000.0000, 0, 999, N'/Images/Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110CP-4A 46,3×43,4mm - Hồng.jpg', CAST(N'2021-06-19T14:13:52.760' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1068, 7, 4, N'Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110CH-7A 46,3×43,4mm - Trắng', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 9000000.0000, 0, 999, N'/Images/Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110CH-7A 46,3×43,4mm - Trắng.jpg', CAST(N'2021-06-19T14:13:52.760' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1069, 7, 4, N'Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110CH-3A 46,3×43,4mm - Xanh', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 2000000.0000, 0, 999, N'/Images/Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110CH-3A 46,3×43,4mm - Xanh.jpg', CAST(N'2021-06-19T14:13:52.760' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1070, 7, 4, N'Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110CH-1A 46,3×43,4mm - Đen Tím', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 1000000.0000, 0, 999, N'/Images/Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110CH-1A 46,3×43,4mm - Đen Tím.jpg', CAST(N'2021-06-19T14:13:52.760' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1071, 7, 4, N'Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110CF-7A 46,3×43,4mm - Trắng', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 7000000.0000, 0, 999, N'/Images/Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110CF-7A 46,3×43,4mm - Trắng.jpg', CAST(N'2021-06-19T14:13:52.763' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1072, 7, 4, N'Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110CF-1A 46,3×43,4mm - Đen', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 3000000.0000, 0, 999, N'/Images/Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110CF-1A 46,3×43,4mm - Đen.jpg', CAST(N'2021-06-19T14:13:52.763' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1073, 7, 4, N'Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110BE-7A 46,3×43,4mm - Trắng Xanh', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 3000000.0000, 0, 999, N'/Images/Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110BE-7A 46,3×43,4mm - Trắng Xanh.jpg', CAST(N'2021-06-19T14:13:52.763' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1074, 7, 4, N'Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110BC-1A 46,3×43,4mm - Đen', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 3000000.0000, 0, 999, N'/Images/Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110BC-1A 46,3×43,4mm - Đen.jpg', CAST(N'2021-06-19T14:13:52.763' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1075, 7, 4, N'Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110-7A3 46,3×43,4mm - Trắng', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 2000000.0000, 0, 999, N'/Images/Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110-7A3 46,3×43,4mm - Trắng.jpg', CAST(N'2021-06-19T14:13:52.763' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1076, 7, 4, N'Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110-7A1 46,3×43,4mm - Trắng', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 1000000.0000, 0, 999, N'/Images/Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110-7A1 46,3×43,4mm - Trắng.jpg', CAST(N'2021-06-19T14:13:52.763' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1077, 7, 4, N'Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110-4A1  46,3×43,4mm - Hồng', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 5000000.0000, 0, 999, N'/Images/Đồng Hồ Nữ Dây Nhựa Casio BABY-G BA-110-4A1  46,3×43,4mm - Hồng.jpg', CAST(N'2021-06-19T14:13:52.763' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1078, 7, 4, N'Đồng hồ nữ dây cao su CASIO BABY-G BA-110-4A2 46,3×43,4mm - Hồng Nhạt', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 5000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây cao su CASIO BABY-G BA-110-4A2 46,3×43,4mm - Hồng Nhạt.jpg', CAST(N'2021-06-19T14:13:52.763' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1079, 7, 4, N'Đồng hồ nữ dây cao su CASIO BABY-G BA-110-1A 46,3×43,4mm - Đen', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 4000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây cao su CASIO BABY-G BA-110-1A 46,3×43,4mm - Đen.jpg', CAST(N'2021-06-19T14:13:52.763' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1080, 7, 4, N'Đồng hồ nữ dây kim loại Casio B650WC-5ADF 43,1 x 41,2mm - Vàng Hồng', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 5000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Casio B650WC-5ADF 43,1 x 41,2mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.763' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1081, 7, 4, N'Đồng Hồ Nữ dây kim loại Casio LA690WGA-9DF 30,4×26,7mm - Vàng', N'+Thương hiệu: Casio; +Xuất xứ: Nhật Bản', 4000000.0000, 0, 999, N'/Images/Đồng Hồ Nữ dây kim loại Casio LA690WGA-9DF 30,4×26,7mm - Vàng.jpg', CAST(N'2021-06-19T14:13:52.767' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1082, 8, 5, N'Đồng hồ nữ dây da Daniel Wellington Classic Black York 36mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 4000000.0000, 10, 999, N'/Images/Đồng hồ nữ dây da Daniel Wellington Classic Black York 36mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.767' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1083, 8, 5, N'Đồng hồ nữ dây da Daniel Wellington Classic Black Reading 36mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 5000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây da Daniel Wellington Classic Black Reading 36mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.767' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1084, 8, 5, N'Đồng hồ nữ dây da Daniel Wellington Classic Black Bristol 36mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 8000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây da Daniel Wellington Classic Black Bristol 36mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.767' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1085, 8, 5, N'Đồng hồ nữ dây da Daniel Wellington Classic Black St Mawes 36mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 2000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây da Daniel Wellington Classic Black St Mawes 36mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.767' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1086, 8, 5, N'Đồng hồ nữ dây da Daniel Wellington Classic Black Sheffield 36mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 3000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây da Daniel Wellington Classic Black Sheffield 36mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.767' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1087, 8, 5, N'Đồng hồ nữ dây da Daniel Wellington Classic St Mawes 36mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 7000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây da Daniel Wellington Classic St Mawes 36mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.767' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1088, 8, 5, N'Đồng hồ nữ dây da Daniel Wellington Classic York 36mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 7000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây da Daniel Wellington Classic York 36mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.767' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1089, 8, 5, N'Đồng hồ nữ dây da Daniel Wellington Classic Reading 36mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 5000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây da Daniel Wellington Classic Reading 36mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.767' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1090, 8, 5, N'Đồng hồ nữ dây da Daniel Wellington Classic Bristol 36mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 6000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây da Daniel Wellington Classic Bristol 36mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.767' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1091, 8, 5, N'Đồng hồ nữ dây da Daniel Wellington Classic Sheffield 36mm - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 1000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây da Daniel Wellington Classic Sheffield 36mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.767' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1092, 9, 6, N'Đồng hồ nữ dây kim loại Fossil ES3590 38mm - Vàng Hồng', N'+Thương hiệu: Fossil; +Xuất xứ: Mỹ', 20000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Fossil ES3590 38mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.767' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1093, 10, 7, N'Đồng hồ nữ dây da Marc Jacobs  MBM1283 36mm - Vàng Hồng', N'+Thương hiệu: Marc Jacobs; +Xuất xứ: Pháp', 6000000.0000, 8, 999, N'/Images/Đồng hồ nữ dây da Marc Jacobs  MBM1283 36mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.770' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1094, 10, 7, N'Đồng hồ nữ dây da Marc Jacobs MJ1599 36mm - Vàng', N'+Thương hiệu: Marc Jacobs; +Xuất xứ: Pháp', 4000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây da Marc Jacobs MJ1599 36mm - Vàng.jpg', CAST(N'2021-06-19T14:13:52.770' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1095, 10, 7, N'Đồng hồ nữ dây da Marc Jacobs MJ1600 28mm - Vàng', N'+Thương hiệu: Marc Jacobs; +Xuất xứ: Pháp', 6000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây da Marc Jacobs MJ1600 28mm - Vàng.jpg', CAST(N'2021-06-19T14:13:52.770' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1096, 10, 7, N'Đồng hồ nữ dây da Marc Jacobs MJ-MBM1267 37mm - Vàng Hồng', N'+Thương hiệu: Marc Jacobs; +Xuất xứ: Pháp', 4000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây da Marc Jacobs MJ-MBM1267 37mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.770' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1097, 10, 7, N'Đồng hồ nữ dây kim loại Marc Jacobs  MBM3245 36mm - Vàng Hồng', N'+Thương hiệu: Marc Jacobs; +Xuất xứ: Pháp', 2000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Marc Jacobs  MBM3245 36mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.770' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1098, 10, 7, N'Đồng hồ nữ dây kim loại Marc Jacobs  MBM3248 28mm - Vàng Hồng', N'+Thương hiệu: Marc Jacobs; +Xuất xứ: Pháp', 10000000.0000, 20, 999, N'/Images/Đồng hồ nữ dây kim loại Marc Jacobs  MBM3248 28mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.770' AS DateTime), 1)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1099, 10, 7, N'Đồng hồ nữ dây kim loại Marc Jacobs MJ3572 34mm - Bạc', N'+Thương hiệu: Marc Jacobs; +Xuất xứ: Pháp', 8000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Marc Jacobs MJ3572 34mm - Bạc.jpg', CAST(N'2021-06-19T14:13:52.770' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1100, 10, 7, N'Đồng hồ nữ dây kim loại Marc Jacobs MJ3574 34mm - Vàng Hồng', N'+Thương hiệu: Marc Jacobs; +Xuất xứ: Pháp', 2000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Marc Jacobs MJ3574 34mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.770' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1101, 11, 8, N'Đồng hồ nữ dây kim loại Michael Kors MK3192 39mm - Vàng Hồng', N'+Thương hiệu: Micheal Kors; +Xuất xứ: Mỹ', 8000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Michael Kors MK3192 39mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.770' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1102, 11, 8, N'Đồng hồ nữ dây kim loại Michael Kors MK3640 36.5mm - Vàng Hồng', N'+Thương hiệu: Micheal Kors; +Xuất xứ: Mỹ', 2000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Michael Kors MK3640 36.5mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.773' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1103, 11, 8, N'Đồng hồ nữ dây kim loại Michael Kors MK3643 33mm - Vàng Hồng', N'+Thương hiệu: Micheal Kors; +Xuất xứ: Mỹ', 1000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Michael Kors MK3643 33mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.773' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1104, 11, 8, N'Đồng hồ nữ dây kim loại Michael Kors MK3706 36.5mm - Vàng Hồng', N'+Thương hiệu: Micheal Kors; +Xuất xứ: Mỹ', 9000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Michael Kors MK3706 36.5mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.773' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1105, 11, 8, N'Đồng hồ nữ dây kim loại Michael Kors MK6551 40mm - Vàng Hồng', N'+Thương hiệu: Micheal Kors; +Xuất xứ: Mỹ', 9000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây kim loại Michael Kors MK6551 40mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.773' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1106, 12, 9, N'Đồng hồ nữ dây da Skagen SKW2390 34mm - Vàng Hồng', N'+Thương hiệu: Skagen; +Xuất xứ: Đan Mạch', 4000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây da Skagen SKW2390 34mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.773' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1107, 12, 9, N'Đồng hồ nữ dây da Skagen SKW2354 34mm - Vàng', N'+Thương hiệu: Skagen; +Xuất xứ: Đan Mạch', 2000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây da Skagen SKW2354 34mm - Vàng.jpg', CAST(N'2021-06-19T14:13:52.773' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1108, 12, 9, N'Đồng hồ nữ dây lưới Skagen SKW2391 30mm - Bạc', N'+Thương hiệu: Skagen; +Xuất xứ: Đan Mạch', 1000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây lưới Skagen SKW2391 30mm - Bạc.jpg', CAST(N'2021-06-19T14:13:52.773' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1109, 12, 9, N'Đồng hồ nữ dây lưới Skagen SKW2151 30mm - Vàng Hồng', N'+Thương hiệu: Skagen; +Xuất xứ: Đan Mạch', 3000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây lưới Skagen SKW2151 30mm - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.773' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1110, 12, 9, N'Đồng hồ nữ dây lưới Skagen SKW2385 30mm - Vàng', N'+Thương hiệu: Skagen; +Xuất xứ: Đan Mạch', 6000000.0000, 0, 999, N'/Images/Đồng hồ nữ dây lưới Skagen SKW2385 30mm - Vàng.jpg', CAST(N'2021-06-19T14:13:52.773' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1111, 13, 5, N'Dây Nato nam Daniel Wellington Cornwall 40mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 1000000.0000, 0, 999, N'/Images/Dây Nato nam Daniel Wellington Cornwall 40mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.773' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1112, 13, 5, N'Dây Da nam Daniel Wellington Reading 40mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 1000000.0000, 0, 999, N'/Images/Dây Da nam Daniel Wellington Reading 40mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.773' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1113, 13, 5, N'Dây Nato nam Daniel Wellington Oxford 40mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 1000000.0000, 0, 999, N'/Images/Dây Nato nam Daniel Wellington Oxford 40mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.777' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1114, 13, 5, N'Dây Nato nam Daniel Wellington Canterbury 40mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 1000000.0000, 0, 999, N'/Images/Dây Nato nam Daniel Wellington Canterbury 40mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.777' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1115, 13, 5, N'Dây Nato nam Daniel Wellington Cambridge 40mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 1000000.0000, 0, 999, N'/Images/Dây Nato nam Daniel Wellington Cambridge 40mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.777' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1116, 13, 5, N'Dây Nato nam Daniel Wellington Glasgow 40mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 800000.0000, 0, 999, N'/Images/Dây Nato nam Daniel Wellington Glasgow 40mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.777' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1117, 13, 5, N'Dây Da nam Daniel Wellington St Mawes 40mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 800000.0000, 0, 999, N'/Images/Dây Da nam Daniel Wellington St Mawes 40mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.777' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1118, 13, 5, N'Dây Da nam Daniel Wellington Sheffield 40mm  - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 800000.0000, 0, 999, N'/Images/Dây Da nam Daniel Wellington Sheffield 40mm  - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.777' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1119, 13, 5, N'Dây Da nam Daniel Wellington Bristol 40mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 500000.0000, 0, 999, N'/Images/Dây Da nam Daniel Wellington Bristol 40mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.777' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1120, 13, 5, N'Dây Da nam Daniel Wellington York 40mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 500000.0000, 0, 999, N'/Images/Dây Da nam Daniel Wellington York 40mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.780' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1121, 13, 5, N'Dây Nato nam Daniel Wellington Cornwall 40mm - Sliver', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 500000.0000, 0, 999, N'/Images/Dây Nato nam Daniel Wellington Cornwall 40mm - Sliver.jpg', CAST(N'2021-06-19T14:13:52.780' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1122, 13, 5, N'Dây Da nam Daniel Wellington Sheffield 40mm - Sliver', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 400000.0000, 0, 999, N'/Images/Dây Da nam Daniel Wellington Sheffield 40mm - Sliver.jpg', CAST(N'2021-06-19T14:13:52.780' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1123, 14, 5, N'Dây Nato nữ Daniel Wellington Cornwall 36mm', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 1000000.0000, 0, 999, N'/Images/Dây Nato nữ Daniel Wellington Cornwall 36mm.jpg', CAST(N'2021-06-19T14:13:52.780' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1124, 14, 5, N'Dây Da nữ Daniel Wellington Sheffield 36mm - Sliver', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 1000000.0000, 0, 999, N'/Images/Dây Da nữ Daniel Wellington Sheffield 36mm - Sliver.jpg', CAST(N'2021-06-19T14:13:52.780' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1125, 14, 5, N'Dây Nato nữ Daniel Wellington Cornwall 36mm  - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 700000.0000, 0, 999, N'/Images/Dây Nato nữ Daniel Wellington Cornwall 36mm  - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.780' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1126, 14, 5, N'Dây Da nữ Daniel Wellington Reading 36mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 200000.0000, 0, 999, N'/Images/Dây Da nữ Daniel Wellington Reading 36mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.780' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1127, 14, 5, N'Dây Nato nữ Daniel Wellington Classy Winchester 26mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 500000.0000, 0, 999, N'/Images/Dây Nato nữ Daniel Wellington Classy Winchester 26mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.780' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1128, 14, 5, N'Dây Nato nữ Daniel Wellington Classy Winchester 34mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 300000.0000, 0, 999, N'/Images/Dây Nato nữ Daniel Wellington Classy Winchester 34mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.780' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1129, 14, 5, N'Dây Nato nữ Daniel Wellington Winchester 36mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 1000000.0000, 0, 999, N'/Images/Dây Nato nữ Daniel Wellington Winchester 36mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.780' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1130, 14, 5, N'Dây Nato nữ Daniel Wellington Oxford 36mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 900000.0000, 0, 999, N'/Images/Dây Nato nữ Daniel Wellington Oxford 36mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.780' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1131, 14, 5, N'Dây Nato nữ Daniel Wellington Canterbury 36mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 850000.0000, 0, 999, N'/Images/Dây Nato nữ Daniel Wellington Canterbury 36mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.780' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1132, 14, 5, N'Dây Nato nữ Daniel Wellington Glasgow 36mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 100000.0000, 0, 999, N'/Images/Dây Nato nữ Daniel Wellington Glasgow 36mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.780' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1133, 14, 5, N'Dây Da nữ Daniel Wellington St Mawes 36mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 500000.0000, 0, 999, N'/Images/Dây Da nữ Daniel Wellington St Mawes 36mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.783' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1134, 14, 5, N'Dây Da nữ Daniel Wellington Sheffield 36mm  - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 800000.0000, 0, 999, N'/Images/Dây Da nữ Daniel Wellington Sheffield 36mm  - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.783' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1135, 14, 5, N'Dây Da nữ Daniel Wellington Bristol 36mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 900000.0000, 0, 999, N'/Images/Dây Da nữ Daniel Wellington Bristol 36mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.783' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1136, 14, 5, N'Dây Da nữ Daniel Wellington York 36mm - Rose Gold', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 1000000.0000, 0, 999, N'/Images/Dây Da nữ Daniel Wellington York 36mm - Rose Gold.jpg', CAST(N'2021-06-19T14:13:52.783' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1137, 15, 5, N'Vòng tay Daniel Wellington Classic Cuff L - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 400000.0000, 0, 999, N'/Images/Vòng tay Daniel Wellington Classic Cuff L - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.783' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1138, 15, 5, N'Vòng tay Daniel Wellington Classic Cuff S - Vàng Hồng', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 300000.0000, 0, 999, N'/Images/Vòng tay Daniel Wellington Classic Cuff S - Vàng Hồng.jpg', CAST(N'2021-06-19T14:13:52.783' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1139, 15, 5, N'Vòng tay Daniel Wellington Classic Cuff L - Bạc', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 200000.0000, 0, 999, N'/Images/Vòng tay Daniel Wellington Classic Cuff L - Bạc.jpg', CAST(N'2021-06-19T14:13:52.783' AS DateTime), 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [MaThuongHieu], [TenSP], [ThongSoKyTHuat], [Gia], [Discount], [SoLuongSP], [HinhAnh], [NgayThem], [TinhTrang]) VALUES (1140, 15, 5, N'Vòng tay Daniel Wellington Classic Cuff S - Bạc', N'+Thương hiệu: Daniel Wellington; +Xuất xứ: Thụy Điển', 900000.0000, 0, 999, N'/Images/Vòng tay Daniel Wellington Classic Cuff S - Bạc.jpg', CAST(N'2021-06-19T14:13:52.783' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenTH], [Photo], [Email], [DiaChi], [DienTHoai]) VALUES (1, N'Anne Klein', N'/Images/logo-01-01.jpg', N'AnneKlein@gmail.com', N'Mỹ', N'0385639830')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenTH], [Photo], [Email], [DiaChi], [DienTHoai]) VALUES (2, N'Bulova', N'/Images/bulova-logo-black-01-01.jpg', N'Bulova@gmail.com', N'Mỹ', N'0385639830')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenTH], [Photo], [Email], [DiaChi], [DienTHoai]) VALUES (3, N'Caravelle', N'/Images/Caravelle-New-Yorklogo-01-01.jpg', N'Caravella@gmail.com', N'Mỹ', N'0385639830')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenTH], [Photo], [Email], [DiaChi], [DienTHoai]) VALUES (4, N'Casio', N'/Images/5847eab1cef1014c0b5e4840-01-01.jpg', N'Casio@gmail.com', N'Nhật Bản', N'0385639830')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenTH], [Photo], [Email], [DiaChi], [DienTHoai]) VALUES (5, N'Daniel Wellington', N'/Images/logo-daniel-wellington-01-01.jpg', N'DW@gmail.com', N'Mỹ', N'0385639830')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenTH], [Photo], [Email], [DiaChi], [DienTHoai]) VALUES (6, N'Fossil', N'/Images/thumb_31585_logo_retailer_1x-01-01.jpg', N'Fossil@gmail.com', N'Mỹ', N'0385639830')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenTH], [Photo], [Email], [DiaChi], [DienTHoai]) VALUES (7, N'Marc Jacobs', N'/Images/20161111104807_221_mj_logo_new-01-01.jpg', N'MarcJacob@gmail.com', N'Mỹ', N'0385639830')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenTH], [Photo], [Email], [DiaChi], [DienTHoai]) VALUES (8, N'Micheal Kors', N'/Images/57ea67b554764-01.jpg', N'MichealKors@gmail.com', N'Mỹ', N'0385639830')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenTH], [Photo], [Email], [DiaChi], [DienTHoai]) VALUES (9, N'Skagen', N'/Images/skagen-logo-01-01.jpg', N'Skagen@gmail.com', N'Mỹ', N'0385639830')
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
GO
INSERT [dbo].[UserAccount] ([Id], [TaiKhoan], [MatKhau], [Status]) VALUES (1, N'Admin', N'HUoV/kfVVFCoHkdsmMtnYQ==', N'active')
INSERT [dbo].[UserAccount] ([Id], [TaiKhoan], [MatKhau], [Status]) VALUES (2, N'admin1', N'HUoV/kfVVFCoHkdsmMtnYQ==', N'Blocked')
INSERT [dbo].[UserAccount] ([Id], [TaiKhoan], [MatKhau], [Status]) VALUES (3, N'admin1', N'HUoV/kfVVFCoHkdsmMtnYQ==', N'active')
GO
ALTER TABLE [dbo].[LoaiSP]  WITH CHECK ADD  CONSTRAINT [FK_MaDanhMuc] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[LoaiSP] CHECK CONSTRAINT [FK_MaDanhMuc]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_MaLoaiSP] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSP] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_MaLoaiSP]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_MaThuongHieu] FOREIGN KEY([MaThuongHieu])
REFERENCES [dbo].[ThuongHieu] ([MaThuongHieu])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_MaThuongHieu]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [kiemtrasoluongsanpham] CHECK  (([SoLuongSP]>=(0)))
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [kiemtrasoluongsanpham]
GO
/****** Object:  StoredProcedure [dbo].[LayDanhMuc]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Lấy danh mục
create proc [dbo].[LayDanhMuc]
as
begin
SET NOCOUNT ON;
select * from LayDanhMucView
end

GO
/****** Object:  StoredProcedure [dbo].[LayLoaiSP]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Lấy loại sản phẩm
create proc [dbo].[LayLoaiSP]
as
begin
SET NOCOUNT ON;
select * from LayLoaiSPView
end

GO
/****** Object:  StoredProcedure [dbo].[LaySanPham]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Lấy sản phẩm
create proc [dbo].[LaySanPham]
as
begin
SET NOCOUNT ON;
select * from LaySanPhamView
end

GO
/****** Object:  StoredProcedure [dbo].[LaySanPhamGiamGiaCaoNhatView]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Lấy sản phẩm giảm giá cao nhất
create proc [dbo].[LaySanPhamGiamGiaCaoNhatView]
as
begin
SET NOCOUNT ON;
select * from SanPham where Discount!=0 order by Discount desc
end

GO
/****** Object:  StoredProcedure [dbo].[LaySanPhamHetHang]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Lấy sẩn phẩm hết hàng
create proc [dbo].[LaySanPhamHetHang]
as
begin
SET NOCOUNT ON;
select * from LaySanPhamHetHangView
end

GO
/****** Object:  StoredProcedure [dbo].[LaySanPhamMoiNhat]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Lấy sản phẩm mới nhất
create proc [dbo].[LaySanPhamMoiNhat]
as
begin
SET NOCOUNT ON;
select * from SanPham where MaLoaiSP<13 order by NgayThem desc
end

GO
/****** Object:  StoredProcedure [dbo].[LaySanPhamTheoDanhMuc]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Lấy sản phẩm theo danh mục
create proc [dbo].[LaySanPhamTheoDanhMuc]
@MaDanhMuc int
as
begin
SET NOCOUNT ON;
select * from SanPham S inner join LoaiSP L on S.MaLoaiSP=L.MaLoaiSP inner join DanhMuc D on L.MaDanhMuc=D.MaDanhMuc where D.MaDanhMuc=@MaDanhMuc order by S.NgayThem desc
end

GO
/****** Object:  StoredProcedure [dbo].[LaySanPhamTheoLoai]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------- ===THAO TÁC NGƯỜI DÙNG====----------------

-- Lấy sản phẩm theo loại sản phẩm
create proc [dbo].[LaySanPhamTheoLoai]
@MaLoaiSP int
as
begin
SET NOCOUNT ON;
select * from SanPham S  where S.MaLoaiSP=@MaLoaiSP order by S.MaLoaiSP desc
end

GO
/****** Object:  StoredProcedure [dbo].[LaySanPhamTheoTen]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Lấy sản phẩm theo tên sản phẩm
create proc [dbo].[LaySanPhamTheoTen]
@TenSP nvarchar(500)
as
begin
SET NOCOUNT ON;
select * from SanPham where TenSP like '%' +@TenSP+'%' order by TenSP desc
end

GO
/****** Object:  StoredProcedure [dbo].[LaySanPhamTheoThuongHieuController]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Lấy sản phẩm theo thương hiệu
create proc [dbo].[LaySanPhamTheoThuongHieuController]
@MaThuongHieu int
as
begin
SET NOCOUNT ON;
select * from SanPham S  where S.MaThuongHieu=@MaThuongHieu order by S.MaThuongHieu desc
end

GO
/****** Object:  StoredProcedure [dbo].[LaySanPhamTheoThuongHieuOrderNgayThemView]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Lấy sản phẩm theo thương hiệu order theo ngày thêm
create proc [dbo].[LaySanPhamTheoThuongHieuOrderNgayThemView]
@MaThuongHieu int
as
begin
SET NOCOUNT ON;
select * from SanPham S where S.MaThuongHieu=@MaThuongHieu and S.MaLoaiSP<13 order by S.NgayThem desc
end

GO
/****** Object:  StoredProcedure [dbo].[LayThuongHieu]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Lấy thương hiệu
create proc [dbo].[LayThuongHieu]
as
begin
SET NOCOUNT ON;
select * from LayThuongHieuView
end

GO
/****** Object:  StoredProcedure [dbo].[LayUserAccount]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Lấy UserAccount
create proc [dbo].[LayUserAccount]
as
begin
SET NOCOUNT ON;
select * from LayUserAccontView
end

GO
/****** Object:  StoredProcedure [dbo].[SuaDanhMuc]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Sửa danh mục
create proc [dbo].[SuaDanhMuc]
@MaDanhMuc int,
@TenDanhMuc nvarchar(200),
@DanhMucImg nvarchar(max)
as
begin
SET NOCOUNT ON;
update DanhMuc
set
	TenDanhMuc=@TenDanhMuc,
	DanhMucImg=@DanhMucImg
where MaDanhMuc=@MaDanhMuc
end

GO
/****** Object:  StoredProcedure [dbo].[SuaLoaiSP]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Sửa loại sản phẩm
create proc [dbo].[SuaLoaiSP]
@MaLoaiSP int,
@MaDanhMuc int,
@TenLoaiSP nvarchar(200)
as
begin
SET NOCOUNT ON;
update LoaiSP
set
	MaDanhMuc=@MaDanhMuc,
	TenLoaiSP=@TenLoaiSP
where MaLoaiSP=@MaLoaiSP
end

GO
/****** Object:  StoredProcedure [dbo].[SuaSanPham]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Sửa sản phẩm
create proc [dbo].[SuaSanPham]
@MaSP int,
@MaLoaiSP int,
@MaThuongHieu int,
@TenSP nvarchar(200),
@ThongSoKyThuat nvarchar(max),
@Gia money,
@Discount int,
@SoLuongSP int,
@HinhAnh nvarchar(max)
as
begin
SET NOCOUNT ON;
update SanPham set
MaLoaiSP=@MaLoaiSP,
MaThuongHieu=@MaThuongHieu,
TenSP=@TenSP,
ThongSoKyTHuat=@ThongSoKyThuat,
Gia=@Gia,
Discount=@Discount,
SoLuongSP=@SoLuongSP,
HinhAnh=@HinhAnh
where
MaSP=@MaSP
end

GO
/****** Object:  StoredProcedure [dbo].[SuaThuongHieu]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Sửa thương hiệu
create proc [dbo].[SuaThuongHieu]
@MaThuongHieu int,
@TenTH nvarchar(200),
@Photo nvarchar(max) ,
@Email nvarchar(max),
@DiaChi nvarchar(max),
@DienTHoai nvarchar(max)
as
begin
SET NOCOUNT ON;
update ThuongHieu set
TenTH=@TenTH,
Photo=@Photo,
Email=@Email,
DiaChi=@DiaChi,
DienTHoai=@DienTHoai
where MaThuongHieu=@MaThuongHieu
end

GO
/****** Object:  StoredProcedure [dbo].[SuaUserAccount]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Sửa UserAccount
create proc [dbo].[SuaUserAccount]
@Id int,
@Status varchar(100)
as
begin
SET NOCOUNT ON;
update UserAccount set
Status=@Status
where
Id=@Id
end

GO
/****** Object:  StoredProcedure [dbo].[ThemDanhMuc]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Thêm danh mục
create proc [dbo].[ThemDanhMuc]
@TenDanhMuc nvarchar(200),
@DanhMucImg nvarchar(max)
as
begin
SET NOCOUNT ON;
insert into DanhMuc
values(@TenDanhMuc,@DanhMucImg)
end

GO
/****** Object:  StoredProcedure [dbo].[ThemLoaiSanPham]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Thêm loại sản phẩm
create proc [dbo].[ThemLoaiSanPham]
@MaDanhMuc int,
@TenLoaiSP nvarchar(200)
as
begin
SET NOCOUNT ON;
insert into LoaiSP
values(@MaDanhMuc,@TenLoaiSP)
end

GO
/****** Object:  StoredProcedure [dbo].[ThemSanPham]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Thêm sản phẩm
create proc [dbo].[ThemSanPham]
@MaLoaiSP int,
@MaThuongHieu int,
@TenSP nvarchar(500),
@ThongSoKyTHuat nvarchar(max),
@Gia money,
@Discount int,
@SoLuongSP int,
@HinhAnh nvarchar(max)
as
begin
SET NOCOUNT ON;
insert into SanPham
values(@MaLoaiSP,@MaThuongHieu,@TenSP,@ThongSoKyTHuat,@Gia,@Discount,@SoLuongSP,@HinhAnh,getdate(),1)
end

GO
/****** Object:  StoredProcedure [dbo].[ThemThuongHieu]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Thêm thương hiệu
create proc [dbo].[ThemThuongHieu]
@TenTH nvarchar(200),
@Photo nvarchar(max) ,
@Email nvarchar(max),
@DiaChi nvarchar(max),
@DienTHoai nvarchar(max)
as
begin
SET NOCOUNT ON;
insert into ThuongHieu
values(@TenTH,@Photo,@Email,@DiaChi,@DienTHoai)
end

GO
/****** Object:  StoredProcedure [dbo].[TimSanPham]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Tìm sản phẩm
create proc [dbo].[TimSanPham]
@TenSP nvarchar(500)
as
begin
select * from SanPham where TenSP like '%' +@TenSP+'%'
end

GO
/****** Object:  StoredProcedure [dbo].[TimUserAccount]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Tìm UserAccount
create proc [dbo].[TimUserAccount]
@TaiKhoan nvarchar(100)
as
begin
select * from UserAccount where TaiKhoan like '%' +@TaiKhoan+'%'
end

GO
/****** Object:  StoredProcedure [dbo].[XemChiTietSanPham]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Xem chi tiết sản phẩm
create proc [dbo].[XemChiTietSanPham]
@MaSP int
as
begin
SET NOCOUNT ON;
select * from SanPham where MaSP=@MaSP
end

GO
/****** Object:  StoredProcedure [dbo].[XoaDanhMuc]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Xóa danh mục
create proc [dbo].[XoaDanhMuc]
@MaDanhMuc int
as
begin
SET NOCOUNT ON;
delete from DanhMuc
where MaDanhMuc=@MaDanhMuc
end

GO
/****** Object:  StoredProcedure [dbo].[XoaLoaiSP]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Xóa loại sản phẩm
create proc [dbo].[XoaLoaiSP]
@MaLoaiSP int
as
begin
SET NOCOUNT ON;
delete from LoaiSP
where MaLoaiSP=@MaLoaiSP
end

GO
/****** Object:  StoredProcedure [dbo].[XoaSanPham]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Xóa Sản phẩm
create proc [dbo].[XoaSanPham]
@MaSP int
as
begin
SET NOCOUNT ON;
delete from SanPham where MaSP=@MaSP
end

GO
/****** Object:  StoredProcedure [dbo].[XoaThuongHieu]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Xóa thương hiệu
create proc [dbo].[XoaThuongHieu]
@MaThuongHieu int
as
begin
SET NOCOUNT ON;
delete from ThuongHieu where MaThuongHieu=@MaThuongHieu
end

GO
/****** Object:  StoredProcedure [dbo].[XoaUserAccount]    Script Date: 20/06/21 11:37:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[XoaUserAccount]
@Id int
as
begin
SET NOCOUNT ON;
delete from UserAccount where Id=@Id
end

GO
USE [master]
GO
ALTER DATABASE [MaiXuanDuyDB] SET  READ_WRITE 
GO
