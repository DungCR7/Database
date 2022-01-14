CREATE DATABASE BTVN
USE BTVN

CREATE TABLE nha_cung_cap(
	ma_nha_cung_cap INT PRIMARY KEY IDENTITY,
	ten_nha_cung_cap VARCHAR(50)
)
DROP TABLE nha_cung_cap
CREATE TABLE hang_san_pham(
	ma_hang_san_pham INT PRIMARY KEY IDENTITY,
	ten_hang_san_pham VARCHAR(50)
)
DROP TABLE hang_san_pham
CREATE TABLE loai_san_pham(
	ma_loai_san_pham INT PRIMARY KEY IDENTITY,
	ten_loai_san_pham VARCHAR(50)
)
DROP TABLE loai_san_pham
CREATE TABLE san_pham(
	ma_san_pham INT PRIMARY KEY IDENTITY,
	ten_san_pham VARCHAR(50),
	ma_nha_cung_cap INT,
	ma_hang_san_pham INT,
	ma_loai_san_pham INT,
	so_luong INT,
	gia FLOAT,
	FOREIGN KEY (ma_nha_cung_cap) REFERENCES nha_cung_cap(ma_nha_cung_cap),
	FOREIGN KEY (ma_hang_san_pham) REFERENCES hang_san_pham(ma_hang_san_pham),
	FOREIGN KEY (ma_loai_san_pham) REFERENCES loai_san_pham(ma_loai_san_pham)
) 
DROP TABLE san_pham
CREATE TABLE khach_hang(
	ma_khach_hang INT PRIMARY KEY IDENTITY,
	ten_khach_hang VARCHAR(50),
	sdt VARCHAR(10),
	gioi_tinh VARCHAR(10),
	ngay_sinh DATE,
	dia_chi VARCHAR(50),
	email VARCHAR(100)
)
DROP TABLE khach_hang
CREATE TABLE hoa_don(
	ma_hoa_don INT PRIMARY KEY IDENTITY,
	ngay_dat_hang DATE,
	trang_thai VARCHAR(50)
)
DROP TABLE hoa_don
CREATE TABLE hoa_don_chi_tiet(
	ma_hoa_don INT,
	ma_san_pham INT,
	FOREIGN KEY (ma_hoa_don) REFERENCES hoa_don(ma_hoa_don),
	FOREIGN KEY (ma_san_pham) REFERENCES san_pham(ma_san_pham),
	so_luong_mua INT,
	gia FLOAT
);
DROP TABLE hoa_don_chi_tiet
/* INSERT 6 BẢN GHI */
INSERT INTO nha_cung_cap VALUES ('Apple')
INSERT INTO nha_cung_cap VALUES ('Xiaomi')
INSERT INTO nha_cung_cap VALUES ('Samsung')
INSERT INTO nha_cung_cap VALUES ('Nokia')
INSERT INTO nha_cung_cap VALUES ('Bphone')
INSERT INTO nha_cung_cap VALUES ('Oppo')

SELECT * FROM  nha_cung_cap

INSERT INTO hang_san_pham VALUES ('Apple')
INSERT INTO hang_san_pham VALUES ('Xiaomi')
INSERT INTO hang_san_pham VALUES ('Samsung')
INSERT INTO hang_san_pham VALUES ('Nokia')
INSERT INTO hang_san_pham VALUES ('Bphone')
INSERT INTO hang_san_pham VALUES ('Oppo')

SELECT * FROM hang_san_pham

INSERT INTO loai_san_pham VALUES ('Smartphone')
INSERT INTO loai_san_pham VALUES ('Smartphone')
INSERT INTO loai_san_pham VALUES ('Smartphone')
INSERT INTO loai_san_pham VALUES ('Smartphone')
INSERT INTO loai_san_pham VALUES ('Smartphone')
INSERT INTO loai_san_pham VALUES ('Smartphone')

SELECT * FROM loai_san_pham

INSERT INTO san_pham VALUES ('XS MAX',1,2,1,1,11700000)
INSERT INTO san_pham VALUES ('IP 11 PRO MAX',1,2,1,1,15700000)
INSERT INTO san_pham VALUES ('IP 12 PRO MAX',1,2,4,3,18700000)
INSERT INTO san_pham VALUES ('IP 13 PRO MAX',4,3,5,1,24300000)
INSERT INTO san_pham VALUES ('IP 11 ',1,2,6,8,13000000)
INSERT INTO san_pham VALUES ('IP 12',1,2,4,7,14000000)

