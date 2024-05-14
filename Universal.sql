USE MASTER 
GO 
IF EXISTS(SELECT * FROM SYSDATABASES WHERE NAME ='Universal')
BEGIN
DROP DATABASE Universal
END
GO
CREATE DATABASE Universal
GO 
USE Universal
GO

-- Nhóm tài khoản --
CREATE TABLE NhomTK
(
	MaNhom			CHAR(5)			NOT NULL,
	TenNhom			NVARCHAR(30)	NOT NULL,
	GhiChu			NTEXT			NULL,
	CONSTRAINT PK_NhomTK PRIMARY KEY (MaNhom)
)
GO
INSERT NhomTK(MaNhom, TenNhom) VALUES('TK001', N'Khách hàng')
INSERT NhomTK(MaNhom, TenNhom) VALUES('TK006', N'Quản lý')
INSERT NhomTK(MaNhom, TenNhom) VALUES('TK007', N'Giao hàng')
INSERT NhomTK(MaNhom, TenNhom) VALUES('TK008', N'Marketing')
INSERT NhomTK(MaNhom, TenNhom) VALUES('TK009', N'Quản trị viên')
GO
SELECT * FROM NhomTK
GO

-- Thành viên --
CREATE TABLE ThanhVien
(
	TaiKhoan		VARCHAR(20)		NOT NULL,
	MatKhau			VARCHAR(20)		NOT NULL,
	HoDemTV			NVARCHAR(30)	NOT NULL,
	TenTV			NVARCHAR(10)	NOT NULL,
	NgaySinh		DATETIME		NOT NULL,
	GioiTinh		BIT				NOT NULL,
	SDT				CHAR(11)		NULL,
	Email			VARCHAR(30)		NULL,
	DiaChi			NVARCHAR(50)	NULL,
	TrangThai		BIT				NOT NULL		DEFAULT(1),
	MaNhom			CHAR(5)			NOT NULL		DEFAULT('TK001'),
	CONSTRAINT PK_ThanhVien PRIMARY KEY (TaiKhoan),
	CONSTRAINT FK_TV_NTK FOREIGN KEY (MaNhom) REFERENCES NhomTK (MaNhom)
)
GO
INSERT ThanhVien(TaiKhoan, MatKhau, HoDemTV, TenTV, NgaySinh, GioiTinh, SDT, Email, DiaChi, TrangThai, MaNhom) VALUES(N'TV001', N'TV001', N'Nguyễn Minh', N'Hùng', CAST(N'1985-02-23 00:00:00.000' AS DateTime), 1, N'0901222222', N'nmhung@gmail.com', N'23 Trần Quang Khải, P.Tân Định', 1, 'TK001')
INSERT ThanhVien(TaiKhoan, MatKhau, HoDemTV, TenTV, NgaySinh, GioiTinh, SDT, Email, DiaChi, TrangThai, MaNhom) VALUES(N'TV002', N'TV002', N'Võ Hoàng Ý', N'Lan', CAST(N'1980-08-11 00:00:00.000' AS DateTime), 0, N'0901333333', N'vhylan@gmail.com', N'112/2 Bến Vân Đồn, P1', 1, 'TK001')
INSERT ThanhVien(TaiKhoan, MatKhau, HoDemTV, TenTV, NgaySinh, GioiTinh, SDT, Email, DiaChi, TrangThai, MaNhom) VALUES(N'TV003', N'TV003', N'Trần Thanh', N'Trung', CAST(N'1989-01-30 00:00:00.000' AS DateTime), 1, N'0901246357', N'tttrung@gmail.com', N'221 Nguyễn Trãi, P5', 1, 'TK001')
INSERT ThanhVien(TaiKhoan, MatKhau, HoDemTV, TenTV, NgaySinh, GioiTinh, SDT, Email, DiaChi, TrangThai, MaNhom) VALUES(N'TV004', N'TV004', N'Phan Quang', N'Tuấn', CAST(N'1994-10-12 00:00:00.000' AS DateTime), 1, N'0903121212', N'tqtuan@yahoo.com', N'122 Cách Mạng Tháng 8, P10', 1, 'TK001')
INSERT ThanhVien(TaiKhoan, MatKhau, HoDemTV, TenTV, NgaySinh, GioiTinh, SDT, Email, DiaChi, TrangThai, MaNhom) VALUES(N'TV005', N'TV005', N'Nguyễn', N'Quang', CAST(N'1981-05-29 00:00:00.000' AS DateTime), 1, N'0908552323', N'nqminh@hotmail.com', N'96 Nguyễn Thiện Thuật, P7', 1, 'TK001')
INSERT ThanhVien(TaiKhoan, MatKhau, HoDemTV, TenTV, NgaySinh, GioiTinh, SDT, Email, DiaChi, TrangThai, MaNhom) VALUES(N'TV006', N'TV006', N'Bùi Đình', N'Thưởng', CAST(N'1995-09-20 00:00:00.000' AS DateTime), 1, N'0913441256', N'bdthuong@gmail.com', N'211 Xô Viết Nghệ Tĩnh, P26', 1, 'TK001')
INSERT ThanhVien(TaiKhoan, MatKhau, HoDemTV, TenTV, NgaySinh, GioiTinh, SDT, Email, DiaChi, TrangThai, MaNhom) VALUES(N'TV007', N'TV007', N'Đỗ Nguyễn Hoàng', N'Anh', CAST(N'1992-02-11 00:00:00.000' AS DateTime), 1, N'0968717189', N'dnhanh@yahoo.com', N'91 Hoa Sữa, P12', 0, 'TK001')
INSERT ThanhVien(TaiKhoan, MatKhau, HoDemTV, TenTV, NgaySinh, GioiTinh, SDT, Email, DiaChi, TrangThai, MaNhom) VALUES(N'TV008', N'TV008', N'Nguyễn Vinh', N'Quang', CAST(N'1981-08-12 00:00:00.000' AS DateTime), 1, N'0903456789', N'nvquang@yahoo.com', N'11/3/12 Phan Đình Phùng, P11', 0, 'TK006')
INSERT ThanhVien(TaiKhoan, MatKhau, HoDemTV, TenTV, NgaySinh, GioiTinh, SDT, Email, DiaChi, TrangThai, MaNhom) VALUES(N'TV009', N'TV009', N'Nguyễn Anh', N'Dũng', CAST(N'1989-06-30 00:00:00.000' AS DateTime), 1, N'0918262626', N'nadung@gmail.com', N'18 Nguyễn Oanh, P9', 0, 'TK007')
INSERT ThanhVien(TaiKhoan, MatKhau, HoDemTV, TenTV, NgaySinh, GioiTinh, SDT, Email, DiaChi, TrangThai, MaNhom) VALUES(N'TV010', N'TV010', N'Lý Tuấn', N'Sinh', CAST(N'1979-12-31 00:00:00.000' AS DateTime), 1, N'0908787878', N'ltsinh@hotmail.com', N'107/2 Lê Đức Thọ, P12', 0, 'TK008')
INSERT ThanhVien(TaiKhoan, MatKhau, HoDemTV, TenTV, NgaySinh, GioiTinh, SDT, Email, DiaChi, TrangThai, MaNhom) VALUES(N'ADMIN', N'20122000', N'Phạm Mạnh Trung', N'Nguyên', CAST(N'2000-12-20 00:00:00.000' AS DateTime), 1, N'0949010239', N'nguyenpham20122000@gmail.com', N'Trịnh Thị Dối P4', 1, 'TK009')
GO
SELECT * FROM ThanhVien
GO

