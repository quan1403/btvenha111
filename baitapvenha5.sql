create database quanlycuahang;
use quanlycuahang;
create table khachhang(
MaKh int primary key,
TenKh varchar(50),
Diachi varchar(50),
SDT int,
NgaySinh date,
NgayDK date,
DoanhSo float);
create table nhanvien(
MaNV int primary key,
TenNv varchar(50),
NgayvaoLam date,
Sdt int);
create table sanpham(
MaSp int primary key,
TenSp varchar(50),
Donvi int,
Gia float);
alter table sanpham add nuocsx varchar(50);
create table hoadon(
MaHD int primary key,
NgayMua date,
MaNv int,
MaKh int,
TongHd float,
foreign key (MaNv) references nhanvien(MaNv),
 foreign key (MaKh) references khachhang(MaKh));
 
 create table Cthd(
 MaHd int,
 MaSP int,
 SoLuong int,
 foreign key (MaHd) references hoadon(MaHd),
 foreign key (MaSp) references sanpham(MaSp),
 primary key (MaHd,MaSp));
 
 INSERT INTO `quanlycuahang`.`khachhang` (`MaKh`, `TenKh`, `Diachi`, `SDT`, `NgaySinh`, `NgayDK`, `DoanhSo`) VALUES ('1', 'Quan', 'Ha noi', '0369715949', '1998-3-14', '2022-6-26', '1');
INSERT INTO `quanlycuahang`.`khachhang` (`MaKh`, `TenKh`, `Diachi`, `SDT`, `NgaySinh`, `NgayDK`, `DoanhSo`) VALUES ('2', 'Duong', 'Ha noi', '0111111', '2001-12-25', '2022-6-25', '1');
INSERT INTO `quanlycuahang`.`khachhang` (`MaKh`, `TenKh`, `Diachi`, `SDT`, `NgaySinh`, `NgayDK`, `DoanhSo`) VALUES ('3', 'Viet', 'Thai Binh', '022222', '1997-1-1', '2022-5-5', '1');
INSERT INTO `quanlycuahang`.`khachhang` (`MaKh`, `TenKh`, `Diachi`, `SDT`, `NgaySinh`, `NgayDK`, `DoanhSo`) VALUES ('4', 'Tuan', 'Nam Dinh', '033333', '2000-1-1', '2022-1-4', '1');
INSERT INTO `quanlycuahang`.`nhanvien` (`MaNV`, `TenNv`, `NgayvaoLam`, `Sdt`) VALUES ('1', 'Tien anh', '2022-1-1', '0123');
INSERT INTO `quanlycuahang`.`nhanvien` (`MaNV`, `TenNv`, `NgayvaoLam`, `Sdt`) VALUES ('2', 'Duc', '2022-2-2', '02222');
INSERT INTO `quanlycuahang`.`sanpham` (`MaSp`, `TenSp`, `Donvi`, `Gia`, `nuocsx`) VALUES ('1', 'oppo', '10', '100000', 'trung quoc');
INSERT INTO `quanlycuahang`.`sanpham` (`MaSp`, `TenSp`, `Donvi`, `Gia`, `nuocsx`) VALUES ('2', 'ip ', '10', '200000', 'usa');
INSERT INTO `quanlycuahang`.`sanpham` (`MaSp`, `TenSp`, `Donvi`, `Gia`, `nuocsx`) VALUES ('3', 'nokia', '10', '50000', 'thai lan');
INSERT INTO `quanlycuahang`.`hoadon` (`MaHD`, `NgayMua`, `MaNv`, `MaKh`, `TongHd`) VALUES ('1', '2022-6-26', '1', '1', '0');
INSERT INTO `quanlycuahang`.`hoadon` (`MaHD`, `NgayMua`, `MaNv`, `MaKh`, `TongHd`) VALUES ('2', '2022-6-26', '2', '2', '0');
INSERT INTO `quanlycuahang`.`hoadon` (`MaHD`, `NgayMua`, `MaNv`, `MaKh`, `TongHd`) VALUES ('3', '2022-6-30', '2', '3', '0');
INSERT INTO `quanlycuahang`.`hoadon` (`MaHD`, `NgayMua`, `MaNv`, `MaKh`, `TongHd`) VALUES ('4', '2022-5-1', '1', '4', '0');
INSERT INTO `quanlycuahang`.`hoadon` (`MaHD`, `NgayMua`, `MaNv`, `MaKh`, `TongHd`) VALUES ('5', '2006-1-1', '1', '1', '0');
INSERT INTO `quanlycuahang`.`hoadon` (`MaHD`, `NgayMua`, `MaNv`, `MaKh`, `TongHd`) VALUES ('6', '2006-1-1', '2', '2', '0');
INSERT INTO `quanlycuahang`.`cthd` (`MaHd`, `MaSP`, `SoLuong`) VALUES ('1', '1', '1');
INSERT INTO `quanlycuahang`.`cthd` (`MaHd`, `MaSP`, `SoLuong`) VALUES ('2', '1', '2');
INSERT INTO `quanlycuahang`.`cthd` (`MaHd`, `MaSP`, `SoLuong`) VALUES ('3', '2', '2');
INSERT INTO `quanlycuahang`.`cthd` (`MaHd`, `MaSP`, `SoLuong`) VALUES ('4', '3', '1');
INSERT INTO `quanlycuahang`.`cthd` (`MaHd`, `MaSP`, `SoLuong`) VALUES ('4', '1', '1');
INSERT INTO `quanlycuahang`.`cthd` (`MaHd`, `MaSP`, `SoLuong`) VALUES ('5', '3', '1');
INSERT INTO `quanlycuahang`.`cthd` (`MaHd`, `MaSP`, `SoLuong`) VALUES ('6', '1', '2');


