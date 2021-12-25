CREATE DATABASE THUCTAP
USE THUCTAP

CREATE TABLE KHOA(
	ma_khoa char(10),
	ten_khoa char(30),
	dien_thoai char(10)
	);
CREATE TABLE GiangVien(
	ma_gv int,
	ho_ten_gv char(30),
	luong float,
	ma_khoa char(10)
	);
CREATE TABLE SinhVien(
	ma_sv int,
	 hotensv char(30), 
	 ma_khoa char(10), 
	 nam_sinh int, 
	 que_quan char(30)
);
CREATE TABLE DeTai (
	ma_dt char(10), 
	ten_dt char(30), 
	kinh_phi int, 
	Noi_Thuc_Tap char(30)
);
CREATE TABLE HuongDan(
	ma_sv int, 
	ma_dt char(10), 
	ma_gv int, 
	ket_qua float
);
/* IN RA TT */
INSERT INTO KHOA VALUES (111,'DIA LY','0123456789')
INSERT INTO KHOA VALUES (112,'QLTN','0123456788')
INSERT INTO KHOA VALUES (113,'KHOA HOC 3','0123456787')
SELECT * FROM KHOA
/*DELETE FROM KHOA */
INSERT INTO GiangVien VALUES(222,'GIANG VIEN A',100,1)
INSERT INTO GiangVien VALUES(322,'GIANG VIEN B',101,1)
INSERT INTO GiangVien VALUES(223,'GIANG VIEN C',150,1)
SELECT * FROM GiangVien
INSERT INTO SinhVien VALUES(44,'SV A',1,2002,'HA NOI')
INSERT INTO SinhVien VALUES(34,'SV R',1,2002,'HA NOI')
INSERT INTO SinhVien VALUES(64,'SV S',1,2002,'HA NOI')
SELECT * FROM SinhVien
INSERT INTO DeTai VALUES(3,'DE TAI 2',240,'HA NOI')
INSERT INTO DeTai VALUES(4,'DE TAI 4',620,'HA NOI')
INSERT INTO DeTai VALUES(1,'DE TAI 6',20,'HA NOI')
SELECT * FROM DeTai
INSERT INTO HuongDan VALUES(1,'MA DE 01',2,5.0)
INSERT INTO HuongDan VALUES(4,'MA DE 05',3,7.0)
INSERT INTO HuongDan VALUES(3,'MA DE 09',8,3.0)
SELECT * FROM HuongDan

SELECT ma_gv,ho_ten_gv ,ma_khoa FROM GiangVien
/* ĐƯA RA TT VỀ MÃ SỐ,TÊN,MÃ KHOA CỦA TẤT CẢ GIẢNG VIÊN KHOA 'DIA LY' VA 'QLTP' */
SELECT ma_gv,ho_ten_gv,ma_khoa FROM GiangVien WHERE ma_khoa = 'DIA LY' OR ma_khoa = 'QLTN'
/* ĐƯA RA TT SV CÓ KẾT QUẢ TỪ 5 ĐẾN 8 */
SELECT *FROM HuongDan WHERE ket_qua >= 5 AND ket_qua <=8