CREATE TABLE farmer (
firstName varchar (50),
surName varchar (50), 
userName varchar (50) not null PRIMARY KEY ,
farmerPassword varchar (50)
);

CREATE TABLE EMPLOYEE (
userName varchar (50),
employeePassword varchar (50) 
);

insert into EMPLOYEE (userName, employeePassword)
VALUES ('admin', 'admin123')
 
CREATE PROCEDURE addFarmer (
@firstName varchar (50) , 
@surName varchar (50),
@userName varchar (50) ,
@farmerPassword varchar (50)
)
AS 
INSERT INTO farmer (firstName,surName,userName,farmerPassword) VALUES (@firstName, @surName, @userName, @farmerPassword)

CREATE TABLE STOCK (
userName varchar (50),
itemCatagory varchar (50),
itemName varchar (50),
itemDesc varchar (50),
itemQuantity int , 
itemImage image ,
FOREIGN KEY (userName) REFERENCES farmer(userName)
);

CREATE PROCEDURE addStock (
@userName varchar (50),
@itemCatagory varchar (50),
@itemName varchar (50),
@itemDesc varchar (50),
@itemQuantity int , 
@itemImage image 
)
AS INSERT STOCK (userName, itemCatagory,itemName,itemDesc,itemQuantity, itemImage) VALUES (@userName, @itemCatagory,@itemName,@itemDesc,@itemQuantity,@itemImage) 



DROP PROCEDURE addFarmer

drop procedure addStock

drop table STOCK
 drop table farmer