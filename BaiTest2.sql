CREATE DATABASE BT2
USE BT2

CREATE TABLE nha_cung_cap(
	ma_nha_cung_cap INT PRIMARY KEY IDENTITY,
	ten_nha_cung_cap VARCHAR(100)
);

CREATE TABLE hang_san_pham(
	ma_hang_san_pham INT PRIMARY KEY IDENTITY,
	ten_hang_san_pham VARCHAR(100)
);

CREATE TABLE loai_san_pham(
	ma_loai_san_pham INT PRIMARY KEY IDENTITY,
	ten_loai_san_pham VARCHAR(100)
);

CREATE TABLE san_pham(
	ma_san_pham INT PRIMARY KEY IDENTITY,
	ten_san_pham VARCHAR(255),
	so_luong INT,
	gia FLOAT,
	ma_nha_cung_cap INT FOREIGN KEY REFERENCES nha_cung_cap(ma_nha_cung_cap),
	ma_hang_san_pham INT FOREIGN KEY REFERENCES hang_san_pham(ma_hang_san_pham),
	ma_loai_san_pham INT FOREIGN KEY REFERENCES loai_san_pham(ma_loai_san_pham)
);

CREATE TABLE khach_hang(
	ma_khach_hang INT PRIMARY KEY IDENTITY,
	ten_khach_hang VARCHAR(50),
	so_dien_thoai VARCHAR(10),
	gioi_tinh BIT,
	ngay_sinh DATE,
	dia_chi VARCHAR(255),
	email VARCHAR(255),
);

CREATE TABLE hoa_don(
	ma_hoa_don INT PRIMARY KEY IDENTITY,
	ma_khach_hang INT FOREIGN KEY REFERENCES khach_hang(ma_khach_hang),
	ngay_dat_hang DATE,
	trang_thai INT
);
SELECT * FROM hoa_don
CREATE TABLE hoa_don_chi_tiet (
	ma_hoa_don INT,
	ma_san_pham INT,
	PRIMARY KEY(ma_hoa_don,ma_san_pham),
	FOREIGN KEY (ma_hoa_don) REFERENCES hoa_don(ma_hoa_don),
	FOREIGN KEY (ma_san_pham) REFERENCES san_pham(ma_san_pham),
	so_luong_mua INT,
	gia_ban FLOAT
);
INSERT INTO nha_cung_cap VALUES ('APPLE')
INSERT INTO nha_cung_cap VALUES ('SAMSUNG')
INSERT INTO nha_cung_cap VALUES ('OPPO')
INSERT INTO nha_cung_cap VALUES ('VIVO')
INSERT INTO nha_cung_cap VALUES ('BLACKBERRY')
INSERT INTO nha_cung_cap VALUES ('LG')

INSERT INTO hang_san_pham VALUES ('APPLE')
INSERT INTO hang_san_pham VALUES ('SAMSUNG')
INSERT INTO hang_san_pham VALUES ('OPPO')
INSERT INTO hang_san_pham VALUES ('VIVO')
INSERT INTO hang_san_pham VALUES ('BLACKBERRY')
INSERT INTO hang_san_pham VALUES ('LG')

INSERT INTO loai_san_pham VALUES ('Dien thoai')
INSERT INTO loai_san_pham VALUES ('May tinh bang')
INSERT INTO loai_san_pham VALUES ('Laptop')
INSERT INTO loai_san_pham VALUES ('May anh')
INSERT INTO loai_san_pham VALUES ('Camera')
INSERT INTO loai_san_pham VALUES ('Phu kien')

INSERT INTO san_pham VALUES ('iphone 13', 20, 30000000, 1, 1, 1)
INSERT INTO san_pham VALUES ('Z fold 3', 20, 44000000, 2, 2, 1)
INSERT INTO san_pham VALUES ('Z filp 3', 30, 25000000, 2, 2, 1)
INSERT INTO san_pham VALUES ('Macbook', 10, 35000000, 1, 1, 2)
INSERT INTO san_pham VALUES ('OPPO A95', 50, 7000000 , 3, 3, 1)
INSERT INTO san_pham VALUES ('VIVO V23e', 40, 8500000, 4, 4, 1)

