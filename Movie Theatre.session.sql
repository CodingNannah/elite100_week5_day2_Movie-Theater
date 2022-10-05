DROP TABLE IF EXISTS Customers CASCADE;
CREATE TABLE customers(
    "customer_id" SERIAL,
    "first_name" VARCHAR(50),
    "last_name" VARCHAR(100),
    "email" VARCHAR(150),
    "phone" VARCHAR(13),
    "age" INTEGER,
    "city" VARCHAR(50),
    "state" VARCHAR(2),
    PRIMARY KEY ("customer_id")
);
DROP TABLE IF EXISTS Concessions CASCADE;
CREATE TABLE concessions(
    "concession_id" SERIAL,
    "customer_id" INTEGER,
    "concession_name" VARCHAR(50),
    "quantity" INTEGER,
    "concession_price" NUMERIC(5, 2),
    "total_concessions_price" NUMERIC(5, 2),
    PRIMARY KEY ("concession_id"),
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
DROP TABLE IF EXISTS movies CASCADE;
CREATE TABLE movies(
    "movie_id" SERIAL,
    "movie_name" VARCHAR(75),
    "genre" VARCHAR(150),
    "rating_id" VARCHAR(5),
    "description" TEXT,
    "main actors" TEXT,
    "director_or_company" VARCHAR(100),
    "length_hr_min" VARCHAR(15),
    "active_movie" BOOLEAN,
    PRIMARY KEY ("movie_id")
);
DROP TABLE IF EXISTS theaters CASCADE;
CREATE TABLE theaters(
    theater_id SERIAL PRIMARY KEY,
    theater INTEGER,
    occupancy_min INTEGER,
    occupancy_max INTEGER,
    show_date DATE,
    show_time VARCHAR(50),
    movie_id INTEGER,
    movie_name VARCHAR(75),
    active_theater BOOLEAN,
    FOREIGN KEY(movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY(movie_name) REFERENCES movies(movie_name)
);
DROP TABLE IF EXISTS tickets CASCADE;
CREATE TABLE tickets(
    ticket_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    movie_name VARCHAR(75),
    theater_id INTEGER,
    show_date DATE,
    show_time VARCHAR(25),
    ticket_price NUMERIC(5, 2),
    total_concessions_price NUMERIC(5, 2),
    total_ticket_price NUMERIC(5, 2),
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(movie_name) REFERENCES movies(movie_name),
    FOREIGN KEY(theater_id) REFERENCES theaters(theater_id),
    FOREIGN KEY(show_date) REFERENCES theaters(show_date),
    FOREIGN KEY(show_time) REFERENCES theaters(show_time),
    FOREIGN KEY(total_concessions_price) REFERENCES concessions(total_concessions_price)
);
INSERT INTO customers(
        first_name,
        last_name,
        email,
        phone,
        age,
        city,
        state
    )
VALUES(
        'Dylan',
        'Smith',
        'dylan@smith.com',
        '(312)555-5555',
        99,
        'Chicago',
        'IL'
    );
INSERT INTO customers(
        first_name,
        last_name,
        email,
        phone,
        age,
        city,
        state
    )
VALUES(
        'Diana',
        'Barber',
        'diana@codingnannah.com',
        '(435)555-5555',
        42,
        'North Logan',
        'UT'
    );
INSERT INTO customers(
        first_name,
        last_name,
        email,
        phone,
        age,
        city,
        state
    )
VALUES(
        'Bryan',
        'Bever',
        'bryan@bever.com',
        '(515)555-5555',
        34,
        'Des Moines',
        'IA'
    );
INSERT INTO customers(
        first_name,
        last_name,
        email,
        phone,
        age,
        city,
        state
    )
VALUES(
        'Matthew',
        'Barber',
        'matthew@barber.com',
        '(603)555-5555',
        21,
        'Manchester',
        'NH'
    );
INSERT INTO customers(
        first_name,
        last_name,
        email,
        phone,
        age,
        city,
        state
    )
VALUES(
        'Connie',
        'Shannon',
        'connie@shannon.com',
        '(208)555-5555',
        54,
        'Idaho Falls',
        'ID'
    );
Insert INTO concessions(
        customer_id,
        concession_name,
        quantity,
        concession_price,
        total_concessions_price
    )
VALUES(
        4,
        'popcorn',
        2,
        3.99,
        7.98
    );
Insert INTO concessions(
        customer_id,
        concession_name,
        quantity,
        concession_price,
        total_concessions_price
    )
VALUES(
        4,
        'drinks',
        2,
        1.99,
        3.98
    );
Insert INTO concessions(
        customer_id,
        concession_name,
        quantity,
        concession_price,
        total_concessions_price
    )
VALUES(
        2,
        'water',
        2,
        1.99,
        3.98
    );
Insert INTO concessions(
        customer_id,
        concession_name,
        quantity,
        concession_price,
        total_concessions_price
    )
VALUES(
        2,
        'candy',
        2,
        1.99,
        3.98
    );
Insert INTO concessions(
        customer_id,
        concession_name,
        quantity,
        concession_price,
        total_concessions_price
    )
VALUES(
        1,
        'cotton candy',
        1,
        2.99,
        2.99
    );
Insert INTO concessions(
        customer_id,
        concession_name,
        quantity,
        concession_price,
        total_concessions_price
    )
VALUES(
        1,
        'pickle',
        1,
        1.99,
        1.99
    );
Insert INTO concessions(
        customer_id,
        concession_name,
        quantity,
        concession_price,
        total_concessions_price
    )
VALUES(
        2,
        'nachos',
        1,
        2.99,
        5.98
    );
SELECT *
FROM concessions;
SELECT *
FROM customers;
SELECT *
FROM movies;
SELECT *
FROM theaters;
SELECT *
FROM tickets;
INSERT INTO movies(
        "movie_name",
        "genre",
        "rating_id",
        "description",
        "main actors",
        "director_or_company",
        "length_hr_min",
        "active_movie"
    )
VALUES(
        'Minions: The Rise of Gru',
        'animated comedy adventure',
        'PG',
        'Growing up in the 1970s, 12-year-old Gru dreams of becoming the greatest supervillian in the world.',
        'Steve Carrell, Julie Andrews, Danny Trejo, and more',
        'Kyle Balda',
        '1 hr 50 min',
        'Yes'
    );
INSERT INTO movies(
        "movie_name",
        "genre",
        "rating_id",
        "description",
        "main actors",
        "director_or_company",
        "length_hr_min",
        "active_movie"
    )
VALUES(
        'Railway Children',
        'live action dramatic adventure',
        'PG',
        'During WWII in England, children were sent into the country to escape Nazi bombing. This is the story of Bobbie Waterbury who takes in some of these children. Adventure ensues as they meet a young soldier far from home.',
        'Jenny Agutter, Tom Courtenay, John Bradley, and more',
        'Morgan Matthews',
        '1 hr 58 min',
        'Yes'
    );
INSERT INTO movies(
        "movie_name",
        "genre",
        "rating_id",
        "description",
        "main actors",
        "director_or_company",
        "length_hr_min",
        "active_movie"
    )
VALUES(
        'See How They Run',
        'live action mystery thriller',
        'PG-13',
        'In 1950s London, the live action movie version of a play is halted after the murder of a crew member. A veteran Inspector and an eager rookie Constable are tasked with revealing the mystery behind this whodunit drama.',
        'Saoirse Ronan, Adrien Brody, Sam Rockwell, and more',
        'Tom George',
        '1 hr 58 min',
        'Yes'
    );
INSERT INTO movies(
        "movie_name",
        "genre",
        "rating_id",
        "description",
        "main actors",
        "director_or_company",
        "length_hr_min",
        "active_movie"
    )
VALUES(
        'DC League of Super-Pets',
        'animated action adventure',
        'PG',
        'Krypto the Super-Dog is the best friend of Superman, recruiting shelter pets to save a kidnapped Superman and the Justice League.',
        'Kat McKinnon, Diego Luna, John Krasinski, Dwayne Johnson, Keanu Reeves, and more',
        'Jared Stern',
        '2 hr 05 min',
        'Yes'
    );
INSERT INTO movies(
        "movie_name",
        "genre",
        "rating_id",
        "description",
        "main actors",
        "director_or_company",
        "length_hr_min",
        "active_movie"
    )
VALUES(
        'Catherine Called Birdy',
        'live action adventure',
        'PG-13',
        'It is the year 1290 in the English village of Stonebridge. Teenage Lady Catherine (Birdy) is to be married off to any wealthy landowner to get her father out of financial ruin. Birdy cleverly avoids her unwanted suitors in increasingly ingenious ways. Will her family and their love survive the test of the vilest suitor of all?',
        'Bella Ramsey, Sophie Okonedo, Joe Alwyn, Andrew Scott, Billie Piper, and more',
        'Lena Dunham',
        '2 hr 08 min',
        'Yes'
    );
INSERT INTO movies(
        "movie_name",
        "genre",
        "rating_id",
        "description",
        "main actors",
        "director_or_company",
        "length_hr_min",
        "active_movie"
    )
VALUES(
        'Top Gun: Maverick',
        'live action dramatic adventure',
        'PG-13',
        'Pete "Maverick" Mitchell is called to train a group of Top Gun graduates for a daring, specialized mission. Maverick is drawn into confrontations with the son of his former partner, higher-ups who question his training methods, and his own deepest fears. This mission demands the best and even the ultimate sacrifice out of all who ultimately fly it.',
        'Tom Cruise, Val Kilmer, Miles Teller, Jennifer Connelly, and more',
        'Joseph Kosinski',
        '2 hr 31 min',
        'Yes'
    );
INSERT INTO movies(
        "movie_name",
        "genre",
        "rating_id",
        "description",
        "main actors",
        "director_or_company",
        "length_hr_min",
        "active_movie"
    )
VALUES(
        'Where the Crawdad"s Sing',
        'live action dramatic mystery thriller',
        'PG-13',
        'From the best-selling novel comes the story of Kya. Abandoned, raising herself in the dangerous marshlands of North Carolina, the "Marsh Girl" is rumored to haunt Barkley Cove. Kya opens her life to two young men from town, until one is found dead, and hte community believes Kya is responsible.',
        'Daisy Edgar-Jones, David Strathairn, Harris Dickinson, Taylor John Smith, and more',
        'Olivia Newman',
        '2 hr 25 min',
        'Yes'
    );
INSERT INTO movies(
        "movie_name",
        "genre",
        "rating_id",
        "description",
        "main actors",
        "director_or_company",
        "length_hr_min",
        "active_movie"
    )
VALUES(
        'The Invitation',
        'live action horror thriller',
        'PG-13',
        'After the death of her mother and without another known relative to turn to, Evie takes a DNA test and discovers a long-lost cousin. She is first enticed by an invitation to a lavish wedding in the English countryside, and then drawn into a horrifying nightmare of survival. Evie learns of twisted secrets in her family history and the real intentions behind her family"s generosity. Will Evie survive her new-found family?',
        'Nathalie Emmanuel, Sean Pertwee, Hugh Skinner, Courtney Taylor, and more',
        'Jessica M. Thompson',
        '2 hr 04 min',
        'Yes'
    );
INSERT INTO movies(
        "movie_name",
        "genre",
        "rating_id",
        "description",
        "main actors",
        "director_or_company",
        "length_hr_min",
        "active_movie"
    )
VALUES(
        'The Woman King',
        'live action drama',
        'PG-13',
        'In the 1800s, the all-female warriors, called the Agojie, protected the African kingdom of Dahomey with legendary strength, skill, and cunning. This is the story of General Nanisca and the next generation of Agojie recruits, who train for battle against a foe who is determined to destroy their way of life.',
        'Viola Davis, John Boyega, Hero Fiennes Tiffin, Thuso Mbedu, Adrienne Warren, and more',
        'Gina Prince-Bythewood',
        '2 hr 26 min',
        'Yes'
    );
INSERT INTO movies(
        "movie_name",
        "genre",
        "rating_id",
        "description",
        "main actors",
        "director_or_company",
        "length_hr_min",
        "active_movie"
    )
VALUES(
        'Running the Bases',
        'live action family drama',
        'PG',
        'A small-town baseball coach uproots his family for the opportunity of a lifetime to coach at a larger high school far away. This man of faith encounters extreme opposition to his coaching methods from the school superintendent. What if the only way to win is to lose?',
        'Brett Varvel, Gig Orsillo, Todd Terry, Cameron Arnett, and more',
        'Marty Roberts',
        '2 hr 27 min',
        'Yes'
    );
INSERT INTO movies(
        "movie_name",
        "genre",
        "rating_id",
        "description",
        "main actors",
        "director_or_company",
        "length_hr_min",
        "active_movie"
    )
VALUES(
        'Lyle, Lyle, Crocodile',
        'live-action CGI family fantasy adventure',
        'PG',
        'Based on Lyle the Crocodile books by Bernard Waber, Josh Primm struggles to find his way after his family moves to NYC. That is, until he meets Lyle, the bath-loving, caviar-eating, singing crocodile. But, all is not well, when an evil neighbor threatens Lyle. Can the Primm family help Lyle"s charismatic owner save his beloved crocodile?',
        'Winslow Fegley, Javier Bardem, Shawn Mendes, Constance Wu, and more',
        'Josh Gordon',
        '2 hr 05 min',
        'No'
    );
INSERT INTO movies(
        "movie_name",
        "genre",
        "rating_id",
        "description",
        "main actors",
        "director_or_company",
        "length_hr_min",
        "active_movie"
    )
VALUES(
        'Billy Joel: Live at Yankee Stadium',
        'documentary musical concert',
        'PG-13',
        'Celebrating Billy Joel"s 50 years as a musical showman, fans old and new are invited to the legendary 1990 concert. This is one-night opportunity includes re-mixed and re-edited performances and behind-the-scenes magic. Come enjoy your very own back-stage pass to some of Billy Joel"s finest moments.',
        'Billy Joel, David Brown, Mark Rivera, and Crystal Taliefero.',
        'Jon Small',
        '1 hr 50 min',
        'No'
    );
Insert INTO theaters(
        theater,
        occupancy_min,
        occupancy_max,
        show_date,
        show_time,
        movie_id,
        movie_name,
        active_theater
    )
VALUES(
        1,
        100,
        144,
        'October 5, 2022',
        '11:00 AM',
        1,
        'Minions: The Rise of Gru',
        'Yes'
    );
Insert INTO theaters(
        theater,
        occupancy_min,
        occupancy_max,
        show_date,
        show_time,
        movie_id,
        movie_name,
        active_theater
    )
VALUES(
        2,
        50,
        72,
        'October 5, 2022',
        '11:00 AM',
        4,
        'DC League of Super-Pets',
        'Yes'
    );
Insert INTO theaters(
        theater,
        occupancy_min,
        occupancy_max,
        show_date,
        show_time,
        movie_id,
        movie_name,
        active_theater
    )
VALUES(
        3,
        350,
        432,
        'October 5, 2022',
        '11:00 AM',
        5,
        'Catherine Called Birdy',
        'Yes'
    );
Insert INTO theaters(
        theater,
        occupancy_min,
        occupancy_max,
        show_date,
        show_time,
        movie_id,
        movie_name,
        active_theater
    )
VALUES(
        3,
        350,
        432,
        'October 5, 2022',
        '1:30 PM',
        1,
        'Minions: The Rise of Gru',
        'Yes'
    );
Insert INTO theaters(
        theater,
        occupancy_min,
        occupancy_max,
        show_date,
        show_time,
        movie_id,
        movie_name,
        active_theater
    )
VALUES(
        3,
        350,
        432,
        'October 5, 2022',
        '4:00 PM',
        6,
        'Top Gun: Maverick',
        'Yes'
    );
Insert INTO theaters(
        theater,
        occupancy_min,
        occupancy_max,
        show_date,
        show_time,
        movie_id,
        movie_name,
        active_theater
    )
VALUES(
        3,
        350,
        432,
        'October 5, 2022',
        '7:30 PM',
        7,
        'Where the Crawdads Sing',
        'Yes'
    );
Insert INTO theaters(
        theater,
        occupancy_min,
        occupancy_max,
        show_date,
        show_time,
        movie_id,
        movie_name,
        active_theater
    )
VALUES(
        3,
        350,
        432,
        'October 5, 2022',
        '9:50 PM',
        6,
        'Top Gun: Maverick',
        'Yes'
    );
DROP TABLE Concessions;
SELECT *
FROM Concessions;
INSERT INTO tickets(
        customer_id,
        movie_name,
        theater_id,
        show_date,
        show_time,
        ticket_price,
        total_concessions_price,
        total_ticket_price
    )
VALUES(
        4,
        'Top Gun: Maverick',
        3,
        'October 5, 2022',
        '9:50 PM',
        11.50,
        11.96,
        34.96
    );
INSERT INTO tickets(
        customer_id,
        movie_name,
        theater_id,
        show_date,
        show_time,
        ticket_price,
        total_concessions_price,
        total_ticket_price
    )
VALUES(
        1,
        'Top Gun: Maverick',
        3,
        'October 5, 2022',
        '9:50 PM',
        11.50,
        4.98,
        16.48
    );
INSERT INTO tickets(
        customer_id,
        movie_name,
        theater_id,
        show_date,
        show_time,
        ticket_price,
        total_concessions_price,
        total_ticket_price
    )
VALUES(
        2,
        'Top Gun: Maverick',
        3,
        'October 5, 2022',
        '9:50 PM',
        11.50,
        13.94,
        36.94
    );
SELECT *
FROM tickets;
UPDATE tickets
SET total_concessions_price = 3.98
WHERE ticket_id = 1;
UPDATE tickets
SET total_ticket_price = 15.48
WHERE ticket_id = 1;
INSERT INTO tickets(
        customer_id,
        movie_name,
        theater_id,
        show_date,
        show_time,
        ticket_price,
        total_concessions_price,
        total_ticket_price
    )
VALUES(
        4,
        'Top Gun: Maverick',
        3,
        'October 5, 2022',
        '9:50 PM',
        11.50,
        7.98,
        19.48
    );
SELECT *
FROM tickets;
ALTER TABLE tickets DROP total_concessions_price;
UPDATE tickets
SET total_ticket_price = 11.50
WHERE ticket_id = 3;
UPDATE tickets
SET total_ticket_price = 11.50
WHERE ticket_id = 1;
UPDATE tickets
SET total_ticket_price = 11.50
WHERE ticket_id = 2;
UPDATE tickets
SET total_ticket_price = 11.50
WHERE ticket_id = 4;
ALTER TABLE tickets DROP total_ticket_price;
INSERT INTO tickets(
        customer_id,
        movie_name,
        theater_id,
        show_date,
        show_time,
        ticket_price
    )
VALUES(
        4,
        'Top Gun: Maverick',
        3,
        'October 5, 2022',
        '9:50 PM',
        11.50
    );
INSERT INTO tickets(
        customer_id,
        movie_name,
        theater_id,
        show_date,
        show_time,
        ticket_price
    )
VALUES(
        1,
        'Top Gun: Maverick',
        3,
        'October 5, 2022',
        '9:50 PM',
        11.50
    );
INSERT INTO tickets(
        customer_id,
        movie_name,
        theater_id,
        show_date,
        show_time,
        ticket_price
    )
VALUES(
        2,
        'Top Gun: Maverick',
        3,
        'October 5, 2022',
        '9:50 PM',
        11.50
    );
SELECT *
FROM customers;
UPDATE tickets
SET customer_id = 3
WHERE customer_id = 4;
SELECT *
FROM tickets;
INSERT INTO tickets(
        customer_id,
        movie_name,
        theater_id,
        show_date,
        show_time,
        ticket_price
    )
VALUES(
        4,
        'Minions: The Rise of Gru',
        1,
        'October 5, 2022',
        '11:00 AM',
        5.75
    );
SELECT *
FROM theaters;
INSERT INTO tickets(
        customer_id,
        movie_name,
        theater_id,
        show_date,
        show_time,
        ticket_price
    )
VALUES(
        5,
        'Catherine Called Birdy',
        3,
        'October 5, 2022',
        '11:00 AM',
        5.75
    );
Insert INTO concessions(
        customer_id,
        concession_name,
        quantity,
        concession_price,
        total_concessions_price
    )
VALUES(
        5,
        'nachos',
        2,
        2.99,
        5.98
    );
Insert INTO concessions(
        customer_id,
        concession_name,
        quantity,
        concession_price,
        total_concessions_price
    )
VALUES(
        5,
        'water',
        2,
        1.99,
        3.98
    );
SELECT *
FROM concessions;
SELECT *
FROM tickets;
SELECT *
FROM customers;
Insert INTO concessions(
        customer_id,
        concession_name,
        quantity,
        concession_price,
        total_concessions_price
    )
VALUES(
        3,
        'popcorn',
        2,
        3.99,
        7.98
    );
Insert INTO concessions(
        customer_id,
        concession_name,
        quantity,
        concession_price,
        total_concessions_price
    )
VALUES(
        3,
        'drinks',
        2,
        1.99,
        3.98
    );
UPDATE concessions
SET total_concessions_price = 2.99
WHERE concession_id = 7;
SELECT *
FROM concessions;
SELECT *
FROM tickets;
SELECT *
FROM customers;
SELECT *
FROM movies;
SELECT *
FROM theaters;
ALTER TABLE theaters
ADD FOREIGN KEY (movie_id) REFERENCES movies(movie_id);
ALTER TABLE theaters
ADD FOREIGN KEY (movie_name) REFERENCES movies(movie_name);
SELECT *
FROM tickets;
ALTER TABLE tickets
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
ALTER TABLE tickets
ADD FOREIGN KEY (movie_name) REFERENCES movies(movie_name);
ALTER TABLE tickets
ADD FOREIGN KEY (theater_id) REFERENCES theaters(theater_id);
ALTER TABLE tickets
ADD FOREIGN KEY (show_time) REFERENCES theaters(show_time);
ALTER TABLE tickets
ADD FOREIGN KEY (show_date) REFERENCES theaters(show_date);