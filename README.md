Movie Theater - basic is a profitable (re: movies always playing, theaters in good repair and always open, etc.), non-discounted movie house with three (small, med, large) theaters. Movies before 6pm are half-priced. Tickets are based on one movie per person per ticket. Movies may show AM(1)/PM(2)/evening(2) for a total of 15 showings per day.

Started plan with discounts and more in movie_theatre.

Simplified to Movie Theater - basic.

TABLES: Concessions, Customers, and Movies have doubles. 
Suspect caused by trying out Lucid's SQL code option. Code is different from what we learned in class, but it works.However, capitalized double tables do not register with the SQL program. 

Tried a few ways to delete the doubles. Used DROP TABLES function, which actually deleted a lowercase one that had information in it. I rebuilt it by re-running the table and associated INSERTs.

DATETIME Option for show_time does not exist. Split that into show_date and show_time.

Could not get TIME to work, no matter the format. Changed it to VARCHAR.

SQL would not format most of the FOREIGN KEYS. Again, possibly Lucid code issue. Usual Error: there is no unique constraint matching given keys for referenced table "name of table". Looked it up. Apparently all Foreign Keys must be a PK somewhere else. Not sure how to resolve show_date, show_time, and movie_name.

Meanwhile, tried re-adding tables and re-writing Foreign Key columns one by one. Got four other FOREIGN KEYS successfully added. 

While adding data, realized needed more columns and connections. Added them, removed others. Don't recall all the changes made. 

Recognized limitations in calculations and ability to purchase multiple concessions on one ticket. 

Meanwhile, redid "tickets" with Update, etc.-- forgot to do them as one customer per ticket. Decided to spread out concessions on "guest tickets" purchased by customers.

RELATIONSHIPS:

Customer customer_id to Tickets customer_id: min 0 tickets to many for customers
Tickets customer_id to Customer customer_id: min 1 customer and max 1 customer per ticket

Movies movie_name to Tickets movie_name: min 1 ticket and max many tickets per movie
Tickets movie_name to Movies movie_name: min 1 and max 1 movies per ticket

Theaters theater_id to Tickets theater_id: min 1 ticket and max many tickets per theater
Tickets theater_id to Theaters theater_id: min 1 and max 1 theaters per ticket

Theaters show_time to Tickets show_time: min 1 and max 1 showtime per ticket
Tickets show_time to Theaters show_time: min many and only many tickets per showtime/theater

* show_date is same as show_time

Concessions total_concessions_price to Tickets total_concessions_price: min 1 ticket and max many for total_concessions price
Tickets total_concessions_price to Concessions total_concessions_price: min 1 and max 1 total concessions price per ticket

Movies movie_id to Theaters movie_id: min 0 (not playing yet) and max many movie id to theater
Theaters movie_id to Movies movie_id: min 1 and max more than one (many - AM/PM/Eve) movie id per theater

Movies movie_name to Theaters movie_name: same as movie_id
Theaters movie_name to Movies movie_name: same as movie_id