-- Đơn hàng --
CREATE TABLE DonHang
(
	SoDH			CHAR(5)			NOT NULL,
	TaiKhoan		VARCHAR(20)		NOT NULL,
	NgayDat			DATETIME		NOT NULL,
	NgayGiao		DATETIME		NULL,
	DiaChiGiao		NVARCHAR(50)	NULL,
	GhiChu			NTEXT			NULL,
	TrangThaiDH		NVARCHAR(20)	NOT NULL,
	CONSTRAINT PK_DonHang PRIMARY KEY (SoDH),
	CONSTRAINT FK_DH_TV FOREIGN KEY (TaiKhoan) REFERENCES ThanhVien (TaiKhoan)
)
GO
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH001', N'TV001', CAST(N'2020-02-12 00:00:00.000' AS DateTime), CAST(N'2020-02-14 00:00:00.000' AS DateTime), N'23 Trần Quang Khải, P.Tân Định', N'Đang chuẩn bị')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH002', N'TV002', CAST(N'2020-02-12 00:00:00.000' AS DateTime), CAST(N'2020-02-14 00:00:00.000' AS DateTime), N'112/2 Bến Vân Đồn, P1', N'Đã giao')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH003', N'TV003', CAST(N'2020-02-12 00:00:00.000' AS DateTime), CAST(N'2020-02-14 00:00:00.000' AS DateTime), N'221 Nguyễn Trãi, P5', N'Đã hủy')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH004', N'TV004', CAST(N'2020-02-12 00:00:00.000' AS DateTime), CAST(N'2020-02-14 00:00:00.000' AS DateTime), N'122 Cách Mạng Tháng 8, P10', N'Chưa thanh toán')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH005', N'TV005', CAST(N'2020-02-12 00:00:00.000' AS DateTime), CAST(N'2020-02-14 00:00:00.000' AS DateTime), N'96 Nguyễn Thiện Thuật, P7', N'Đang chuẩn bị')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH006', N'TV006', CAST(N'2020-02-12 00:00:00.000' AS DateTime), CAST(N'2020-02-14 00:00:00.000' AS DateTime), N'211 Xô Viết Nghệ Tĩnh, P26', N'Đã giao')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH007', N'TV001', CAST(N'2020-02-13 00:00:00.000' AS DateTime), CAST(N'2020-02-15 00:00:00.000' AS DateTime), N'23 Trần Quang Khải, P.Tân Định', N'Đã hủy')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH008', N'TV002', CAST(N'2020-02-13 00:00:00.000' AS DateTime), CAST(N'2020-02-14 00:00:00.000' AS DateTime), N'112/2 Bến Vân Đồn, P1', N'Chưa thanh toán')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH009', N'TV003', CAST(N'2020-02-13 00:00:00.000' AS DateTime), CAST(N'2020-02-15 00:00:00.000' AS DateTime), N'221 Nguyễn Trãi, P5', N'Đang chuẩn bị')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH010', N'TV004', CAST(N'2020-02-13 00:00:00.000' AS DateTime), CAST(N'2020-02-15 00:00:00.000' AS DateTime), N'122 Cách Mạng Tháng 8, P10', N'Đã giao')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH011', N'TV005', CAST(N'2020-02-13 00:00:00.000' AS DateTime), CAST(N'2020-02-14 00:00:00.000' AS DateTime), N'96 Nguyễn Thiện Thuật, P7', N'Đã hủy')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH012', N'TV006', CAST(N'2020-02-13 00:00:00.000' AS DateTime), CAST(N'2020-02-14 00:00:00.000' AS DateTime), N'211 Xô Viết Nghệ Tĩnh, P26', N'Chưa thanh toán')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH013', N'TV001', CAST(N'2020-03-02 00:00:00.000' AS DateTime), CAST(N'2020-02-05 00:00:00.000' AS DateTime), N'23 Trần Quang Khải, P.Tân Định', N'Đang chuẩn bị')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH014', N'TV002', CAST(N'2020-03-10 00:00:00.000' AS DateTime), CAST(N'2020-02-14 00:00:00.000' AS DateTime), N'112/2 Bến Vân Đồn, P1', N'Đã giao')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH015', N'TV003', CAST(N'2020-03-11 00:00:00.000' AS DateTime), CAST(N'2020-02-14 00:00:00.000' AS DateTime), N'221 Nguyễn Trãi, P5', N'Đã hủy')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH016', N'TV004', CAST(N'2020-03-12 00:00:00.000' AS DateTime), CAST(N'2020-02-14 00:00:00.000' AS DateTime), N'122 Cách Mạng Tháng 8, P10', N'Chưa thanh toán')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH017', N'TV005', CAST(N'2020-03-13 00:00:00.000' AS DateTime), CAST(N'2020-02-14 00:00:00.000' AS DateTime), N'96 Nguyễn Thiện Thuật, P7', N'Đang chuẩn bị')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH018', N'TV006', CAST(N'2020-03-12 00:00:00.000' AS DateTime), CAST(N'2020-02-14 00:00:00.000' AS DateTime), N'211 Xô Viết Nghệ Tĩnh, P26', N'Đã giao')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH019', N'TV001', CAST(N'2020-03-15 00:00:00.000' AS DateTime), CAST(N'2020-02-16 00:00:00.000' AS DateTime), N'23 Trần Quang Khải, P.Tân Định', N'Đã hủy')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH020', N'TV002', CAST(N'2020-03-23 00:00:00.000' AS DateTime), CAST(N'2020-02-25 00:00:00.000' AS DateTime), N'112/2 Bến Vân Đồn, P1', N'Chưa thanh toán')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH021', N'TV003', CAST(N'2020-03-22 00:00:00.000' AS DateTime), CAST(N'2020-02-24 00:00:00.000' AS DateTime), N'221 Nguyễn Trãi, P5', N'Đang chuẩn bị')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH022', N'TV004', CAST(N'2020-03-21 00:00:00.000' AS DateTime), CAST(N'2020-02-23 00:00:00.000' AS DateTime), N'122 Cách Mạng Tháng 8, P10', N'Đã giao')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH023', N'TV005', CAST(N'2020-03-25 00:00:00.000' AS DateTime), CAST(N'2020-02-26 00:00:00.000' AS DateTime), N'96 Nguyễn Thiện Thuật, P7', N'Đã hủy')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH024', N'TV006', CAST(N'2020-03-26 00:00:00.000' AS DateTime), CAST(N'2020-02-28 00:00:00.000' AS DateTime), N'211 Xô Viết Nghệ Tĩnh, P26', N'Chưa thanh toán')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH025', N'TV001', CAST(N'2020-04-02 00:00:00.000' AS DateTime), CAST(N'2020-04-05 00:00:00.000' AS DateTime), N'23 Trần Quang Khải, P.Tân Định', N'Đang chuẩn bị')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH026', N'TV002', CAST(N'2020-04-10 00:00:00.000' AS DateTime), CAST(N'2020-04-14 00:00:00.000' AS DateTime), N'112/2 Bến Vân Đồn, P1', N'Đã giao')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH027', N'TV003', CAST(N'2020-04-11 00:00:00.000' AS DateTime), CAST(N'2020-04-14 00:00:00.000' AS DateTime), N'221 Nguyễn Trãi, P5', N'Đã hủy')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH028', N'TV004', CAST(N'2020-04-12 00:00:00.000' AS DateTime), CAST(N'2020-04-14 00:00:00.000' AS DateTime), N'122 Cách Mạng Tháng 8, P10', N'Chưa thanh toán')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH029', N'TV005', CAST(N'2020-04-13 00:00:00.000' AS DateTime), CAST(N'2020-04-14 00:00:00.000' AS DateTime), N'96 Nguyễn Thiện Thuật, P7', N'Đang chuẩn bị')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH030', N'TV006', CAST(N'2020-04-12 00:00:00.000' AS DateTime), CAST(N'2020-04-14 00:00:00.000' AS DateTime), N'211 Xô Viết Nghệ Tĩnh, P26', N'Đã giao')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH031', N'TV001', CAST(N'2020-04-15 00:00:00.000' AS DateTime), CAST(N'2020-04-16 00:00:00.000' AS DateTime), N'23 Trần Quang Khải, P.Tân Định', N'Đã hủy')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH032', N'TV002', CAST(N'2020-04-23 00:00:00.000' AS DateTime), CAST(N'2020-04-25 00:00:00.000' AS DateTime), N'112/2 Bến Vân Đồn, P1', N'Chưa thanh toán')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH033', N'TV003', CAST(N'2020-04-22 00:00:00.000' AS DateTime), CAST(N'2020-04-24 00:00:00.000' AS DateTime), N'221 Nguyễn Trãi, P5', N'Đang chuẩn bị')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH034', N'TV004', CAST(N'2020-04-21 00:00:00.000' AS DateTime), CAST(N'2020-04-23 00:00:00.000' AS DateTime), N'122 Cách Mạng Tháng 8, P10', N'Đã giao')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH035', N'TV005', CAST(N'2020-04-25 00:00:00.000' AS DateTime), CAST(N'2020-04-26 00:00:00.000' AS DateTime), N'96 Nguyễn Thiện Thuật, P7', N'Đã hủy')
INSERT DonHang(SoDH, TaiKhoan, NgayDat, NgayGiao, DiaChiGiao, TrangThaiDH) VALUES('DH036', N'TV006', CAST(N'2020-04-26 00:00:00.000' AS DateTime), CAST(N'2020-04-28 00:00:00.000' AS DateTime), N'211 Xô Viết Nghệ Tĩnh, P26', N'Chưa thanh toán')
GO
SELECT * FROM DonHang
GO

-- Thể loại --
CREATE TABLE TheLoai
(
	MaLoai			CHAR(5)			NOT NULL,
	TenLoai			NVARCHAR(30)	NOT NULL,
	GhiChu			NTEXT			NULL,
	CONSTRAINT PK_TheLoai PRIMARY KEY (MaLoai)
)
GO
INSERT TheLoai(MaLoai, TenLoai) VALUES('TL001', N'Dụng cụ nhà bếp')
INSERT TheLoai(MaLoai, TenLoai) VALUES('TL002', N'Điện gia dụng')
INSERT TheLoai(MaLoai, TenLoai) VALUES('TL003', N'Trang trí nội thất')
INSERT TheLoai(MaLoai, TenLoai) VALUES('TL004', N'Dụng cụ thể thao')
INSERT TheLoai(MaLoai, TenLoai) VALUES('TL005', N'Thiết bị thông minh')
INSERT TheLoai(MaLoai, TenLoai) VALUES('TL006', N'Quần - Áo, Thời trang')
GO
SELECT * FROM TheLoai
GO