INSERT INTO khach_hang VALUES ('Nguyen Van A', '0123456789', 1, '1992-02-02', 'hn', 'a@gmail.com')
INSERT INTO khach_hang VALUES ('Tran Van B', '0123456788', 1, '1995-02-07', 'hn', 'b@gmail.com')
INSERT INTO khach_hang VALUES ('Pham Van C', '0123456787', 1, '1994-01-01', 'hp', 'c@gmail.com')
INSERT INTO khach_hang VALUES ('Nguyen Thi D', '0123456786', 0, '1993-03-03', 'hn', 'd@gmail.com')
INSERT INTO khach_hang VALUES ('Pham Thi E', '0123456785', 0, '1995-05-05', 'hp', 'e@gmail.com')
INSERT INTO khach_hang VALUES ('Trinh Thi F', '0123456784', 0, '1991-06-07', 'hn', 'f@gmail.com')
SELECT * FROM hoa_don_chi_tiet
INSERT INTO hoa_don VALUES (1, '2021-05-20', 2)
INSERT INTO hoa_don VALUES (2, '2021-08-20', 2)
INSERT INTO hoa_don VALUES (3, '2021-07-25', 2)
INSERT INTO hoa_don VALUES (1, '2021-12-31', 1)
INSERT INTO hoa_don VALUES (1, '2021-12-20', 1)
INSERT INTO hoa_don VALUES (2, '2022-01-05', 0)

INSERT INTO hoa_don_chi_tiet VALUES (1, 1, 10, 30000000)
INSERT INTO hoa_don_chi_tiet VALUES (1, 2, 5, 43000000)
INSERT INTO hoa_don_chi_tiet VALUES (1, 3, 7, 25000000)
INSERT INTO hoa_don_chi_tiet VALUES (2, 1, 20, 31000000)
INSERT INTO hoa_don_chi_tiet VALUES (3, 4, 8, 35000000)
INSERT INTO hoa_don_chi_tiet VALUES (6, 6, 20, 8000000)
/*j, in ra m?? s???n ph???m,t??n sp,gi?? c???a c??c sp c?? gi?? tr??? tr??n 10tr b???ng 1 view
k,in ra m?? sp,t??n sp,m?? ncc,t??n ncc,m?? hsp,t??n hsp,m?? lsp,t??n lsp b???ng view
*/

CREATE VIEW view_san_pham 
AS SELECT ma_san_pham,ten_san_pham,gia FROM san_pham WHERE gia >= 10000000
DROP VIEW view_san_pham
SELECT * FROM view_san_pham 
USE BT2
CREATE VIEW view_cai_can_view AS SELECT san_pham.ma_san_pham,san_pham.ten_san_pham,nha_cung_cap.ten_nha_cung_cap,nha_cung_cap.ma_nha_cung_cap,
hang_san_pham.ma_hang_san_pham,hang_san_pham.ten_hang_san_pham,loai_san_pham.ma_loai_san_pham,loai_san_pham.ten_loai_san_pham
FROM san_pham 
INNER JOIN nha_cung_cap ON nha_cung_cap.ma_nha_cung_cap = san_pham.ma_nha_cung_cap
INNER JOIN hang_san_pham ON hang_san_pham.ma_hang_san_pham = san_pham.ma_hang_san_pham
INNER JOIN loai_san_pham ON loai_san_pham.ma_loai_san_pham = san_pham.ma_loai_san_pham
DROP VIEW view_cai_can_view
SELECT * FROM view_cai_can_view

/* hi???n th??? h??a ????n g???m m?? hd,t??n kh,sdt,ma sp,t??n sp,sl mua ,gia,tong ti???n b???ng view
in ra ma sp,t??n sp,m?? hsp,t??n hsp,gi?? b??n,t???ng ti???n ???? b??n sp b???ng view */

