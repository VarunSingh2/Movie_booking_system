INSERT INTO users (user_id, first_name, last_name, phone_no)
VALUES  (1, 'Varun', 'Singh', '1234567890'), -- sab ticket
        (2, 'Rachana', 'Singh', '0987654321'),  -- alternate movies first 7
        (3, 'Surekha', 'Singh', '5555555555'), -- alternate movies last 7
        (4, 'Arun', 'Singh', '7777777777'), -- all alternate movies
        (5, 'Sushant', 'Singh', '4444444444'), -- random 2 movies
        (6, 'Senorita', 'Singh', '1444444444'), -- random 1 movie
        (7, 'Sushma', 'Singh', '3444444444'); -- no movie


INSERT INTO directors (director_id, first_name, last_name)
VALUES
    (1, 'Christopher', 'Nolan'),
    (2, 'James', 'Cameron'),
    (3, 'Rohit', 'Shetty'),
    (4, 'Sanjay Leela', 'Bansali'),
    (5, 'Karan', 'Johar');


INSERT INTO actors (actor_id, first_name, last_name)
VALUES
    (1, 'Christian', 'Bale'),
    (2, 'Heath', 'Ledger'),
    (3, 'Cillian', 'Murphy'),
    (4, 'Arnold', 'Schwarzenegger'),
    (5, 'Leonardo', 'DiCaprio'),
    (6, 'Shahrukh', 'Khan'),
    (7, 'Deepika', 'Padukone'),
    (8, 'Ranveer', 'Singh'),
    (9, 'Alia', 'Bhatt');


INSERT INTO movies (movie_id, title, ratings, director_id)
VALUES
    (1, 'Batman', 8, 1),
    (2, 'Batman Rises', 8, 1),
    (3, 'Oppenheimer', 9, 1),
    (4, 'Terminator', 9, 2),
    (5, 'Titanic', 9, 2),
    (6, 'Chennai Express', 8, 3),
    (7, 'Dilwale', 6, 3),
    (8, 'Ram-Leela', 8, 4),
    (9, 'Padmaavat', 8, 4),
    (10, 'Student of the year', 2, 5),
    (11, 'Humpty Sharma ki Dulhaniya',1, 5),
    (12, 'Dear Zindagi',8, 5);

-- Insert test data into movies_actors_mapping table
INSERT INTO movies_actors_mapping (movie_actor_id, movie_id, actor_id)
VALUES
     -- batman
    (1, 1, 1),
    (2, 1, 2),
    (3, 1, 3),

    -- dark knight rises
    (4, 2, 1),
    (5, 2, 3),

    -- oppenheimer
    (6, 3, 3),

    -- terminator
    (7,4,4),

    -- titanic
    (8,5,5),

    -- chennai express
    (9,6,6),
    (10,6,7),

    -- dilwale
     (11,7,6),

     -- ram-leela
     (12,8,7),
     (13,8,8),

     -- padmaavat
     (14,9,7),
     (15,9,8),

     -- student of the year
     (16,10, 9),

     -- humpty sharma
     (17,11, 9),

     -- dear zindagi
     (18,12, 9),
     (19,12,6);



-- Insert test data into cinema_halls table
INSERT INTO cinema_halls (cinema_hall_id, name)
VALUES
    (1, 'Phoenix cinema hall'),
    (2, 'Inorbit cinema hall'),
    (3, 'Mariplex 3'),
    (4, 'Cinepolis 4');


-- Insert test data into tickets table
INSERT INTO tickets (ticket_id, cinema_hall_id, user_id, movie_id)
VALUES
    (1, 1, 1, 1),
    (2, 2, 1, 3),
    (3, 3, 1, 5),
    (4, 2, 1, 7),
    (5, 4, 1, 12),
    (6, 1, 1, 11),
    (7, 1, 1, 10),

    (8, 2, 2, 12),
    (9, 2, 2, 11),
    (10, 4, 3, 10),
    (11, 4, 3, 9),
    (12, 4, 3, 7),

    (13, 4, 4, 12),
    (14, 4, 4, 4),
    (15, 4, 4, 3),

    (16, 4, 5, 1),
    (17, 3, 5, 2),
    (18, 1, 5, 9),

    (19, 2, 6, 9),
    (20, 2, 6, 6),
    (21, 1, 6, 2),

    (22, 2, 7, 12),
    (23, 3, 7, 12),
    (24, 4, 7, 12)
;

-- insert new user with no tickets for left outer join
insert into users values(8, 'Preeti', 'Kumar' , '1294');

-- insert new ticket to log it into user_activity_log
insert into tickets values(25, 4, 2, 8);