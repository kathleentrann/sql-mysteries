-- A ​murder​ that occurred on ​Jan.15, 2018​ and that it took place in ​SQL City​.
SELECT * FROM crime_scene_report
WHERE city ='SQL City'
AND type='murder'
AND date='20180115'

-- RESULTS: The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".

-- Write a query that identifies the first witness
SELECT * FROM person
WHERE address_street_name='Northwestern Dr'
ORDER BY address_number DESC LIMIT 1

-- RESULT: 14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949

-- Write a query that identifies the second witness.
SELECT * FROM person
WHERE address_street_name='Franklin Ave'
AND name LIKE 'Annabel%'

-- RESULT: 16371	Annabel Miller	490173	103	Franklin Ave	318771143