-- Bài viết --
CREATE TABLE BaiViet
(
	MaBV			CHAR(5)			NOT NULL,
	TenBV			NVARCHAR(1000)	NOT NULL,
	DDHinh			VARCHAR(max)	NOT NULL,
	TomTat			NVARCHAR(2000)	NOT NULL,
	NgayDang		DATETIME		NULL,
	NoiDung			NVARCHAR(max)	NOT NULL,
	DaDuyet			BIT				NOT NULL		DEFAULT(0),
	TaiKhoan		VARCHAR(20)		NOT NULL,
	MaLoai			CHAR(5)			NOT NULL,
	CONSTRAINT PK_BaiViet PRIMARY KEY (MaBV),
	CONSTRAINT FK_BV_TV FOREIGN KEY (TaiKhoan) REFERENCES ThanhVien (TaiKhoan),
	CONSTRAINT FK_BV_TL FOREIGN KEY (MaLoai) REFERENCES TheLoai (MaLoai)
)
GO
INSERT BaiViet(MaBV, TenBV, DDHinh, TomTat, NgayDang, NoiDung, DaDuyet, TaiKhoan, MaLoai) 
VALUES(
'BV001',
N'Chuyên gia chỉ ra 2 thực phẩm tuyệt đối không nên cho vào lò vi sóng',
N'/Asset/Images/baiViet/photo-1-16201906925601413709085.jpg',
N'Lò vi sóng là một thiết bị gia dụng rất tiện lợi, có thể nấu và hâm nóng thức ăn một cách đơn giản. Nhưng sử dụng lò vi sóng có an toàn không?',
CAST(N'2021-05-05 14:52:15.857' AS DateTime),
N'Có thể nói lò vi sóng đơn giản, dễ vận hành, là một trong những thiết bị gia dụng không thể thiếu trong cuộc sống, tuy nhiên không phải mọi thứ đều có thể cho vào lò vi sóng. Không ít trường hợp bị thương hoặc nhiễm độc chỉ vì sử dụng lò vi sóng sai cách.
  Dưới đây là những khuyến cáo của Tan Dunci, một y tá tại Trung tâm Độc chất Lâm sàng Chang Gung ở Lâm Khẩu (Đài Loan) khi sử dụng lò vi sóng để giữ an toàn cho bản thân và gia đình.
  Y tá Tan Dunci chỉ ra rằng, vấn đề an toàn lớn nhất của lò vi sóng nằm ở các hộp đựng được sử dụng cho lò vi sóng. Một số loại hộp đựng không phù hợp có sản sinh ra chất độc nhiễm vào thực phẩm sau khi được làm nóng trong lò vi sóng.
  - Hộp đựng nhiều màu sắc, hộp nhựa thông thường, bộ đồ ăn melamine và bọc nhựa được nung ở nhiệt độ cao dễ thải ra chất độc hại.
  Hộp đựng có thể cho vào lò vi sóng chủ yếu được làm bằng thủy tinh, gốm sứ hoặc nhựa chịu nhiệt (PP hay polypropylene, loại nhựa có số 5 ghi ở bên trong hình tam giác được tạo bởi 3 mũi tên).
  Thông thường, các loại thực phẩm dùng trong lò vi sóng ở siêu thị đều sử dụng hộp nhựa chịu nhiệt. Nhưng trước khi sử dụng, bạn nên chú ý đến khả năng chịu nhiệt của hộp đựng và ký hiệu nhiệt độ của lò vi sóng để tránh trường hợp hâm nóng hộp đựng ở nhiệt độ vượt quá khả năng chịu đựng của nó.
  Tan Dunci cho biết, khi đi siêu thị mua đồ đông lạnh, cô sẽ mang theo hộp thủy tinh riêng, đổ thức ăn vào và hâm nóng lại. Nếu bạn không thể mang theo hộp đựng phù hợp của riêng mình, không nên đun nó quá lâu để tránh gây bỏng miệng. Ví dụ như lớp trong của bát giấy, hộp giấy có thêm một lớp màng ni lông thì nên dùng lò vi sóng để làm nóng nhẹ.
  - Những đồ đựng có vành kim loại, nồi kim loại hay lá nhôm dễ phát sinh tia lửa điện khi cho vào lò vi sóng, vì vậy tốt nhất bạn không nên cho vào lò vi sóng.',
1,
N'ADMIN',
'TL001'
)
INSERT BaiViet(MaBV, TenBV, DDHinh, TomTat, NgayDang, NoiDung, DaDuyet, TaiKhoan, MaLoai) 
VALUES(
'BV002',
N'Quạt ‘thần thánh’ không cần điện, cảnh báo sau cái giá siêu rẻ',
N'/Asset/Images/baiViet/quat-dien-1.jpg',
N'Có mức giá siêu rẻ, lại được quảng cáo là không cần dùng điện vẫn chạy tốt, dễ dàng di chuyển... nên quạt năng lượng mặt trời gây sốt và được rất nhiều người tìm mua dịp hè này.',
CAST(N'2021-05-13 05:45:15.857' AS DateTime),
N'Những năm gần đây, khi giá điện sinh hoạt ngày càng tăng cao, người dân thường có nhu cầu tìm mua các thiết bị điện gia dụng tiết kiệm điện. Song, việc đầu tư các thiết bị này thường khá tốn kém vì trên thị trường chúng có giá thành khá đắt đỏ.
  Thời điểm này bắt đầu vào hè, nhu cầu sử dụng các thiết bị làm mát tăng kéo theo hoá đơn tiền điện tăng chóng mặt thì trên thị trường các mẫu quạt năng lượng mặt trời được rao bán rầm rộ. Chúng được quảng cáo, thay vì chạy bằng điện như các loại thông thường, loại quạt này lại vận hành hoàn toàn dựa trên nguồn điện năng lượng mặt trời.
  Cụ thể, mỗi chiếc quạt năng lượng mặt trời sẽ đi kèm theo một tấm pin mặt trời giúp hấp thụ ánh nắng và sản xuất điện năng để duy trì hoạt động. Tùy từng loại tấm pin, khi đặt ngoài ánh nắng mặt trời, bộ điều khiển của quạt sẽ nạp năng lượng vào pin, mất từ 4-6 tiếng. Sau khi pin được nạp đầy, quạt sẽ hoạt động trong 6-10 tiếng liên tục, kể cả vào những ngày mưa không có ánh nắng mặt trời. Ngoài ra, người dùng có thể dùng điện lưới sạc vào ắc-quy để tích trữ sử dụng.
  Hiện nay, trên thị trường, những loại quạt này có xuất xứ từ nhiều nơi như: Trung Quốc, Hàn Quốc, Việt Nam,... với mức giá rất đa dạng, tùy theo kích thước và chức năng. Trong đó, loại thấp nhất có giá khoảng 200.000-300.000 đồng (quạt mini), quạt cây có giá dao động 800.000-2 triệu đồng. Nhiều dòng quạt đang được giảm giá 20-50% để hút người mua.
  Đơn cử, dòng quạt năng lượng mặt trời minin 20W đang được giảm giá đến 50%, từ 830.000 đồng xuống 417.000 đồng; quạt mini 3,5W X9E được giảm 40%, từ 510.000 đồng xuống còn 306.000 đồng; mẫu quạt Sunisi FT-30 có giá 1 triệu đồng, giảm 50% so với giá gốc là 2,1 triệu đồng; mẫu quạt Korichi KRC 6300 giảm từ 1,2 triệu đồng còn 890.000 đồng; mẫu quạt Jenpect 220V có giá gốc là 1,3 triệu đồng, giảm 34% hiện chỉ còn 850.000 đồng,...
  Theo lời quảng cáo của nhân viên các cửa hàng điện gia dụng, so với quạt truyền thống thì quạt năng lượng mặt trời có nhiều ưu điểm như: không tốn tiền điện, không sợ mất điện đột ngột trong những ngày hè nóng nực. Không chỉ vậy, chúng còn rất tiện ích khi mang đi dã ngoại, cắm trại; có thể sạc trực tiếp cho các thiết bị di động khác như: điện thoại, đèn pin,... qua cổng USB rất tiện lợi. Hơn nữa, tuổi thọ pin dài 3-5 năm sử dụng, dung lượng pin lên đến 12.000 mAh, thời gian sử dụng đến 8-12 giờ.
  Với các chức năng “thần thánh”, đặc biệt nhất là không tốn điện khiến loại quạt năng lượng mặt trời này ngay lập tức gây sốt trên thị trường, được rất nhiều người tìm mua.
  Anh Nguyễn Hùng - nhân viên một cửa hàng điện máy ở TP.HCM - cho hay, thời điểm này, nhu cầu tìm mua các loại quạt làm mát đã bắt đầu tăng mạnh, trong đó dòng quạt năng lượng mặt trời bán chạy hơn cả. Như hiện tại đầu hè, cửa hàng anh bán được khoảng 300 chiếc quạt năng lượng mặt trời, đỉnh điểm nắng nóng năm ngoái anh bán lên đến 800 chiếc.
  Tương tự, anh Hoàng Văn Bình - nhân viên một cửa hàng điện gia dụng ở Thanh Xuân (Hà Nội) - cũng cho biết, những năm gần đây, giá điện có xu hướng tăng lên, mọi người có nhu cầu tìm mua, sử dụng những thiết bị tiết kiệm điện lại tận dụng được nguồn năng lượng từ tự nhiên. Do đó từ tháng 5, khách tìm mua quạt năng lượng mặt trời nhộn nhịp hơn. Hiện tại, anh chỉ còn 15 chiếc quạt nữa là cháy hàng.
  Theo anh, loại quạt này thường thích hợp với kiểu nhà thấp, nhà cấp 4 hơn là nhà cao tầng, chung cư như ở thành phố. Bởi đặc thù quạt và tấm pin tách rời, cần chọn vị trí gắn tấm pin để đón ánh nắng (mái nhà, tầng thượng, ban công, trước sân,... ) sau đó kết nối với bộ quạt. Thế nên, với nhà cao tầng, việc di chuyển thiết bị khá khó khăn.
  Song anh Bình cũng thừa nhận, khi trời mưa, khả năng sạc của quạt sẽ kém đi, do đó vào mùa mưa kéo dài quạt năng lượng mặt trời sẽ không phát huy được hết lợi ích của chúng. Khi đó, quạt vẫn có thể sử dụng bằng điện lưới như thông thường.
  Hạn chế chọn các loại quạt tích điện đa chức năng có trang bị thêm các loại đèn, nhạc báo hay đồng hồ... vì các tính năng này tiêu thụ nguồn điện từ ắc quy lớn, dễ làm cho ắc quy nhanh hỏng hơn. Người dùng không nên ham rẻ mà mua những dòng quạt kém chất lượng sẽ tiềm ẩn nhiều rủi ro, nên cân nhắc khi lựa chọn và cần chọn mua sản phẩm của những thương hiệu, địa chỉ uy tín.',
1,
N'ADMIN',
'TL002'
)
INSERT BaiViet(MaBV, TenBV, DDHinh, TomTat, NgayDang, NoiDung, DaDuyet, TaiKhoan, MaLoai) 
VALUES(
'BV003',
N'Loạt nội thất phòng khách bán giá ưu đãi trong tháng 5',
N'/Asset/Images/baiViet/1-1621220178-3461-1621220768-1-2220-2615-1621243961.jpg',
N'Kệ sách đa tầng, bàn trà hai tầng, kệ giầy tiết kiệm không gian, kệ tivi để sàn... của nội thất IGEA và IBIE đang giảm giá tối đa tới hơn 40% trên Shop VnExpress.',
CAST(N'2021-05-18 08:00:15.857' AS DateTime),
N'Kệ sách đứng đa tầng GP42 của IGEA chiều dài 74 cm, chiều sâu 20 cm, chiều cao 147 cm làm từ gỗ MDF phủ melamin chống xước chống nước. Mấu sản phẩm có hai màu gỗ hoặc trắng, có thể trưng bày sách, đồ trang trí tại phòng đọc, phòng học, phòng làm việc, văn phòng làm việc. Giá gốc 560.000 đồng, hiện ưu đãi 24% còn 423.000 đồng.
  Kệ góc đa năng 5 tầng của IGEA có chiều cao 130 cm, chiều dài và rộng cùng 35 cm, làm từ gỗ MDF phủ melamin chống xước chống nước. Sản phẩm phù hợp để để tài liệu hay đồ trưng bày tại phòng khách, cửa hàng, văn phòng làm việc. Kệ đang được bán với giá 296.000 đồng nhờ ưu đãi 26%.
  Kệ dép 5 tầng của IBIE được đóng từ gỗ cao su dày 20 ly, đã qua xử lý chống cong vênh, mối mọt, bề mặt sơn PU và 2K chống thấm. Các tầng là các nan ghép mộng, riêng tầng trên cùng làm từ gỗ nguyên tấm. Kệ có kích thước dài 73 cm, sâu 30 cm, cao 90 cm, để được tối đa 25 đôi giày dép. Khoảng cách từ sàn nhà tới kệ cuối cùng là 5 cm giúp dễ quét dọn vệ sinh. Tay nắm được cắt CNC khi di chuyển không sợ bị bẩn tay. Giá gốc 1,21 triệu đồng, ưu đãi 37% còn 765.330 đồng.
  Kệ giày IG347 của IGEA với thiết kế ngăn để dốc tiết kiệm không gian, làm từ gỗ nhựa compostie chống nước, chống xước, chống mối mọt, cong vênh. Kệ cao 101 cm, rộng 40 cm, sâu 17cm, 5 tầng, nặng 7 kg, có thể tháo lắp dễ dàng. Sản phẩm bảo hành 6 tháng. Giá gốc 428.000 đồng, ưu đãi 40% còn 256.000 đồng.
  Kệ tivi để sàn thương hiệu IGEA làm từ gỗ MDF nhập khẩu phủ melamin chống xước chống nước, dày 2 ly. Kệ gồm hai ngăn kéo kín và 4 ngăn hở. Nếu kéo dài, kệ có chiều dài tối đa 240 cm, khi thu gọn còn 160 cm, chiều sâu không đổi là 30 cm, chiều cao 48 cm. Kệ phù hợp để đầu thu, Wifi, loa, thiết bị điện tử, đồ trang trí..., lắp được cả phòng khách và phòng ngủ. Sản phẩm có giá 1,4 triệu đồng, giảm 41% còn 823.000 đồng.
  Bàn trà 2 tầng của IGEA với mặt bàn làm từ gỗ MDF phủ melamin chống xước chống nước. Chân bàn bằng gỗ sồi. Bàn cao 52 cm. Mặt tầng trên có đường kính 50 cm, tầng dưới đường kính 40 cm. Bàn có thể đặt tại phòng khách, phòng ngủ, ban công, studio, cửa hàng, spa, salon, quán café, hoặc làm bàn làm việc. Sản phẩm đang được bán với giá ưu đãi 27% là 280.000 đồng.
  Bộ bàn tròn Eiffel và 4 ghế Eames của IBIE với mặt bàn đường kính 60 cm làm làm từ gỗ MDF chống thấm tốt. Chân bàn cao 72 cm làm từ gỗ sồi. Chân ghế cũng làm từ gỗ sồi, mặt ghế bằng nhựa. Chân bàn và ghế đều có khung đan chéo sơn tĩnh điện, làm tăng khả năng chịu lực. Kiểu dáng thích hợp để tiếp khách, làm bàn trà, bàn ăn... trong văn phòng, gia đình hoặc quán cafe. Giá gốc 3,52 triệu đồng, hiện ưu đãi 40% còn 2,12 triệu đồng.
  Ngoài các sản phẩm trên, tại Shop VnExpress còn nhiều món đồ nội thất khác đang được bán giá ưu đãi trong dịp tháng 5, giúp bạn tăng tiện nghi và thẩm mỹ cho phòng khách.',
1,
N'ADMIN',
'TL003'
)
INSERT BaiViet(MaBV, TenBV, DDHinh, TomTat, NgayDang, NoiDung, DaDuyet, TaiKhoan, MaLoai) 
VALUES(
'BV004',
N'"Hốt bạc" những ngày dịch từ việc bán dụng cụ thể thao tại nhà',
N'/Asset/Images/baiViet/dung-cu-the-thao-2.jpg',
N'Dịch Covid-19 khiến hoạt động thể thao tập thể và ngoài trời bị hạn chế. Tận dụng cơ hội vàng, nhiều người làm nghề bán dụng cụ thể thao có cơ hội "hốt bạc" những ngày dịch bệnh bùng phát.',
CAST(N'2021-05-07 11:08:15.857' AS DateTime),
N'Những ngày qua, Hà Nội đã tạm dừng một số hoạt động như tụ tập đông người, tập thể dục nơi công cộng vì có thể tiềm ẩn nguy cơ cao lây nhiễm dịch bệnh. Tuy nhiên, tình trạng này lại là cơ hội vàng để những người làm nghề kinh doanh dụng cụ thể thao tại nhà phát triển mảng bán hàng online.
  Chia sẻ với PV, anh Nguyễn Văn Phóng, chủ một cửa hàng kinh doanh dụng cụ thể thao trên địa bàn quận Thanh Xuân, (Hà Nội), cho biết: "Mỗi lần dịch bệnh Covid-19 ập đến, số lượng hàng gia đình tôi bán ra tăng gấp 2 lần những ngày bình thường. Có ngày, cửa hàng nhà tôi bán vài chục triệu tiền hàng, cả ngày bận rộn với công việc lắp đặt và tư vấn".
  Theo anh Nguyễn Văn Phóng, dịch bệnh khiến người dân không thể ra ngoài tập thể dục, cũng như vui chơi các hoạt động ngoài trời nên việc lựa chọn dụng cụ thể thao tại nhà được nhiều gia đình lựa chọn. Từ đó, những người làm nghề thêm bận rộn với công việc giữa mùa dịch.
  "Từ khi Hà Nội và nhiều tỉnh thành xuất hiện những ca dương tính với Covid-19, chúng tôi tăng cường quảng cáo những mặt hàng hỗ trợ tập thể dục trên các trang mạng xã hội" - anh Nguyễn Văn Phóng chia sẻ.
  Cũng tất bật trong những ngày dịch bệnh quay trở lại, anh Nguyễn Minh Tuấn, một nhân viên bán dụng cụ thể thao trên địa bàn quận Ba Đình, (Hà Nội), chia sẻ: "Như các lần giãn cách và hạn chế ra đường, tập trung đông người trước, lần này, những mặt hàng thiết bị tập thể dục trong nhà được nhiều khách hàng lựa chọn".
  Theo anh Nguyễn Minh Tuấn, mỗi ngày phải phục vụ tư vấn hàng chục khách hàng. Khách chủ yếu mua các thiết bị hỗ trợ tập săn chắc cơ, mặt hàng thảm tập, tạ tay, lò xo kéo nâng cơ, vòng lắc, dây nhảy, quần áo tập, giày thể thao... Trừ chi phí anh có thể thu lời vài triệu đồng.
  Tuy nhiên, anh Nguyễn Minh Tuấn cho rằng, khách hàng lựa chọn tập thể dục tại nhà chỉ là giải pháp tạm thời cho những ngày không thể ra ngoài nên làm nghề này chỉ bận những ngày dịch bệnh.
  Để có thể thu hút khách hàng, anh Nguyễn Minh Tuấn cho rằng, đa số giao dịch trên mạng internet nên người làm nghề cần phải nắm bắt được tâm lý, độ tuổi khách hàng để tư vấn những dụng cụ thể thao trong nhà phù hợp.
  "Những ngày này, công việc của tôi rất bận rộn, đi làm từ sáng sớm để chốt đơn online cho khách. Tư vấn qua điện thoại đến khản cả cổ, rồi đóng hàng giao cho khách đến tận đêm muộn. Tuy nhiên, nhiều khách mua hàng tôi được nhận % nhiều hơn nên rất phấn khởi" - anh Nguyễn Minh Tuấn tâm sự.
  Tuy nhiên, theo anh Lê Hồng Quân, để tránh tình trạng khách hàng đặt hàng không rồi không nhận, người làm nghề cần nghiên cứu kỹ đối tượng khách hàng về thái độ khi đặt hàng và kiểm tra thật kỹ địa chỉ khách hàng cung cấp.',
1,
N'ADMIN',
'TL004'
)
INSERT BaiViet(MaBV, TenBV, DDHinh, TomTat, NgayDang, NoiDung, DaDuyet, TaiKhoan, MaLoai) 
VALUES(
'BV005',
N'FPT "bắt tay" Google ra thiết bị TV Box thông minh điều khiển không chạm',
N'/Asset/Images/baiViet/loa-thong-minh.jpg',
N'FPT Play Box S là thiết bị kết hợp giữa TV Box và loa thông minh đầu tiên trên thế giới hỗ trợ khả năng điều khiển giọng nói bằng tiếng Việt...',
CAST(N'2021-04-27 18:34:15.857' AS DateTime),
N'Điểm nhấn công nghệ của sản phẩm mới FPT Play Box S được Công ty Cổ phần Viễn Thông FPT công bố tối 26/4 chính là tính năng Hands-free Voice Control (điều khiển không chạm).
  Không chỉ là TV Box phục vụ nhu cầu giải trí, FPT Play Box S còn được xem như là “trái tim” của ngôi nhà thông minh, để điều khiển các thiết bị khác trong nhà. Với thiết bị này, người dùng có thể mở một kênh truyền hình yêu thích trong khi ra lệnh cho máy hút bụi tự vận hành, bật tắt đèn hay kiểm tra các thông tin về thời tiết, thị trường...
  Với ứng dụng Rogo Smart Home, người dùng có thể dễ dàng kết nối với các thiết bị IoT trong hệ sinh thái Nhà thông minh, ra lệnh tắt mở trên tất cả các thiết bị hoàn toàn bằng giọng nói tiếng Việt. Ngoài ra, ứng dụng còn liên tục cập nhật các thông số về nhiệt độ, độ ẩm không khí… ngay trên giao diện TV.
  Thiết bị này cũng cho phép người dùng lập lịch điều khiển các thiết bị Smart-home như bóng đèn, công tắc, rèm cửa theo các múi giờ cố định hay theo tín hiệu cảm biến chuyển động, cảm biến cửa, cảm biến ánh sáng như: mở rèm cửa và tắt đèn ngủ lúc 6 giờ sáng hay bật đèn hành lang, đèn nhà vệ sinh khi có người ra vào, giảm đèn…
  Theo thông tin từ Công ty Cổ phần Viễn Thông FPT, thiết bị này có thể tương thích với hơn 5.000 thiết bị thông minh từ hơn 150 nhà cung cấp thông qua nền tảng của Google Home.
  Ông Lê Trọng Đức, Giám đốc sản phẩm FPT Play Box, chia sẻ: “FPT Play Box S sẽ trở thành một trợ lý ảo hoàn hảo trong chính ngôi nhà của bạn. Sản phẩm này sẽ là trung tâm điều khiển các thiết bị thông minh trong nhà và người dùng chỉ cần sử dụng giọng nói tiếng Việt để ra lệnh. Đây chính là chiến lược đô thị thông minh của FPT Telecom. Chúng tôi kỳ vọng sản phẩm không chỉ phục vụ cho riêng người dùng Việt Nam mà còn có kế hoạch chinh phục người dùng thế giới”.
  Được biết, thiết bị này có giá 2.390.000 đồng bao gồm phí sử dụng 1 tháng gói VIP và 12 tháng gói Gia đình với gồm 62 kênh truyền hình đặc sắc trong nước và quốc tế thuộc gói kênh trả phí, cùng với gần 100 kênh miễn phí, trực tiếp FA Cup và độc quyền Serie A giải bóng đá vô địch quốc gia Ý (2018-2021)...',
1,
N'ADMIN',
'TL005'
)
INSERT BaiViet(MaBV, TenBV, DDHinh, TomTat, NgayDang, NoiDung, DaDuyet, TaiKhoan, MaLoai) 
VALUES(
'BV006',
N'Họa tiết kẻ sọc và sự trở lại đúng thời điểm',
N'/Asset/Images/baiViet/dam-hoa-tiet-ke-soc-ngang-sooyaaa__.jpg',
N'Nếu những chuyến du lịch trở nên bất khả thi vì sự hạn chế của đại dịch, vậy thì hãy để họa tiết kẻ sọc đưa bạn đến gần hơn với các cảm hứng viễn du và chinh phục.',
CAST(N'2021-05-18 10:13:01.857' AS DateTime),
N'Họa tiết kẻ sọc được xem là “linh hồn” của nhiều phong cách như Preppy hay Academia. Đặc biệt, họa tiết này thường chiếm ưu thế trong tủ quần áo của các tín đồ theo chủ nghĩa tối giản. Không thể phủ nhận những đường kẻ song song này có tính ứng dụng cao, mang lại nhiều lựa chọn cho người mặc trong mọi hoàn cảnh.
  Với nguồn gốc từ đồng phục thủy thủ, họa tiết kẻ sọc mang “hơi thở” của biển chinh phục thời trang Hè hàng năm. Ngoài áo sơ mi, những đường kẻ sọc mạnh mẽ được biến hóa trên nhiều thiết kế nữ tính như chân váy, đầm, jumpsuit,… Bất kể trong tình huống nào, những món đồ kẻ sọc luôn là lựa chọn an toàn cho bộ cánh thời trang của bạn.
  Chanel là nhà mốt đánh dấu cột mốc xuất hiện của họa tiết kẻ sọc trong làng thời trang với sự ra đời của chiếc áo thun tay dài vào đầu thế kỷ 20. Họa tiết này là biểu tượng khẳng định tính độc lập và niềm kiêu hãnh của phụ nữ thời bấy giờ. Cho đến nay, những thiết kế kẻ sọc vẫn xuất hiện trên sàn diễn của nhiều thương hiệu thời trang danh giá.
  Ở tuần lễ thời trang Xuân – Hè 2021, các nhà thiết kế tinh tế tái hiện họa tiết kẻ sọc hoài cổ trên nền trang phục hiện đại. Christian Dior và Versace ứng dụng đường kẻ sọc với gam màu nóng bắt mắt, mang đậm cảm hứng thời trang Hè. Áo sơ mi màu trung tính của Max Mara và Etro thể hiện nét nam tính đặc trưng của họa tiết sọc.
  Họa tiết kẻ sọc vốn bắt nguồn từ trang phục nam. Khi bước đầu “lấn sân” sang các thiết kế dành cho phái đẹp, họa tiết kẻ sọc được áp dụng nhiều trên các kiểu sơ mi cơ bản. Cho đến nay, áo sơ mi kẻ sọc dọc vẫn là món đồ được giới mộ điệu ưu ái vì tính trang trọng lẫn phong thái thanh lịch.
  Ngoài cách mặc đơn thông thường, bạn có thể thử các bản phối layer với áo khoác da hoặc áo len. Dựa trên nguyên tắc tương phản, áo sơ mi kẻ sọc sẽ kết hợp tốt với các thiết kế quần trơn có phom dáng vừa, không quá rộng.
  Nhờ vào chất liệu, họa tiết kẻ sọc có thể tạo nên nhiều hiệu ứng thị giác độc đáo. Những đường kẻ khi cộng hưởng với chất liệu dày dặn giúp định hình các thiết kế blazer hay áo corset, tăng cường nét mạnh mẽ, cá tính của bộ trang phục. Ngược lại, khi được ứng dụng trên nền vải mềm mại, bay bổng của các thiết kế đầm, từng đường kẻ như uốn lượn giúp tôn lên sự tao nhã, nữ tính của phái đẹp.
  ',
1,
N'ADMIN',
'TL006'
)
GO
SELECT * FROM BaiViet
GO