SELECT * FROM san_pham

INSERT INTO khach_hang VALUES ('Nguyen Van A','0987654321','NAM','3/30/1999','HA NOI','ASC@gmail.com')
INSERT INTO khach_hang VALUES ('Nguyen Van b','0983654321','Nu','3/31/1999','HA NOI','AjC@gmail.com')
INSERT INTO khach_hang VALUES ('Nguyen Van c','0981654321','NAM','4/30/1999','HA NOI','AaC@gmail.com')
INSERT INTO khach_hang VALUES ('Nguyen Van d','0987454321','Nu','1/30/1999','HA NOI','Avb@gmail.com')
INSERT INTO khach_hang VALUES ('Nguyen Van e','0987354321','NAM','4/30/1999','HA NOI','AmC@gmail.com')
INSERT INTO khach_hang VALUES ('Nguyen Van h','0987674321','NAM','6/30/1999','HA NOI','AhjC@gmail.com')

SELECT * FROM khach_hang

INSERT INTO hoa_don VALUES ('6/30/2021','DONE')
INSERT INTO hoa_don VALUES ('5/10/2021','NO')
INSERT INTO hoa_don VALUES ('5/21/2021','DONE')
INSERT INTO hoa_don VALUES ('8/03/2021','NO')
INSERT INTO hoa_don VALUES ('7/20/2021','DONE')
INSERT INTO hoa_don VALUES ('9/15/2021','NO')

SELECT * FROM hoa_don

INSERT INTO hoa_don_chi_tiet VALUES (1,1,2,11700000)
INSERT INTO hoa_don_chi_tiet VALUES (1,4,6,15000000)
INSERT INTO hoa_don_chi_tiet VALUES (4,1,2,12300000)
INSERT INTO hoa_don_chi_tiet VALUES (6,4,7,19900000)
INSERT INTO hoa_don_chi_tiet VALUES (3,3,2,10000000)
INSERT INTO hoa_don_chi_tiet VALUES (2,1,5,13600000)

SELECT * FROM hoa_don_chi_tiet

/* B */
SELECT * FROM san_pham WHERE gia >= 10000000
/* c  Hiển thị thông tin sản phẩm gồm ma_san_pham, 
ten_san_pham, ma_nha_cung_cap, ten_nha_cung_cap, 
ma_hang_san_pham, ten_hang_san_pham, ma_loai_san_pham, ten_loai_san_pham */ 
SELECT san_pham.ma_san_pham, san_pham.ten_san_pham, san_pham.so_luong, san_pham.gia, nha_cung_cap.*,hang_san_pham.*,loai_san_pham.* FROM san_pham 
INNER JOIN nha_cung_cap ON san_pham.ma_nha_cung_cap = nha_cung_cap.ma_nha_cung_cap
INNER JOIN hang_san_pham ON san_pham.ma_hang_san_pham = hang_san_pham.ma_hang_san_pham
INNER JOIN loai_san_pham ON san_pham.ma_loai_san_pham = loai_san_pham.ma_loai_san_pham
WHERE san_pham.gia >= 10000000


 /* d, Hiển thị thông tin hóa đơn gồm: ma_hoa_don, ten_khach_hang, sdt, ma_san_pham, ten_san_pham, so_luong_mua, gia, tong_tien */
SELECT hoa_don.ma_hoa_don, khach_hang.ten_khach_hang, khach_hang.sdt,hoa_don_chi_tiet.ma_san_pham, san_pham.ten_san_pham,
hoa_don_chi_tiet.so_luong_mua, hoa_don_chi_tiet.gia, (hoa_don_chi_tiet.gia * hoa_don_chi_tiet.so_luong_mua) as tong_tien
FROM hoa_don INNER JOIN khach_hang ON hoa_don.ma_khach_hang = khach_hang.ma_khach_hang
INNER JOIN hoa_don_chi_tiet ON hoa_don.ma_hoa_don = hoa_don_chi_tiet.ma_hoa_don
INNER JOIN san_pham ON hoa_don_chi_tiet.ma_san_pham = san_pham.ma_san_pham