CREATE VIEW view_hoa_don AS SELECT hoa_don.ma_hoa_don,khach_hang.ten_khach_hang,
khach_hang.so_dien_thoai,san_pham.ma_san_pham,san_pham.ten_san_pham,hoa_don_chi_tiet.so_luong_mua,hoa_don_chi_tiet.gia_ban
AS 'TONG TIEN' FROM hoa_don
INNER JOIN khach_hang ON khach_hang.ma_khach_hang = hoa_don.ma_khach_hang
INNER JOIN hoa_don_chi_tiet ON hoa_don.ma_hoa_don = hoa_don_chi_tiet.ma_hoa_don
INNER JOIN san_pham ON hoa_don_chi_tiet.ma_san_pham = san_pham.ma_san_pham

SELECT * FROM view_hoa_don

CREATE VIEW view_san_pham_da_ban AS SELECT san_pham.ma_san_pham,san_pham.ten_san_pham,hang_san_pham.ma_hang_san_pham,
hang_san_pham.ten_hang_san_pham,hoa_don_chi_tiet.gia_ban AS 'TONG TIEN BAN SAN PHAM'
FROM san_pham
INNER JOIN hang_san_pham ON hang_san_pham.ma_hang_san_pham = san_pham.ma_hang_san_pham
INNER JOIN hoa_don_chi_tiet ON hoa_don_chi_tiet.ma_san_pham = san_pham.ma_san_pham

SELECT * FROM view_san_pham_da_ban

/* t???o v?? s??? d???ng stored procedure 
+ hi???n th??? th??ng tin c??c kh??ch h??ng c?? t???ng ti???n h??a ????n >= 10tr
+ hi???n th??? ttin c??c sp v?? sl ???? b??n c???a c??c sp ????
+hi???n th??? ttin kh??ch h??ng mua nhi???u sp nh???t 
*/
/*  hi???n th??? th??ng tin c??c kh??ch h??ng c?? t???ng ti???n h??a ????n >= 10tr */
CREATE PROCEDURE hoa_don_10tr AS
BEGIN
	SELECT * FROM hoa_don_chi_tiet INNER JOIN hoa_don ON hoa_don.ma_hoa_don = hoa_don_chi_tiet.ma_hoa_don
	WHERE gia_ban  >= 10000000
END

EXECUTE hoa_don_10tr
DROP PROCEDURE hoa_don_10tr 

/* hi???n th??? ttin c??c sp v?? sl ???? b??n c???a c??c sp ???? */
 
CREATE PROCEDURE san_pham_da_ban_ra AS 
BEGIN
	SELECT san_pham.ten_san_pham,san_pham.ma_san_pham,hoa_don_chi_tiet.so_luong_mua FROM san_pham 
	INNER JOIN hoa_don_chi_tiet ON san_pham.ma_san_pham = hoa_don_chi_tiet.ma_san_pham
END

EXEC san_pham_da_ban_ra
DROP PROCEDURE san_pham_da_ban_ra
/* hi???n th??? ttin kh??ch h??ng mua nhi???u sp nh???t  */

CREATE PROCEDURE max_sp AS
BEGIN
	SELECT khach_hang.ten_khach_hang,khach_hang.ma_khach_hang,hoa_don.ngay_dat_hang,hoa_don_chi_tiet.so_luong_mua
	FROM khach_hang
	INNER JOIN hoa_don ON khach_hang.ma_khach_hang = hoa_don.ma_khach_hang
	INNER JOIN hoa_don_chi_tiet ON hoa_don.ma_hoa_don = hoa_don_chi_tiet.ma_hoa_don
END

EXECUTE max_sp

DROP PROCEDURE max_sp

CREATE TRIGGER trigger_sp 
ON hoa_don 
AFTER INSERT 
AS
BEGIN
SELECT hoa_don.ma_hoa_don,hoa_don.ma_khach_hang,hoa_don.ngay_dat_hang,khach_hang.ten_khach_hang FROM hoa_don
INNER JOIN khach_hang ON hoa_don.ma_khach_hang = khach_hang.ma_khach_hang
END

INSERT INTO hoa_don VALUES (2, '2032-01-20', 0)
USE BT2
CREATE TRIGGER trigger_sanpham
ON san_pham
AFTER INSERT
AS
BEGIN
	SELECT * FROM san_pham
END