-- Nhận xét --
CREATE TABLE NhanXet
(
	MaNX			CHAR(5)			NOT NULL,
	MaBV			CHAR(5)			NOT NULL,
	TaiKhoan		VARCHAR(20)		NOT NULL,
	NgayDang		DATETIME		NULL,
	NoiDung			NVARCHAR(max)	NOT NULL,
	CONSTRAINT PK_NhanXet PRIMARY KEY (MaNX),
	CONSTRAINT FK_NX_TV FOREIGN KEY (TaiKhoan) REFERENCES ThanhVien (TaiKhoan),
	CONSTRAINT FK_NX_BV FOREIGN KEY (MaBV) REFERENCES BaiViet (MaBV),
)
GO
INSERT NhanXet(MaNX, MaBV, TaiKhoan, NgayDang, NoiDung)
VALUES('NX001', 'BV001', 'TV001', CAST(N'2021-05-18 05:45:15.857' AS DateTime),
N'Bài viết hay, Tiếp tục phát huy bạn nhé')
INSERT NhanXet(MaNX, MaBV, TaiKhoan, NgayDang, NoiDung)
VALUES('NX002', 'BV001', 'TV002', CAST(N'2021-05-18 05:45:15.857' AS DateTime),
N'Bài viết quá dở, Bạn xem lại')
INSERT NhanXet(MaNX, MaBV, TaiKhoan, NgayDang, NoiDung)
VALUES('NX003', 'BV002', 'TV003', CAST(N'2021-05-18 05:45:15.857' AS DateTime),
N'Bài viết quá dở, Bạn xem lại')
INSERT NhanXet(MaNX, MaBV, TaiKhoan, NgayDang, NoiDung)
VALUES('NX004', 'BV002', 'TV004', CAST(N'2021-05-18 05:45:15.857' AS DateTime),
N'Bài viết hay, Tiếp tục phát huy bạn nhé')
INSERT NhanXet(MaNX, MaBV, TaiKhoan, NgayDang, NoiDung)
VALUES('NX005', 'BV003', 'TV005', CAST(N'2021-05-18 05:45:15.857' AS DateTime),
N'Bài viết hay, Tiếp tục phát huy bạn nhé')
INSERT NhanXet(MaNX, MaBV, TaiKhoan, NgayDang, NoiDung)
VALUES('NX006', 'BV003', 'TV006', CAST(N'2021-05-18 05:45:15.857' AS DateTime),
N'Bài viết quá dở, Bạn xem lại')
INSERT NhanXet(MaNX, MaBV, TaiKhoan, NgayDang, NoiDung)
VALUES('NX007', 'BV004', 'TV005', CAST(N'2021-05-18 05:45:15.857' AS DateTime),
N'Bài viết quá dở, Bạn xem lại')
INSERT NhanXet(MaNX, MaBV, TaiKhoan, NgayDang, NoiDung)
VALUES('NX008', 'BV004', 'TV003', CAST(N'2021-05-18 05:45:15.857' AS DateTime),
N'Bài viết hay, Tiếp tục phát huy bạn nhé')
INSERT NhanXet(MaNX, MaBV, TaiKhoan, NgayDang, NoiDung)
VALUES('NX009', 'BV005', 'TV001', CAST(N'2021-05-18 05:45:15.857' AS DateTime),
N'Bài viết hay, Tiếp tục phát huy bạn nhé')
INSERT NhanXet(MaNX, MaBV, TaiKhoan, NgayDang, NoiDung)
VALUES('NX010', 'BV005', 'TV006', CAST(N'2021-05-18 05:45:15.857' AS DateTime),
N'Bài viết quá dở, Bạn xem lại')
INSERT NhanXet(MaNX, MaBV, TaiKhoan, NgayDang, NoiDung)
VALUES('NX011', 'BV006', 'TV004', CAST(N'2021-05-18 05:45:15.857' AS DateTime),
N'Bài viết quá dở, Bạn xem lại')
INSERT NhanXet(MaNX, MaBV, TaiKhoan, NgayDang, NoiDung)
VALUES('NX012', 'BV006', 'TV002', CAST(N'2021-05-18 05:45:15.857' AS DateTime),
N'Bài viết hay, Tiếp tục phát huy bạn nhé')
GO
SELECT * FROM NhanXet
GO

