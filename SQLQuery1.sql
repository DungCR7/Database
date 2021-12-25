create database QLHH
use QLHH

create table nha_cung_cap(
	ma_cung_cap int,
	ten_nha_cung_cap varchar(50)
);

create table hang_san_pham(
	ma_hang int,
	ten_hang varchar(50)
);

create table san_pham(
	ma_san_pham int,
	ten_san_pham varchar(50),
	so_luong int,
	tinh_trang varchar(50),
	ngay_san_xuat date,
	han_su_dung date,
	ma_nha_cung_cap int,
	ma_hang int,
	gia float
);

create table khach_hang(
	ma_khach_hang int,
	ten_khach_hang varchar(50),
	ngay_sinh date,
	gioi_tinh varchar(10),
	so_dien_thoai int,
	dia_chi varchar(100),
	email varchar(50)
);

create table hoa_don(
	ma_hoa_don int,
	ngay_lap date,
	ma_khach_hang int,
	trang_thai varchar(50)
);

create table hoa_don_chi_tiet(
	ma_hoa_don int,
	ma_san_pham int,
	so_luong int,
	gia float
);
ALTER TABLE hoa_don_chi_tiet ALTER COLUMN gia INT
ALTER TABLE hoa_don_chi_tiet ADD ma_hoa_don_chi_tiet INT
ALTER TABLE hoa_don_chi_tiet DROP COLUMN ma_hoa__don_chi_tiet
drop table hoa_don_chi_tiet