select  count(distinct ct.MaSp) as 'Số sp khác nhau'
from hoadon hd join cthd CT on hd.Mahd = CT. Mahd 
where year(hd.ngaymua) = 2006  ;

 select max(hoadon.tonghd) as 'max', min(hoadon.tonghd) as 'min'
from hoadon; 
 select avg(hoadon.tonghd) as 'trung binh hoa don 2006'
from hoadon
where year(hoadon.ngaymua) = 2006 ;
select sum(hoadon.tonghd) as 'tonghd 2006'
from hoadon
where year(hoadon.ngaymua) = 2006 ;
select max(hoadon.tonghd) as 'hd max 2006'
from hoadon
where year(ngaymua) = 2006; 

select KH.tenKh, max(HD.tonghd)
from khachhang KH join hoadon HD on KH.makh = hd.makh
where year(ngaymua) = 2006;

select KH.makh,KH.tenkh
from khachhang kh
order by kh.doanhso asc
limit 3;

select masp, tensp, gia
from sanpham
where gia >= (
select distinct gia from sanpham
order by gia asc
limit 2,1
);

select masp, tensp, gia
from sanpham
where nuocsx like 'thai lan' and gia >= (
select distinct gia from sanpham
order by gia asc
limit 2,1
);

select masp, tensp, gia
from sanpham
where nuocsx like 'trung quoc' and gia >= (
select distinct gia from sanpham
order by gia asc
limit 2,1
);

Select *, rank() over(order by doanhso asc) as 'doanh so cao nhat' from khachhang limit 3;

select count(masp) 'số sp do trung quoc sx' 
from sanpham
where nuocsx like 'trung quoc';

select nuocsx, count(masp) "số sp sx" 
from sanpham
group by nuocsx;

select nuocsx , min(gia) as 'gia sp min', max(gia) as 'gia sp max', avg(gia) as 'gia sp avg' 
from sanpham
group by nuocsx;

select ngaymua 'Ngày', sum(tonghd) as 'Doanh thu'
from hoadon
group by ngaymua
order by ngaymua;

select count(cthd.soluong) ' Số lượng bán ra'
from cthd join hoadon on hoadon.mahd = cthd.mahd
where month(ngaymua) = 10 and year(ngaymua) = 2006;

select month(ngaymua) as 'tháng', sum(tonghd) as 'doanh thu'
from hoadon
where year(ngaymua) = 2006
group by month(ngaymua)
order by month(ngaymua);

select hoadon.mahd , count(cthd.masp) as 'so sp'
from hoadon join cthd on cthd.mahd = hoadon.mahd
group by hoadon.mahd
having count(cthd.masp) = 3 ;

select hoadon.mahd , count(cthd.masp) as 'so sp'
from hoadon join cthd on cthd.mahd = hoadon.mahd join sanpham on sanpham.masp = cthd.masp
where sanpham.nuocsx = 'việt nam'
group by hoadon.mahd
having count(cthd.masp) = 3 ;

select khachhang.makh, khachhang.tenkh,count(hoadon.mahd)
from khachhang join hoadon on hoadon.makh = khachhang.makh
group by khachhang.makh
having count(hoadon.mahd) = (
select count(mahd)
from hoadon
group by makh
order by count(mahd) asc
limit 1
);

select month(ngaymua) as 'tháng', sum(tonghd) as 'doanh thu'
from hoadon
where year(ngaymua) = 2006
group by month(ngaymua)
having sum(tonghd) = (
select sum(tonghd)
from hoadon
where year(ngaymua) = 2006
group by month(ngaymua)
order by sum(tonghd) asc
limit 1);

select sanpham.masp, sanpham.tensp, count(cthd.soluong) as 'số lượng bán ra'
from sanpham join cthd on cthd.masp = sanpham.masp join hoadon on hoadon.mahd = cthd.mahd 
where year(hoadon.ngaymua) = 2006
group by sanpham.masp
having count(cthd.soluong) = (
select count(cthd.soluong)
from cthd
group by masp
order by count(cthd.soluong)
limit 1
);