-- Thẻ --
CREATE TABLE The
(
	MaThe			CHAR(5)			NOT NULL,
	TenThe			NVARCHAR(30)	NOT NULL,
	GhiChu			NTEXT			NULL,
	CONSTRAINT PK_The PRIMARY KEY (MaThe)
)
GO
INSERT The(MaThe, TenThe) VALUES('T0001', N'Đen')
INSERT The(MaThe, TenThe) VALUES('T0002', N'Trắng')
INSERT The(MaThe, TenThe) VALUES('T0003', N'Hồng')
INSERT The(MaThe, TenThe) VALUES('T0004', N'Đỏ')
INSERT The(MaThe, TenThe) VALUES('T0005', N'Vàng')
INSERT The(MaThe, TenThe) VALUES('T0006', N'1 size')
INSERT The(MaThe, TenThe) VALUES('T0007', N'Nhiều size')
INSERT The(MaThe, TenThe) VALUES('T0008', N'Mẹo vặt')
INSERT The(MaThe, TenThe) VALUES('T0009', N'Mới nổi')
INSERT The(MaThe, TenThe) VALUES('T0010', N'Sưu tầm')
INSERT The(MaThe, TenThe) VALUES('T0011', N'Covid')
INSERT The(MaThe, TenThe) VALUES('T0012', N'Tương lai')
INSERT The(MaThe, TenThe) VALUES('T0013', N'Quá khứ')
GO
SELECT * FROM The
GO

-- Thẻ | Bài viết --
CREATE TABLE The_BV
(
	MaThe			CHAR(5)			NOT NULL,
	MaBV			CHAR(5)			NOT NULL,
	CONSTRAINT PK_TBV PRIMARY KEY (MaThe, MaBV),
	CONSTRAINT FK_TBV_The FOREIGN KEY (MaThe) REFERENCES The (MaThe),
	CONSTRAINT FK_TBV_BV FOREIGN KEY (MaBV) REFERENCES BaiViet (MaBV)
)
GO
INSERT The_BV(MaThe, MaBV) VALUES('T0007', 'BV001')
INSERT The_BV(MaThe, MaBV) VALUES('T0008', 'BV002')
INSERT The_BV(MaThe, MaBV) VALUES('T0009', 'BV003')
INSERT The_BV(MaThe, MaBV) VALUES('T0011', 'BV004')
INSERT The_BV(MaThe, MaBV) VALUES('T0012', 'BV005')
INSERT The_BV(MaThe, MaBV) VALUES('T0013', 'BV006')
GO
SELECT * FROM The_BV
GO

-- Thương hiệu --
CREATE TABLE ThuongHieu
(
	MaTH			CHAR(5)			NOT NULL,
	TenTH			NVARCHAR(30)	NOT NULL,
	GhiChu			NTEXT			NULL,
	CONSTRAINT PK_ThuongHieu PRIMARY KEY (MaTH)
)
GO
INSERT ThuongHieu(MaTH, TenTH) VALUES('TH001', N'AMA')
INSERT ThuongHieu(MaTH, TenTH) VALUES('TH002', N'Apple')
INSERT ThuongHieu(MaTH, TenTH) VALUES('TH003', N'Electrolux')
INSERT ThuongHieu(MaTH, TenTH) VALUES('TH004', N'Fitme')
INSERT ThuongHieu(MaTH, TenTH) VALUES('TH005', N'Fivestar Standard')
INSERT ThuongHieu(MaTH, TenTH) VALUES('TH006', N'IGEA')
INSERT ThuongHieu(MaTH, TenTH) VALUES('TH007', N'Lê Sang')
INSERT ThuongHieu(MaTH, TenTH) VALUES('TH008', N'Mi Doctor')
INSERT ThuongHieu(MaTH, TenTH) VALUES('TH009', N'Nagakawa')
INSERT ThuongHieu(MaTH, TenTH) VALUES('TH010', N'OEM')
INSERT ThuongHieu(MaTH, TenTH) VALUES('TH011', N'Panasonic')
INSERT ThuongHieu(MaTH, TenTH) VALUES('TH012', N'Samsung')
INSERT ThuongHieu(MaTH, TenTH) VALUES('TH013', N'Sunhouse')
INSERT ThuongHieu(MaTH, TenTH) VALUES('TH014', N'Toshiba')
INSERT ThuongHieu(MaTH, TenTH) VALUES('TH015', N'US Lion')
INSERT ThuongHieu(MaTH, TenTH) VALUES('TH016', N'Xiaomi')
GO
SELECT * FROM ThuongHieu
GO

-- Sản phẩm --
CREATE TABLE SanPham
(
	MaSP			CHAR(5)			NOT NULL,
	TenSP			NVARCHAR(500)	NOT NULL,
	DDHinh			VARCHAR(max)	NOT NULL,
	NgayDang		DATETIME		NULL,
	NoiDung			NVARCHAR(max)	NOT NULL,
	GiaBan			FLOAT			NOT NULL,
	GiaGiam			FLOAT			NOT NULL,
	DVT				NVARCHAR(10)	NOT NULL,
	DaDuyet			BIT				NOT NULL,
	TaiKhoan		VARCHAR(20)		NOT NULL,
	MaLoai			CHAR(5)			NOT NULL,
	MaTH			CHAR(5)			NOT NULL,
	CONSTRAINT PK_SanPham PRIMARY KEY (MaSP),
	CONSTRAINT FK_SP_TV FOREIGN KEY (TaiKhoan) REFERENCES ThanhVien (TaiKhoan),
	CONSTRAINT FK_SP_TL FOREIGN KEY (MaLoai) REFERENCES TheLoai (MaLoai),
	CONSTRAINT FK_SP_TH FOREIGN KEY (MaTH) REFERENCES ThuongHieu (MaTH)
)
GO
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES('SP001', N'Túi xách nam - da bò',
N'/Asset/Images/sanPham/tui_xach_nam_da_bo-8.jpg',
CAST(N'2020-09-12 15:31:15.857' AS DateTime),
N'Nội dung Giới thiệu túi xách nam bằng vật liệu da bò',
N'ADMIN', 1, 1650000, 0, 'TL006', 'TH010', N'Túi')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES('SP002', N'Túi xách thời trang trẻ trung - vải bố',
N'/Asset/Images/sanPham/tui-vai-bo-chua-bao-gio-la-het-hot-5.jpg',
CAST(N'2020-09-12 15:31:15.857' AS DateTime),
N'Nội dung Giới thiệu túi xách nam bằng vật liệu da bò',
N'ADMIN', 1, 450000, 0, 'TL006', 'TH010', N'Túi')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES('SP003', N'Túi xách nữ - da trăn',
N'/Asset/Images/sanPham/tui-xach-nu-t009.jpg',
CAST(N'2020-09-12 15:31:15.857' AS DateTime),
N'Nội dung Giới thiệu túi xách nam bằng vật liệu da trăn',
N'ADMIN', 1, 2300000, 0, 'TL006', 'TH010', N'Túi')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES('SP004', N'Đồng hồ nam - cơ thụy sỹ',
N'/Asset/Images/sanPham/dong-ho-thuy-sy-sang-trong-dang-cap.jpg',
CAST(N'2020-09-12 15:31:15.857' AS DateTime),
N'Nội dung Giới thiệu đồng hồ nam, mặt tròn của thụy sỹ',
N'ADMIN', 1, 4500000, 0, 'TL006', 'TH010', N'Chiếc')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES('SP005', N'Giày nam trẻ trung',
N'/Asset/Images/sanPham/Tay-Derby-4-Lo_BRC0119001_2-2.jpg',
CAST(N'2020-09-12 15:31:15.857' AS DateTime),
N'Nội dung Giới thiệu giày nam, chất liệu vải',
N'ADMIN', 1, 3500000, 0, 'TL006', 'TH010', N'Đôi')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES('SP006', N'Giày nữ thời trang',
N'/Asset/Images/sanPham/giay-boot-nu-ro308_s1997.jpg',
CAST(N'2020-09-12 15:31:15.857' AS DateTime),
N'Nội dung Giới thiệu Giày nữ thời trang',
N'ADMIN', 0, 31500000, 0, 'TL006', 'TH010', N'Đôi')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES('SP007', N'Dây nịt nam - trung niên',
N'/Asset/Images/sanPham/18.1-1-500x400.jpg',
CAST(N'2020-09-12 15:31:15.857' AS DateTime),
N'Nội dung Giới thiệu Dây nịt nam - trung niên',
N'ADMIN', 0, 300000, 0, 'TL006', 'TH010', N'Cái')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES('SP008', N'Bóp da nam - cá sấu',
N'/Asset/Images/sanPham/bop-da-ca-sau-nam-mong-tay-bcs24-1.jpg',
CAST(N'2020-09-12 15:31:15.857' AS DateTime),
N'Nội dung Giới thiệu Bóp da nam - cá sấu',
N'ADMIN', 0, 1300000, 0, 'TL006', 'TH010', N'Cái')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP009', N'Samsung Galaxy Note 10 Plus',
N'/Asset/Images/sanPham/samsungGalaxyNote10Plus.jpg',
CAST(N'2021-04-03T23:16:04.237' AS DateTime), 
N'Sự kết hợp của những dải màu nổi bật và sinh động.
  Với lớp kính cường lực Gorilla 6 bảo vệ vững chắc, và chất liệu thủy tinh đánh bóng bắt sáng cao cấp sắc sảo kiến tạo nên ánh quang đậm chất đương đại.
  Thao tác sử dụng Galaxy Note10 và Note10+ trực quan hơn nhờ Giao diện Đồng nhất, thân thiện với thói quen thường ngày, cho trải nghiệm Galaxy trở nên vô tận.', 
