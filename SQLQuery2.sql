create database QLSV
use QLSV

create table nha_cung_cap(
	ma_nha_cung_cap int,
	ten_nha_cung_cap varchar(100)
);
create table hang_san_pham(
	ma_hang int,
	ten_hang varchar(50)
);
create table san_pham(
	ma_san_pham int,
	ten_san_pham varchar(50),
	so_luong int,
	tinh_trang bit,
	ngay_san_xuat date,
	han_su_dung date,
	ma_nha_cung_cap int,
	ma_hang int,
	gia float,
);
create table khach_hang(
	ma_khach_hang int,
	ten_khach_hang varchar(50),
	dia_chi int,
	so_dien_thoai int,
	email varchar(50),
	ngay_sinh date,
	gioi_tinh bit
);
create table hoa_don(
 ma_hoa_don int,
 ngay_lap date,
 ma_khach_hang int,
 trang_thai bit,
);
create table hoa_don_chi_tiet(
	ma_hoa_don int,
	ma_san_pham int,
	so_luong int,
	gia float
);
ALTER TABLE hoa_don_chi_tiet ADD ma_hoa_don_chi_tiet INT
ALTER TABLE hoa_don_chi_tiet DROP COLUMN ma_hoa_don_chi_tiet

INSERT INTO nha_cung_cap VALUES (1,'IPHONE')
INSERT INTO nha_cung_cap VALUES (2,'SAMSUNG')
INSERT INTO nha_cung_cap(ten_nha_cung_cap) VALUES ('XIAOMI')
SELECT *FROM nha_cung_cap
INSERT INTO san_pham VALUES (1,'IPHONE 11 PROMAX 256GB',2,1,'2021-12-18','2022-06-23',7,4,17500)
SELECT *FROM san_pham