INSERT INTO san_pham VALUES ('12PRO MAX', 30, 44000000, 2, 5, 1)

CREATE TRIGGER trigger_delete_sp
ON san_pham
AFTER DELETE
AS
BEGIN
	SELECT * FROM san_pham
END

DELETE FROM san_pham WHERE ma_san_pham >= 7

DROP TRIGGER trigger_delete_sp

/* instead of trigger */ 
SELECT * FROM san_pham
SELECT * FROM hoa_don_chi_tiet
CREATE TRIGGER INSTEAD_OF_DELETE_SP
ON san_pham
INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM hoa_don_chi_tiet WHERE ma_san_pham = 3
END
/* THAY VI XOA MA SP TREN SP THI NO XOA MA SP TREN HOA DON CHI TIET */
DELETE FROM san_pham WHERE ma_san_pham = 3

DROP TRIGGER INSTEAD_OF_DELETE_SP

/* Vi???t 1 after trigger th???c thi c??ng vi???c: 
Sau khi insert 1 b???n ghi tr??n b???ng h??a ????n th?? 
s??? hi???n th??? th??ng tin c???a t???t c??? c??c h??a ????n bao g???m: 
m?? h??a ????n, m?? kh??ch h??ng, t??n kh??ch h??ng, ng??y ?????t h??ng */

CREATE TRIGGER TRIGGER_HOA_DON
ON hoa_don
AFTER INSERT
AS
BEGIN
	SELECT hoa_don.ma_hoa_don,khach_hang.ma_khach_hang,
	khach_hang.ten_khach_hang,hoa_don.ngay_dat_hang 
	FROM hoa_don INNER JOIN khach_hang 
	ON hoa_don.ma_khach_hang = khach_hang.ma_khach_hang
END
/* INSERTED v?? DELETED
INSERTED LA 1 BANG AO TREN DTB LUU TTIN CAC BAN GHI MA MINH DANG INSERT VAO 1 BANG NAO DO
DELETED DE LUU BAN GHI BI MAT*/
/* insert -> inserted -> b???ng */
/* update -> deleted -> inserted -> b???ng */
/* Vi???t 1 trigger sau khi th??m 1 nh?? cung c???p th?? s??? t??? ?????ng th??m 1
s???n ph???m v??o b???ng s???n ph???m v???i m?? nh?? cung c???p v???a ???????c th??m v??o */

SELECT * FROM nha_cung_cap
SELECT * FROM san_pham

CREATE TRIGGER trigger_inserted ON nha_cung_cap
AFTER INSERT 
AS
BEGIN
	INSERT INTO san_pham VALUES ('Samsung S22', 40, 35000000, 
	(SELECT TOP 1 ma_nha_cung_cap FROM nha_cung_cap ORDER BY ma_nha_cung_cap DESC), 4, 1);
END

INSERT INTO nha_cung_cap VALUES ('SAMSUNG')

DROP TRIGGER trigger_inserted

CREATE TRIGGER trigger_deleted ON nha_cung_cap
INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM hoa_don_chi_tiet WHERE ma_san_pham IN (SELECT ma_san_pham FROM san_pham WHERE ma_nha_cung_cap IN (SELECT ma_nha_cung_cap FROM nha_cung_cap WHERE ma_nha_cung_cap IN (SELECT ma_nha_cung_cap FROM deleted)));
	DELETE FROM san_pham WHERE ma_nha_cung_cap IN (SELECT ma_nha_cung_cap FROM nha_cung_cap WHERE ma_nha_cung_cap IN (SELECT ma_nha_cung_cap FROM deleted));
	DELETE FROM nha_cung_cap WHERE ma_nha_cung_cap IN (SELECT ma_nha_cung_cap FROM deleted);
END

/* FUCTION DEMO
tra ve gia tri cua 1 bo tai 1 thuoc tinh nao do*/

CREATE FUNCTION FUNCTION_DEMO (@gia INT )
RETURNS VARCHAR (100)
AS
BEGIN
	RETURN ( SELECT TOP 1 ten_san_pham FROM san_pham 
	WHERE gia = @gia ORDER BY ten_san_pham DESC )