N'ADMIN', 0, 25450000, 0, 'TL005', 'TH012', N'Cái')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP010', N'Điện Thoại iPhone 11 Pro Max 64GB',
N'/Asset/Images/sanPham/iPhone11_ProMax.jpg',
CAST(N'2021-04-03T23:16:04.213' AS DateTime),
N'Điện thoại iPhone 11 Pro Max là phiên bản cao cấp nhất của iPhone năm nay.
  Sản phẩm có nhiều cải tiến nổi bật, hiệu năng, thiết kế mới đặc biệt ở phần mặt lưng và hệ thống camera.
  IPhone 11 Pro Max có rất nhiều cải tiến về thiết kế, điểm khác biệt lớn nhất đến từ phần mặt lưng với cụm camera được thiết kế cách điệu khá to.',
N'ADMIN', 0, 26500000, 0, 'TL005', 'TH002', N'Cái')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP011', N'Sofa góc Phòng khách', N'/Asset/Images/sanPham/sofaGocPhongKhach.png',
CAST(N'2021-04-03T23:16:04.237' AS DateTime),
N'+ Là sản phẩm nội thất chủ đạo cho căn phòng chung cư nhà bạn, là sản phẩm đẹp và tô điển cho không gian nội thất.
  + Sofa góc cho không gian phòng khách căn hộ từ bình dân cho đến cao cấp được sang trọng hơn bao giờ hết.
  + Gam màu sáng tối với nhiều màu sắc bạn có thể lựa chọn phù hợp với mọi tông màu phòng khách nhà bạn, phù hợp với mọi kiến trúc hiện đại của căn hộ.',
N'ADMIN', 0, 6850000, 0, 'TL003', 'TH010', N'Cái')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP012', N'Quần jogger gân tăm nữ',
N'/Asset/Images/sanPham/quanJoggerNu.jpg',
CAST(N'2021-04-03T23:16:04.253' AS DateTime),
N'Quần jogger gân tăm nữ. Freesize 60kg trở lại 
  + Màu sắc: đen.
  + Chất liệu: thun gân.
  + Xuất xứ: Việt Nam',
N'ADMIN', 0, 55000, 0, 'TL006', 'TH010', N'Chiếc')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP013', N'Áo Sơ Mi Nam Trơn Ngắn Tay',
N'/Asset/Images/sanPham/aoSoMiNamNganTay.jpg',
CAST(N'2021-04-03T23:16:04.237' AS DateTime),
N'Áo sơ mi nam body vẫn rất phù hợp để sử dụng thoải mái cho môi trường công sở. 
  Mẫu áo có thiết kế như thế này sẽ giúp các bạn nam thể hiện được sự tươi trẻ, năng động, thanh lịch và dễ dàng khoe được vóc dáng cân đối của cơ thể.
  Mẫu áo sơ mi nam body phù hợp và đẹp nhất khi được những chàng trai sở hữu thân hình săn chắc và thon gọn.',
N'ADMIN', 0, 99000, 0, 'TL006', 'TH010', N'Chiếc')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP014', N'Giá để giày, Kệ Giày, kệ giầy dép - 7 tầng',
N'/Asset/Images/sanPham/keGiaDeGiay.jpg',
CAST(N'2021-04-03T23:16:04.243' AS DateTime),
N'Tủ Giày Gỗ Lắp Ráp 7 Tầng Cao Cấp với thiết kế nhỏ gọn, dễ dàng tháo lắp, đặc biệt có thể xếp lại cất gọn khi không sử dụng đến, tiết kiệm diện tích.
  Khung gỗ  melamine chống nước, có kèm bộ ốc vít để bạn có thể tự lắp ráp và tháo dỡ khi muốn di chuyển
  Kết cấu chắc chắn, bền bỉ, chịu lực tốt. Có thể để được 12 đôi giày dép và thêm ngăn kéo để chứa đồ nhỏ.
  Sản phẩm góp phần tạo nét hiện đại, sinh động cho không gian sống.',
N'ADMIN', 0, 439000, 0, 'TL003', 'TH010', N'Cái')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP015', N'Giàn tạ đa năng 3 vị trí KZ-82',
N'/Asset/Images/sanPham/gianTaDaNang3ViTri.jpg',
CAST(N'2021-04-03T23:16:04.253' AS DateTime),
N'Chức năng tập luyện: phối hợp được nhiều bài tập khác nhau, theo từng nhóm cơ cụ thể như tập vai, ép ngực, đạp đùi, kéo xô ngắn, kéo xô dài, tập chân, tay, thắt lưng và các nhóm cơ khác…
  + Sử dụng ống thép chiu lực: 50 x 70mm độ dày thép 1.5mm, được phun sơn tính điện chống trầy xước
  + Dây cáp: Có đường kính 5mm, đảm bảo độ chịu lực cao, bền
  + Ghế ngồi và miếng bọc: Có độ dày trung bình 45mm, đảm bảo độ bền.',
N'ADMIN', 0, 18900000, 0, 'TL004', 'TH010', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP016', N'Ghế thư giãn',
N'/Asset/Images/sanPham/gheThuGian.jpg',
CAST(N'2021-04-03T23:16:04.203' AS DateTime),
N'Ghế làm chất liệu cao cấp, chắc chắn. Dùng ở văn phong, đi dã ngoại, ở nhà.
  Dễ dàng gấp gọn, Nằm cực sướng, giúp thư giãn lưng sau mỗi ngày làm việc',
N'ADMIN', 0, 699000, 0, 'TL003', 'TH010', N'Cái')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP017', N'Balo Nữ Đi Học Laptop Chống Nước Ulzzang',
N'/Asset/Images/sanPham/baloNuChongNuoc.jpg',
CAST(N'2021-04-03T23:16:04.243' AS DateTime),
N'Thiết kế hiện đại, trẻ trung,tiện dụng,vừa đơn giản, vừa sang trọng. Sản phẩm chắc chắn. 
  Kích thước :BALO:40X12X30 CM',
N'ADMIN', 0, 105000, 0, 'TL006', 'TH010', N'Cái')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP018', N'Khung nắn chỉnh cột sống, điều trị thoát vị đĩa đệm',
N'/Asset/Images/sanPham/chinhCotSOng_dieuChinhThoatVi.jpg',
CAST(N'2021-04-03T23:16:04.260' AS DateTime),
N'Khung nắn có độ cong lý tưởng cho người dùng một cách tự nhiên.
  Khung nắn có thể chạm tới tối đa các huyệt đạo có trên lưng, đả thông huyệt, tăng cường tuần hoàn máu, làm bệnh mau thuyên giảm.
  Hỗ trợ định hình cột sống về dạng tự nhiên ban đầu mà không cần phải tác động ngoại lực. Hỗ trợ giảm đau một cách tự nhiên tại nhà.',
N'ADMIN', 0, 82000, 0, 'TL004', 'TH010', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP019', N'Kệ tivi phong cách Bắc Âu T350-1',
N'/Asset/Images/sanPham/keTiviPhongCachBacAu.png',
CAST(N'2021-04-03T23:16:04.270' AS DateTime),
N'Thiết kế đơn giản nhưng sắc nét, hiện đại, giúp trang trí nhà thêm ấn tượng tiết kiệm diện tích.
  Đa công năng: Sử dụng làm kệ tủ tivi ,kệ trang trí đa năng. 
  + Kích thước:178x30x36cm. 
  + Chất Liệu: Gỗ MDF nhập khẩu phủ melamin cao cấp chống xước chống nước tuyệt đối
  + Màu sắc: Vân gỗ,Trắng hiện đại, nâu',
N'ADMIN', 0, 569000, 0, 'TL003', 'TH010', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP020', N'Đồng Hồ Thông Minh AMA Watch S2',
N'/Asset/Images/sanPham/smartWatchAMA.jpg',
CAST(N'2021-04-03T23:16:04.260' AS DateTime),
N'Đồng Hồ Thông Minh AMA Watch S2 thiết bị tầm trung nhưng sở hữu nhiều công nghệ và và tính năng hiện đại. 
  Một lựa chọn tuyệt vời dành cho những ai đang tìm kiếm 1 chiếc đồng hồ thông minh, với mức giá hợp lý.',
N'ADMIN', 0, 1387000, 0, 'TL005', 'TH001', N'Cái')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP021', N'Áo thể thao Fitme Body Compression',
N'/Asset/Images/sanPham/aoTheThaoFitness.png',
CAST(N'2021-04-03T23:16:04.237' AS DateTime),
N'Áo thể thao Body Compression Fitme cao cấp chuyên nghiệp dành cho những ai có nhu cầu luyện tập với cường độ cao
  Phù hợp cho các môn thể thao tập gym, bóng rổ, bóng đá, bóng chuyền, giữ nhiệt. 
  Quần chất co dãn cao, fit cơ thể, tôn dáng người',
N'ADMIN', 0, 152000, 0, 'TL004', 'TH004', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP022', N'Đế Sạc Không Dây Đa Chức Năng Cho Apple Watch',
N'/Asset/Images/sanPham/deSacKhongDayApple.jpg',
CAST(N'2021-04-03T23:16:04.260' AS DateTime),
N'Đế sạc Apple này được chế tác tinh xảo từ nhôm bền, thảm cao su chống trượt ở phía dưới giúp tăng cường hoàn hảo sự ổn định của nó.
  Đế Sạc Không Dây Đa Chức Năng Cho Apple Watch & Iphone & AirPods US02- Hàng chính hãng',
