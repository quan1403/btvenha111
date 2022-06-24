create database TicketFilm;
use TicketFilm;
create table tblPhong(
PhongId int primary key,
TenPhong varchar(50),
Status varchar(50));

create table tblPhim(
PhimId int primary key,
TenPhim varchar(50),
LoaiPhim varchar(50),
ThoiGian int);

create table tblGhe(
GheId int primary key,
PhongId int,
SoGhe varchar(50),
foreign key (PhongId) references tblPhong(PhongId));

create table tblVe(
PhimId int,
GheId int,
NgayChieu date,
Status varchar(50),
primary key(PhimId,GheId),
foreign key (PhimId)references tblPhim(PhimId),
foreign key(GheId)references tblGhe(GheId));

INSERT INTO `ticketfilm`.`tblphim` (`PhimId`, `TenPhim`, `LoaiPhim`, `ThoiGian`) VALUES ('1', 'Em bé Hà Nội', 'Tâm Lý', '90');
INSERT INTO `ticketfilm`.`tblphim` (`PhimId`, `TenPhim`, `LoaiPhim`, `ThoiGian`) VALUES ('2', 'Nhiệm vụ bất khả thi', 'Hành động', '100');
INSERT INTO `ticketfilm`.`tblphim` (`PhimId`, `TenPhim`, `LoaiPhim`, `ThoiGian`) VALUES ('3', 'Dị nhân', 'viễn tưởng', '90');
INSERT INTO `ticketfilm`.`tblphim` (`PhimId`, `TenPhim`, `LoaiPhim`, `ThoiGian`) VALUES ('4', 'Cuốn theo chiều gió', 'Tình cảm', '120');
INSERT INTO `ticketfilm`.`tblphong` (`PhongId`, `TenPhong`, `Status`) VALUES ('1', 'phòng chiếu 1', '1');
INSERT INTO `ticketfilm`.`tblphong` (`PhongId`, `TenPhong`, `Status`) VALUES ('2', 'phòng chiếu 2', '1');
INSERT INTO `ticketfilm`.`tblphong` (`PhongId`, `TenPhong`, `Status`) VALUES ('3', 'phòng chiếu 3', '0');
INSERT INTO `ticketfilm`.`tblghe` (`GheId`, `PhongId`, `SoGhe`) VALUES ('1', '1', 'A3');
INSERT INTO `ticketfilm`.`tblghe` (`GheId`, `PhongId`, `SoGhe`) VALUES ('2', '1', 'B5');
INSERT INTO `ticketfilm`.`tblghe` (`GheId`, `PhongId`, `SoGhe`) VALUES ('3', '2', 'A7');
INSERT INTO `ticketfilm`.`tblghe` (`GheId`, `PhongId`, `SoGhe`) VALUES ('4', '2', 'D1');
INSERT INTO `ticketfilm`.`tblghe` (`GheId`, `PhongId`, `SoGhe`) VALUES ('5', '3', 'T2');
INSERT INTO `ticketfilm`.`tblve` (`PhimId`, `GheId`, `NgayChieu`, `Status`) VALUES ('1', '1', '2008-12-20', 'đã bán');
INSERT INTO `ticketfilm`.`tblve` (`PhimId`, `GheId`, `NgayChieu`, `Status`) VALUES ('1', '3', '2008-11-20', 'đã bán');
INSERT INTO `ticketfilm`.`tblve` (`PhimId`, `GheId`, `NgayChieu`, `Status`) VALUES ('1', '4', '2008-12-23', 'đã bán');
INSERT INTO `ticketfilm`.`tblve` (`PhimId`, `GheId`, `NgayChieu`, `Status`) VALUES ('2', '1', '2009-2-14', 'đã bán');
INSERT INTO `ticketfilm`.`tblve` (`PhimId`, `GheId`, `NgayChieu`, `Status`) VALUES ('3', '1', '2009-2-14', 'đã bán');
INSERT INTO `ticketfilm`.`tblve` (`PhimId`, `GheId`, `NgayChieu`, `Status`) VALUES ('2', '5', '2009-3-8', 'chưa bán');
INSERT INTO `ticketfilm`.`tblve` (`PhimId`, `GheId`, `NgayChieu`, `Status`) VALUES ('2', '3', '2009-3-8', 'chưa bán');
-- câu 2:
select*from tblphim order by thoigian; 
-- câu 3:
select*from tblPhim where thoigian = (select max(thoigian)from tblPhim);
-- câu 4:
select*from tblPhim where thoigian = (select min(thoigian)from tblPhim);
-- câu 5:
select * from tblGhe where soghe like 'A%';
-- câu 6:
alter table tblPhong change column status status nvarchar(25);
-- câu 7:
update tblPhong set status = if(status =0,'Đang sửa',if(status =1 ,'Đang sửa chữa','Unknow')) where phongId >0;
-- câu 8:
select * from tblPhim where length(tblPhim.tenphim) between 15 and 25; 
-- câu 9:
select(concat(tblPhong.tenphong,tblPhong.status)) as 'trạng thái phòng chiếu' from tblPhong;
-- câu 10:
create table tblRank(
select tblphim.tenphim,tblphim.ThoiGian from tblphim order by tenphim);
-- câu 11:
alter table tblphim add column Mota nvarchar(255);
update tblphim set Mota = (concat('đây là bộ phim thể loại',loaiphim)) where phimid >0;
select * from tblphim;
update tblphim set Mota = (concat('đây là film thể loại',loaiphim)) where phimid >0;
select * from tblphim;
-- câu 12:
ALTER TABLE tblGhe
DROP foreign key tblghe_ibfk_1;
alter table tblve
drop foreign key tblve_ibfk_1;
alter table tblve
drop foreign key tblve_ibfk_2;
