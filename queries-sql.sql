-- A ​murder​ that occurred on ​Jan.15, 2018​ and that it took place in ​SQL City​.
SELECT *
  FROM crime_scene_report
 WHERE city = 'SQL City' AND
       type = 'murder' AND
       date = '20180115';

-- RESULTS: The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".

-- Write a query that identifies the first witness
SELECT *
  FROM person
 WHERE address_street_name = 'Northwestern Dr'
 ORDER BY address_number DESC
 LIMIT 1;


-- RESULT: 14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949

-- Write a query that identifies the second witness.
SELECT *
  FROM person
 WHERE address_street_name = 'Franklin Ave' AND
       name LIKE 'Annabel%';

-- RESULT: 16371	Annabel Miller	490173	103	Franklin Ave	318771143

-- Write a query that shows the interview transcripts for our two subjects.
SELECT transcript, name
  FROM interview i
       JOIN
       person p ON i.person_id = p.id
 WHERE p.name = 'Annabel Miller' OR
       p.name = 'Morty Schapiro';


-- I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".	Morty Schapiro
-- I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.	Annabel Miller

-- Find the murderer!
-- Narrow down search through gym membership
SELECT person_id, name
  FROM get_fit_now_check_in check_in
       JOIN
       get_fit_now_member member ON check_in.membership_id = member.id
 WHERE check_in.membership_id LIKE '48Z%' AND
       member.membership_status = 'gold';

-- 28819	Joe Germuska
-- 67318	Jeremy Bowers

-- Find murder via license plate
SELECT name
  FROM person p
       JOIN
       drivers_license dl ON p.license_id = dl.id
 WHERE dl.plate_number LIKE '%H42W%' AND
       p.id = '28819' OR
       p.id = '67318';

-- And murder is Jeremy Bowers!!
