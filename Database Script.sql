create database project; 
Use project;


#Manager Table

create table Manager(
M_ID int(10) not null auto_increment unique,
M_Name varchar(50) not null,
M_NIC varchar(10) not null primary key,
M_Password varchar(30) not null

);


#Employee Table

create table Employee(
E_ID int(10) not null auto_increment unique,
E_FullName varchar(100) not null,
E_Gender varchar(10) not null,
E_Address varchar(100) not null,
E_NIC varchar(10) not null,
E_Designation varchar(15) not null,
E_DOB varchar(12) not null,
E_BasicSalary varchar(10) not null,
E_Password varchar(300) not null,
M_ID int(10) not null default 1,
constraint E_NIC_PK primary key(E_NIC),
constraint M_ID_FK foreign key (M_ID) references Manager(M_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

#Customer Table
 
create table Customer(
C_ID int(10) not null auto_increment unique,
C_FullName varchar(100) not null,
C_Gender varchar(10) not null,
C_Address varchar(100) not null,
C_NIC varchar(10) not null,
C_Phone varchar(15) not null,
C_Password varchar(300) not null,
constraint C_NIC_PK primary key(C_NIC)

);

#Order Table

create table LaundryOrder(
O_ID int(10) not null auto_increment unique,
O_Weight varchar(10) not null,
O_Date varchar(15) not null,
O_Payment varchar(15) not null,
C_NIC varchar(15) not null,
E_NIC varchar(15) not null,

constraint O_ID_PK primary key(O_ID),
constraint C_NIC_FK foreign key (C_NIC) references Customer(C_NIC) ON DELETE CASCADE ON UPDATE CASCADE,
constraint E_NIC_FK foreign key (E_NIC) references Employee(E_NIC) ON DELETE CASCADE ON UPDATE CASCADE
);

insert into Manager values(1,"A.K.M.Karunarathna","859654783V","510ec3db71d587f7878083749a3473");


insert into Employee values(1,"A.K.Hettiarachchi","male","122 Makandura Gonavila","929878552V","Operator","06/08/1992","25000","510ec3db71d587f7878083749a3473",1);
insert into Employee values(2,"T.P.Thilakasiri","male","Negombo road Dankotuwa","829878887V","Operator","03/01/1982","20000","510ec3db71d587f7878083749a3473",1);
insert into Employee values(3,"P.T.Wilmala","female","178 Kadawath Ganemulla","879878654V","Receiptionist","11/12/1987","30000","510ec3db71d587f7878083749a3473",1);
insert into Employee values(4,"M.P.Maldeniya","male","Negombo road Dankotuwa","909788522V","Operator","18/08/1990","25000","510ec3db71d587f7878083749a3473",1);
insert into Employee values(5,"T.K.P.Seetha","female","Kurunegala road Giriulla","909878855V","Operator","22/07/1991","22000","510ec3db71d587f7878083749a3473",1);


insert into Customer values(1,"J.S.Jayasooriya","male","Kandy Road Panadura","874578696V","0779854786","510ec3db71d587f7878083749a3473");
insert into Customer values(2,"M.T.Wickramasooriya","female","Pasyala Road Nittabuwa","864578693V","0719454789","510ec3db71d587f7878083749a3473");
insert into Customer values(3,"I.S.Athukorala","male","Kandy Road Pasyala","904578876V","0729854786","510ec3db71d587f7878083749a3473");
insert into Customer values(4,"K.D.Dasanayaka","male","Giriulla Road Pasyala","914578656V","0757854455","510ec3db71d587f7878083749a3473");
insert into Customer values(5,"R.A.Disanayaka","female","Negombo road Dankotuwa","904578656V","0757754356","510ec3db71d587f7878083749a3473");


insert into LaundryOrder values(1,"5","15/05/2018","1000","904578656V","879878654V");
insert into LaundryOrder values(2,"4","16/05/2018","1000","914578656V","879878654V");
insert into LaundryOrder values(3,"10","16/05/2018","12000","874578696V","909878855V");
insert into LaundryOrder values(4,"11","17/05/2018","9000","874578696V","879878654V");
insert into LaundryOrder values(5,"3.5","17/05/2018","5000","864578693V","879878654V");

