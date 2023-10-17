create database Movie_tickets;
use Movie_tickets;
create table user(
User_Id int NOT NULL,
First_Name varchar(20),
Last_Name varchar(20),
Phone_no varchar(10),
Primary Key(User_Id)

);

create table CinemaHall(
Hall_Id int NOT NULL,
Hall_name varchar(20),
No_of_seats varchar(5)

);
create table Tickets(
Ticket_Id int NOT NULL,
Price varchar(10),
User_Id int,
Hall_Id int,
FOREIGN KEY(User_Id) references user(User_Id),
FOREIGN KEY(Hall_Id) references CinemaHall(Hall_Id)


);
create table Movies(
Movie_Id int NOT NULL,
Movie_title varchar(100),
Ratings varchar(5)
);
Alter table Movies ADD primary key(Movie_Id);
desc CinemaHall;
Alter table Tickets ADD Movie_Id int;
Alter table Tickets ADD foreign key(Movie_Id) references Movies(Movie_Id);
desc Tickets;
Select * from Tickets;