CREATE DATABASE QLTT
USE QLTT

CREATE TABLE khoa(
	makhoa VARCHAR(10),
	tenkhoa VARCHAR(30),
	dienthoai VARCHAR(10)
)

CREATE TABLE giangvien(
	magv INT,
	hotengv VARCHAR(30),
	luong FLOAT,
	makhoa VARCHAR(10)
)

CREATE TABLE sinhvien(
	masv INT,
	hotensv VARCHAR(30),
	makhoa VARCHAR(10),
	namsinh INT,
	quequan VARCHAR(30)
)

CREATE TABLE DeTai(
	madt VARCHAR(10),
	tendt VARCHAR(30),
	kinhphi INT,
	noithuctap VARCHAR(30)
)

CREATE TABLE HuongDan(
	masv INT,
	madt VARCHAR(10),
	magv INT,
	ketqua FLOAT
)

/* a, insert moi bang 10 ban ghi */
INSERT INTO khoa VALUES ('1', 'CNTT', '0123456789')
INSERT INTO khoa VALUES ('2', 'VLKT', '0123456788')
INSERT INTO khoa VALUES ('3', 'CNTP', '0123456787')
INSERT INTO khoa VALUES ('4', 'TT', '0123456786')
INSERT INTO khoa VALUES ('5', 'KT', '0123456785')
INSERT INTO khoa VALUES ('6', 'NN', '0123456784')
INSERT INTO khoa VALUES ('7', 'HH', '0123456789')
INSERT INTO khoa VALUES ('8', 'GDTC', '0123456789')
INSERT INTO khoa VALUES ('9', 'GDQP', '0123456789')
INSERT INTO khoa VALUES ('10', 'CNDM', '0123456789')

INSERT INTO giangvien VALUES (1, 'gva', 500, 1)
INSERT INTO giangvien VALUES (2, 'gvb', 501, 1)
INSERT INTO giangvien VALUES (3, 'gvc', 300, 6)
INSERT INTO giangvien VALUES (4, 'gvd', 400, 3)
INSERT INTO giangvien VALUES (5, 'gve', 230, 9)
INSERT INTO giangvien VALUES (6, 'gvf', 500, 10)
INSERT INTO giangvien VALUES (7, 'gvg', 510, 2)
INSERT INTO giangvien VALUES (8, 'gvh', 400, 5)
INSERT INTO giangvien VALUES (9, 'gvi', 700, 4)
INSERT INTO giangvien VALUES (10, 'gva', 530, 7)

INSERT INTO sinhvien VALUES (1, 'sva', 1, 1999, 'hn')
INSERT INTO sinhvien VALUES (2, 'svb', 1, 2000, 'hp')
INSERT INTO sinhvien VALUES (3, 'svc', 6, 2000, 'hn')
INSERT INTO sinhvien VALUES (4, 'svd', 3, 2002, 'hn')
INSERT INTO sinhvien VALUES (5, 'sve', 9, 2003, 'hp')
INSERT INTO sinhvien VALUES (6, 'svf', 10, 2001, 'hp')
INSERT INTO sinhvien VALUES (7, 'svg', 2, 2000, 'hp')
INSERT INTO sinhvien VALUES (8, 'svh', 5, 2003, 'hn')
INSERT INTO sinhvien VALUES (9, 'svi', 4, 2002, 'hp')
INSERT INTO sinhvien VALUES (10, 'sva', 7, 2003, 'hn')

INSERT INTO DeTai VALUES (1, 'de tai 1', 100, 'cty a')
INSERT INTO DeTai VALUES (2, 'de tai 2', 150, 'cty a')
INSERT INTO DeTai VALUES (3, 'de tai 3', 130, 'cty b')
INSERT INTO DeTai VALUES (4, 'de tai 4', 200, 'cty c')
INSERT INTO DeTai VALUES (5, 'de tai 5', 100, 'cty d')
INSERT INTO DeTai VALUES (6, 'de tai 6', 120, 'cty e')
INSERT INTO DeTai VALUES (7, 'de tai 7', 210, 'cty f')
INSERT INTO DeTai VALUES (8, 'de tai 8', 200, 'cty c')
INSERT INTO DeTai VALUES (9, 'de tai 9', 100, 'cty h')
INSERT INTO DeTai VALUES (10, 'de tai 10', 300, 'cty b')

INSERT INTO HuongDan VALUES (1,1,1,5.5)
INSERT INTO HuongDan VALUES (2,1,1,6.5)
INSERT INTO HuongDan VALUES (3,3,10,5.5)
INSERT INTO HuongDan VALUES (4,4,6,5.5)
INSERT INTO HuongDan VALUES (5,5,5,5.5)
INSERT INTO HuongDan VALUES (6,6,8,5.5)
INSERT INTO HuongDan VALUES (7,7,4,5.5)
INSERT INTO HuongDan VALUES (8,8,3,5.5)
INSERT INTO HuongDan VALUES (9,9,4,5.5)
INSERT INTO HuongDan VALUES (10,10,2,5.5)

/* b, ????a ra th??ng tin g???m m?? s???, h??? t??n v?? m?? khoa c???a t???t c??? c??c gi???ng vi??n */
SELECT magv,hotengv,makhoa FROM giangvien

/* c, ????a ra th??ng tin g???m m?? s???, h??? t??n v?? m?? khoa c???a c??c gi???ng vi??n c???a khoa 1 va 5 */
SELECT magv,hotengv,makhoa FROM giangvien WHERE makhoa = 1 OR makhoa = 5

/* d, ????a ra th??ng tin c???a sinh vi??n c?? k???t qu??? t??? 5 ?????n 8 */
SELECT * FROM HuongDan WHERE ketqua >= 5 AND ketqua <= 8
