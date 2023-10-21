-- Give all movies related to Batman
select * from movies where title like'Batman%';


-- Give me the users names seeing batman movie (3 different ways) Using subqueries and using join
select users.first_name from users where users.user_id in(select user_id from tickets where tickets.movie_id = (select movie_id from movies where title='Batman'));

select users.first_name from users where users.user_id in(select user_id from tickets where tickets.movie_id = (select movie_id from movies where title='Batman'));

select users.first_name  from users, tickets where users.user_id=tickets.user_id and tickets.movie_id=(select movie_id from movies where title='Batman');

-- Give me all the user names who are in cinema hall 1
select users.first_name from users, tickets where cinema_hall_id=1 and users.user_id=tickets.user_id;

select users.first_name from users inner join  tickets on users.user_id=tickets.user_id where cinema_hall_id=1;

-- Find the average rating by director name (In this example Christopher Nolan)
SELECT AVG(m.ratings) AS average_rating
FROM movies m
JOIN directors d
ON m.director_id = d.director_id
WHERE d.first_name = 'Christopher' AND d.last_name = 'Nolan';

-- Find movies and ratings by an actor: (Shahrukh Khan)
SELECT m.title, m.ratings
FROM movies m
         JOIN movies_actors_mapping mam ON m.movie_id = mam.movie_id
         JOIN actors a ON mam.actor_id = a.actor_id
WHERE a.first_name = 'Shahrukh' AND a.last_name = 'Khan';

-- Show users who have booked tickets more than rating 8
SELECT distinct u.first_name, u.last_name FROM users u JOIN tickets t ON u.user_id= t.user_id JOIN movies m ON t.movie_id = m.movie_id WHERE m.ratings > 8;

-- Left Outer Join:
-- Find a list of all users and the movies they have booked tickets for, including users who have not booked any tickets.
SELECT distinct  u.first_name, u.last_name, m.title AS booked_movie FROM users u LEFT OUTER JOIN tickets t ON u.user_id = t.user_id LEFT OUTER JOIN movies m ON t.movie_id =m.movie_id;

-- Self Join
-- Find all users who have booked tickets for the same movie as Varun Singh'.
SELECT DISTINCT u2.first_name, u2.last_name
FROM users u1
         JOIN tickets t1 ON u1.user_id = t1.user_id
         JOIN tickets t2 ON t1.movie_id = t2.movie_id
         JOIN users u2 ON t2.user_id = u2.user_id
WHERE u1.first_name = 'Varun' AND u1.last_name = 'Singh' AND u1.user_id <> u2.user_id

-- TRIGGERS:
-- Create a trigger to not have phone number less than or more than 10
DELIMITER //

CREATE TRIGGER check_phone_number_length
    BEFORE INSERT
    ON users
    FOR EACH ROW
BEGIN
IF LENGTH(NEW.phone_no) <> 10 THEN
        SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Phone number must be exactly 10 characters long';
END IF;
END;
//

DELIMITER ;


-- Trigger to stop deletion  for users table (you can add for any table)

DELIMITER //

CREATE TRIGGER prevent_user_deletion
    BEFORE DELETE ON users
    FOR EACH ROW
BEGIN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Deletion of users is not allowed.';
END;
//

DELIMITER ;


-- Trigger to log activity when tickets are bought by a user
DELIMITER //

CREATE TRIGGER audit_user_activity
    AFTER INSERT ON tickets
    FOR EACH ROW
BEGIN
INSERT INTO user_activity_log (user_id, action, timestamp)
VALUES (NEW.user_id, 'Booked Ticket', NOW());
END;
//

DELIMITER ;