/*SELECT hoa_don.ma_hoa_don,khach_hang.ten_khach_hang,khach_hang.sdt,hoa_don_chi_tiet.ma_san_pham,san_pham.ten_san_pham,hoa_don_chi_tiet.so_luong_mua,hoa_don_chi_tiet.gia,( hoa_don_chi_tiet.so_luong_mua * hoa_don_chi_tiet.gia  ) AS tong_tien
FROM hoa_don 
INNER JOIN khach_hang ON hoa_don.ma_khach_hang = khach_hang.ma_khach_hang
INNER JOIN hoa_don_chi_tiet ON hoa_don.ma_hoa_don = hoa_don_chi_tiet.ma_hoa_don
INNER JOIN san_pham ON hoa_don_chi_tiet.ma_san_pham = san_pham.ma_san_pham */

/*e, hiển thị thông tin gồm: ma_hoa_don, ma_khach_hang, ten_khach_hang, ngay_dat_mua, tong_tien của từng hóa đơn*/
SELECT hoa_don.ma_hoa_don, hoa_don.ma_khach_hang, hoa_don.ngay_dat_hang, khach_hang.ten_khach_hang, SUM(hoa_don_chi_tiet.gia * hoa_don_chi_tiet.so_luong_mua) AS tong_tien 
FROM hoa_don 
INNER JOIN khach_hang ON hoa_don.ma_khach_hang = khach_hang.ma_khach_hang
INNER JOIN hoa_don_chi_tiet ON hoa_don.ma_hoa_don = hoa_don_chi_tiet.ma_hoa_don
INNER JOIN san_pham ON hoa_don_chi_tiet.ma_san_pham = san_pham.ma_san_pham
GROUP BY hoa_don.ma_hoa_don, hoa_don.ma_khach_hang, hoa_don.ngay_dat_hang, khach_hang.ten_khach_hang
/*f, Hiển thị thông tin gồm: ma_san_pham, ten_san_pham, ma_hang_san_pham, ten_hang_san_pham, gia, tong_tien_da_ban_san_pham */

SELECT san_pham.ma_san_pham, san_pham.ten_san_pham, hang_san_pham.ma_hang_san_pham, hang_san_pham.ten_hang_san_pham, hoa_don_chi_tiet.gia, 
SUM(hoa_don_chi_tiet.gia * hoa_don_chi_tiet.so_luong_mua) AS tong_tien_da_ban_san_pham
FROM hoa_don_chi_tiet INNER JOIN san_pham ON hoa_don_chi_tiet.ma_san_pham = san_pham.ma_san_pham
INNER JOIN loai_san_pham ON loai_san_pham.ma_loai_san_pham = san_pham.ma_loai_san_pham
INNER JOIN hang_san_pham ON hang_san_pham.ma_hang_san_pham = san_pham.ma_hang_san_pham
INNER JOIN hoa_don ON hoa_don.ma_hoa_don = hoa_don_chi_tiet.ma_hoa_don
GROUP BY san_pham.ma_san_pham, san_pham.ten_san_pham, hang_san_pham.ma_hang_san_pham, hang_san_pham.ten_hang_san_pham, hoa_don_chi_tiet.gia

/*g*/
SELECT hoa_don_chi_tiet.so_luong_mua, hoa_don_chi_tiet.ma_san_pham,san_pham.ten_san_pham FROM san_pham 
INNER JOIN hoa_don_chi_tiet ON san_pham.ma_san_pham=hoa_don_chi_tiet.ma_san_pham
WHERE so_luong_mua = (SELECT MAX(so_luong_mua) AS soluongmuanhieunhat FROM hoa_don_chi_tiet)
GROUP BY hoa_don_chi_tiet.ma_san_pham,san_pham.ten_san_pham,hoa_don_chi_tiet.so_luong_mua

/*h*/
SELECT hoa_don_chi_tiet.so_luong_mua,hoa_don.ma_khach_hang,khach_hang.ten_khach_hang,hoa_don_chi_tiet.so_luong_mua FROM khach_hang 
INNER JOIN hoa_don ON khach_hang.ma_khach_hang=hoa_don.ma_khach_hang
INNER JOIN hoa_don_chi_tiet ON hoa_don_chi_tiet.ma_hoa_don=hoa_don.ma_hoa_don
WHERE so_luong_mua = (SELECT MAX(so_luong_mua) AS soluongmuanhieunhat FROM hoa_don_chi_tiet)
GROUP BY hoa_don_chi_tiet.so_luong_mua, hoa_don.ma_khach_hang,khach_hang.ten_khach_hang

/*i*/