END
SELECT * FROM san_pham
PRINT dbo.FUNCTION_DEMO (7000000)

SELECT dbo.FUNCTION_DEMO (7000000)
DROP FUNCTION FUNCTION_DEMO
/* function INLINIE TABLE */
CREATE FUNCTION FUNCTION_INLINE_TABLE (@gia INT )
RETURNS TABLE 
AS
RETURN (SELECT hoa_don.ma_hoa_don,khach_hang.ma_khach_hang,
	khach_hang.ten_khach_hang,hoa_don.ngay_dat_hang 
	FROM hoa_don 
	INNER JOIN khach_hang 
	ON hoa_don.ma_khach_hang = khach_hang.ma_khach_hang);

SELECT * FROM FUNCTION_INLINE_TABLE (7000000)

DROP FUNCTION FUNCTION_INLINE_TABLE

/* DECLARE KHAI BAO BIEN ,BOI DEN CA 3 COT*/
DECLARE @gia INT ;
SET @gia = 7000000;
SELECT * FROM san_pham WHERE gia = @gia

CREATE TRIGGER trigger_deleted_1 ON nha_cung_cap
INSTEAD OF DELETE
AS
BEGIN
	
	DELETE FROM hoa_don_chi_tiet WHERE ma_san_pham IN (SELECT ma_san_pham FROM san_pham WHERE ma_nha_cung_cap IN (SELECT ma_nha_cung_cap FROM nha_cung_cap WHERE ma_nha_cung_cap IN (SELECT ma_nha_cung_cap FROM deleted)));
	DELETE FROM san_pham WHERE ma_nha_cung_cap IN (SELECT ma_nha_cung_cap FROM nha_cung_cap WHERE ma_nha_cung_cap IN (SELECT ma_nha_cung_cap FROM deleted));
	DELETE FROM nha_cung_cap WHERE ma_nha_cung_cap IN (SELECT ma_nha_cung_cap FROM deleted);
END

/* T???O FUNCTION
1. HI???N TH??? TH??NG TIN SP C?? GI?? >= N (N T??? CH???N KHI VI???T C??U L???NH FUNCTION )
2. HI???N TH??? TTIN C??C KH V?? H??A ????N ???? MUA 
3.HI???N TH??? TTIN C??C SP V?? H??A ????N CUA SP ????
4.HI???N TH??? TTIN C??C KH C?? T???NG TI???N C???A C??C H?? L???N NH???T 
*/
/* 1. HI???N TH??? TH??NG TIN SP C?? GI?? >= N (N T??? CH???N KHI VI???T C??U L???NH FUNCTION ) */
CREATE FUNCTION gia_function (@gia INT )
RETURNS TABLE 
AS
RETURN 
(SELECT san_pham.ten_san_pham,san_pham.ma_san_pham,
san_pham.so_luong,hoa_don_chi_tiet.gia_ban
FROM san_pham INNER JOIN hoa_don_chi_tiet 
ON san_pham.ma_san_pham = hoa_don_chi_tiet.ma_san_pham);

DECLARE @gia INT ;
SET @gia = 3000000;
SELECT * FROM san_pham WHERE gia >= @gia

DROP FUNCTION gia_function

CREATE FUNCTION khach_hang_function (@trang_thai INT )
RETURNS TABLE
AS
RETURN
(SELECT khach_hang.ten_khach_hang,khach_hang.ma_khach_hang,khach_hang.so_dien_thoai,hoa_don.ngay_dat_hang,hoa_don.trang_thai 
FROM khach_hang INNER JOIN hoa_don ON khach_hang.ma_khach_hang = hoa_don.ma_khach_hang);

SELECT * FROM khach_hang_function (1)


SELECT san_pham.ten_san_pham,san_pham.ma_san_pham,san_pham.ma_loai_san_pham,hoa_don_chi_tiet.ma_hoa_don,hoa_don_chi_tiet.so_luong_mua,hoa_don_chi_tiet.gia_ban 
FROM san_pham INNER JOIN hoa_don_chi_tiet ON san_pham.ma_san_pham = hoa_don_chi_tiet.ma_san_pham
