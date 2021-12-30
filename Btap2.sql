CREATE DATABASE BT2
USE BT2

CREATE TABLE nien_khoa(
	ma_nien_khoa INT PRIMARY KEY,
	ten_nien_khoa VARCHAR(100)
)

CREATE TABLE nganh_hoc(
	ma_nganh_hoc INT,
	ten_nganh_hoc VARCHAR(100)
)
DROP TABLE nganh_hoc
CREATE TABLE lop(
	ma_lop INT PRIMARY KEY,
	ten_lop VARCHAR(100),
	so_luong_sv INT,
	ma_nganh_hoc INT,
	ma_nien_khoa INT
	
)
DROP TABLE lop
/* insert moi bang 10 ban ghi */
INSERT INTO nien_khoa VALUES (1,'Khoa 1')
INSERT INTO nien_khoa VALUES (2,'Khoa 1')
INSERT INTO nien_khoa VALUES (3,'Khoa 3')
INSERT INTO nien_khoa VALUES (4,'Khoa 4')
INSERT INTO nien_khoa VALUES (5,'Khoa 5')
INSERT INTO nien_khoa VALUES (6,'Khoa 6')
INSERT INTO nien_khoa VALUES (7,'Khoa 7')
INSERT INTO nien_khoa VALUES (8,'Khoa 8')
INSERT INTO nien_khoa VALUES (9,'Khoa 9')
INSERT INTO nien_khoa VALUES (10,'Khoa 10')
SELECT * FROM nien_khoa
UPDATE nien_khoa SET ten_nien_khoa = 'Khoa 2' WHERE ma_nien_khoa = 2
/*ma nganh hoc = 1 */
INSERT INTO nganh_hoc VALUES (1,'CNTT')
INSERT INTO nganh_hoc VALUES (1,'KT')
INSERT INTO nganh_hoc VALUES (1,'Y')
INSERT INTO nganh_hoc VALUES (1,'NN')
INSERT INTO nganh_hoc VALUES (1,'HH')
INSERT INTO nganh_hoc VALUES (1,'KL')
INSERT INTO nganh_hoc VALUES (1,'TL')
INSERT INTO nganh_hoc VALUES (1,'BD')
INSERT INTO nganh_hoc VALUES (1,'AT')
INSERT INTO nganh_hoc VALUES (1,'AN')
SELECT * FROM nganh_hoc
INSERT INTO lop VALUES (1, 'Lop 1', 20, 1,1)
INSERT INTO lop VALUES (2, 'Lop 2', 32, 1,1)
INSERT INTO lop VALUES (3, 'Lop 3', 45, 8,1)
INSERT INTO lop VALUES (4, 'Lop 4', 13, 4,5)
INSERT INTO lop VALUES (5, 'Lop 5', 24, 1,1)
INSERT INTO lop VALUES (6, 'Lop 6', 34, 6,3)
INSERT INTO lop VALUES (7, 'Lop 7', 65, 7,8)
INSERT INTO lop VALUES (8, 'Lop 8', 74, 1,4)
INSERT INTO lop VALUES (9, 'Lop 9', 5, 2,9)
INSERT INTO lop VALUES (10, 'Lop 10', 74, 3,9)
SELECT * FROM lop
/*sl sv >30*/
SELECT *FROM lop WHERE so_luong_sv >30

