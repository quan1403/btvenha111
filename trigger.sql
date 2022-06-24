create database quanlysanpham;
Create table product(
    codeP int primary key,
    nameP varchar(255),
    priceP double
);
create table orders(
    codeO int primary key,
    dateO date,
    totalMoney double
);
create table OrderDetail(
	codeP int ,
	codeO int,
	soluong int ,
    primary key(codeP,codeO),
    foreign key (codeP) references product(codeP),
	foreign key (codeO) references orders(codeO)
);
INSERT INTO `quanlysanpham`.`product` (`codeP`, `nameP`, `priceP`) VALUES ('1', 'banh mi', '8.2');
INSERT INTO `quanlysanpham`.`product` (`codeP`, `nameP`, `priceP`) VALUES ('2', 'bim bim', '5.2');
INSERT INTO `quanlysanpham`.`product` (`codeP`, `nameP`, `priceP`) VALUES ('3', 'mi tom', '9.2');
INSERT INTO `quanlysanpham`.`product` (`codeP`, `nameP`, `priceP`) VALUES ('4', 'nuoc hoa', '7.2');

delimiter $$
create trigger aaa
after insert on OrderDetail
for each row
begin
update orders
set totalMoney = totalMoney + (new.soluong + (select priceP from product where codeP = new.codeP))where codeO = new.codeO;
end
$$

