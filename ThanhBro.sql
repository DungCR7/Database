CREATE DATABASE BTB5
USE BTB5

CREATE TABLE nha_cung_cap(
	ma_cung_cap INT PRIMARY KEY IDENTITY,
	ten_cung_cap VARCHAR(100) 
);

INSERT INTO nha_cung_cap VALUES ('vxt')
INSERT INTO nha_cung_cap VALUES ('lat')
INSERT INTO nha_cung_cap VALUES ('thh')
INSERT INTO nha_cung_cap VALUES ('adt')
INSERT INTO nha_cung_cap VALUES ('gtq')
INSERT INTO nha_cung_cap VALUES ('ntd')
INSERT INTO nha_cung_cap VALUES ('nqt')

CREATE TABLE hang_san_pham(
	ma_hang_san_pham INT PRIMARY KEY IDENTITY,
	ten_hang_san_pham VARCHAR(100) 
);

INSERT INTO hang_san_pham VALUES ('iron man')
INSERT INTO hang_san_pham VALUES ('hulk')
INSERT INTO hang_san_pham VALUES ('captain')
INSERT INTO hang_san_pham VALUES ('spider man')
INSERT INTO hang_san_pham VALUES ('thor')
INSERT INTO hang_san_pham VALUES ('batman')
INSERT INTO hang_san_pham VALUES ('gao')

CREATE TABLE loai_san_pham(
	ma_loai_san_pham INT PRIMARY KEY IDENTITY,
	ten_loai_san_pham VARCHAR(100) 
);

INSERT INTO loai_san_pham VALUES ('ronaldo')
INSERT INTO loai_san_pham VALUES ('rooney')
INSERT INTO loai_san_pham VALUES ('sancho')
INSERT INTO loai_san_pham VALUES ('neuer')
INSERT INTO loai_san_pham VALUES ('shaw')
INSERT INTO loai_san_pham VALUES ('degea')
INSERT INTO loai_san_pham VALUES ('lewandowski')

CREATE TABLE san_pham(
	ma_san_pham INT PRIMARY KEY IDENTITY,
	ten_san_pham VARCHAR(100),
	so_luong INT,
	gia INT,
	ma_cung_cap INT FOREIGN KEY REFERENCES nha_cung_cap (ma_cung_cap),
	ma_hang_san_pham INT FOREIGN KEY REFERENCES hang_san_pham(ma_hang_san_pham),
	ma_loai_san_pham INT FOREIGN KEY REFERENCES loai_san_pham(ma_loai_san_pham)
);

INSERT INTO san_pham VALUES ('quanao', 34, 5000, 1, 3, 4)
INSERT INTO san_pham VALUES ('giaydep', 36, 2000, 5, 4, 1)
INSERT INTO san_pham VALUES ('thatlung', 37, 1000, 2, 5, 2)
INSERT INTO san_pham VALUES ('mu', 39, 9000, 6, 1, 2)
INSERT INTO san_pham VALUES ('khan', 24, 6000, 2, 2, 7)
INSERT INTO san_pham VALUES ('vongtay', 14, 8000, 4, 7, 6)
INSERT INTO san_pham VALUES ('vongco', 54, 7000, 7, 2, 5)

CREATE TABLE khach_hang(
	ma_khach_hang INT PRIMARY KEY IDENTITY,
	ten_khach_hang VARCHAR(100),
	sdt INT,
	gioi_tinh VARCHAR(100),
	ngay_sinh DATE,
	dia_chi VARCHAR(100),
	email VARCHAR(100),
);

INSERT INTO khach_hang VALUES ('abc', 0123456789, 'nam','01-01-2002' , 'hanoi', 'faw@gmail.com')
INSERT INTO khach_hang VALUES ('xyz', 0145456789, 'nam','03-01-2002' , 'hanoi', 'daa@gmail.com')
INSERT INTO khach_hang VALUES ('htg', 0122456789, 'nu','02-01-2002' , 'hanoi', 'sae@gmail.com')
INSERT INTO khach_hang VALUES ('cbs', 0125456789, 'nu','04-01-2002' , 'hanoi', 'trd@gmail.com')
INSERT INTO khach_hang VALUES ('ths', 0123356789, 'nam','05-01-2002' , 'hanoi', 'dsfs@gmail.com')
INSERT INTO khach_hang VALUES ('hsa', 01123456789, 'nu','12-01-2002' , 'hanoi', 'dsds00110@gmail.com')
INSERT INTO khach_hang VALUES ('sya', 0115456789, 'nu','07-01-2002' , 'hanoi', 'jdf@gmail.com')


