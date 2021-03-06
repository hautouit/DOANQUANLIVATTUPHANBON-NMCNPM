/****** To insert Vietnames:  ******/
/****** 1. make sure script in Unicode-16 ******/
/****** 2. Put N before Vietnames text ******/
/******    Example: N'Nguyễn Công Hoan' ******/

USE [master]
GO

WHILE EXISTS(select NULL from sys.databases where name='QUANLICUAHANG')
BEGIN
    DECLARE @SQL varchar(max)
    SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
    FROM MASTER..SysProcesses
    WHERE DBId = DB_ID(N'QUANLICUAHANG') AND SPId <> @@SPId
    EXEC(@SQL)
    DROP DATABASE [QUANLICUAHANG]
END
GO

CREATE DATABASE QUANLICUAHANG

GO

USE [QUANLICUAHANG]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[SANPHAMDL]    Script Date: 4/19/2018 10:06:34 PM ******/
CREATE TABLE [dbo].[SANPHAMDL](
	[MaSPDL] [NVARCHAR](10) NOT NULL,
	[TenSP] [NVARCHAR](30) NOT NULL,
	[MaDL] [INT] NOT NULL,
	[Gia] [SMALLMONEY] NOT NULL,
	[DonVi] [NVARCHAR](30) NOT NULL,
	[SoLuong] [INT] NOT NULL,
 CONSTRAINT [PK_SANPHAMDL] PRIMARY KEY CLUSTERED 
(
	[MaSPDL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DAILI]    Script Date: 4/20/2018 8:21:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DAILI](
	[MaDL] [INT] IDENTITY(1,1) NOT NULL,
	[TenDL] [NVARCHAR](30) NOT NULL,
 CONSTRAINT [PK_DAILI] PRIMARY KEY CLUSTERED 
(
	[MaDL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PHIEUNHAPHANG]    Script Date: 4/19/2018 10:11:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PHIEUNHAPHANG](
	[MaPHNhap] [NVARCHAR](10) NOT NULL,
	[TenCH] [NVARCHAR](50) NOT NULL,
	[MaDL] [INT] NOT NULL,
	[NgayNhap] [DATETIME2](7) NOT NULL,
	[TongTien] [MONEY] NOT NULL,
	[TongNo] [MONEY] NOT NULL,
 CONSTRAINT [PK_PHIEUNHAPHANG] PRIMARY KEY CLUSTERED 
(
	[MaPHNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 4/19/2018 10:22:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [NVARCHAR](10) NOT NULL,
	[TenKH] [NVARCHAR](50) NOT NULL,
	[DiaChi] [NVARCHAR](50) NOT NULL,
	[SDT] [NVARCHAR](15) NOT NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SANPHAMCH]    Script Date: 4/19/2018 10:30:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SANPHAMCH](
	[MaSPCH] [NVARCHAR](10) NOT NULL,
	[TenSP] [NVARCHAR](30) NOT NULL,
	[Gia] [SMALLMONEY] NOT NULL,
	[DonVi] [NVARCHAR](30) NOT NULL,
	[SoLuong] [INT] NOT NULL,
 CONSTRAINT [PK_SANPHAMCH] PRIMARY KEY CLUSTERED 
(
	[MaSPCH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [QUANLICUAHANG]
GO

/****** Object:  Table [dbo].[CUAHANG]    Script Date: 4/28/2018 1:25:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CUAHANG](
	[TenCH] [NVARCHAR](50) NOT NULL,
	[MaKH] [NVARCHAR](10) NOT NULL,
	[MaSP] [NVARCHAR](10) NOT NULL,
	[MaPHNhap] [NVARCHAR](10) NOT NULL,
	[MaPHBan] [NVARCHAR](10) NOT NULL,
 CONSTRAINT [PK_CUAHANG] PRIMARY KEY CLUSTERED 
(
	[TenCH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PHIEUBANHANG]    Script Date: 4/19/2018 10:39:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUBANHANG](
	[MaPHBan] [NVARCHAR](10) NOT NULL,
	[TenCH] [NVARCHAR](50) NOT NULL,
	[MaKH] [NVARCHAR](10) NOT NULL,
	[NgayBan] [DATETIME2](7) NOT NULL,
	[TongTien] [MONEY] NOT NULL,
	[TongNo] [MONEY] NOT NULL,
 CONSTRAINT [PK_PHIEUBANHANG_1] PRIMARY KEY CLUSTERED 
(
	[MaPHBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/*Thêm đại lí */

USE [QUANLICUAHANG]
GO

INSERT INTO [dbo].[DAILI]([TenDL])VALUES(N'Đại lí phân bón')
GO
INSERT INTO [dbo].[DAILI]([TenDL])VALUES(N'Đại lí thuốc trừ sâu')
GO

/* Thêm sản phẩm đâị lí*/
USE [QUANLICUAHANG]
GO

INSERT INTO [dbo].[SANPHAMDL]([MaSP],[TenSP],[MaDL],[Gia],[DonVi],[SoLuong])VALUES(N'SP01',N'Thuốc Trừ sâu',2,20000,N'chai',10)
GO
INSERT INTO [dbo].[SANPHAMDL]([MaSP],[TenSP],[MaDL],[Gia],[DonVi],[SoLuong])VALUES(N'SP02',N'Thuốc diệt cỏ',2,30000,N'chai',10)
GO
INSERT INTO [dbo].[SANPHAMDL]([MaSP],[TenSP],[MaDL],[Gia],[DonVi],[SoLuong])VALUES(N'SP03',N'Phân URE',1,200000,N'bao',10)
GO
INSERT INTO [dbo].[SANPHAMDL]([MaSP],[TenSP],[MaDL],[Gia],[DonVi],[SoLuong])VALUES(N'SP04',N'Phân Đạm',1,100000,N'bao',10)
GO
INSERT INTO [dbo].[SANPHAMDL]([MaSP],[TenSP],[MaDL],[Gia],[DonVi],[SoLuong])VALUES(N'SP05',N'Phân Lân',1,100000,N'bao',10)
GO


-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 21/4/2018
-- Description:	Liệt kê Danh Sách Đại Lí
-- =============================================
CREATE PROCEDURE DSDAILI 
AS
BEGIN
	SELECT *FROM DAILI
END
GO

-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 21/4/2018
-- Description:	Thêm Đại lí
-- =============================================
CREATE PROCEDURE ThemDaiLi 
	-- Add the parameters for the stored procedure here
	@TenDL NVARCHAR(30)
AS
BEGIN
		INSERT INTO dbo.DAILI(TenDL)
		VALUES(@TenDL) 
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		
-- Create date: Tô Công Hậu
-- Description:	Sửa thông tin Đại lí
-- =============================================
CREATE PROCEDURE SuaDaiLi
	-- Add the parameters for the stored procedure here
	@MaDL INT,
	@TenDL nvarchar(30)
AS
BEGIN
	UPDATE dbo.DAILI SET TenDL=@TenDL WHERE MaDL=@MADL
END
GO

-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 22/04/2018
-- Description:	Xóa Tên Đại Lí
-- =============================================
CREATE PROCEDURE XoaDL 
	-- Add the parameters for the stored procedure here
	@MaDL int
AS
BEGIN
	DELETE FROM dbo.DAILI WHERE MaDL=@MaDL
END


-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 22/04/2018
-- Description:	Sản phẩm của Đại Lí
-- =============================================
CREATE PROCEDURE DSSanPhamDL 
AS
BEGIN
	SELECT*FROM dbo.SANPHAMDL
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 22/04/2018
-- Description:	Thêm Sản phẩm Đại lí
-- =============================================
CREATE PROCEDURE ThemSPDL 
	-- Add the parameters for the stored procedure here
	@MaSPDL NVARCHAR(10),
	@TenSP NVARCHAR(30),
	@MaDL INT,
	@Gia MONEY,
	@DonVi NVARCHAR(30),
	@SoLuong INT 
AS
BEGIN
	INSERT INTO dbo.SANPHAMDL(MaSPDL,TenSP,MaDL,Gia,DonVi,SoLuong) VALUES (@MASPDL,@TenSP,@MaDL,@Gia,@DonVi,@SoLuong)
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công  Hậu
-- Create date: 23/4/2018
-- Description:	Sửa sản phẩm Đại Lí
-- =============================================
CREATE PROCEDURE SuaSPDL 
	-- Add the parameters for the stored procedure here
	@MaSPDL NVARCHAR(10), 
	@TenSP NVARCHAR(10),
	@MaDL INT,
	@Gia MONEY,
	@DonVi NVARCHAR(30),
	@SoLuong INT
AS
BEGIN
	UPDATE dbo.SANPHAMDL SET TenSP=@TenSP,MaDL=@MaDL,Gia=@Gia,DonVi=@DonVi,SoLuong=@SoLuong WHERE MaSPDL=@MaSPDL
END
GO

-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 23/4/2018
-- Description:	Xóa Sản Phẩm Đại Lí
-- =============================================
CREATE PROCEDURE XoaSPDL 
	-- Add the parameters for the stored procedure here
	@MaSPDL NVARCHAR(10)
AS
BEGIN
	DELETE FROM dbo.SANPHAMDL WHERE MaSPDL=@MaSPDL 
END
GO

USE [QUANLICUAHANG]
GO

INSERT INTO [dbo].[KHACHHANG]([MaKH],[TenKH],[DiaChi],[SDT])VALUES('KH01',N'Nguyễn Văn A',N'Phổ Minh,Đức Phổ,Quảng Ngãi','0168203492')
INSERT INTO [dbo].[KHACHHANG]([MaKH],[TenKH],[DiaChi],[SDT])VALUES('KH02',N'Trần Văn B',N'Phổ Minh,Đức Phổ,Quảng Ngãi','0168203492')
INSERT INTO [dbo].[KHACHHANG]([MaKH],[TenKH],[DiaChi],[SDT])VALUES('KH03',N'Lê Văn C',N'Phổ Minh,Đức Phổ,Quảng Ngãi','0168203492')
INSERT INTO [dbo].[KHACHHANG]([MaKH],[TenKH],[DiaChi],[SDT])VALUES('KH04',N'Hồ Văn D',N'Phổ Thuận,Đức Phổ,Quảng Ngãi','0168203492')
INSERT INTO [dbo].[KHACHHANG]([MaKH],[TenKH],[DiaChi],[SDT])VALUES('KH05',N'Võ Văn E',N'Phổ Vinh,Đức Phổ,Quảng Ngãi','0168203492')
INSERT INTO [dbo].[KHACHHANG]([MaKH],[TenKH],[DiaChi],[SDT])VALUES('KH06',N'Nguyễn Văn F',N'Phổ Ninh,Đức Phổ,Quảng Ngãi','0168203492')

GO

-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 23/4/2018
-- Description:	Danh sách Khách hàng
-- =============================================
CREATE PROCEDURE DSKhachHang 
AS
BEGIN
	SELECT *FROM dbo.KHACHHANG
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 24/4/2018
-- Description:	Thêm Khách Hàng
-- =============================================
CREATE PROCEDURE ThemKH 
	-- Add the parameters for the stored procedure here
	@MaKH NVARCHAR(10), 
	@TenKH NVARCHAR(50),
	@DiaChi NVARCHAR(50),
	@SDT NVARCHAR(15) 
AS
BEGIN
	INSERT INTO dbo.KHACHHANG(MaKH,TenKH,DiaChi,SDT)VALUES(@MaKH,@TenKH,@DiaChi,@SDT)
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 24/4/2018
-- Description:	Sửa Khách Hàng
-- =============================================
CREATE PROCEDURE SuaKH 
	-- Add the parameters for the stored procedure here
	@MaKH NVARCHAR(10), 
	@TenKH NVARCHAR(50),
	@DiaChi NVARCHAR(50),
	@SDT NVARCHAR(15)
AS
BEGIN
	UPDATE dbo.KHACHHANG SET TenKH=@TenKH,DiaChi=@DiaChi,SDT=@SDT WHERE MaKH=@MaKH
END
GO

-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 24/4/2018
-- Description:	Xóa Khách Hàng
-- =============================================
CREATE PROCEDURE XoaKH 
	-- Add the parameters for the stored procedure here
	@MaKH NVARCHAR(10)
AS
BEGIN
	DELETE FROM dbo.KHACHHANG WHERE MaKH=@MaKH
END
GO

USE [QUANLICUAHANG]
GO

-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 25/4/2018
-- Description:	Thêm phiếu nhập hàng
-- =============================================
CREATE PROCEDURE ThemPHNhap 
	-- Add the parameters for the stored procedure here
	@MaPHNhap NVARCHAR(10), 
	@TenCH NVARCHAR(50),
	@MaDL INT,
	@NgayNhap DATETIME2,
	@TongTien MONEY,
	@TongNo MONEY
AS
BEGIN
	INSERT INTO dbo.PHIEUNHAPHANG(MaPHNhap,TenCH,MaDL,NgayNhap,TongTien,TongNo)VALUES(@MaPHNhap,@TenCH,@MaDL,@NgayNhap,@TongTien,@TongNo)
END
GO

-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 25/4/2018
-- Description:	Danh sách phiếu nhập
-- =============================================
CREATE PROCEDURE DSPhieuNhap 
AS
BEGIN
	SELECT *FROM dbo.PHIEUNHAPHANG
END
GO

-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 25/4/2018
-- Description:	Chỉnh sửa phiếu nhập hàng
-- =============================================
CREATE PROCEDURE SuaPHNhap 
	-- Add the parameters for the stored procedure here
	@MaPHNhap NVARCHAR(10), 
	@TenCH NVARCHAR(50),
	@MaDL INT,
	@NgayNhap DATETIME2,
	@TongTien MONEY,
	@TongNo MONEY
AS
BEGIN
	UPDATE dbo.PHIEUNHAPHANG SET TenCH=@TenCH,MaDL=@MaDL,NgayNhap=@NgayNhap,TongTien=@tongTien,TongNo=@TongNo WHERE MaPHNhap=@MaPHNhap
END
GO

-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 25/4/2018
-- Description:	Xóa Phiếu Hàng Nhập
-- =============================================
CREATE PROCEDURE XoaPHNhap 
	@MaPHNhap NVARCHAR(10)
AS
BEGIN
	DELETE FROM dbo.PHIEUNHAPHANG WHERE MaPHNhap=@MaPHNhap
END
GO

-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 26/4/2018
-- Description:	Danh Sách Chi tiết phiếu nhập
-- =============================================
CREATE PROCEDURE DSChiTietPhieuNhap 
AS
BEGIN
	SELECT*FROM dbo.CHITIETPHIEUNHAP
END

-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 26/4/2018
-- Description:	Thêm chi tiết phiếu nhập
-- =============================================
CREATE PROCEDURE ThemChiTietPHNhap 
	@MaPHNhap NVARCHAR(10), 
	@MaSP NVARCHAR(10),
	@SoLuong INT
AS
BEGIN
	INSERT INTO dbo.CHITIETPHIEUNHAP(MaPHNhap,MaSP,SoLuong)VALUES(@MaPHNhap,@MaSP,@SoLuong) 
END
GO

-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 26/4/2018
-- Description:	Thêm chi tiết phiếu nhập
-- =============================================
CREATE  PROCEDURE SuaChiTietPHNhap
	@MaPHNhap NVARCHAR(10), 
	@MaSP NVARCHAR(10),
	@SoLuong INT
AS
BEGIN
	UPDATE dbo.CHITIETPHIEUNHAP SET MaSP=@MaSP,SoLuong=@SoLuong WHERE MaPHNhap=@MaPHNhap
END

-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 26/4/2018
-- Description:	Thêm chi tiết phiếu nhập
-- =============================================
CREATE  PROCEDURE XoaChiTietPHNhap
	@MaPHNhap NVARCHAR(10)
AS
BEGIN
	DELETE FROM dbo.CHITIETPHIEUNHAP WHERE MaPHNhap=@MaPHNhap
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 26/4/2018
-- Description:	Tìm kiếm thông tin khách hàng
-- =============================================
CREATE PROCEDURE TimKiemKH 
	@TuKhoa NVARCHAR(50)
AS
BEGIN
	SELECT*FROM dbo.KHACHHANG WHERE TenKH LIKE @TuKhoa
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 27/4/2018
-- Description:	Danh sách phiếu bán hàng
-- =============================================
CREATE PROCEDURE DSPhieuBan 
AS
BEGIN
	SELECT* FROM dbo.PHIEUBANHANG
END
GO

USE [QUANLICUAHANG]
GO

/****** Object:  Table [dbo].[CHITIETPHIEUBAN]    Script Date: 4/27/2018 9:16:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CHITIETPHIEUBAN](
	[MaPHBan] [NVARCHAR](10) NOT NULL,
	[MaSP] [NVARCHAR](10) NOT NULL,
	[SoLuong] [INT] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPHBan] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [QUANLICUAHANG]
GO

/****** Object:  Table [dbo].[CHITIETPHIEUNHAP]    Script Date: 4/27/2018 9:18:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CHITIETPHIEUNHAP](
	[MaPHNhap] [NVARCHAR](10) NOT NULL,
	[MaSP] [NVARCHAR](10) NOT NULL,
	[SoLuong] [INT] NOT NULL,
 CONSTRAINT [PK__CHITIETP__1] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[MaPHNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 27/4/2018
-- Description:	Thêm phiếu bán
-- =============================================
CREATE PROCEDURE ThemPHBan 
	@MaPHBan NVARCHAR(10), 
	@TenCH NVARCHAR(50),
	@MaKH NVARCHAR(10),
	@NgayBan DATETIME2,
	@TongTien MONEY,
	@TongNo MONEY 
AS
BEGIN
	INSERT INTO dbo.PHIEUBANHANG(MaPHBan,TenCH,MaKH,NgayBan,TongTien,TongNo)VALUES(@MaPHBan,@TenCH,@MaKH,@NgayBan,@TongTien,@TongNo)

END
GO

-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 27/4/2018
-- Description:	Sửa phiếu bán
-- =============================================
CREATE PROCEDURE SuaPHBan 
	@MaPHBan NVARCHAR(10), 
	@TenCH NVARCHAR(50),
	@MaKH NVARCHAR(10),
	@NgayBan DATETIME2,
	@TongTien MONEY,
	@TongNo MONEY 
AS
BEGIN
	UPDATE dbo.PHIEUBANHANG SET TenCH=@TenCH,MaKH=@MaKH,NgayBan=@NgayBan,TongTien=@TongTien,TongNo=@TongNo WHERE MaPHBan=@MaPHBan
END
GO

-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 27/4/2018
-- Description:	Sửa phiếu bán
-- =============================================
CREATE PROCEDURE XoaPHBan 
		@MaSP NVARCHAR(10)
AS
BEGIN
	DELETE FROM dbo.CHITIETPHIEUBAN WHERE MaSP=@MaSP
END
GO

-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 27/4/2018
-- Description:	Danh sách chi tiết phiếu bán hàng
-- =============================================
CREATE PROCEDURE DSChiTietPhieuBan 
AS
BEGIN
	SELECT *FROM dbo.CHITIETPHIEUBAN 
END
GO

USE [QUANLICUAHANG]
GO

/****** Object:  Table [dbo].[CHITIETPHIEUBAN]    Script Date: 4/27/2018 11:32:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CHITIETPHIEUBAN](
	[MaPHBan] [NVARCHAR](10) NOT NULL,
	[MaSP] [NVARCHAR](10) NOT NULL,
	[SoLuong] [INT] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPHBan] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 27/4/2018
-- Description:	Thêm chi tiết phiếu bán hàng
-- =============================================
CREATE PROCEDURE ThemChiTietPHBan 
	@MaPHBan NVARCHAR(10),
	@MaSP NVARCHAR(10),
	@SoLuong INT
AS
BEGIN
	INSERT INTO dbo.CHITIETPHIEUBAN(MaPHBan,MaSP,SoLuong)VALUES(@MaPHBan,@MaSP,@SoLuong)
END
GO

-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 27/4/2018
-- Description:	Sửa chi tiết phiếu bán hàng
-- =============================================
CREATE PROCEDURE SuaChiTietPHBan 
	@MaPHBan NVARCHAR(10),
	@MaSP NVARCHAR(10),
	@SoLuong INT
AS
BEGIN
	UPDATE dbo.CHITIETPHIEUBAN SET MaSP=@MaSP,SoLuong=@SoLuong WHERE MaPHBan=@MaPHBan
END
GO

-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 27/4/2018
-- Description:	Xóa chi tiết phiếu bán hàng
-- =============================================
CREATE PROCEDURE XoaChiTietPHBan 
	@MaPHBan NVARCHAR(10)
AS
BEGIN
	DELETE FROM dbo.CHITIETPHIEUBAN WHERE MaPHBan=@MaPHBan
END
GO

-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 27/4/2018
-- Description:	Danh sách Sản phẩm trong cửa hàng
-- =============================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE DSSanPhamCH 
AS
BEGIN
	SELECT *FROM dbo.SANPHAMCH 
END

-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 27/4/2018
-- Description:	Thêm sản phẩm trong Cửa hàng
-- =============================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE ThemSPCH
	@MaSPCH NVARCHAR(10),
	@TenSP NVARCHAR(30),
	@Gia MONEY,
	@DonVi NVARCHAR(30),
	@SoLuong INT 
AS
BEGIN
	INSERT INTO dbo.SANPHAMCH(MaSPCH,TenSP,Gia,DonVi,SoLuong) VALUES (@MASPCH,@TenSP,@Gia,@DonVi,@SoLuong)
END

-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 27/4/2018
-- Description:	Sửa sản phẩm trong Cửa hàng
-- =============================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE SuaSPCH
	@MaSPCH NVARCHAR(10),
	@TenSP NVARCHAR(30),
	@Gia MONEY,
	@DonVi NVARCHAR(30),
	@SoLuong INT 
AS
BEGIN
	UPDATE dbo.SANPHAMCH SET TenSP=@TenSP,Gia=@Gia,DonVi=@DonVi,SoLuong=@SoLuong WHERE MaSPCH=@MaSPCH
END

-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 27/4/2018
-- Description:	Xóa sản phẩm trong Cửa hàng
-- =============================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE XoaSPCH
	@MaSPCH NVARCHAR(10)
AS
BEGIN
	DELETE FROM dbo.SANPHAMCH WHERE MaSPCH=@MaSPCH
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tô Công Hậu
-- Create date: 28/4/2018
-- Description:	Danh sách Chi tiết hóa đơn theo MaPH
-- =============================================
CREATE PROCEDURE SoLuongSPCH 
	@MaPHBan NVARCHAR(10)
AS
BEGIN
	SELECT *FROM dbo.PHIEUBANHANG WHERE MaPHBan=@MaPHBan
END
GO

GO
-- ALTER TABLE dbo.CHITIETPHIEUNHAP DROP CONSTRAINT FK_CHITIETPHIEUNHAP_SPCH
ALTER TABLE dbo.CHITIETPHIEUNHAP ADD CONSTRAINT FK_CHITIETPHIEUNHAP_SPDL FOREIGN KEY (MaSP) REFERENCES dbo.SANPHAMDL(MaSPDL)
ALTER TABLE dbo.PHIEUNHAPHANG ADD CONSTRAINT FK_PHIEUNHAPHANG_DAILI FOREIGN KEY (MaDL) REFERENCES dbo.DAILI(MaDL)
ALTER TABLE dbo.CHITIETPHIEUBAN ADD CONSTRAINT FK_CHITIETPHIEUBAN_SPCH FOREIGN KEY (MaSP) REFERENCES dbo.SANPHAMCH(MaSPCH)
ALTER TABLE dbo.CHITIETPHIEUNHAP ADD CONSTRAINT FK_CHITIETPHIEUNHAP_PHIEUNHAPHANG FOREIGN KEY (MaPHNhap) REFERENCES dbo.PHIEUNHAPHANG(MaPHNhap)
ALTER TABLE dbo.CHITIETPHIEUBAN ADD CONSTRAINT FK_CHITIETPHIEUBAN_PHIEUBANHANG FOREIGN KEY (MaPHBan) REFERENCES dbo.PHIEUBANHANG(MaPHBan)
--ALTER TABLE dbo.PHIEUBANHANG ADD CONSTRAINT FK_PHIEUBANHANG_CUAHANG FOREIGN KEY (TenCH) REFERENCES dbo.CUAHANG(TenCH)
-- ALTER TABLE dbo.PHIEUNHAPHANG ADD CONSTRAINT FK_PHIEUNHAPHANG_CUAHANG FOREIGN KEY (TenCH) REFERENCES dbo.CUAHANG(TenCH)
ALTER TABLE dbo.PHIEUBANHANG ADD CONSTRAINT FK_PHIEUBANHANG_KHACHHANG FOREIGN KEY (MaKH) REFERENCES dbo.KHACHHANG(MaKH)