N'ADMIN', 0, 490000, 0, 'TL005', 'TH015', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP023', N'Váy Babaydoll Kẻ Caro Phối Nơ',
N'/Asset/Images/sanPham/vayBabadollCaro.jpg',
CAST(N'2021-04-03T23:16:04.213' AS DateTime),
N'Mẫu váy nhẹ nhàng tiểu thư cho các nàng bánh bèo vừa về kho Lê Sang nha!. Mã mới xưởng bên mới thiết kế chào hàng các nàng luôn ạ.
  + Thiết kế cổ tròn phối nơ, đuôi cá.
  + Vải đũi xốp trắng mịn dày dặn.',
N'ADMIN', 0, 109000, 0, 'TL006', 'TH007', N'Cái')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP024', N'Tạ đeo chân cao cấp',
N'/Asset/Images/sanPham/taDeoChanCaoCap.jpg',
CAST(N'2021-04-03T23:16:04.213' AS DateTime),
N'Tạ đeo chân cao cấp phiên bản 4.0 - Nâng cao thể lực, giảm mỡ tăng cơ, phát triển chiều cao, sức bật và sức bền
  Cấu tạo :
  + Vải : Polyeste siêu bền có khả năng chống nước, khử mùi siêu thoáng và cực kỳ êm chân khi tập luyện.
  + Thanh tạ : Thép không gỉ mạ crom cao cấp.	
  + Trọng Lượng : 4 kg, 5 kg, 6 kg, 8 kg... có thể điểu chỉnh được trọng lượng.',
N'ADMIN', 0, 315000, 0, 'TL004', 'TH010', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP025', N'Xà Đơn Treo Tường',
N'/Asset/Images/sanPham/xaDonTreoTuong.jpg',
CAST(N'2021-04-03T23:16:04.253' AS DateTime),
N'Tập hít xà đơn hàng ngày sẽ giúp cho bạn có một thân hình cân đối, đẹp, vòng ngực rộng và cơ bắp săn chắn.
  Với việc tập xà đơn sẽ giúp bạn có một đôi tay cứng, chắc, khỏe.
  Tập hít xà đơn hàng ngày cũng sẽ giúp người tập giảm béo bụng một cách nhanh nhất và hiệu quả
  Xà đơn treo tường có thể thay đổi độ dài sao cho phù hợp với từng kích thước vị trí cần lắp đặt.',
N'ADMIN', 0, 119000, 0, 'TL004', 'TH008', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP026', N'Giày bốt da nam cao cổ',
N'/Asset/Images/sanPham/giayBotDaNamCaoCo.jpg',
CAST(N'2021-04-03T23:16:04.260' AS DateTime),
N'Giày da nam GD-08 với phong cách Bụi Bặm giúp bạn trở nên cá tính và ngầu hơn bao giờ hết, chất da tổng hợp cao cấp giúp bạn dùng lâu bên với thời gian
  Giày bốt nam GD-08 thiết kế giữa chất da và lớt vải lỗ thoáng khi nơi thân giày giúp chân bạn được thoáng khi hơn có 2 màu : Đen và Nâu',
N'ADMIN', 0, 189000, 0, 'TL006', 'TH010', N'Đôi')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP027', N'Bàn Trà Sofa Phong Cách Bắc Âu - IGEA',
N'/Asset/Images/sanPham/banTraSofaIGEA.jpg',
CAST(N'2021-04-03T23:16:04.230' AS DateTime),
N'Mặt bàn sản xuất từ gỗ MDF phủ melamin cao cấp chống xước chống nước bề mặt sáng bóng. Chân bàn sản xuất từ gỗ sồi vân gỗ đều và đẹp.
  Kích thước: mặt bàn rộng 50cm dài 90cm cao 42cm. Màu sắc: Trắng. Phong cách: Hiện đại',
N'ADMIN', 0, 290000, 0, 'TL003', 'TH006', N'Cái')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP028', N'Máy chạy bộ trên không cao cấp',
N'/Asset/Images/sanPham/mayChayBoTrenKhong.jpg',
CAST(N'2021-04-03T23:16:04.260' AS DateTime),
N'Máy kết hợp tập luyện vừa chạy bộ, đi bộ vừa có thể tập kéo tay thúc đẩy các hệ cơ bắp chân, bắp tay, đùi, hông, mông, eo, bụng..
  Bàn để chân rộng, tạo thế đứng vững chắc, tay cầm bọc mút dày, tạo sự thoải mái cho người tập',
N'ADMIN', 0, 1020000, 0, 'TL004', 'TH010', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP029', N'Giày thể thao nữ',
N'/Asset/Images/sanPham/giayTheThaoNu.jpg',
CAST(N'2021-04-03T23:16:04.260' AS DateTime),
N'Kiểu dáng mới, mẫu mã đa dạng. Thể thao cá tính, đi chơi, đi thể dục đều đẹp ạ. Đế cao su, êm chân chống trơn trượt. Size 35 -39',
N'ADMIN', 0, 153000, 0, 'TL006', 'TH010', N'Đôi')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP030', N'Máy giặt Toshiba Inverter',
N'/Asset/Images/sanPham/mayGiatToshiba.jpg',
CAST(N'2021-04-03T23:16:04.230' AS DateTime),
N'Máy Giặt Cửa Trước Inverter Toshiba TW-BK105S2V-WS (9.5kg) - Hàng Chính Hãng sở hữu kiểu thiết kế lồng ngang hiện đại.
  Mang phong cách châu Âu cùng với gam màu trắng tinh tế, chắc chắn sẽ trở thành nội thất sang trọng cho không gian sống nhà bạn. Tiết kiệm điện năng. Khối lượng giặt: 9.5kg. 
  Loại máy giặt: Cửa trước - lồng ngang. Tiết kiệm điện với công nghệ Inverter.',
N'ADMIN', 0, 7390000, 0, 'TL002', 'TH014', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP031', N'Tủ Lạnh ELECTROLUX Inverter 524 Lít ',
N'/Asset/Images/sanPham/tuLanhELECTROLUX.png',
CAST(N'2021-04-03T23:16:04.277' AS DateTime),
N'Làm mát 360 giúp giữ cho thực phẩm của bạn tươi và ngon lâu hơn bằng cách giảm thiểu biến động nhiệt độ. Bằng cách làm mát từng kệ riêng lẻ, nhiệt độ ổn định được duy trì.
  Bộ lọc TasteLock Crisper với NutriPlus tạo ra một môi trường kín, ẩm để khóa các chất dinh dưỡng lâu hơn, giữ cho trái cây và rau quả của bạn tươi trong bảy ngày.',
N'ADMIN', 0, 22590000, 0, 'TL002', 'TH003', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP032 ', N'Máy Giặt Cửa Trước Inverter Electrolux',
N'/Asset/Images/sanPham/mayGiatElectrolux.jpg',
CAST(N'2021-04-03T23:16:04.213' AS DateTime),
N'Máy Giặt Cửa Trước Inverter Electrolux EWF9025BQSA là một chiếc máy giặt cửa trước có thiết kế hiện đại, trẻ trung với chất liệu inox màu bạc tinh tế, sang trọng.
  Cùng thiết kế cửa pha lê trong suốt trang nhã, máy giặt Electrolux sẽ tạo nên điểm nhấn tinh tế cho không gian giặt giũ trong nhà bạn.
  Khối lượng giặt: 9kg. Loại máy giặt: Cửa trước - lồng ngang. Động cơ: Truyền động dây Cua roa. Công nghệ Inverter - Tiết kiệm điện hiệu quả.',
N'ADMIN', 0, 8940000, 0, 'TL002', 'TH003', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP033', N'Bộ nồi inox 430 Fivestar Standard',
N'/Asset/Images/sanPham/boNoiInoxFivestarStandard.jpg',
CAST(N'2021-04-03T23:16:04.277' AS DateTime),
N'Bộ nồi inox Fivestar 3 đáy bếp từ nắp inox. + Đường kính nói là 16 cm , chiều cao noi 10cm,dung tích 1.8 lít.
  + Đường kính 20 cm, nồi cao12 cm, dùng tích 3.6 lít.
  + Đường kính 24, nồi cao 14 cm, dùng tích 5.1 lít',
N'ADMIN', 0, 559000, 0, 'TL001', 'TH005', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP034', N'Tủ lạnh Toshiba Inverter 493 lít',
N'/Asset/Images/sanPham/tuLanhToshiba.jpg',
CAST(N'2021-04-03T23:16:04.253' AS DateTime),
N'Tổng dung tích 493 lít - Lấy nước ngoài tiện lợi - Công nghệ Dual Inverter tiết kiệm điện năng.
  Chế độ kỳ nghỉ tiết kiệm - Điều khiển cảm ứng bên ngoài - Tay cầm nổi kiểu mới tiện dụng
  Luồng khí lạnh đa chiều - Chế độ làm lạnh nhanh (Quick REF.) - Chế độ cấp đông nhanh (Quick FRZ.)',
N'ADMIN', 0, 20249000, 0, 'TL002', 'TH014', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP035', N'Máy giặt Panasonic Inverter 10.5 Kg',
N'/Asset/Images/sanPham/mayGiatPanasonic.jpg',
CAST(N'2021-04-03T23:16:04.243' AS DateTime),
N'Giặt sạch các vết bẩn cứng đầu dễ dàng với công nghệ giặt Stainmaster, sở hữu công nghệ giặt Stainmaster.
  Giúp giặt sạch các vết bẩn cứng đầu và tăng cường hiệu quả giặt sạch quần áo tốt hơn.',
N'ADMIN', 0, 9290000, 0, 'TL002', 'TH011', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP036', N'Bộ 3 nồi inox 4 đáy Nagakawa',
N'/Asset/Images/sanPham/boNoiInox4DayNagakawa.jpg',
CAST(N'2021-04-03T23:16:04.243' AS DateTime),
N'Bộ 3 nồi inox 4 đáy Nagakawa NAG1306 (16cm, 20cm, 24cm) - Quai mạ vàng - Dùng trên mọi loại bếp - 
  Hàng Chính Hãng bao gồm 3 nồi với 3 kích thước: 160mm; 200mm; 240mm.
  Thiết kế thân nồi thẳng cao, đơn giản, rất đẹp mắt với màu inox sáng bóng, được làm bằng chất liệu inox cao cấp.',
N'ADMIN', 0, 599000, 0, 'TL001', 'TH009', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP037', N'Nồi Áp Suất Cơ Inox Cao Cấp Nagakawa',
N'/Asset/Images/sanPham/noiApSuatNagakawa.jpg',
CAST(N'2021-04-03T23:16:04.230' AS DateTime),
N'Hệ thống 2 van xả, khóa nắp tuyệt đối an toàn. Hệ thống doăng an toàn và kín tuyêt đối. 
  Chất liệu cao cấp inox 304 không gỉ, chống bám bẩn tối ưu, an toàn cho sức khỏe, dễ dàng vệ sinh.
  Cấu trúc đáy 3 lớp, nấu chín đều, giữ nhiệt lâu, tản nhiệt tốt.',