CREATE TABLE hoa_don(
	ma_hoa_don INT PRIMARY KEY IDENTITY,
	ma_khach_hang INT FOREIGN KEY REFERENCES khach_hang(ma_khach_hang),
	ngay_dat_hang DATE,
	trang_thai INT
);

INSERT INTO hoa_don VALUES (1,'07-01-2002' ,1 )
INSERT INTO hoa_don VALUES (2,'04-02-2002' ,2 )
INSERT INTO hoa_don VALUES (4,'01-01-2002' ,1 )
INSERT INTO hoa_don VALUES (5,'05-06-2002' ,2)
INSERT INTO hoa_don VALUES (2,'06-05-2002' ,1 )
INSERT INTO hoa_don VALUES (6,'04-03-2002' ,3 )
INSERT INTO hoa_don VALUES (3,'02-02-2002' ,2 )


CREATE TABLE hoa_don_chi_tiet(
	ma_hoa_don INT FOREIGN KEY REFERENCES hoa_don(ma_hoa_don),
	ma_san_pham INT FOREIGN KEY REFERENCES san_pham(ma_san_pham),
	so_luong_mua INT,
	gia INT,
);

INSERT INTO hoa_don_chi_tiet VALUES (1,1 ,12, 30000)
INSERT INTO hoa_don_chi_tiet VALUES (6,2 ,13, 10000)
INSERT INTO hoa_don_chi_tiet VALUES (7,4 ,19, 40000)
INSERT INTO hoa_don_chi_tiet VALUES (5,1,10, 16000)
INSERT INTO hoa_don_chi_tiet VALUES (4,2 ,11, 40000)
INSERT INTO hoa_don_chi_tiet VALUES (2,4 ,13, 30000)
INSERT INTO hoa_don_chi_tiet VALUES (3,7 ,12, 10000)

/*a,Nhập mỗi bảng 10 bản ghi*/
SELECT * FROM nha_cung_cap
SELECT * FROM hang_san_pham
SELECT * FROM loai_san_pham
SELECT * FROM san_pham
SELECT * FROM khach_hang
SELECT * FROM hoa_don
SELECT * FROM hoa_don_chi_tiet

/*b,Hiển thị thông tin các sản phẩm có giá trên 10tr*/
SELECT * FROM san_pham WHERE gia = 10000000 

/*c, Hiển thị thông tin sản phẩm gồm ma_san_pham, ten_san_pham, ma_nha_cung_cap, ten_nha_cung_cap, ma_hang_san_pham, ten_hang_san_pham, ma_loai_san_pham, ten_loai_san_pham*/
SELECT san_pham.ma_san_pham, san_pham.ten_san_pham, nha_cung_cap.ma_cung_cap, nha_cung_cap.ten_cung_cap, hang_san_pham.ma_hang_san_pham,
hang_san_pham.ten_hang_san_pham, hang_san_pham.ma_hang_san_pham, hang_san_pham.ten_hang_san_pham
FROM san_pham INNER JOIN nha_cung_cap ON san_pham.ma_cung_cap = nha_cung_cap.ma_cung_cap
INNER JOIN hang_san_pham ON san_pham.ma_hang_san_pham = hang_san_pham.ma_hang_san_pham
INNER JOIN loai_san_pham ON san_pham.ma_loai_san_pham = loai_san_pham.ma_loai_san_pham

/*d, Hiển thị thông tin hóa đơn gồm: ma_hoa_don, ten_khach_hang, sdt, ma_san_pham, ten_san_pham, so_luong_mua, gia, tong_tien*/
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
