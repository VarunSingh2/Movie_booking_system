create table users (
user_id int primary key,
first_name varchar(120),
last_name varchar(255),
phone_no varchar(10)
);

create table movies (
movie_id int primary key,
title varchar(255),
ratings tinyint,
director_id int,
foreign key(director_id) references directors(director_id) 
);


create table movies_actors_mapping(
movie_actor_id int primary key,
movie_id int,
actor_id int,
foreign key(movie_id) references movies(movie_id),
foreign key(actor_id) references actors(actor_id)
) 

create table directors (
director_id int primary key,
first_name varchar(120),
last_name varchar(255)
);

create table actors(
actor_id int primary key,
first_name varchar(120),
last_name varchar(255)
)

create table cinema_halls(
cinema_hall_id int primary key,
name varchar(100)
);

create table tickets(
ticket_id int primary key,
cinema_hall_id int,
user_id int,
movie_id int,
foreign key(cinema_hall_id) references cinema_halls(cinema_hall_id),
foreign key(user_id) references users(user_id),
foreign key(movie_id) references movies(movie_id)
);

CREATE TABLE user_activity_log(
    log_id    INT PRIMARY KEY AUTO_INCREMENT,
    user_id   INT,
    action    VARCHAR(255),
    timestamp DATETIME,
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);