N'ADMIN', 0, 1328000, 0, 'TL001', 'TH009', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP038', N'Tủ lạnh Panasonic Inverter 642 lít',
N'/Asset/Images/sanPham/tuLanhPanasonic.png',
CAST(N'2021-04-03T23:16:04.253' AS DateTime),
N'Tủ lạnh Panasonic Inverter 642 lít NR-F654GT-X2 với kiểu dáng 6 cửa, mặt gương cùng hệ thống khay kệ làm từ kính.
  Cường lực cứng cáp, không chỉ tô điểm vẻ đẹp đẳng cấp cho gian bếp mà còn giúp bạn thoải mái trong việc sắp xếp thực phẩm. 
  Bên cạnh đó, tủ lạnh Panasonic 642 lít còn là sự lựa chọn lý tưởng cho gia đình trên 5 người.',
N'ADMIN', 0, 88990000, 0, 'TL002', 'TH011', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP039', N'Bộ nồi Inox 3 đáy SUNHOUSE',
N'/Asset/Images/sanPham/boNoiInoxSunhouse.jpg',
CAST(N'2021-04-03T23:16:04.203' AS DateTime),
N'Quai nồi Quai inox tán đinh bọc silicon cách nhiệt, Núm cầm Núm inox bọc silicon cách nhiệt, 
  Vung nồi Vung kính cường lực viền inox, Đáy nồi Đáy từ, sử dụng trên mọi loại bếp.',
N'ADMIN', 0, 399000, 0, 'TL001', 'TH013', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP040', N'Bộ Nồi Anod Sunhouse',
N'/Asset/Images/sanPham/boNoiAnodSunhouse.jpg',
CAST(N'2021-04-03T23:16:04.237' AS DateTime),
N'Thân nồi được làm từ chất liệu Anod cao cấp, không biến dạng khi va đập.
  Vung kính cường lực siêu bền. Tay cầm bọc nhựa cách nhiệt, di chuyển an toàn.
  An toàn cho sức khỏe, không làm biến đổi thành phần chất dinh dưỡng của thực phẩm',
N'ADMIN', 0, 429000, 0, 'TL001', 'TH013', N'Bộ')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP041', N'Xiaomi Redmi Note 8',
N'/Asset/Images/sanPham/XiaomiRedmiNote8.jpg',
CAST(N'2021-04-03T23:16:04.243' AS DateTime),
N'Điện Thoại Xiaomi Redmi Note 8 - Hàng Chính Hãng Không chỉ có 2 hay 3 camera mà với chiếc smartphone mới Xiaomi Redmi Note 8 thì người dùng sẽ có tới 4 camera để thỏa mãn nhu cầu chụp ảnh của mình.
  Xiaomi Redmi Note 8 sở hữu cho mình camera chính với độ phân giải khủng "khủng" với "số chấm" lên tới 48 MP.',
N'ADMIN', 0, 3750000, 0, 'TL005', 'TH016', N'Cái')
INSERT SanPham(MaSP, TenSP, DDHinh, NgayDang, NoiDung, TaiKhoan, DaDuyet, GiaBan, GiaGiam, MaLoai, MaTH, DVT)
VALUES(N'SP042', N'Tai nghe bluetooth thể thao Y98',
N'/Asset/Images/sanPham/TaiNgheBluetoothY98.jpg',
CAST(N'2021-04-03T23:16:04.270' AS DateTime),
N'Nghe nhạc trong lúc tập luyện thể thao có thể giúp người tập quên đi cảm giác mệt mỏi và gia tăng thời gian tập luyện. 
  Đồng thời, việc nghe nhạc cũng khiến con người quên đi sự chán nản, lặp đi lặp lại của các bài tập thể dục, từ đó gia tăng hiệu suất tập thể dục, thể thao. 
  Chính vì vậy chiếc Tai nghe thể thao Bluetooth Y98 đang hot trên thị trường hiện nay chắc chắn sẽ làm bạn hài lòng.',
N'ADMIN', 0, 299000, 0, 'TL005', 'TH010', N'Bộ')
GO
SELECT * FROM SanPham Order by NgayDang
GO

-- Thẻ | Sản phẩm --
CREATE TABLE The_SP
(
	MaThe			CHAR(5)			NOT NULL,
	MaSP			CHAR(5)			NOT NULL,
	CONSTRAINT PK_TSP PRIMARY KEY (MaThe, MaSP),
	CONSTRAINT FK_TSP_The FOREIGN KEY (MaThe) REFERENCES The (MaThe),
	CONSTRAINT FK_TSP_SP FOREIGN KEY (MaSP) REFERENCES SanPham (MaSP)
)
GO
INSERT The_SP(MaThe, MaSP) VALUES('T0001', 'SP001')
INSERT The_SP(MaThe, MaSP) VALUES('T0002', 'SP002')
INSERT The_SP(MaThe, MaSP) VALUES('T0003', 'SP003')
INSERT The_SP(MaThe, MaSP) VALUES('T0004', 'SP004')
INSERT The_SP(MaThe, MaSP) VALUES('T0005', 'SP005')
INSERT The_SP(MaThe, MaSP) VALUES('T0006', 'SP006')
INSERT The_SP(MaThe, MaSP) VALUES('T0007', 'SP007')
INSERT The_SP(MaThe, MaSP) VALUES('T0001', 'SP008')
INSERT The_SP(MaThe, MaSP) VALUES('T0002', 'SP009')
INSERT The_SP(MaThe, MaSP) VALUES('T0003', 'SP010')
INSERT The_SP(MaThe, MaSP) VALUES('T0004', 'SP011')
INSERT The_SP(MaThe, MaSP) VALUES('T0005', 'SP012')
INSERT The_SP(MaThe, MaSP) VALUES('T0006', 'SP013')
INSERT The_SP(MaThe, MaSP) VALUES('T0007', 'SP014')
INSERT The_SP(MaThe, MaSP) VALUES('T0001', 'SP015')
INSERT The_SP(MaThe, MaSP) VALUES('T0002', 'SP016')
INSERT The_SP(MaThe, MaSP) VALUES('T0003', 'SP017')
INSERT The_SP(MaThe, MaSP) VALUES('T0004', 'SP018')
INSERT The_SP(MaThe, MaSP) VALUES('T0005', 'SP019')
INSERT The_SP(MaThe, MaSP) VALUES('T0006', 'SP020')
INSERT The_SP(MaThe, MaSP) VALUES('T0007', 'SP021')
INSERT The_SP(MaThe, MaSP) VALUES('T0001', 'SP022')
INSERT The_SP(MaThe, MaSP) VALUES('T0002', 'SP023')
INSERT The_SP(MaThe, MaSP) VALUES('T0003', 'SP024')
INSERT The_SP(MaThe, MaSP) VALUES('T0004', 'SP025')
INSERT The_SP(MaThe, MaSP) VALUES('T0005', 'SP026')
INSERT The_SP(MaThe, MaSP) VALUES('T0006', 'SP027')
INSERT The_SP(MaThe, MaSP) VALUES('T0007', 'SP028')
INSERT The_SP(MaThe, MaSP) VALUES('T0001', 'SP029')
INSERT The_SP(MaThe, MaSP) VALUES('T0002', 'SP030')
INSERT The_SP(MaThe, MaSP) VALUES('T0003', 'SP031')
INSERT The_SP(MaThe, MaSP) VALUES('T0004', 'SP032')
INSERT The_SP(MaThe, MaSP) VALUES('T0005', 'SP033')
INSERT The_SP(MaThe, MaSP) VALUES('T0006', 'SP034')
INSERT The_SP(MaThe, MaSP) VALUES('T0007', 'SP035')
INSERT The_SP(MaThe, MaSP) VALUES('T0001', 'SP036')
INSERT The_SP(MaThe, MaSP) VALUES('T0002', 'SP037')
INSERT The_SP(MaThe, MaSP) VALUES('T0003', 'SP038')
INSERT The_SP(MaThe, MaSP) VALUES('T0004', 'SP039')
INSERT The_SP(MaThe, MaSP) VALUES('T0005', 'SP040')
INSERT The_SP(MaThe, MaSP) VALUES('T0006', 'SP041')
INSERT The_SP(MaThe, MaSP) VALUES('T0007', 'SP042')
GO
SELECT * FROM The_SP
GO

-- Chi tiết hóa đơn --
CREATE TABLE CTHD
(
	SoDH			CHAR(5)			NOT NULL,
	MaSP			CHAR(5)			NOT NULL,
	SoLuong			Int				NOT NULL		DEFAULT(0),
	CONSTRAINT PK_CTHD PRIMARY KEY (SoDH, MaSP),
	CONSTRAINT FK_CTHD_DH FOREIGN KEY (SoDH) REFERENCES DonHang (SoDH),
	CONSTRAINT FK_CTHD_SP FOREIGN KEY (MaSP) REFERENCES SanPham (MaSP)
)
GO
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH001', 'SP001', 5)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH001', 'SP003', 8)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH001', 'SP004', 3)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH001', 'SP008', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH002', 'SP001', 5)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH002', 'SP002', 8)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH002', 'SP005', 1)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH003', 'SP002', 5)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH003', 'SP004', 3)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH003', 'SP006', 8)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH003', 'SP007', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH004', 'SP003', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH004', 'SP004', 3)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH005', 'SP006', 6)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH005', 'SP007', 3)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH005', 'SP008', 3)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH006', 'SP002', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH006', 'SP005', 1)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH006', 'SP006', 3)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH006', 'SP007', 9)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH007', 'SP001', 5)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH007', 'SP003', 8)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH007', 'SP004', 3)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH008', 'SP001', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH008', 'SP002', 1)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH008', 'SP003', 5)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH008', 'SP006', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH009', 'SP001', 5)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH009', 'SP008', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH010', 'SP001', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH010', 'SP002', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH010', 'SP007', 1)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH010', 'SP008', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH011', 'SP001', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH011', 'SP002', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH011', 'SP007', 1)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH011', 'SP008', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH012', 'SP001', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH012', 'SP002', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH012', 'SP008', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH013', 'SP002', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH013', 'SP007', 1)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH013', 'SP008', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH014', 'SP001', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH014', 'SP008', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH015', 'SP001', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH015', 'SP002', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH016', 'SP001', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH016', 'SP008', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH017', 'SP002', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH017', 'SP007', 1)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH017', 'SP008', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH018', 'SP001', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH018', 'SP002', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH018', 'SP008', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH019', 'SP007', 1)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH019', 'SP008', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH020', 'SP002', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH020', 'SP007', 1)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH020', 'SP008', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH021', 'SP002', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH021', 'SP007', 1)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH021', 'SP008', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH022', 'SP001', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH022', 'SP008', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH023', 'SP001', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH023', 'SP002', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH023', 'SP007', 1)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH024', 'SP001', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH024', 'SP002', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH025', 'SP003', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH025', 'SP005', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH025', 'SP006', 1)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH025', 'SP007', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH026', 'SP003', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH026', 'SP005', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH026', 'SP007', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH027', 'SP006', 1)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH027', 'SP007', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH028', 'SP003', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH028', 'SP007', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH029', 'SP003', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH029', 'SP005', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH030', 'SP002', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH030', 'SP007', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH031', 'SP001', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH031', 'SP002', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH031', 'SP004', 1)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH031', 'SP007', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH032', 'SP001', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH032', 'SP007', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH033', 'SP004', 1)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH033', 'SP007', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH034', 'SP002', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH034', 'SP004', 1)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH034', 'SP007', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH035', 'SP001', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH035', 'SP004', 1)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH035', 'SP007', 7)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH036', 'SP001', 2)
INSERT CTHD(SoDH, MaSP, SoLuong) VALUES('DH036', 'SP007', 7)
GO
SELECT * FROM CTHD
GO