SELECT COUNT(*) FROM singer
SELECT COUNT(*) FROM singer
SELECT name , country , age FROM singer ORDER BY age DESC
SELECT name , country , age FROM singer ORDER BY age DESC
SELECT AVG(age) , MIN(age) , MAX(age) FROM singer WHERE country = 'France'
SELECT AVG(age) , MIN(age) , MAX(age) FROM singer WHERE country = 'France'
SELECT name , song_release_year FROM singer ORDER BY age ASC LIMIT 1
SELECT name , song_release_year FROM singer ORDER BY age ASC LIMIT 1
SELECT DISTINCT country FROM singer WHERE age > 20
SELECT DISTINCT country FROM singer WHERE age > 20
SELECT country , COUNT(*) FROM singer GROUP BY country
SELECT country , COUNT(*) FROM singer GROUP BY country
SELECT song_name FROM singer WHERE age > (SELECT AVG(age) FROM singer)
SELECT song_name FROM singer WHERE age > (SELECT AVG(age) FROM singer)
SELECT location , name FROM stadium WHERE capacity BETWEEN 5000 AND 10000
SELECT location , name FROM stadium WHERE capacity BETWEEN 5000 AND 10000
SELECT MAX(capacity) , AVG(capacity) FROM stadium
SELECT AVG(capacity) , MAX(capacity) FROM stadium
SELECT name , capacity FROM stadium ORDER BY average DESC LIMIT 1
SELECT name , capacity FROM stadium ORDER BY average DESC LIMIT 1
SELECT COUNT(*) FROM concert WHERE year = 2014 OR year = 2015
SELECT COUNT(*) FROM concert WHERE year = 2014 OR year = 2015
SELECT t2.name , COUNT(*) FROM concert as t1 JOIN stadium as t2 ON t1.stadium_id = t2.stadium_id GROUP BY t1.stadium_id
SELECT COUNT(*) , t2.name FROM concert as t1 JOIN stadium as t2 ON t1.stadium_id = t2.stadium_id GROUP BY t2.name
SELECT t2.name , t2.capacity FROM concert as t1 JOIN stadium as t2 ON t1.stadium_id = t2.stadium_id WHERE t1.year >= 2014 GROUP BY t2.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.name , t2.capacity FROM concert as t1 JOIN stadium as t2 ON t1.stadium_id = t2.stadium_id WHERE t1.year > 2013 GROUP BY t1.stadium_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT year FROM concert GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1
SELECT year FROM concert GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM stadium WHERE stadium_id NOT IN (SELECT stadium_id FROM concert)
SELECT name FROM stadium WHERE stadium_id NOT IN (SELECT stadium_id FROM concert)
SELECT country FROM singer WHERE age > 40 INTERSECT SELECT country FROM singer WHERE age < 30
SELECT name FROM stadium EXCEPT SELECT t2.name FROM concert as t1 JOIN stadium as t2 ON t1.stadium_id = t2.stadium_id WHERE t1.year = 2014
SELECT name FROM stadium WHERE stadium_id NOT IN (SELECT stadium_id FROM concert WHERE year = 2014)
SELECT t1.concert_name , t1.theme , COUNT(*) FROM concert as t1 JOIN singer_in_concert as t2 ON t1.concert_id = t2.concert_id GROUP BY t1.concert_id
SELECT t2.concert_name , t2.theme , COUNT(*) FROM singer_in_concert as t1 JOIN concert as t2 ON t1.concert_id = t2.concert_id GROUP BY t2.concert_name
SELECT t1.name , COUNT(*) FROM singer as t1 JOIN singer_in_concert as t2 ON t1.singer_id = t2.singer_id GROUP BY t1.name
SELECT t2.name , COUNT(*) FROM singer_in_concert as t1 JOIN singer as t2 ON t1.singer_id = t2.singer_id GROUP BY t2.name
SELECT t2.name FROM singer_in_concert as t1 JOIN singer as t2 ON t1.singer_id = t2.singer_id JOIN concert as t3 ON t1.concert_id = t3.concert_id WHERE t3.year = 2014
SELECT t2.name FROM singer_in_concert as t1 JOIN singer as t2 ON t1.singer_id = t2.singer_id JOIN concert as t3 ON t1.concert_id = t3.concert_id WHERE t3.year = 2014
SELECT t1.name , t1.country FROM singer as t1 JOIN singer_in_concert as t2 ON t1.singer_id = t2.singer_id WHERE t2.concert_id IN ( SELECT concert_id FROM concert WHERE song_name LIKE '%Hey%' )
SELECT t1.name , t1.country FROM singer as t1 JOIN singer_in_concert as t2 ON t1.singer_id = t2.singer_id WHERE t2.concert_id IN ( SELECT concert_id FROM concert WHERE song_name LIKE '%Hey%' )
SELECT t2.name , t2.location FROM concert as t1 JOIN stadium as t2 ON t1.stadium_id = t2.stadium_id WHERE t1.year = 2014 INTERSECT SELECT t2.name , t2.location FROM concert as t1 JOIN stadium as t2 ON t1.stadium_id = t2.stadium_id WHERE t1.year = 2015
SELECT t2.name , t2.location FROM concert as t1 JOIN stadium as t2 ON t1.stadium_id = t2.stadium_id WHERE t1.year = 2014 INTERSECT SELECT t2.name , t2.location FROM concert as t1 JOIN stadium as t2 ON t1.stadium_id = t2.stadium_id WHERE t1.year = 2015
SELECT COUNT(*) FROM concert as t1 JOIN stadium as t2 ON t1.stadium_id = t2.stadium_id WHERE t2.capacity = ( SELECT MAX(capacity) FROM stadium )
SELECT COUNT(*) FROM concert as t1 JOIN stadium as t2 ON t1.stadium_id = t2.stadium_id WHERE t2.capacity = (SELECT MAX(capacity) FROM stadium)
SELECT COUNT(*) FROM pets WHERE weight > 10
SELECT COUNT(*) FROM pets WHERE weight > 10
SELECT weight FROM pets WHERE pet_age = ( SELECT MIN(pet_age) FROM pets WHERE pettype = 'dog' ) AND pettype = 'dog'
SELECT weight FROM pets WHERE pet_age = ( SELECT MIN(pet_age) FROM pets WHERE pettype = 'dog' ) AND pettype = 'dog'
SELECT MAX(weight) , pettype FROM pets GROUP BY pettype
SELECT MAX(weight) , pettype FROM pets GROUP BY pettype
SELECT COUNT(*) FROM student as t1 JOIN has_pet as t2 ON t1.stuid = t2.stuid WHERE t1.age > 20
SELECT COUNT(*) FROM pets as t1 JOIN student as t2 ON t1.petid = t2.stuid WHERE t2.age > 20
SELECT COUNT(*) FROM pets as t1 JOIN student as t2 ON t1.petid = t2.stuid JOIN has_pet as t3 ON t2.stuid = t3.stuid WHERE t1.pettype = "dog" AND t2.sex = "f"
SELECT COUNT(*) FROM pets as t1 JOIN student as t2 ON t1.petid = t2.stuid JOIN has_pet as t3 ON t2.stuid = t3.stuid WHERE t1.pettype = "dog" AND t2.sex = "f"
SELECT COUNT(DISTINCT pettype) FROM pets
SELECT COUNT(DISTINCT pettype) FROM pets
SELECT t2.fname FROM pets as t1 JOIN student as t2 ON t1.petid = t3.petid JOIN has_pet as t3 ON t2.stuid = t3.stuid WHERE t1.pettype = "cat" OR t1.pettype = "dog"
SELECT t2.fname FROM pets as t1 JOIN student as t2 ON t1.petid = t3.petid JOIN has_pet as t3 ON t2.stuid = t3.stuid WHERE t1.pettype = "cat" OR t1.pettype = "dog"
SELECT t2.fname FROM pets as t1 JOIN student as t2 ON t1.petid = t3.petid JOIN has_pet as t3 ON t2.stuid = t3.stuid WHERE t1.pettype = "cat" INTERSECT SELECT t2.fname FROM pets as t1 JOIN student as t2 ON t1.petid = t3.petid JOIN has_pet as t3 ON t2.stuid = t3.stuid WHERE t1.pettype = "dog"
SELECT t2.fname FROM pets as t1 JOIN student as t2 ON t1.petid = t3.petid JOIN has_pet as t3 ON t2.stuid = t3.stuid WHERE t1.pettype = "cat" INTERSECT SELECT t2.fname FROM pets as t1 JOIN student as t2 ON t1.petid = t3.petid JOIN has_pet as t3 ON t2.stuid = t3.stuid WHERE t1.pettype = "dog"
SELECT major , age FROM student WHERE stuid NOT IN (SELECT t1.stuid FROM has_pet as t2 JOIN pets as t1 ON t2.petid = t1.petid WHERE t1.pettype = "cat")
SELECT t2.major , t2.age FROM pets as t1 JOIN student as t2 ON t1.stuid = t2.stuid WHERE t1.pettype != "cat" EXCEPT SELECT t2.major , t2.age FROM pets as t1 JOIN student as t2 ON t1.stuid = t2.stuid WHERE t1.pettype = "cat"
SELECT stuid FROM has_pet EXCEPT SELECT t1.petid , stuid FROM pets as t1 JOIN has_pet as t2 ON t1.petid = t2.petid WHERE t1.pettype = "cat"
SELECT stuid FROM has_pet EXCEPT SELECT t1.petid FROM pets as t1 JOIN has_pet as t2 ON t1.petid = t2.petid WHERE t1.pettype = "cat"
SELECT t2.fname , t2.age FROM pets as t1 JOIN student as t2 ON t1.stuid = t2.stuid JOIN has_pet as t3 ON t2.stuid = t3.stuid WHERE t1.pettype = "dog" EXCEPT SELECT t2.fname , t2.age FROM pets as t1 JOIN student as t2 ON t1.stuid = t2.stuid JOIN has_pet as t3 ON t2.stuid = t3.stuid WHERE t1.pettype = "cat"
SELECT t2.fname FROM pets as t1 JOIN student as t2 ON t1.petid = t3.petid WHERE t1.pettype = "dog" EXCEPT SELECT t2.fname FROM pets as t1 JOIN student as t2 ON t1.petid = t3.petid WHERE t1.pettype = "cat"
SELECT pettype , weight FROM pets ORDER BY pet_age ASC LIMIT 1
SELECT pettype , weight FROM pets ORDER BY pet_age ASC LIMIT 1
SELECT petid , weight FROM pets WHERE pet_age > 1
SELECT petid , weight FROM pets WHERE pet_age > 1
SELECT AVG(t1.pet_age) , MAX(t1.pet_age) , t1.pettype FROM pets as t1 JOIN has_pet as t2 ON t1.petid = t2.petid GROUP BY t1.pettype
SELECT AVG(pet_age) , MAX(pet_age) , pettype FROM pets GROUP BY pettype
SELECT pettype , AVG(weight) FROM pets GROUP BY pettype
SELECT AVG(weight) , pettype FROM pets GROUP BY pettype
SELECT t1.fname , t1.age FROM student as t1 JOIN has_pet as t2 ON t1.stuid = t2.stuid
SELECT DISTINCT t1.fname , t1.age FROM student as t1 JOIN has_pet as t2 ON t1.stuid = t2.stuid
SELECT t2.petid FROM student as t1 JOIN has_pet as t2 ON t1.stuid = t2.stuid WHERE t1.lname = "Smith"
SELECT t2.petid FROM student as t1 JOIN has_pet as t2 ON t1.stuid = t2.stuid WHERE t1.lname = 'Smith'
SELECT COUNT(*) , stuid FROM has_pet GROUP BY stuid
SELECT COUNT(*) , t1.stuid FROM student as t1 JOIN has_pet as t2 ON t1.stuid = t2.stuid GROUP BY t1.stuid
SELECT t1.fname , t1.sex FROM student as t1 JOIN has_pet as t2 ON t1.stuid = t2.stuid GROUP BY t1.stuid HAVING COUNT(*) > 1
SELECT t1.fname , t1.sex FROM student as t1 JOIN has_pet as t2 ON t1.stuid = t2.stuid GROUP BY t1.stuid HAVING COUNT(*) > 1
SELECT t2.lname FROM pets as t1 JOIN student as t2 ON t1.petid = t3.petid JOIN has_pet as t3 ON t2.stuid = t3.stuid WHERE t1.pettype = "cat" AND t1.pet_age = 3
SELECT t2.lname FROM pets as t1 JOIN student as t2 ON t1.petid = t3.petid JOIN has_pet as t3 ON t2.stuid = t3.stuid WHERE t1.pettype = "cat" AND t1.pet_age = 3
SELECT AVG(age) FROM student WHERE stuid NOT IN (SELECT stuid FROM has_pet)
SELECT AVG(age) FROM student WHERE stuid NOT IN (SELECT stuid FROM has_pet)
SELECT COUNT(*) FROM continents
SELECT COUNT(*) FROM continents
SELECT t1.contid , t1.continent , COUNT(*) FROM continents as t1 JOIN countries as t2 ON t1.contid = t2.continent GROUP BY t1.contid
SELECT t1.contid , t1.continent , COUNT(*) FROM continents as t1 JOIN countries as t2 ON t1.contid = t2.continent GROUP BY t1.contid
SELECT COUNT(*) FROM countries
SELECT COUNT(*) FROM countries
SELECT t1.fullname , t1.id , COUNT(*) FROM car_makers as t1 JOIN model_list as t2 ON t1.id = t2.maker GROUP BY t1.id
SELECT t1.id , t1.fullname , COUNT(*) FROM car_makers as t1 JOIN model_list as t2 ON t1.id = t2.maker GROUP BY t1.id
SELECT t2.model FROM car_names as t1 JOIN model_list as t2 ON t1.model = t2.model JOIN cars_data as t3 ON t1.makeid = t3.id ORDER BY t3.horsepower LIMIT 1
SELECT t3.model FROM car_names as t1 JOIN cars_data as t2 ON t1.makeid = t2.id JOIN model_list as t3 ON t1.model = t3.model WHERE t2.horsepower = ( SELECT MIN(horsepower) FROM cars_data )
SELECT model FROM car_names WHERE weight < (SELECT AVG(weight) FROM car_names)
SELECT model FROM car_names WHERE weight < (SELECT AVG(weight) FROM car_names)
SELECT DISTINCT t2.maker FROM car_names as t1 JOIN car_makers as t2 ON t1.makeid = t2.id JOIN model_list as t3 ON t2.id = t3.maker WHERE t1.year = 1970
SELECT DISTINCT t3.maker FROM car_names as t1 JOIN cars_data as t2 ON t1.makeid = t2.id JOIN car_makers as t3 ON t1.make = t3.maker WHERE t2.year = 1970
SELECT t1.make , t2.year FROM car_names as t1 JOIN cars_data as t2 ON t1.makeid = t2.id ORDER BY t2.year LIMIT 1
SELECT t2.maker , t1.year FROM cars_data as t1 JOIN car_makers as t2 ON t1.id = t2.id JOIN model_list as t3 ON t2.id = t3.maker WHERE t3.model = 'toyota' ORDER BY t1.year LIMIT 1
SELECT DISTINCT model FROM model_list WHERE model_list.model_id IN ( SELECT model_id FROM car_makers WHERE year_of_creation > 1980 )
SELECT DISTINCT model FROM model_list WHERE model_list.model_id IN ( SELECT model_id FROM car_makers WHERE year_founded > 1980 )
SELECT t1.continent , COUNT(*) FROM continents as t1 JOIN countries as t2 ON t1.contid = t2.continent GROUP BY t1.continent
SELECT t2.continent , COUNT(*) FROM car_makers as t1 JOIN continents as t2 ON t1.country = t2.contid GROUP BY t2.continent
SELECT t2.countryname FROM car_makers as t1 JOIN countries as t2 ON t1.country = t2.countryid GROUP BY t1.country ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.countryname FROM car_makers as t1 JOIN countries as t2 ON t1.country = t2.countryid GROUP BY t1.country ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) , t1.fullname FROM car_makers as t1 JOIN model_list as t2 ON t1.id = t2.maker GROUP BY t1.id
SELECT COUNT(*) , t1.id , t1.fullname FROM car_makers as t1 JOIN model_list as t2 ON t1.id = t2.maker GROUP BY t1.id
SELECT t3.accelerate FROM car_names as t1 JOIN model_list as t2 ON t1.model = t2.model WHERE t1.make = "amc" AND t2.model = "hornet sportabout (sw)" JOIN cars_data as t3 ON t1.makeid = t3.id
SELECT t2.accelerate FROM car_names as t1 JOIN cars_data as t2 ON t1.model = t2.name JOIN model_list as t3 ON t1.make = t3.model WHERE t3.model = "hornet sportabout (sw)"
SELECT COUNT(*) FROM car_makers as t1 JOIN countries as t2 ON t1.country = t2.countryid WHERE t2.countryname = "france"
SELECT COUNT(*) FROM car_makers WHERE country = "france"
SELECT COUNT(*) FROM model_list as t1 JOIN countries as t2 ON t1.maker = t2.countryid WHERE t2.countryname = "usa"
SELECT COUNT(*) FROM countries as t1 JOIN car_makers as t2 ON t1.countryid = t2.country JOIN model_list as t3 ON t2.id = t3.maker WHERE t1.countryname = "usa"
SELECT AVG(mpg) FROM cars_data WHERE cylinders = 4
SELECT AVG(mpg) FROM cars_data WHERE cylinders = 4
SELECT weight FROM cars_data WHERE cylinders = 8 AND year = 1974 ORDER BY weight ASC LIMIT 1
SELECT weight FROM cars_data WHERE cylinders = 8 AND year = 1974 ORDER BY weight ASC LIMIT 1
SELECT maker , model FROM model_list
SELECT maker , model FROM model_list
SELECT t2.countryname , t1.country FROM car_makers as t1 JOIN countries as t2 ON t1.country = t2.countryid GROUP BY t1.country HAVING COUNT(*) >= 1
SELECT countryid , countryname FROM countries INTERSECT SELECT country , countryname FROM car_makers
SELECT COUNT(*) FROM cars_data WHERE horsepower > 150
SELECT COUNT(*) FROM car_names WHERE makeid IN ( SELECT makeid FROM car_stats WHERE hp > 150 )
SELECT AVG(weight) , year FROM cars_data GROUP BY year
SELECT AVG(weight) , year FROM cars_data GROUP BY year
SELECT countryname FROM countries WHERE continent = 2 GROUP BY countryname HAVING COUNT(DISTINCT fullname) >= 3
SELECT t2.countryname FROM car_makers as t1 JOIN countries as t2 ON t1.country = t2.countryid GROUP BY t1.country HAVING COUNT(*) >= 3 AND t2.continent = 2
SELECT t1.make , MAX(t2.horsepower) FROM car_names as t1 JOIN cars_data as t2 ON t1.model = t2.id JOIN model_list as t3 ON t1.make = t3.model WHERE t2.cylinders = 3 GROUP BY t1.make
SELECT t3.make , MAX(t2.horsepower) FROM car_names as t3 JOIN cars_data as t2 ON t3.model = t2.name JOIN model_list as t1 ON t1.model = t3.model WHERE t2.cylinders = 3 GROUP BY t3.make
SELECT t2.model FROM car_names as t1 JOIN model_list as t2 ON t1.model = t2.model JOIN cars_data as t3 ON t1.makeid = t3.id ORDER BY t3.mpg LIMIT 1
SELECT t1.model FROM car_names as t1 JOIN model_list as t2 ON t1.makeid = t2.modelid JOIN cars_data as t3 ON t1.makeid = t3.id ORDER BY t3.mpg DESC LIMIT 1
SELECT AVG(horsepower) FROM cars_data WHERE year < 1980
SELECT AVG(t1.horsepower) FROM cars_data as t1 JOIN car_makers as t2 ON t1.id = t2.id JOIN model_list as t3 ON t2.maker = t3.maker WHERE t1.year < 1980
SELECT AVG(edispl) FROM car_makers as t1 JOIN model_list as t2 ON t1.id = t2.maker WHERE t2.model = 'volvo'
SELECT AVG(t2.edispl) FROM car_names as t1 JOIN cars_data as t2 ON t1.makeid = t2.id JOIN car_makers as t3 ON t1.make = t3.maker JOIN model_list as t4 ON t4.modelid = t1.makeid WHERE t3.maker = "volvo"
SELECT MAX(accelerate) , cylinders FROM cars_data GROUP BY cylinders
SELECT MAX(accelerate) , cylinders FROM cars_data GROUP BY cylinders
SELECT model FROM model_list GROUP BY model ORDER BY COUNT(*) DESC LIMIT 1
SELECT model FROM model_list GROUP BY model ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE cylinders > 4
SELECT COUNT(*) FROM car_names WHERE makeid = ( SELECT DISTINCT makeid FROM car_names WHERE make = "ford" )
SELECT COUNT(*) FROM car_names WHERE makeid = 1
SELECT COUNT(*) FROM car_makers as t1 JOIN model_list as t2 ON t1.id = t2.maker WHERE t1.fullname = "American Motor Company"
SELECT COUNT(*) FROM car_makers as t1 JOIN model_list as t2 ON t1.id = t2.maker WHERE t1.maker = "amc"
SELECT t1.fullname , t1.id FROM car_makers as t1 JOIN model_list as t2 ON t1.id = t2.maker GROUP BY t2.maker HAVING COUNT(*) > 3
SELECT t1.maker , t1.id FROM car_makers as t1 JOIN model_list as t2 ON t1.id = t2.maker GROUP BY t2.maker HAVING COUNT(*) > 3
SELECT DISTINCT t1.model FROM car_names as t1 JOIN car_makers as t2 ON t1.make = t2.maker JOIN cars_data as t3 ON t1.makeid = t3.id JOIN model_list as t4 ON t1.model = t4.model WHERE t2.fullname = "General Motors" AND t3.weight > 3500
SELECT DISTINCT t4.model FROM car_names as t1 JOIN cars_data as t2 ON t1.makeid = t2.id JOIN car_makers as t3 ON t1.make = t3.maker JOIN model_list as t4 ON t1.model = t4.model WHERE t3.maker = "general motors" OR t2.weight > 3500
SELECT DISTINCT year FROM cars_data WHERE weight >= 3000 AND weight <= 4000
SELECT DISTINCT year FROM cars_data WHERE weight < 4000 UNION SELECT DISTINCT year FROM cars_data WHERE weight > 3000
SELECT horsepower FROM cars_data ORDER BY accelerate DESC LIMIT 1
SELECT horsepower FROM cars_data ORDER BY accelerate DESC LIMIT 1
SELECT t2.cylinders FROM car_makers as t1 JOIN model_list as t2 ON t1.id = t2.maker WHERE t2.model = "volvo" ORDER BY t1.accelerate LIMIT 1
SELECT t4.cylinders FROM car_names as t1 JOIN model_list as t2 ON t1.model = t2.model WHERE t1.make = "volvo" JOIN car_makers as t3 ON t3.id = t2.maker JOIN cars_data as t4 ON t4.id = t1.makeid ORDER BY t4.accelerate LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE accelerate > (SELECT MAX(horsepower) FROM cars_data)
SELECT COUNT(*) FROM cars_data WHERE accelerate > (SELECT MAX(horsepower) FROM cars_data)
SELECT COUNT(DISTINCT country) FROM car_makers WHERE id > 2
SELECT COUNT(*) FROM (SELECT country FROM car_makers GROUP BY country HAVING COUNT(*) > 2)
SELECT COUNT(*) FROM cars_data WHERE cylinders > 6
SELECT COUNT(*) FROM cars_data WHERE cylinders > 6
SELECT t3.model FROM cars_data as t1 JOIN car_makers as t2 ON t1.id = t2.id JOIN model_list as t3 ON t2.maker = t3.maker WHERE t1.cylinders = 4 ORDER BY t1.horsepower DESC LIMIT 1
SELECT t2.model FROM cars_data as t1 JOIN model_list as t2 ON t1.id = t2.modelid WHERE t1.cylinders = 4 GROUP BY t2.model ORDER BY SUM(t1.horsepower) DESC LIMIT 1
SELECT t1.id , t2.make FROM cars_data as t1 JOIN car_names as t2 ON t1.id = t2.makeid WHERE t1.horsepower > (SELECT MIN(horsepower) FROM cars_data) EXCEPT SELECT t1.id , t2.make FROM cars_data as t1 JOIN car_names as t2 ON t1.id = t2.makeid WHERE t1.cylinders > 3
SELECT t1.id , t2.make FROM cars_data as t1 JOIN car_names as t2 ON t1.id = t2.makeid WHERE t1.horsepower < (SELECT MIN(horsepower) FROM cars_data) AND t1.cylinders < 4
SELECT MAX(mpg) FROM cars_data WHERE cylinders = 8 OR year < 1980
SELECT MAX(mpg) FROM cars_data WHERE cylinders = 8 OR year < 1980
SELECT t1.model FROM car_names as t1 JOIN model_list as t2 ON t1.model = t2.model JOIN car_makers as t3 ON t2.maker = t3.id JOIN cars_data as t4 ON t1.makeid = t4.id WHERE t4.weight < 3500 EXCEPT SELECT t1.model FROM car_names as t1 JOIN model_list as t2 ON t1.model = t2.model JOIN car_makers as t3 ON t2.maker = t3.id WHERE t3.maker = "Ford Motor Company"
SELECT DISTINCT t3.model FROM car_names as t1 JOIN car_makers as t2 ON t1.makeid = t2.id JOIN model_list as t3 ON t1.model = t3.model WHERE t2.maker != "ford motor" AND t1.makeid IN ( SELECT makeid FROM car_names WHERE makeid IN ( SELECT t2.makeid FROM car_makers as t2 JOIN model_list as t3 ON t2.id = t3.maker WHERE t3.modelid = "3500" ) )
SELECT countryname FROM countries WHERE countryid NOT IN (SELECT country FROM car_makers)
SELECT countryname FROM countries WHERE countryid NOT IN (SELECT country FROM car_makers)
SELECT id , maker FROM car_makers GROUP BY id HAVING COUNT(*) >= 2 AND COUNT(*) >= 3
SELECT t1.id , t1.maker FROM car_makers as t1 JOIN model_list as t2 ON t1.id = t2.maker GROUP BY t2.maker HAVING COUNT(*) >= 2 INTERSECT SELECT t1.id , t1.maker FROM car_makers as t1 JOIN model_list as t2 ON t1.id = t2.maker GROUP BY t2.maker HAVING COUNT(*) > 3
SELECT t3.countryid , t3.countryname FROM car_makers as t1 JOIN model_list as t2 ON t1.id = t2.maker JOIN countries as t3 ON t1.country = t3.countryid GROUP BY t1.country HAVING COUNT(*) > 3 UNION SELECT t3.countryid , t3.countryname FROM car_makers as t1 JOIN model_list as t2 ON t1.id = t2.maker JOIN countries as t3 ON t1.country = t3.countryid WHERE t2.model = 'fiat'
SELECT t4.countryid , t4.countryname FROM car_names as t1 JOIN car_makers as t2 ON t1.makeid = t2.id JOIN model_list as t3 ON t3.maker = t2.id JOIN countries as t4 ON t2.country = t4.countryid GROUP BY t4.countryname HAVING COUNT(DISTINCT t2.maker) > 3 UNION SELECT t4.countryid , t4.countryname FROM car_names as t1 JOIN car_makers as t2 ON t1.makeid = t2.id JOIN model_list as t3 ON t3.maker = t2.id JOIN countries as t4 ON t2.country = t4.countryid WHERE t3.model = "fiat" GROUP BY t4.countryname
SELECT country FROM airlines WHERE airline = "JetBlue Airways"
SELECT t2.country FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.airline WHERE t2.airline = "Jetblue Airways"
SELECT abbreviation FROM airlines WHERE airline = "JetBlue Airways"
SELECT abbreviation FROM airlines WHERE airline = "Jetblue Airways"
SELECT airline , abbreviation FROM airlines WHERE country = 'USA'
SELECT airline , abbreviation FROM airlines WHERE country = 'USA'
SELECT airportcode , airportname FROM airports WHERE city = "Anthony"
SELECT airportcode , airportname FROM airports WHERE city = "Anthony"
SELECT COUNT(*) FROM airlines
SELECT COUNT(*) FROM airlines
SELECT COUNT(*) FROM airports
SELECT COUNT(*) FROM airports
SELECT COUNT(*) FROM flights
SELECT COUNT(*) FROM flights
SELECT airline FROM airlines WHERE abbreviation = 'UAL'
SELECT airline FROM airlines WHERE abbreviation = 'UAL'
SELECT COUNT(*) FROM airlines WHERE country = 'USA'
SELECT COUNT(*) FROM airlines WHERE country = 'USA'
SELECT city , country FROM airports WHERE airportname = "Alton"
SELECT city , country FROM airports WHERE airportname = "Alton"
SELECT airportname FROM airports WHERE airportcode = "AKO"
SELECT airportname FROM airports WHERE airportcode = 'AKO'
SELECT airportname FROM airports WHERE city = "Aberdeen"
SELECT airportname FROM airports WHERE city = "Aberdeen"
SELECT COUNT(*) FROM flights WHERE sourceairport = "APG"
SELECT COUNT(*) FROM flights WHERE sourceairport = "APG"
SELECT COUNT(*) FROM flights WHERE destairport = "ATO"
SELECT COUNT(*) FROM flights WHERE destairport = "ATO"
SELECT COUNT(*) FROM flights as t1 JOIN airports as t2 ON t1.sourceairport = t2.airportcode WHERE t2.city = "Aberdeen"
SELECT COUNT(*) FROM flights as t1 JOIN airports as t2 ON t1.sourceairport = t2.airportcode WHERE t2.city = 'Aberdeen'
SELECT COUNT(*) FROM flights as t1 JOIN airports as t2 ON t1.destairport = t2.airportcode WHERE t2.city = "Aberdeen"
SELECT COUNT(*) FROM flights as t1 JOIN airports as t2 ON t1.destairport = t2.airportcode WHERE t2.city = 'Aberdeen'
SELECT COUNT(*) FROM flights as t1 JOIN airports as t2 ON t1.sourceairport = t2.airportcode JOIN airports as t3 ON t1.destairport = t3.airportcode WHERE t2.city = 'Aberdeen' AND t3.city = 'Ashley'
SELECT COUNT(*) FROM flights as t1 JOIN airports as t2 ON t1.sourceairport = t2.airportcode WHERE t2.city = "Aberdeen" INTERSECT SELECT COUNT(*) FROM flights as t1 JOIN airports as t2 ON t1.destairport = t2.airportcode WHERE t2.city = "Ashley"
SELECT COUNT(*) FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.uid WHERE t2.airline = 'JetBlue Airways'
SELECT COUNT(*) FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.airline WHERE t2.airline = "Jetblue Airways"
SELECT COUNT(*) FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.airline WHERE t2.airline = 'United Airlines' AND t1.destairport = 'ASY'
SELECT COUNT(*) FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.airline WHERE t1.destairport = "ASY" AND t2.airline = "United Airlines"
SELECT COUNT(*) FROM airports as t1 JOIN flights as t2 ON t1.airportcode = t2.sourceairport JOIN airlines as t3 ON t2.airline = t3.airline WHERE t1.airportname = "Aberdeen" AND t3.airline = "United Airlines"
SELECT COUNT(*) FROM airlines as t1 JOIN flights as t2 ON t1.uid = t2.airline WHERE t1.airline = "United Airlines" AND t2.sourceairport = (SELECT t3.airportcode FROM airports as t3 WHERE t3.airportname = "AHD Airport")
SELECT COUNT(*) FROM airlines as t1 JOIN flights as t2 ON t1.uid = t2.airline JOIN airports as t3 ON t2.destairport = t3.airportcode WHERE t1.airline = "United Airlines" AND t3.city = "Aberdeen"
SELECT COUNT(*) FROM airlines as t1 JOIN flights as t2 ON t1.uid = t2.airline JOIN airports as t3 ON t2.destairport = t3.airportcode WHERE t1.airline = "United Airlines" AND t3.city = "Aberdeen"
SELECT t2.city FROM flights as t1 JOIN airports as t2 ON t1.destairport = t2.airportcode GROUP BY t2.city ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.city FROM flights as t1 JOIN airports as t2 ON t1.destairport = t2.airportcode GROUP BY t2.city ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.city FROM flights as t1 JOIN airports as t2 ON t1.sourceairport = t2.airportcode GROUP BY t2.city ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.city FROM flights as t1 JOIN airports as t2 ON t1.sourceairport = t2.airportcode GROUP BY t1.sourceairport ORDER BY COUNT(*) DESC LIMIT 1
SELECT sourceairport FROM flights GROUP BY sourceairport ORDER BY COUNT(*) DESC LIMIT 1
SELECT sourceairport FROM flights GROUP BY sourceairport ORDER BY COUNT(*) DESC LIMIT 1
SELECT sourceairport FROM flights GROUP BY sourceairport ORDER BY COUNT(*) LIMIT 1
SELECT sourceairport FROM flights GROUP BY sourceairport ORDER BY COUNT(*) LIMIT 1
SELECT t2.airline FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.uid GROUP BY t2.airline ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.airline FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.uid GROUP BY t2.airline ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.abbreviation , t2.country FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.airline GROUP BY t1.airline ORDER BY COUNT(*) LIMIT 1
SELECT t2.abbreviation , t2.country FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.airline GROUP BY t1.airline ORDER BY COUNT(*) LIMIT 1
SELECT t2.airline FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.airline_id JOIN airports as t3 ON t1.sourceairport = t3.airportcode WHERE t3.airportcode = 'AHD'
SELECT t2.airline FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.uid WHERE t1.sourceairport = "AHD"
SELECT DISTINCT t3.airline FROM airports as t1 JOIN flights as t2 ON t1.airportcode = t2.destairport JOIN airlines as t3 ON t2.airline = t3.airline WHERE t1.airportcode = "AHD"
SELECT t3.airline FROM airports as t1 JOIN flights as t2 ON t1.airportcode = t2.destairport JOIN airlines as t3 ON t2.airline = t3.airline WHERE t1.airportname = "Aberdeen"
SELECT t2.airline FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.airline WHERE t1.sourceairport = 'APG' INTERSECT SELECT t2.airline FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.airline WHERE t1.sourceairport = 'CVO'
SELECT t2.airline FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.airline WHERE t1.sourceairport = 'APG' INTERSECT SELECT t2.airline FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.airline WHERE t1.sourceairport = 'CVO'
SELECT DISTINCT t2.airline FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.uid WHERE t1.sourceairport = 'CVO' EXCEPT SELECT DISTINCT t2.airline FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.uid WHERE t1.sourceairport = 'APG'
SELECT airline FROM flights WHERE sourceairport = "CVO" EXCEPT SELECT airline FROM flights WHERE sourceairport = "APG"
SELECT t2.airline FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.uid GROUP BY t2.airline HAVING COUNT(*) >= 10
SELECT t2.airline FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.uid GROUP BY t2.airline HAVING COUNT(*) >= 10
SELECT t2.airline FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.uid GROUP BY t2.airline HAVING COUNT(*) < 200
SELECT t2.airline FROM flights as t1 JOIN airlines as t2 ON t1.airline = t2.uid GROUP BY t2.airline HAVING COUNT(*) < 200
SELECT flightno FROM flights WHERE airline IN ( SELECT uid FROM airlines WHERE airline = "United Airlines" )
SELECT flightno FROM flights WHERE airline IN ( SELECT airline FROM airlines WHERE airline = "United Airlines" )
SELECT flightno FROM flights WHERE sourceairport = "APG"
SELECT flightno FROM flights WHERE sourceairport = "APG"
SELECT flightno FROM flights WHERE destairport = "APG"
SELECT flightno FROM flights WHERE destairport = "APG"
SELECT t1.flightno FROM flights as t1 JOIN airports as t2 ON t1.sourceairport = t2.airportcode WHERE t2.city = "Aberdeen"
SELECT t1.flightno FROM flights as t1 JOIN airports as t2 ON t1.sourceairport = t2.airportcode WHERE t2.city = 'Aberdeen'
SELECT flightno FROM flights as t1 JOIN airports as t2 ON t1.destairport = t2.airportcode WHERE t2.city = "Aberdeen"
SELECT t1.flightno FROM flights as t1 JOIN airports as t2 ON t1.destairport = t2.airportcode WHERE t2.city = 'Aberdeen'
SELECT COUNT(*) FROM flights as t1 JOIN airports as t2 ON t1.destairport = t2.airportcode WHERE t2.city = 'Aberdeen' OR t2.city = 'Abilene'
SELECT COUNT(*) FROM flights as t1 JOIN airports as t2 ON t1.destairport = t2.airportcode WHERE t2.city = 'Aberdeen' OR t2.city = 'Abilene'
SELECT airportname FROM airports WHERE airportcode NOT IN (SELECT sourceairport FROM flights) AND airportcode NOT IN (SELECT destairport FROM flights)
SELECT airportcode FROM airports EXCEPT SELECT sourceairport FROM flights UNION SELECT destairport FROM flights
SELECT COUNT(*) FROM employee
SELECT COUNT(*) FROM employee
SELECT name FROM employee ORDER BY age ASC
SELECT name FROM employee ORDER BY age ASC
SELECT city , COUNT(*) FROM employee GROUP BY city
SELECT COUNT(*) , city FROM employee GROUP BY city
SELECT city FROM employee WHERE age < 30 GROUP BY city HAVING COUNT(*) > 1
SELECT city FROM employee WHERE age < 30 GROUP BY city HAVING COUNT(*) > 1
SELECT location , COUNT(*) FROM shop GROUP BY location
SELECT location , COUNT(*) FROM shop GROUP BY location
SELECT manager_name , district FROM shop ORDER BY number_products DESC LIMIT 1
SELECT manager_name , district FROM shop ORDER BY number_products DESC LIMIT 1
SELECT MIN(number_products) , MAX(number_products) FROM shop
SELECT MIN(number_products) , MAX(number_products) FROM shop
SELECT name , location , district FROM shop ORDER BY number_products DESC
SELECT name , location , district FROM shop ORDER BY number_products DESC
SELECT name FROM shop WHERE number_products > (SELECT AVG(number_products) FROM shop)
SELECT name FROM shop WHERE number_products > (SELECT AVG(number_products) FROM shop)
SELECT t2.name FROM evaluation as t1 JOIN employee as t2 ON t1.employee_id = t2.employee_id GROUP BY t1.employee_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.name FROM employee as t1 JOIN evaluation as t2 ON t1.employee_id = t2.employee_id GROUP BY t1.employee_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.name FROM employee as t1 JOIN evaluation as t2 ON t1.employee_id = t2.employee_id ORDER BY t2.bonus DESC LIMIT 1
SELECT t1.name FROM employee as t1 JOIN evaluation as t2 ON t1.employee_id = t2.employee_id ORDER BY t2.bonus DESC LIMIT 1
SELECT name FROM employee WHERE employee_id NOT IN (SELECT employee_id FROM evaluation)
SELECT name FROM employee WHERE employee_id NOT IN (SELECT employee_id FROM evaluation)
SELECT t1.name FROM shop as t1 JOIN hiring as t2 ON t1.shop_id = t2.shop_id GROUP BY t1.shop_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.name FROM shop as t1 JOIN hiring as t2 ON t1.shop_id = t2.shop_id GROUP BY t1.shop_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM shop WHERE shop_id NOT IN (SELECT shop_id FROM hiring)
SELECT name FROM shop WHERE shop_id NOT IN (SELECT shop_id FROM hiring)
SELECT COUNT(*) , t1.name FROM shop as t1 JOIN hiring as t2 ON t1.shop_id = t2.shop_id GROUP BY t1.name
SELECT COUNT(*) , t1.name FROM shop as t1 JOIN hiring as t2 ON t1.shop_id = t2.shop_id GROUP BY t1.shop_id
SELECT SUM(bonus) FROM evaluation
SELECT SUM(bonus) FROM evaluation
SELECT * FROM hiring
SELECT * FROM hiring
SELECT district FROM shop WHERE number_products < 3000 INTERSECT SELECT district FROM shop WHERE number_products > 10000
SELECT district FROM shop WHERE number_products < 3000 INTERSECT SELECT district FROM shop WHERE number_products > 10000
SELECT COUNT(DISTINCT location) FROM shop
SELECT COUNT(DISTINCT location) FROM shop
SELECT COUNT(*) FROM documents
SELECT COUNT(*) FROM documents
SELECT document_id , document_name , document_description FROM documents
SELECT document_id , document_name , document_description FROM documents
SELECT t1.document_name , t2.template_id FROM documents as t1 JOIN templates as t2 ON t1.template_id = t2.template_id WHERE t1.document_description LIKE '%w%'
SELECT document_name , template_id FROM documents WHERE document_description LIKE "%w%"
SELECT document_id , template_id , document_description FROM documents WHERE document_name = "Robbin CV"
SELECT document_id , template_id , document_description FROM documents WHERE document_name = "Robbin CV"
SELECT COUNT(DISTINCT templates.template_id) FROM templates as t1 JOIN documents as t2 ON t1.template_id = t2.template_id
SELECT COUNT(DISTINCT templates.template_id) FROM templates as t1 JOIN documents as t2 ON t1.template_id = t2.template_id
SELECT COUNT(*) FROM templates as t1 JOIN documents as t2 ON t1.template_id = t2.template_id WHERE t1.template_type_code = 'PPT'
SELECT COUNT(*) FROM templates as t1 JOIN documents as t2 ON t1.template_id = t2.template_id WHERE t1.template_type_code = "PP"
SELECT t1.template_id , COUNT(*) FROM templates as t1 JOIN documents as t2 ON t1.template_id = t2.template_id GROUP BY t1.template_id
SELECT template_id , COUNT(*) FROM documents GROUP BY template_id
SELECT t1.template_id , t1.template_type_code FROM templates as t1 JOIN documents as t2 ON t1.template_id = t2.template_id GROUP BY t1.template_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.template_id , t1.template_type_code FROM templates as t1 JOIN documents as t2 ON t1.template_id = t2.template_id GROUP BY t1.template_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.template_id FROM templates as t1 JOIN documents as t2 ON t1.template_id = t2.template_id GROUP BY t1.template_id HAVING COUNT(*) > 1
SELECT t1.template_id FROM templates as t1 JOIN documents as t2 ON t1.template_id = t2.template_id GROUP BY t1.template_id HAVING COUNT(*) > 1
SELECT template_id FROM templates EXCEPT SELECT template_id FROM documents
SELECT template_id FROM templates EXCEPT SELECT template_id FROM documents
SELECT COUNT(*) FROM templates
SELECT COUNT(*) FROM templates
SELECT template_id , version_number , template_type_code FROM templates
SELECT template_id , version_number , template_type_code FROM templates
SELECT DISTINCT template_type_code FROM templates
SELECT DISTINCT template_type_code FROM templates
SELECT template_id FROM templates WHERE template_type_code = "PP" OR template_type_code = "PPT"
SELECT template_id FROM templates WHERE template_type_code = "PP" OR template_type_code = "PPT"
SELECT COUNT(*) FROM templates WHERE template_type_code = "CV"
SELECT COUNT(*) FROM templates WHERE template_type_code = "CV"
SELECT version_number , template_type_code FROM templates WHERE version_number > 5
SELECT version_number , template_type_code FROM templates WHERE version_number > 5
SELECT template_type_code , COUNT(*) FROM templates GROUP BY template_type_code
SELECT template_type_code , COUNT(*) FROM templates GROUP BY template_type_code
SELECT template_type_code FROM templates GROUP BY template_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT template_type_code FROM templates GROUP BY template_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT template_type_code FROM templates GROUP BY template_type_code HAVING COUNT(*) < 3
SELECT template_type_code FROM templates GROUP BY template_type_code HAVING COUNT(*) < 3
SELECT version_number , template_type_code FROM templates ORDER BY version_number ASC LIMIT 1
SELECT MIN(version_number) , template_type_code FROM templates
SELECT t2.template_type_code FROM documents as t1 JOIN templates as t2 ON t1.template_id = t2.template_id WHERE document_name = "Data base"
SELECT t1.template_type_code FROM templates as t1 JOIN documents as t2 ON t1.template_id = t2.template_id WHERE t2.document_name = "Data base"
SELECT t2.document_name FROM templates as t1 JOIN documents as t2 ON t1.template_id = t2.template_id WHERE t1.template_type_code = "BK"
SELECT document_name FROM documents as t1 JOIN templates as t2 ON t1.template_id = t2.template_id WHERE t2.template_type_code = "BK"
SELECT t1.template_type_code , COUNT(*) FROM templates as t1 JOIN documents as t2 ON t1.template_id = t2.template_id GROUP BY t1.template_type_code
SELECT t1.template_type_code , COUNT(*) FROM templates as t1 JOIN documents as t2 ON t1.template_id = t2.template_id GROUP BY t1.template_type_code
SELECT t1.template_type_code FROM templates as t1 JOIN documents as t2 ON t1.template_id = t2.template_id GROUP BY t1.template_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.template_type_code FROM documents as t1 JOIN templates as t2 ON t1.template_id = t2.template_id GROUP BY t2.template_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT template_type_code FROM templates EXCEPT SELECT t1.template_type_code FROM documents as t1 JOIN templates as t2 ON t1.template_id = t2.template_id
SELECT template_type_code FROM ref_template_types WHERE template_type_code NOT IN (SELECT t1.template_type_code FROM templates as t1 JOIN documents as t2 ON t1.template_id = t2.template_id)
SELECT template_type_code , template_type_description FROM ref_template_types
SELECT template_type_code , template_type_description FROM ref_template_types
SELECT t1.template_type_description FROM ref_template_types as t1 JOIN templates as t2 ON t1.template_type_code = t2.template_type_code WHERE t2.template_type_code = "AD"
SELECT t1.template_type_description FROM ref_template_types as t1 JOIN templates as t2 ON t1.template_type_code = t2.template_type_code WHERE t2.template_type_code = "AD" GROUP BY t2.template_type_code
SELECT template_type_code FROM ref_template_types WHERE template_type_description = "Book"
SELECT template_type_code FROM ref_template_types WHERE template_type_description = "Book"
SELECT DISTINCT t1.template_type_description FROM ref_template_types as t1 JOIN templates as t2 ON t1.template_type_code = t2.template_type_code JOIN documents as t3 ON t3.template_id = t2.template_id
SELECT DISTINCT t1.document_description FROM documents as t1 JOIN templates as t2 ON t1.template_id = t2.template_id
SELECT t1.template_id FROM ref_template_types as t2 JOIN templates as t1 ON t1.template_type_code = t2.template_type_code WHERE t2.template_type_description = "Presentation"
SELECT template_id FROM ref_template_types as t1 JOIN templates as t2 ON t1.template_type_code = t2.template_type_code WHERE t1.template_type_description = 'Presentation'
SELECT COUNT(*) FROM paragraphs
SELECT COUNT(*) FROM paragraphs
SELECT COUNT(*) FROM paragraphs as t1 JOIN documents as t2 ON t1.document_id = t2.document_id WHERE t2.document_name = 'Summer Show'
SELECT COUNT(*) FROM documents as t1 JOIN paragraphs as t2 ON t1.document_id = t2.document_id WHERE t1.document_name = "Summer Show"
SELECT other_details FROM paragraphs WHERE paragraph_text = "Korea "
SELECT other_details FROM paragraphs WHERE paragraph_text LIKE '%Korea%'
SELECT t1.paragraph_id , t1.paragraph_text FROM paragraphs as t1 JOIN documents as t2 ON t1.document_id = t2.document_id WHERE t2.document_name = "Welcome to NY"
SELECT t1.paragraph_id , t1.paragraph_text FROM paragraphs as t1 JOIN documents as t2 ON t1.document_id = t2.document_id WHERE t2.document_name = "Welcome to NY"
SELECT t1.paragraph_text FROM paragraphs as t1 JOIN documents as t2 ON t1.document_id = t2.document_id WHERE t2.document_name = "Customer reviews"
SELECT t2.paragraph_text FROM documents as t1 JOIN paragraphs as t2 ON t1.document_id = t2.document_id WHERE t1.document_name = "Customer reviews"
SELECT t2.document_id , COUNT(*) FROM paragraphs as t1 JOIN documents as t2 ON t1.document_id = t2.document_id GROUP BY t2.document_id ORDER BY t2.document_id
SELECT document_id , COUNT(*) FROM paragraphs GROUP BY document_id ORDER BY document_id
SELECT t2.document_id , t2.document_name , COUNT(*) FROM paragraphs as t1 JOIN documents as t2 ON t1.document_id = t2.document_id GROUP BY t2.document_id
SELECT t2.document_id , t2.document_name , COUNT(*) FROM paragraphs as t1 JOIN documents as t2 ON t1.document_id = t2.document_id GROUP BY t2.document_id
SELECT document_id FROM paragraphs GROUP BY document_id HAVING COUNT(*) >= 2
SELECT document_id FROM paragraphs GROUP BY document_id HAVING COUNT(*) >= 2
SELECT t2.document_id , t2.document_name FROM paragraphs as t1 JOIN documents as t2 ON t1.document_id = t2.document_id GROUP BY t1.document_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.document_id , t2.document_name FROM paragraphs as t1 JOIN documents as t2 ON t1.document_id = t2.document_id GROUP BY t1.document_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT document_id FROM paragraphs GROUP BY document_id ORDER BY COUNT(*) LIMIT 1
SELECT document_id FROM paragraphs GROUP BY document_id ORDER BY COUNT(*) LIMIT 1
SELECT document_id FROM paragraphs GROUP BY document_id HAVING COUNT(*) >= 1 AND COUNT(*) <= 2
SELECT document_id FROM paragraphs GROUP BY document_id HAVING COUNT(*) BETWEEN 1 AND 2
SELECT t1.document_id FROM paragraphs as t1 JOIN documents as t2 ON t1.document_id = t2.document_id WHERE t1.paragraph_text = 'Brazil' INTERSECT SELECT t1.document_id FROM paragraphs as t1 JOIN documents as t2 ON t1.document_id = t2.document_id WHERE t1.paragraph_text = 'Ireland'
SELECT t1.paragraph_id FROM paragraphs as t1 JOIN documents as t2 ON t1.document_id = t2.document_id WHERE t1.paragraph_text = 'Brazil' INTERSECT SELECT t1.paragraph_id FROM paragraphs as t1 JOIN documents as t2 ON t1.document_id = t2.document_id WHERE t1.paragraph_text = 'Ireland'
SELECT COUNT(*) FROM teacher
SELECT COUNT(*) FROM teacher
SELECT name FROM teacher ORDER BY age ASC
SELECT name FROM teacher ORDER BY age ASC
SELECT age , hometown FROM teacher
SELECT age , hometown FROM teacher
SELECT name FROM teacher WHERE hometown != 'Little Lever Urban District'
SELECT name FROM teacher WHERE hometown != 'Little Lever Urban District'
SELECT name FROM teacher WHERE age = 32 OR age = 33
SELECT name FROM teacher WHERE age = 32 OR age = 33
SELECT hometown FROM teacher ORDER BY age ASC LIMIT 1
SELECT hometown FROM teacher ORDER BY age ASC LIMIT 1
SELECT hometown , COUNT(*) FROM teacher GROUP BY hometown
SELECT hometown , COUNT(*) FROM teacher GROUP BY hometown
SELECT hometown FROM teacher GROUP BY hometown ORDER BY COUNT(*) DESC LIMIT 1
SELECT hometown FROM teacher GROUP BY hometown ORDER BY COUNT(*) DESC LIMIT 1
SELECT hometown FROM teacher GROUP BY hometown HAVING COUNT(*) >= 2
SELECT hometown FROM teacher GROUP BY hometown HAVING COUNT(*) >= 2
SELECT t1.name , t3.course FROM teacher as t1 JOIN course_arrange as t2 ON t1.teacher_id = t2.teacher_id JOIN course as t3 ON t2.course_id = t3.course_id
SELECT t1.name , t3.course FROM teacher as t1 JOIN course_arrange as t2 ON t1.teacher_id = t2.teacher_id JOIN course as t3 ON t2.course_id = t3.course_id
SELECT t1.name , t3.course FROM teacher as t1 JOIN course_arrange as t2 ON t1.teacher_id = t2.teacher_id JOIN course as t3 ON t2.course_id = t3.course_id ORDER BY t1.name
SELECT t1.name , t3.course FROM teacher as t1 JOIN course_arrange as t2 ON t1.teacher_id = t2.teacher_id JOIN course as t3 ON t2.course_id = t3.course_id ORDER BY t1.name
SELECT t1.name FROM teacher as t1 JOIN course_arrange as t2 ON t1.teacher_id = t2.teacher_id JOIN course as t3 ON t2.course_id = t3.course_id WHERE t3.course = 'Math'
SELECT t1.name FROM teacher as t1 JOIN course_arrange as t2 ON t1.teacher_id = t2.teacher_id JOIN course as t3 ON t3.course_id = t2.course_id WHERE t3.course = 'Math'
SELECT t1.name , COUNT(*) FROM teacher as t1 JOIN course_arrange as t2 ON t1.teacher_id = t2.teacher_id GROUP BY t1.name
SELECT t1.name , COUNT(*) FROM teacher as t1 JOIN course_arrange as t2 ON t1.teacher_id = t2.teacher_id GROUP BY t1.name
SELECT t1.name FROM teacher as t1 JOIN course_arrange as t2 ON t1.teacher_id = t2.teacher_id GROUP BY t2.teacher_id HAVING COUNT(*) >= 2
SELECT t1.name FROM teacher as t1 JOIN course_arrange as t2 ON t1.teacher_id = t2.teacher_id GROUP BY t2.teacher_id HAVING COUNT(*) >= 2
SELECT name FROM teacher WHERE teacher_id NOT IN (SELECT teacher_id FROM course_arrange)
SELECT name FROM teacher WHERE teacher_id NOT IN (SELECT teacher_id FROM course_arrange)
SELECT COUNT(*) FROM visitor WHERE age < 30
SELECT name FROM visitor WHERE level_of_membership > 4 ORDER BY level_of_membership DESC
SELECT AVG(age) FROM visitor WHERE level_of_membership <= 4
SELECT name , level_of_membership FROM visitor WHERE level_of_membership > 4 ORDER BY age DESC
SELECT museum_id , name FROM museum ORDER BY num_of_staff DESC LIMIT 1
SELECT AVG(num_of_staff) FROM museum WHERE open_year < 2009
SELECT open_year , num_of_staff FROM museum WHERE name = "Plaza Museum"
SELECT name FROM museum WHERE num_of_staff > (SELECT MIN(num_of_staff) FROM museum WHERE open_year > 2010)
SELECT t1.id , t1.name , t1.age FROM visitor as t1 JOIN visit as t2 ON t1.id = t2.visitor_id GROUP BY t2.visitor_id HAVING COUNT(*) > 1
SELECT t1.id , t1.name , t1.level_of_membership FROM visitor as t1 JOIN visit as t2 ON t1.id = t2.visitor_id ORDER BY t2.total_spent DESC LIMIT 1
SELECT t1.museum_id , t1.name FROM museum as t1 JOIN visit as t2 ON t1.museum_id = t2.museum_id GROUP BY t1.museum_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM museum WHERE museum_id NOT IN (SELECT museum_id FROM visit)
SELECT t1.name , t1.age FROM visitor as t1 JOIN visit as t2 ON t1.id = t2.visitor_id ORDER BY t2.num_of_ticket DESC LIMIT 1
SELECT AVG(num_of_ticket) , MAX(num_of_ticket) FROM visit
SELECT SUM(t2.num_of_ticket) FROM visitor as t1 JOIN visit as t2 ON t1.id = t2.visitor_id WHERE t1.level_of_membership = 1
SELECT t1.name FROM visitor as t1 JOIN visit as t2 ON t1.id = t2.visitor_id JOIN museum as t3 ON t3.museum_id = t2.museum_id WHERE t3.open_year < 2009 INTERSECT SELECT t1.name FROM visitor as t1 JOIN visit as t2 ON t1.id = t2.visitor_id JOIN museum as t3 ON t3.museum_id = t2.museum_id WHERE t3.open_year > 2011
SELECT COUNT(*) FROM visitor WHERE id NOT IN (SELECT t1.visitor_id FROM visit as t1 JOIN museum as t2 ON t1.museum_id = t2.museum_id WHERE t2.open_year > 2010)
SELECT COUNT(*) FROM museum WHERE open_year > 2013 OR open_year < 2008
SELECT COUNT(*) FROM players
SELECT COUNT(*) FROM players
SELECT COUNT(*) FROM matches
SELECT COUNT(*) FROM matches
SELECT first_name , birth_date FROM players WHERE country_code = "USA"
SELECT first_name , birth_date FROM players WHERE country_code = "USA"
SELECT AVG(loser_age) , AVG(winner_age) FROM matches
SELECT AVG(loser_age) , AVG(winner_age) FROM matches
SELECT AVG(winner_rank) FROM matches
SELECT AVG(winner_rank) FROM matches
SELECT MAX(loser_rank) FROM matches
SELECT MIN(loser_rank) FROM matches
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10
SELECT DISTINCT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10
SELECT DISTINCT winner_name FROM matches WHERE tourney_date LIKE "2013%" INTERSECT SELECT DISTINCT winner_name FROM matches WHERE tourney_date LIKE "2016%"
SELECT DISTINCT winner_name FROM matches WHERE tourney_date LIKE "2013%" INTERSECT SELECT DISTINCT winner_name FROM matches WHERE tourney_date LIKE "2016%"
SELECT COUNT(*) FROM matches WHERE year = 2013 OR year = 2016
SELECT COUNT(*) FROM matches WHERE year = 2013 OR year = 2016
SELECT t1.country_code , t1.first_name FROM players as t1 JOIN matches as t2 ON t1.player_id = t2.winner_id WHERE t2.tourney_name = "WTA Championships" INTERSECT SELECT t1.country_code , t1.first_name FROM players as t1 JOIN matches as t2 ON t1.player_id = t2.winner_id WHERE t2.tourney_name = "Australian Open"
SELECT t1.first_name , t1.country_code FROM players as t1 JOIN matches as t2 ON t1.player_id = t2.winner_id WHERE t2.tourney_name = "WTA Championships" INTERSECT SELECT t1.first_name , t1.country_code FROM players as t1 JOIN matches as t2 ON t1.player_id = t2.winner_id WHERE t2.tourney_name = "Australian Open"
SELECT first_name , country_code FROM players ORDER BY birth_date DESC LIMIT 1
SELECT first_name , country_code FROM players ORDER BY birth_date DESC LIMIT 1
SELECT first_name , last_name FROM players ORDER BY birth_date
SELECT first_name , last_name FROM players ORDER BY birth_date
SELECT first_name , last_name FROM players WHERE hand = "L" ORDER BY birth_date
SELECT first_name , last_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT t1.first_name , t1.country_code FROM players as t1 JOIN rankings as t2 ON t1.player_id = t2.player_id GROUP BY t1.player_id ORDER BY SUM(tours) DESC LIMIT 1
SELECT t1.first_name , t1.country_code FROM players as t1 JOIN rankings as t2 ON t1.player_id = t2.player_id GROUP BY t1.player_id ORDER BY SUM(tours) DESC LIMIT 1
SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1
SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.winner_name , t2.ranking_points FROM matches as t1 JOIN rankings as t2 ON t1.winner_id = t2.player_id GROUP BY t1.winner_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT winner_name , winner_rank_points FROM matches GROUP BY winner_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT winner_name FROM matches WHERE tourney_name = "Australian Open" ORDER BY winner_rank_points DESC LIMIT 1
SELECT winner_name FROM matches WHERE tourney_name = "Australian Open" ORDER BY winner_rank_points DESC LIMIT 1
SELECT loser_name , winner_name FROM matches ORDER BY minutes DESC LIMIT 1
SELECT winner_name , loser_name FROM matches ORDER BY minutes DESC LIMIT 1
SELECT AVG(t1.ranking) , t2.first_name FROM players as t2 JOIN rankings as t1 ON t2.player_id = t1.player_id GROUP BY t2.first_name
SELECT t1.first_name , AVG(t2.ranking) FROM players as t1 JOIN rankings as t2 ON t1.player_id = t2.player_id GROUP BY t1.first_name
SELECT SUM(t2.ranking_points) , t1.first_name FROM players as t1 JOIN rankings as t2 ON t1.player_id = t2.player_id GROUP BY t1.first_name
SELECT t1.first_name , SUM(t2.ranking_points) FROM players as t1 JOIN rankings as t2 ON t1.player_id = t2.player_id GROUP BY t1.player_id
SELECT country_code , COUNT(*) FROM players GROUP BY country_code
SELECT country_code , COUNT(*) FROM players GROUP BY country_code
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50
SELECT ranking_date , SUM(tours) FROM rankings GROUP BY ranking_date
SELECT ranking_date , SUM(tours) FROM rankings GROUP BY ranking_date
SELECT COUNT(*) , year FROM matches GROUP BY year
SELECT COUNT(*) , year FROM matches GROUP BY year
SELECT t1.first_name , t1.last_name , t1.rank FROM players as t1 JOIN matches as t2 ON t1.player_id = t2.winner_id ORDER BY t2.winner_age LIMIT 3
SELECT t1.first_name , t1.last_name , t1.rank FROM players as t1 JOIN matches as t2 ON t1.player_id = t2.winner_id ORDER BY t2.winner_age LIMIT 3
SELECT COUNT(DISTINCT winner_name) FROM matches WHERE tourney_name = "WTA Championships" AND winner_hand = "L"
SELECT COUNT(*) FROM matches WHERE winner_hand = "L" AND tourney_name = "WTA Championships"
SELECT t2.first_name , t2.country_code , t2.birth_date FROM matches as t1 JOIN players as t2 ON t1.winner_id = t2.player_id ORDER BY t1.winner_rank_points DESC LIMIT 1
SELECT t2.first_name , t2.country_code , t2.birth_date FROM matches as t1 JOIN players as t2 ON t1.winner_id = t2.player_id GROUP BY t1.winner_id ORDER BY SUM(t1.winner_rank_points) DESC LIMIT 1
SELECT hand , COUNT(*) FROM players GROUP BY hand
SELECT hand , COUNT(*) FROM players GROUP BY hand
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured'
SELECT name , tonnage FROM ship ORDER BY name DESC
SELECT name , date , result FROM battle
SELECT MAX(killed) , MIN(killed) FROM death
SELECT AVG(injured) FROM death
SELECT t2.killed , t2.injured FROM ship as t1 JOIN death as t2 ON t1.id = t2.caused_by_ship_id WHERE t1.tonnage = "t"
SELECT name , result FROM battle WHERE bulgarian_commander != 'Boril'
SELECT DISTINCT t1.id , t1.name FROM battle as t1 JOIN ship as t2 ON t1.id = t2.lost_in_battle WHERE t2.ship_type = 'Brig'
SELECT t1.id , t1.name FROM ship as t1 JOIN death as t2 ON t1.id = t2.caused_by_ship_id GROUP BY t1.id HAVING SUM(t2.killed) > 10
SELECT t1.id , t1.name FROM ship as t1 JOIN death as t2 ON t1.id = t2.caused_by_ship_id GROUP BY t1.id ORDER BY SUM(t2.injured) DESC LIMIT 1
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I'
SELECT COUNT(DISTINCT result) FROM battle
SELECT COUNT(*) FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE tonnage = '225')
SELECT t1.name , t1.date FROM battle as t1 JOIN ship as t2 ON t1.id = t2.lost_in_battle WHERE t2.name = 'Lettice' INTERSECT SELECT t1.name , t1.date FROM battle as t1 JOIN ship as t2 ON t1.id = t2.lost_in_battle WHERE t2.name = 'HMS Atalanta'
SELECT t1.name , t1.result , t1.bulgarian_commander FROM battle as t1 JOIN ship as t2 ON t1.id = t2.lost_in_battle WHERE t2.location != "English Channel" EXCEPT SELECT t1.name , t1.result , t1.bulgarian_commander FROM battle as t1 JOIN ship as t2 ON t1.id = t2.lost_in_battle WHERE t2.location = "English Channel"
SELECT note FROM death WHERE note LIKE '%East%'
SELECT line_1 , line_2 FROM addresses
SELECT line_1 , line_2 FROM addresses
SELECT COUNT(*) FROM courses
SELECT COUNT(*) FROM courses
SELECT course_description FROM courses WHERE course_name = "math"
SELECT t1.section_description FROM sections as t1 JOIN courses as t2 ON t1.course_id = t2.course_id WHERE t2.course_name = 'math'
SELECT zip_postcode FROM addresses WHERE city = "Port Chelsea"
SELECT zip_postcode FROM addresses WHERE city = "Port Chelsea"
SELECT t1.department_name , t1.department_id FROM departments as t1 JOIN degree_programs as t2 ON t1.department_id = t2.department_id GROUP BY t1.department_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT degree_summary_name , department_id FROM degree_programs GROUP BY department_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT department_id) FROM degree_programs
SELECT COUNT(DISTINCT department_id) FROM degree_programs
SELECT COUNT(DISTINCT degree_summary_name) FROM degree_programs
SELECT COUNT(DISTINCT degree_summary_name) FROM degree_programs
SELECT COUNT(*) FROM departments as t1 JOIN degree_programs as t2 ON t1.department_id = t2.department_id WHERE t1.department_name = "engineering"
SELECT COUNT(*) FROM departments as t1 JOIN degree_programs as t2 ON t1.department_id = t2.department_id WHERE t1.department_name = "engineering"
SELECT section_name , section_description FROM sections
SELECT section_name , section_description FROM sections
SELECT t2.course_name , t1.course_id FROM sections as t1 JOIN courses as t2 ON t1.course_id = t2.course_id GROUP BY t1.course_id HAVING COUNT(*) <= 2
SELECT t2.course_name , t2.course_id FROM sections as t1 JOIN courses as t2 ON t1.course_id = t2.course_id GROUP BY t1.course_id HAVING COUNT(*) < 2
SELECT section_name FROM sections ORDER BY section_name DESC
SELECT section_name FROM sections ORDER BY section_name DESC
SELECT t1.semester_name , t1.semester_id FROM semesters as t1 JOIN student_enrolment as t2 ON t1.semester_id = t2.semester_id GROUP BY t1.semester_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.semester_name , t1.semester_id FROM semesters as t1 JOIN student_enrolment as t2 ON t1.semester_id = t2.semester_id GROUP BY t1.semester_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT department_description FROM departments WHERE department_name LIKE '%the computer%'
SELECT department_description FROM departments WHERE department_name LIKE "%computer%"
SELECT t1.first_name , t1.middle_name , t1.last_name , t1.student_id FROM students as t1 JOIN student_enrolment as t2 ON t1.student_id = t2.student_id WHERE t2.semester_id = 2 GROUP BY t1.student_id HAVING COUNT(*) = 2
SELECT t1.first_name , t1.middle_name , t1.last_name , t1.student_id FROM students as t1 JOIN student_enrolment as t2 ON t1.student_id = t2.student_id GROUP BY t2.semester_id HAVING COUNT(*) = 2
SELECT t3.first_name , t3.middle_name , t3.last_name FROM degree_programs as t1 JOIN student_enrolment as t2 ON t1.degree_program_id = t2.degree_program_id JOIN students as t3 ON t2.student_id = t3.student_id WHERE t1.degree_summary_name = "Bachelor"
SELECT t3.first_name , t3.middle_name , t3.last_name FROM student_enrolment as t1 JOIN degree_programs as t2 ON t1.degree_program_id = t2.degree_program_id JOIN students as t3 ON t1.student_id = t3.student_id WHERE t2.degree_summary_name = "Bachelors"
SELECT t1.degree_summary_name FROM degree_programs as t1 JOIN student_enrolment as t2 ON t1.degree_program_id = t2.degree_program_id GROUP BY t1.degree_summary_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.degree_summary_name FROM student_enrolment as t1 JOIN degree_programs as t2 ON t1.degree_program_id = t2.degree_program_id GROUP BY t1.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT degree_program_id , degree_summary_name FROM degree_programs GROUP BY degree_program_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.degree_program_id , t2.degree_summary_name FROM student_enrolment as t1 JOIN degree_programs as t2 ON t1.degree_program_id = t2.degree_program_id GROUP BY t1.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.student_id , t2.first_name , t2.middle_name , t2.last_name , COUNT(*) , t1.student_id FROM student_enrolment as t1 JOIN students as t2 ON t1.student_id = t2.student_id GROUP BY t1.student_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.student_id , t2.first_name , t2.middle_name , t2.last_name , COUNT(*) FROM student_enrolment as t1 JOIN students as t2 ON t1.student_id = t2.student_id GROUP BY t1.student_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT semester_name FROM semesters WHERE semester_id NOT IN (SELECT semester_id FROM student_enrolment)
SELECT semester_name FROM semesters WHERE semester_id NOT IN (SELECT semester_id FROM student_enrolment)
SELECT DISTINCT t2.course_name FROM student_enrolment_courses as t1 JOIN courses as t2 ON t1.course_id = t2.course_id
SELECT t1.course_name FROM courses as t1 JOIN student_enrolment_courses as t2 ON t1.course_id = t2.course_id
SELECT t2.course_name FROM student_enrolment_courses as t1 JOIN courses as t2 ON t1.course_id = t2.course_id GROUP BY t1.course_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.course_name FROM student_enrolment_courses as t1 JOIN courses as t2 ON t1.course_id = t2.course_id GROUP BY t1.course_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.last_name FROM addresses as t1 JOIN students as t2 ON t1.address_id = t2.current_address_id WHERE t1.state_province_county = "North Carolina" EXCEPT SELECT t2.last_name FROM addresses as t1 JOIN students as t2 ON t1.address_id = t2.current_address_id JOIN student_enrolment as t3 ON t2.student_id = t3.student_id
SELECT t2.last_name FROM addresses as t1 JOIN students as t2 ON t1.address_id = t2.current_address_id WHERE t1.state_province_county = "North Carolina" EXCEPT SELECT t2.last_name FROM addresses as t1 JOIN students as t2 ON t1.address_id = t2.current_address_id JOIN student_enrolment as t3 ON t2.student_id = t3.student_id
SELECT t1.transcript_date , t1.transcript_id FROM transcripts as t1 JOIN transcript_contents as t2 ON t1.transcript_id = t2.transcript_id GROUP BY t1.transcript_id HAVING COUNT(*) >= 2
SELECT t2.transcript_date , t2.transcript_id FROM transcript_contents as t1 JOIN transcripts as t2 ON t1.transcript_id = t2.transcript_id GROUP BY t2.transcript_id HAVING COUNT(*) >= 2
SELECT cell_mobile_number FROM students WHERE first_name = "Timmothy" AND last_name = "Ward"
SELECT cell_mobile_number FROM students WHERE first_name = "Timmothy" AND last_name = "Ward"
SELECT first_name , middle_name , last_name FROM students ORDER BY date_first_registered LIMIT 1
SELECT first_name , middle_name , last_name FROM students ORDER BY date_first_registered LIMIT 1
SELECT first_name , middle_name , last_name FROM students WHERE date_left = (SELECT MIN(date_left) FROM students)
SELECT first_name , middle_name , last_name FROM students WHERE date_first_registered = (SELECT MIN(date_first_registered) FROM students)
SELECT t2.first_name FROM addresses as t1 JOIN students as t2 ON t1.address_id = t2.permanent_address_id WHERE t1.address_id NOT IN (SELECT address_id FROM addresses as t3 JOIN students as t4 ON t3.address_id = t4.current_address_id)
SELECT t2.first_name FROM addresses as t1 JOIN students as t2 ON t1.address_id = t2.permanent_address_id EXCEPT SELECT t2.first_name FROM addresses as t1 JOIN students as t2 ON t1.address_id = t2.current_address_id
SELECT t1.address_id , t1.line_1 , t1.line_2 , t1.line_3 FROM addresses as t1 JOIN students as t2 ON t1.address_id = t2.current_address_id GROUP BY t1.address_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.address_id , t1.line_1 , t1.line_2 FROM addresses as t1 JOIN students as t2 ON t1.address_id = t2.current_address_id GROUP BY t1.address_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(transcript_date) FROM transcripts
SELECT AVG(transcript_date) FROM transcripts
SELECT transcript_date , other_details FROM transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT transcript_date , other_details FROM transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT COUNT(*) FROM transcripts
SELECT COUNT(*) FROM transcripts
SELECT MAX(transcript_date) FROM transcripts
SELECT MAX(transcript_date) FROM transcripts
SELECT COUNT(*) , student_course_id FROM transcript_contents GROUP BY student_course_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.course_id , COUNT(*) FROM student_enrolment_courses as t1 JOIN transcript_contents as t2 ON t1.student_course_id = t2.student_course_id GROUP BY t1.course_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT transcript_date , transcript_id FROM transcripts ORDER BY other_details LIMIT 1
SELECT t1.transcript_date , t1.transcript_id FROM transcripts as t1 JOIN transcript_contents as t2 ON t1.transcript_id = t2.transcript_id GROUP BY t1.transcript_id ORDER BY COUNT(*) LIMIT 1
SELECT t1.semester_id FROM semesters as t1 JOIN degree_programs as t2 ON t1.semester_id = t2.department_id JOIN student_enrolment as t3 ON t2.degree_program_id = t3.degree_program_id WHERE t2.degree_summary_name = "Master" INTERSECT SELECT t1.semester_id FROM semesters as t1 JOIN degree_programs as t2 ON t1.semester_id = t2.department_id JOIN student_enrolment as t3 ON t2.degree_program_id = t3.degree_program_id WHERE t2.degree_summary_name = "Bachelor"
SELECT t2.semester_id FROM degree_programs as t1 JOIN student_enrolment as t2 ON t1.degree_program_id = t2.degree_program_id WHERE t1.degree_summary_name = "Master" INTERSECT SELECT t2.semester_id FROM degree_programs as t1 JOIN student_enrolment as t2 ON t1.degree_program_id = t2.degree_program_id WHERE t1.degree_summary_name = "Bachelor"
SELECT COUNT(DISTINCT current_address_id) FROM students
SELECT DISTINCT t1.city FROM addresses as t1 JOIN students as t2 ON t1.address_id = t2.current_address_id
SELECT * FROM students ORDER BY first_name DESC
SELECT other_student_details FROM students ORDER BY first_name DESC
SELECT section_description FROM sections WHERE section_name = "h"
SELECT section_description FROM sections WHERE section_name = "h"
SELECT t1.first_name FROM students as t1 JOIN addresses as t2 ON t1.permanent_address_id = t2.address_id WHERE t2.country = "Haiti" UNION SELECT t1.first_name FROM students as t1 JOIN addresses as t2 ON t1.permanent_address_id = t2.address_id WHERE t1.cell_mobile_number = "09700166582"
SELECT t1.first_name FROM students as t1 JOIN addresses as t2 ON t1.permanent_address_id = t2.address_id WHERE t2.country = "Haiti" UNION SELECT t1.first_name FROM students as t1 JOIN addresses as t2 ON t1.current_address_id = t2.address_id WHERE t2.country = "Haiti" UNION SELECT t1.first_name FROM students as t1 JOIN addresses as t2 ON t1.permanent_address_id = t2.address_id WHERE t1.cell_mobile_number = "09700166582" UNION SELECT t1.first_name FROM students as t1 JOIN addresses as t2 ON t1.current_address_id = t2.address_id WHERE t1.cell_mobile_number = "09700166582"
SELECT title FROM cartoon ORDER BY title
SELECT title FROM cartoon ORDER BY title
SELECT title FROM cartoon WHERE directed_by = "Ben Jones"
SELECT title FROM cartoon WHERE directed_by = "Ben Jones"
SELECT COUNT(*) FROM cartoon WHERE written_by = "Joseph Kuhr"
SELECT COUNT(*) FROM cartoon WHERE written_by = "Joseph Kuhr"
SELECT title , directed_by FROM cartoon ORDER BY original_air_date
SELECT title , directed_by FROM cartoon ORDER BY original_air_date
SELECT title FROM cartoon WHERE directed_by = "Ben Jones" OR directed_by = "Brandon Vietti"
SELECT title FROM cartoon WHERE directed_by = 'Ben Jones' OR directed_by = 'Brandon Vietti'
SELECT country , COUNT(*) FROM tv_channel GROUP BY country ORDER BY COUNT(*) DESC LIMIT 1
SELECT country , COUNT(*) FROM tv_channel GROUP BY country ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT series_name) , COUNT(DISTINCT content) FROM tv_channel
SELECT COUNT(DISTINCT series_name) , COUNT(DISTINCT content) FROM tv_channel
SELECT content FROM tv_channel WHERE series_name = "Sky Radio"
SELECT content FROM tv_channel WHERE series_name = "Sky Radio"
SELECT package_option FROM tv_channel WHERE series_name = "Sky Radio"
SELECT package_option FROM tv_channel WHERE series_name = "Sky Radio"
SELECT COUNT(*) FROM tv_channel WHERE language = "English"
SELECT COUNT(*) FROM tv_channel WHERE language = "English"
SELECT language , COUNT(*) FROM tv_channel GROUP BY language ORDER BY COUNT(*) ASC LIMIT 1
SELECT language , COUNT(*) FROM tv_channel GROUP BY language ORDER BY COUNT(*) ASC LIMIT 1
SELECT language , COUNT(*) FROM tv_channel GROUP BY language
SELECT language , COUNT(*) FROM tv_channel GROUP BY language
SELECT t2.series_name FROM cartoon as t1 JOIN tv_channel as t2 ON t1.channel = t2.id WHERE t1.title = "The Rise of the Blue Beetle!"
SELECT t2.series_name FROM cartoon as t1 JOIN tv_channel as t2 ON t1.channel = t2.id WHERE t1.title = "The Rise of the Blue Beetle!"
SELECT t3.title FROM tv_channel as t1 JOIN tv_series as t2 ON t1.id = t2.channel JOIN cartoon as t3 ON t2.channel = t3.channel WHERE t1.series_name = "Sky Radio"
SELECT t2.title FROM tv_channel as t1 JOIN cartoon as t2 ON t1.id = t2.channel WHERE t1.series_name = "Sky Radio"
SELECT episode FROM tv_series ORDER BY rating
SELECT episode FROM tv_series ORDER BY rating
SELECT episode , rating FROM tv_series ORDER BY rating DESC LIMIT 3
SELECT episode , rating FROM tv_series ORDER BY rating DESC LIMIT 3
SELECT MIN(share) , MAX(share) FROM tv_series
SELECT MAX(share) , MIN(share) FROM tv_series
SELECT air_date FROM tv_series WHERE episode = "A Love of a Lifetime"
SELECT air_date FROM tv_series WHERE episode = "A Love of a Lifetime"
SELECT weekly_rank FROM tv_series WHERE episode = "A Love of a Lifetime"
SELECT weekly_rank FROM tv_series WHERE episode = "A Love of a Lifetime"
SELECT t2.series_name FROM tv_series as t1 JOIN tv_channel as t2 ON t1.channel = t2.id WHERE t1.episode = "A Love of a Lifetime"
SELECT episode FROM tv_series WHERE id = 1
SELECT t1.episode FROM tv_series as t1 JOIN tv_channel as t2 ON t1.channel = t2.id WHERE t2.series_name = "Sky Radio"
SELECT episode FROM tv_series WHERE channel = "Sky Radio"
SELECT directed_by , COUNT(*) FROM cartoon GROUP BY directed_by
SELECT directed_by , COUNT(*) FROM cartoon GROUP BY directed_by
SELECT production_code , channel FROM cartoon ORDER BY original_air_date DESC LIMIT 1
SELECT production_code , channel FROM cartoon ORDER BY original_air_date DESC LIMIT 1
SELECT package_option , series_name FROM tv_channel WHERE hight_definition_TV = "yes"
SELECT t2.package_option , t2.series_name FROM tv_series as t1 JOIN tv_channel as t2 ON t1.channel = t2.id WHERE t2.hight_definition_tv = 'yes'
SELECT t2.country FROM cartoon as t1 JOIN tv_channel as t2 ON t1.channel = t2.id WHERE t1.written_by = "Todd Casey"
SELECT t1.country FROM tv_channel as t1 JOIN cartoon as t2 ON t1.id = t2.channel WHERE t2.written_by = "Todd Casey"
SELECT t2.country FROM cartoon as t1 JOIN tv_channel as t2 ON t1.channel = t2.id WHERE t1.written_by = "Todd Casey" EXCEPT SELECT t2.country FROM cartoon as t1 JOIN tv_channel as t2 ON t1.channel = t2.id WHERE t1.written_by = "Todd Casey"
SELECT country FROM tv_channel WHERE id NOT IN (SELECT channel FROM cartoon WHERE written_by = "Todd Casey")
SELECT t2.series_name , t2.country FROM cartoon as t1 JOIN tv_channel as t2 ON t1.channel = t2.id WHERE t1.directed_by = "Ben Jones" INTERSECT SELECT t2.series_name , t2.country FROM cartoon as t1 JOIN tv_channel as t2 ON t1.channel = t2.id WHERE t1.directed_by = "Michael Chang"
SELECT t1.series_name , t1.country FROM tv_channel as t1 JOIN cartoon as t2 ON t1.id = t2.channel WHERE t2.directed_by = 'Ben Jones' INTERSECT SELECT t1.series_name , t1.country FROM tv_channel as t1 JOIN cartoon as t2 ON t1.id = t2.channel WHERE t2.directed_by = 'Michael Chang'
SELECT pixel_aspect_ratio_par , country FROM tv_channel WHERE language != 'English'
SELECT pixel_aspect_ratio_PAR , country FROM tv_channel WHERE language != 'English'
SELECT id FROM tv_channel GROUP BY country HAVING COUNT(*) > 2
SELECT id FROM tv_channel GROUP BY content HAVING COUNT(*) > 2
SELECT id FROM tv_channel WHERE directed_by != "Ben Jones"
SELECT id FROM tv_channel WHERE id NOT IN (SELECT channel FROM cartoon WHERE directed_by = 'Ben Jones')
SELECT package_option FROM tv_channel WHERE id NOT IN (SELECT channel FROM cartoon WHERE directed_by = "Ben Jones")
SELECT t2.package_option FROM cartoon as t1 JOIN tv_channel as t2 ON t1.channel = t2.id WHERE t1.directed_by != "Ben Jones"
SELECT COUNT(*) FROM poker_player
SELECT COUNT(*) FROM poker_player
SELECT earnings FROM poker_player ORDER BY earnings DESC
SELECT earnings FROM poker_player ORDER BY earnings DESC
SELECT final_table_made , best_finish FROM poker_player
SELECT final_table_made , best_finish FROM poker_player
SELECT AVG(earnings) FROM poker_player
SELECT AVG(earnings) FROM poker_player
SELECT money_rank FROM poker_player ORDER BY earnings DESC LIMIT 1
SELECT money_rank FROM poker_player ORDER BY earnings DESC LIMIT 1
SELECT MAX(final_table_made) FROM poker_player WHERE earnings < 200000
SELECT MAX(final_table_made) FROM poker_player WHERE earnings < 200000
SELECT t1.name FROM people as t1 JOIN poker_player as t2 ON t1.people_id = t2.people_id
SELECT t1.name FROM people as t1 JOIN poker_player as t2 ON t1.people_id = t2.people_id
SELECT t1.name FROM people as t1 JOIN poker_player as t2 ON t1.people_id = t2.people_id WHERE t2.earnings > 300000
SELECT t1.name FROM people as t1 JOIN poker_player as t2 ON t1.people_id = t2.people_id WHERE t2.earnings > 300000
SELECT t1.name FROM people as t1 JOIN poker_player as t2 ON t1.people_id = t2.people_id ORDER BY t2.final_table_made
SELECT t1.name FROM people as t1 JOIN poker_player as t2 ON t1.people_id = t2.people_id ORDER BY t2.final_table_made ASC
SELECT t1.birth_date FROM people as t1 JOIN poker_player as t2 ON t1.people_id = t2.people_id ORDER BY t2.earnings LIMIT 1
SELECT t1.birth_date FROM people as t1 JOIN poker_player as t2 ON t1.people_id = t2.people_id ORDER BY t2.earnings LIMIT 1
SELECT t1.money_rank FROM poker_player as t1 JOIN people as t2 ON t1.people_id = t2.people_id ORDER BY t2.height DESC LIMIT 1
SELECT t1.money_rank FROM poker_player as t1 JOIN people as t2 ON t1.people_id = t2.people_id ORDER BY t2.height DESC LIMIT 1
SELECT AVG(t2.earnings) FROM people as t1 JOIN poker_player as t2 ON t1.people_id = t2.people_id WHERE t1.height > 200
SELECT AVG(t2.earnings) FROM people as t1 JOIN poker_player as t2 ON t1.people_id = t2.people_id WHERE t1.height > 200
SELECT t1.name FROM people as t1 JOIN poker_player as t2 ON t1.people_id = t2.people_id ORDER BY t2.earnings DESC
SELECT t1.name FROM people as t1 JOIN poker_player as t2 ON t1.people_id = t2.people_id ORDER BY t2.earnings DESC
SELECT nationality , COUNT(*) FROM people GROUP BY nationality
SELECT nationality , COUNT(*) FROM people GROUP BY nationality
SELECT nationality FROM people GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT nationality FROM people GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT nationality FROM people GROUP BY nationality HAVING COUNT(*) >= 2
SELECT nationality FROM people GROUP BY nationality HAVING COUNT(*) >= 2
SELECT name , birth_date FROM people ORDER BY name ASC
SELECT name , birth_date FROM people ORDER BY name
SELECT name FROM people WHERE nationality != "Russia"
SELECT name FROM people WHERE nationality != 'Russia'
SELECT name FROM people WHERE people_id NOT IN (SELECT people_id FROM poker_player)
SELECT name FROM people WHERE people_id NOT IN (SELECT people_id FROM poker_player)
SELECT COUNT(DISTINCT nationality) FROM people
SELECT COUNT(DISTINCT nationality) FROM people
SELECT COUNT(DISTINCT state) FROM area_code_state
SELECT contestant_number , contestant_name FROM contestants ORDER BY contestant_name DESC
SELECT vote_id , phone_number , state FROM votes
SELECT MAX(area_code) , MIN(area_code) FROM area_code_state
SELECT MAX(created) FROM votes WHERE state = 'CA'
SELECT contestant_name FROM contestants WHERE contestant_name != 'Jessie Alloway'
SELECT DISTINCT state , created FROM votes
SELECT t1.contestant_number , t1.contestant_name FROM contestants as t1 JOIN votes as t2 ON t1.contestant_number = t2.contestant_number GROUP BY t1.contestant_number HAVING COUNT(*) >= 2
SELECT t1.contestant_number , t1.contestant_name FROM contestants as t1 JOIN votes as t2 ON t1.contestant_number = t2.contestant_number GROUP BY t1.contestant_number ORDER BY COUNT(*) asC LIMIT 1
SELECT COUNT(*) FROM votes WHERE state = 'NY' OR state = 'CA'
SELECT COUNT(*) FROM contestants WHERE contestant_number NOT IN (SELECT contestant_number FROM votes)
SELECT state FROM votes GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.created , t2.state , t2.phone_number FROM contestants as t1 JOIN votes as t2 ON t1.contestant_number = t2.contestant_number WHERE t1.contestant_name = "Tabatha Gehling"
SELECT DISTINCT t2.area_code FROM contestants as t1 JOIN votes as t2 ON t1.contestant_number = t2.contestant_number JOIN area_code_state as t3 ON t2.state = t3.state WHERE t1.contestant_name = 'Tabatha Gehling' INTERSECT SELECT DISTINCT t2.area_code FROM contestants as t1 JOIN votes as t2 ON t1.contestant_number = t2.contestant_number JOIN area_code_state as t3 ON t2.state = t3.state WHERE t1.contestant_name = 'Kelly Clauss'
SELECT contestant_name FROM contestants WHERE contestant_name LIKE '%Al%'
SELECT name FROM country WHERE indepyear > 1950
SELECT name FROM country WHERE indepyear > 1950
SELECT COUNT(*) FROM country WHERE governmentform = "Republic"
SELECT COUNT(*) FROM country WHERE governmentform = "Republic"
SELECT SUM(surfacearea) FROM country WHERE region = 'Caribbean'
SELECT SUM(surfacearea) FROM country WHERE region = "Caribbean"
SELECT continent FROM country WHERE code = 'AIA'
SELECT continent FROM country WHERE name = "Anguilla"
SELECT region FROM country WHERE code = ( SELECT countrycode FROM city WHERE name = "Kabul" )
SELECT region FROM country WHERE code = ( SELECT countrycode FROM city WHERE name = "Kabul" )
SELECT language FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t2.name = "Aruba" GROUP BY t1.language ORDER BY COUNT(*) DESC LIMIT 1
SELECT language FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t2.name = "Aruba"
SELECT population , lifeexpectancy FROM country WHERE name = "Brazil"
SELECT population , lifeexpectancy FROM country WHERE name = "Brazil"
SELECT region , population FROM country WHERE name = "Angola"
SELECT region , population FROM country WHERE name = "Angola"
SELECT AVG(lifeexpectancy) FROM country WHERE region = 'Central Africa'
SELECT AVG(lifeexpectancy) FROM country WHERE region = 'Central Africa'
SELECT name FROM country WHERE continent = "Asia" ORDER BY lifeexpectancy LIMIT 1
SELECT name FROM country WHERE continent = 'Asia' ORDER BY lifeexpectancy LIMIT 1
SELECT SUM(population) , MAX(gnp) FROM country WHERE continent = 'Asia'
SELECT MAX(gnp) , SUM(population) FROM country WHERE continent = 'Asia'
SELECT AVG(lifeexpectancy) FROM country WHERE continent = 'Africa' AND governmentform = 'Republic'
SELECT AVG(lifeexpectancy) FROM country WHERE continent = 'Africa' AND governmentform = 'Republic'
SELECT SUM(surfacearea) FROM country WHERE continent = 'Asia' OR continent = 'Europe'
SELECT SUM(surfacearea) FROM country WHERE continent = 'Asia' OR continent = 'Europe'
SELECT population FROM city WHERE district = "Gelderland"
SELECT SUM(population) FROM city WHERE district = "Gelderland"
SELECT AVG(gnp) , SUM(population) FROM country WHERE governmentform = 'US Territory'
SELECT AVG(gnp) , SUM(population) FROM country WHERE governmentform = 'US Territory'
SELECT COUNT(DISTINCT language) FROM countrylanguage
SELECT COUNT(DISTINCT language) FROM countrylanguage
SELECT COUNT(DISTINCT governmentform) FROM country WHERE continent = 'Africa'
SELECT COUNT(DISTINCT governmentform) FROM country WHERE continent = 'Africa'
SELECT COUNT(*) FROM countrylanguage WHERE countrycode = "ABW"
SELECT COUNT(*) FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t2.name = "Aruba"
SELECT COUNT(*) FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t2.name = "Afghanistan" AND t1.isofficial = "t"
SELECT COUNT(*) FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t1.isofficial = 't' AND t2.name = 'Afghanistan'
SELECT t2.name FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code GROUP BY t1.countrycode ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.name FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code GROUP BY t1.countrycode ORDER BY COUNT(*) DESC LIMIT 1
SELECT continent FROM countrylanguage GROUP BY continent ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.continent FROM country as t1 JOIN countrylanguage as t2 ON t1.code = t2.countrycode GROUP BY t1.continent ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM (SELECT countrycode FROM countrylanguage WHERE language = "Dutch" INTERSECT SELECT countrycode FROM countrylanguage WHERE language = "English")
SELECT COUNT(*) FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t1.language = "Dutch" OR t1.language = "English"
SELECT t2.name FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t1.language = 'English' INTERSECT SELECT t2.name FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t1.language = 'French'
SELECT t1.name FROM country as t1 JOIN countrylanguage as t2 ON t1.code = t2.countrycode WHERE t2.language = 'English' INTERSECT SELECT t1.name FROM country as t1 JOIN countrylanguage as t2 ON t1.code = t2.countrycode WHERE t2.language = 'French'
SELECT t2.name FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t1.language = 'English' AND t1.isofficial = 'T' INTERSECT SELECT t2.name FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t1.language = 'French' AND t1.isofficial = 'T'
SELECT t1.name FROM country as t1 JOIN countrylanguage as t2 ON t1.code = t2.countrycode WHERE t2.language = 'English' INTERSECT SELECT t1.name FROM country as t1 JOIN countrylanguage as t2 ON t1.code = t2.countrycode WHERE t2.language = 'French'
SELECT COUNT(DISTINCT t1.continent) FROM country as t1 JOIN countrylanguage as t2 ON t1.code = t2.countrycode WHERE t2.language = 'Chinese'
SELECT COUNT(DISTINCT continent) FROM country as t1 JOIN countrylanguage as t2 ON t1.code = t2.countrycode WHERE language = 'Chinese'
SELECT t2.region FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t1.language = 'Dutch' OR t1.language = 'English'
SELECT t2.region FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t1.language = "Dutch" OR t1.language = "English"
SELECT countrycode FROM countrylanguage WHERE language = "Dutch" AND isofficial = "T" UNION SELECT countrycode FROM countrylanguage WHERE language = "English" AND isofficial = "T"
SELECT countrycode FROM countrylanguage WHERE language = "Dutch" AND isofficial = "T" UNION SELECT countrycode FROM countrylanguage WHERE language = "English" AND isofficial = "T"
SELECT t1.language FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t2.continent = 'Asia' GROUP BY t1.language ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.language FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t2.continent = 'Asia' GROUP BY t1.language ORDER BY COUNT(*) DESC LIMIT 1
SELECT language FROM countrylanguage GROUP BY language HAVING COUNT(DISTINCT countrycode) = 1 AND isofficial = 'T'
SELECT DISTINCT t1.language FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t2.governmentform = "Republic" GROUP BY t1.language HAVING COUNT(*) = 1
SELECT t1.name FROM city as t1 JOIN countrylanguage as t2 ON t1.countrycode = t2.countrycode WHERE t2.language = 'English' AND t1.population = (SELECT MAX(population) FROM city WHERE countrycode = 'England')
SELECT t1.name FROM city as t1 JOIN countrylanguage as t2 ON t1.countrycode = t2.countrycode WHERE t2.language = "English" ORDER BY t1.population DESC LIMIT 1
SELECT name , population , lifeexpectancy FROM country WHERE continent = 'Asia' ORDER BY surfacearea DESC LIMIT 1
SELECT name , population , lifeexpectancy FROM country WHERE continent = 'Asia' ORDER BY surfacearea DESC LIMIT 1
SELECT AVG(lifeexpectancy) FROM country WHERE language != "English"
SELECT AVG(lifeexpectancy) FROM country WHERE language != "English"
SELECT SUM(t2.population) FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t1.language != "English"
SELECT SUM(population) FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language = 'English')
SELECT t1.language FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t2.headofstate = "Beatrix" AND t1.isofficial = "T"
SELECT t1.language FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t2.headofstate = "Beatrix" AND t1.isofficial = "T"
SELECT COUNT(DISTINCT t1.language) FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t2.indepyear < 1930 AND t1.isofficial = 'T'
SELECT COUNT(DISTINCT t1.language) FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t2.indepyear < 1930 AND t1.isofficial = 't'
SELECT name FROM country WHERE surfacearea > (SELECT MAX(surfacearea) FROM country WHERE continent = 'Europe')
SELECT name FROM country WHERE surfacearea > (SELECT MAX(surfacearea) FROM country WHERE continent = 'Europe')
SELECT name FROM country WHERE continent = 'Africa' AND population < (SELECT MIN(population) FROM country WHERE continent = 'Asia')
SELECT name FROM country WHERE continent = 'Africa' AND population < (SELECT MIN(population) FROM country WHERE continent = 'Asia')
SELECT name FROM country WHERE population > (SELECT MAX(population) FROM country WHERE continent = "Africa") AND continent = "Asia"
SELECT name FROM country WHERE continent = 'Asia' AND population > (SELECT MAX(population) FROM country WHERE continent = 'Africa')
SELECT countrycode FROM countrylanguage EXCEPT SELECT countrycode FROM countrylanguage WHERE language = "English"
SELECT countrycode FROM countrylanguage EXCEPT SELECT countrycode FROM countrylanguage WHERE language = "English"
SELECT countrycode FROM countrylanguage WHERE language != "English"
SELECT countrycode FROM countrylanguage EXCEPT SELECT countrycode FROM countrylanguage WHERE language = "English"
SELECT code FROM country EXCEPT SELECT countrycode FROM countrylanguage WHERE language = "English" EXCEPT SELECT countrycode FROM country WHERE governmentform != "Republic"
SELECT code FROM country EXCEPT SELECT countrycode FROM countrylanguage WHERE language = "English" EXCEPT SELECT code FROM country WHERE governmentform = "Republic"
SELECT name FROM city WHERE countrycode IN (SELECT code FROM country WHERE continent = 'Europe' EXCEPT SELECT countrycode FROM countrylanguage WHERE language = 'English')
SELECT t2.name FROM countrylanguage as t1 JOIN city as t2 ON t1.countrycode = t2.countrycode WHERE t1.language != "English" AND t1.isofficial != "T" AND t2.district != "Europe"
SELECT DISTINCT t1.name FROM city as t1 JOIN country as t3 ON t1.countrycode = t3.code JOIN countrylanguage as t2 ON t2.countrycode = t3.code WHERE t3.continent = "Asia" AND t2.language = "Chinese" AND t2.isofficial = "T"
SELECT DISTINCT t2.name FROM countrylanguage as t1 JOIN city as t2 ON t1.countrycode = t2.countrycode WHERE t1.language = "Chinese" AND t1.isofficial = "T" AND t2.district = "Asia"
SELECT name , indepyear , surfacearea FROM country ORDER BY population ASC LIMIT 1
SELECT name , indepyear , surfacearea FROM country ORDER BY population ASC LIMIT 1
SELECT population , name , headofstate FROM country ORDER BY surfacearea DESC LIMIT 1
SELECT name , population , headofstate FROM country ORDER BY surfacearea DESC LIMIT 1
SELECT t2.name , COUNT(*) FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code GROUP BY t1.countrycode HAVING COUNT(*) >= 3
SELECT t2.name , COUNT(*) FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code GROUP BY t1.countrycode HAVING COUNT(*) > 2
SELECT COUNT(*) , district FROM city WHERE population > (SELECT AVG(population) FROM city) GROUP BY district
SELECT COUNT(*) , district FROM city WHERE population > (SELECT AVG(population) FROM city) GROUP BY district
SELECT governmentform , SUM(population) FROM country GROUP BY governmentform HAVING AVG(lifeexpectancy) > 72
SELECT governmentform , SUM(population) FROM country GROUP BY governmentform HAVING AVG(lifeexpectancy) > 72
SELECT AVG(lifeexpectancy) , SUM(population) , continent FROM country GROUP BY continent HAVING AVG(lifeexpectancy) < 72
SELECT SUM(population) , AVG(lifeexpectancy) , continent FROM country WHERE lifeexpectancy < 72 GROUP BY continent
SELECT name , surfacearea FROM country ORDER BY surfacearea DESC LIMIT 5
SELECT name , surfacearea FROM country ORDER BY surfacearea DESC LIMIT 5
SELECT name FROM country ORDER BY population DESC LIMIT 3
SELECT name FROM country ORDER BY population DESC LIMIT 3
SELECT name FROM country ORDER BY population ASC LIMIT 3
SELECT name FROM country ORDER BY population ASC LIMIT 3
SELECT COUNT(*) FROM country WHERE continent = 'Asia'
SELECT COUNT(*) FROM country WHERE continent = 'Asia'
SELECT name FROM country WHERE continent = "Europe" AND population > 80000
SELECT name FROM country WHERE continent = "Europe" AND population = 80000
SELECT SUM(population) , AVG(surfacearea) FROM country WHERE continent = 'North America' AND surfacearea > 3000
SELECT SUM(population) , AVG(surfacearea) FROM country WHERE continent = 'North America' AND surfacearea > 3000
SELECT name FROM city WHERE population BETWEEN 160000 AND 900000
SELECT name FROM city WHERE population BETWEEN 160000 AND 900000
SELECT language FROM countrylanguage GROUP BY language ORDER BY COUNT(*) DESC LIMIT 1
SELECT language FROM countrylanguage GROUP BY language ORDER BY COUNT(*) DESC LIMIT 1
SELECT language FROM countrylanguage GROUP BY countrycode ORDER BY SUM(percentage) DESC LIMIT 1
SELECT countrycode , language FROM countrylanguage GROUP BY countrycode , language ORDER BY SUM(percentage) DESC LIMIT 1
SELECT COUNT(DISTINCT t2.name) FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t1.language = "Spanish" AND t1.percentage = ( SELECT MAX(percentage) FROM countrylanguage WHERE language = "Spanish" )
SELECT COUNT(*) FROM countrylanguage as t1 JOIN country as t2 ON t1.countrycode = t2.code WHERE t1.language = "Spanish" AND t1.percentage > 50.0
SELECT countrycode FROM countrylanguage WHERE language = "Spanish" ORDER BY percentage DESC LIMIT 1
SELECT countrycode FROM countrylanguage WHERE language = "Spanish" AND percentage > 50
SELECT COUNT(*) FROM conductor
SELECT COUNT(*) FROM conductor
SELECT name FROM conductor ORDER BY age ASC
SELECT name FROM conductor ORDER BY age
SELECT name FROM conductor WHERE nationality != "USA"
SELECT name FROM conductor WHERE nationality != "USA"
SELECT record_company FROM orchestra ORDER BY year_of_founded DESC
SELECT record_company FROM orchestra ORDER BY year_of_founded DESC
SELECT AVG(attendance) FROM show
SELECT AVG(attendance) FROM show
SELECT MAX(share) , MIN(share) FROM performance WHERE type != "Live final"
SELECT MAX(share) , MIN(share) FROM performance WHERE type != "Live final"
SELECT COUNT(DISTINCT nationality) FROM conductor
SELECT COUNT(DISTINCT nationality) FROM conductor
SELECT name FROM conductor ORDER BY year_of_work DESC
SELECT name FROM conductor ORDER BY year_of_work DESC
SELECT name FROM conductor ORDER BY year_of_work DESC LIMIT 1
SELECT name FROM conductor ORDER BY year_of_work DESC LIMIT 1
SELECT t1.name , t2.orchestra FROM conductor as t1 JOIN orchestra as t2 ON t1.conductor_id = t2.conductor_id
SELECT t1.name , t2.orchestra FROM conductor as t1 JOIN orchestra as t2 ON t1.conductor_id = t2.conductor_id
SELECT t1.name FROM conductor as t1 JOIN orchestra as t2 ON t1.conductor_id = t2.conductor_id GROUP BY t1.conductor_id HAVING COUNT(*) > 1
SELECT t1.name FROM conductor as t1 JOIN orchestra as t2 ON t1.conductor_id = t2.conductor_id GROUP BY t1.conductor_id HAVING COUNT(*) > 1
SELECT t1.name FROM conductor as t1 JOIN orchestra as t2 ON t1.conductor_id = t2.conductor_id GROUP BY t1.conductor_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.name FROM conductor as t1 JOIN orchestra as t2 ON t1.conductor_id = t2.conductor_id GROUP BY t1.conductor_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.name FROM conductor as t1 JOIN orchestra as t2 ON t1.conductor_id = t2.conductor_id WHERE t2.year_of_founded > 2008
SELECT t1.name FROM conductor as t1 JOIN orchestra as t2 ON t1.conductor_id = t2.conductor_id WHERE t2.year_of_founded > 2008
SELECT record_company , COUNT(*) FROM orchestra GROUP BY record_company
SELECT record_company , COUNT(*) FROM orchestra GROUP BY record_company
SELECT major_record_format FROM orchestra GROUP BY major_record_format ORDER BY COUNT(*) ASC
SELECT major_record_format FROM orchestra GROUP BY major_record_format ORDER BY COUNT(*) DESC
SELECT record_company FROM orchestra GROUP BY record_company ORDER BY COUNT(*) DESC LIMIT 1
SELECT record_company FROM orchestra GROUP BY record_company ORDER BY COUNT(*) DESC LIMIT 1
SELECT orchestra FROM orchestra WHERE orchestra_id NOT IN (SELECT orchestra_id FROM performance)
SELECT orchestra FROM orchestra WHERE orchestra_id NOT IN (SELECT orchestra_id FROM performance)
SELECT record_company FROM orchestra WHERE year_of_founded < 2003 INTERSECT SELECT record_company FROM orchestra WHERE year_of_founded > 2003
SELECT record_company FROM orchestra WHERE year_of_founded < 2003 INTERSECT SELECT record_company FROM orchestra WHERE year_of_founded > 2003
SELECT COUNT(*) FROM orchestra WHERE major_record_format = "CD" OR major_record_format = "DVD"
SELECT COUNT(*) FROM orchestra WHERE major_record_format = "CD" OR major_record_format = "DVD"
SELECT t1.year_of_founded FROM orchestra as t1 JOIN performance as t2 ON t1.orchestra_id = t2.orchestra_id GROUP BY t1.orchestra_id HAVING COUNT(*) > 1
SELECT t1.year_of_founded FROM orchestra as t1 JOIN performance as t2 ON t1.orchestra_id = t2.orchestra_id GROUP BY t1.orchestra_id HAVING COUNT(*) > 1
SELECT COUNT(*) FROM highschooler
SELECT COUNT(*) FROM highschooler
SELECT name , grade FROM highschooler
SELECT name , grade FROM highschooler
SELECT DISTINCT grade FROM highschooler
SELECT grade FROM highschooler
SELECT grade FROM highschooler WHERE name = "Kyle"
SELECT grade FROM highschooler WHERE name = "Kyle"
SELECT name FROM highschooler WHERE grade = 10
SELECT name FROM highschooler WHERE grade = 10
SELECT id FROM highschooler WHERE name = "Kyle"
SELECT id FROM highschooler WHERE name = "Kyle"
SELECT COUNT(*) FROM highschooler WHERE grade = 9 OR grade = 10
SELECT COUNT(*) FROM highschooler WHERE grade = 9 OR grade = 10
SELECT grade , COUNT(*) FROM highschooler GROUP BY grade
SELECT grade , COUNT(*) FROM highschooler GROUP BY grade
SELECT grade FROM highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM highschooler GROUP BY grade HAVING COUNT(*) >= 4
SELECT grade FROM highschooler GROUP BY grade HAVING COUNT(*) >= 4
SELECT student_id , COUNT(*) FROM friend GROUP BY student_id
SELECT COUNT(*) , student_id FROM friend GROUP BY student_id
SELECT t2.name , COUNT(*) FROM friend as t1 JOIN highschooler as t2 ON t1.student_id = t2.id GROUP BY t1.student_id
SELECT t2.name , COUNT(*) FROM friend as t1 JOIN highschooler as t2 ON t1.student_id = t2.id GROUP BY t1.student_id
SELECT t2.name FROM friend as t1 JOIN highschooler as t2 ON t1.student_id = t2.id GROUP BY t1.student_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.name FROM friend as t1 JOIN highschooler as t2 ON t1.student_id = t2.id GROUP BY t1.student_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.name FROM friend as t1 JOIN highschooler as t2 ON t1.student_id = t2.id GROUP BY t1.student_id HAVING COUNT(*) >= 3
SELECT t2.name FROM friend as t1 JOIN highschooler as t2 ON t1.student_id = t2.id GROUP BY t1.student_id HAVING COUNT(*) >= 3
SELECT t2.name FROM friend as t1 JOIN highschooler as t2 ON t1.friend_id = t2.id WHERE t1.student_id = (SELECT student_id FROM friend WHERE friend_id = (SELECT id FROM highschooler WHERE name = "Kyle") )
SELECT t2.name FROM friend as t1 JOIN highschooler as t2 ON t1.friend_id = t2.id WHERE t1.student_id = (SELECT id FROM highschooler WHERE name = "Kyle")
SELECT COUNT(*) FROM friend WHERE student_id IN (SELECT student_id FROM highschooler WHERE name = "Kyle")
SELECT COUNT(*) FROM friend WHERE student_id = (SELECT friend_id FROM friend WHERE student_id = (SELECT student_id FROM highschooler WHERE name = "Kyle") AND student_id = friend_id) AND student_id = friend_id
SELECT student_id FROM friend GROUP BY student_id HAVING COUNT(*) = 0
SELECT id FROM highschooler WHERE id NOT IN (SELECT student_id FROM friend)
SELECT name FROM highschooler WHERE id NOT IN (SELECT student_id FROM friend)
SELECT name FROM friend EXCEPT SELECT t1.name FROM highschooler as t1 JOIN friend as t2 ON t1.id = t2.student_id
SELECT t1.student_id FROM friend as t1 JOIN likes as t2 ON t1.student_id = t2.student_id INTERSECT SELECT t1.student_id FROM friend as t1 JOIN likes as t2 ON t1.student_id = t2.liked_id
SELECT t1.student_id FROM friend as t1 JOIN likes as t2 ON t1.friend_id = t2.student_id INTERSECT SELECT t1.student_id FROM friend as t1 JOIN likes as t2 ON t1.friend_id = t2.liked_id
SELECT t3.name FROM friend as t1 JOIN likes as t2 ON t1.student_id = t2.student_id JOIN highschooler as t3 ON t1.student_id = t3.id UNION SELECT t3.name FROM friend as t1 JOIN likes as t2 ON t1.friend_id = t2.student_id JOIN highschooler as t3 ON t1.student_id = t3.id
SELECT t2.name FROM friend as t1 JOIN highschooler as t2 ON t1.student_id = t2.id INTERSECT SELECT t2.name FROM likes as t3 JOIN highschooler as t2 ON t3.student_id = t2.id
SELECT student_id , COUNT(*) FROM likes GROUP BY student_id
SELECT student_id , COUNT(*) FROM likes GROUP BY student_id
SELECT t2.name , COUNT(*) FROM likes as t1 JOIN highschooler as t2 ON t1.student_id = t2.id GROUP BY t1.student_id
SELECT t2.name , COUNT(*) FROM likes as t1 JOIN highschooler as t2 ON t1.student_id = t2.id GROUP BY t1.student_id
SELECT t1.name FROM highschooler as t1 JOIN likes as t2 ON t1.id = t2.student_id GROUP BY t2.student_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.name FROM highschooler as t1 JOIN likes as t2 ON t1.id = t2.student_id GROUP BY t2.student_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.name FROM likes as t1 JOIN highschooler as t2 ON t1.student_id = t2.id GROUP BY t1.student_id HAVING COUNT(*) >= 2
SELECT t2.name FROM likes as t1 JOIN highschooler as t2 ON t1.student_id = t2.id GROUP BY t1.student_id HAVING COUNT(*) >= 2
SELECT t2.name FROM friend as t1 JOIN highschooler as t2 ON t1.student_id = t2.id WHERE t2.grade > 5 GROUP BY t1.student_id HAVING COUNT(*) >= 2
SELECT t2.name FROM friend as t1 JOIN highschooler as t2 ON t1.student_id = t2.id WHERE t2.grade > 5 GROUP BY t1.student_id HAVING COUNT(*) >= 2
SELECT COUNT(*) FROM highschooler as t1 JOIN likes as t2 ON t1.id = t2.student_id WHERE t1.name = "Kyle"
SELECT COUNT(*) FROM likes as t1 JOIN highschooler as t2 ON t1.student_id = t2.id WHERE t2.name = 'Kyle'
SELECT AVG(t2.grade) FROM friend as t1 JOIN highschooler as t2 ON t1.student_id = t2.id
SELECT AVG(t2.grade) FROM friend as t1 JOIN highschooler as t2 ON t1.student_id = t2.id
SELECT MIN(t2.grade) FROM friend as t1 JOIN highschooler as t2 ON t1.student_id = t2.id WHERE t1.student_id NOT IN (SELECT student_id FROM friend)
SELECT MIN(t2.grade) FROM friend as t1 JOIN highschooler as t2 ON t1.student_id = t2.id EXCEPT SELECT grade FROM highschooler as t2 JOIN friend as t1 ON t1.friend_id = t2.id
SELECT state FROM owners INTERSECT SELECT state FROM professionals
SELECT state FROM owners INTERSECT SELECT state FROM professionals
SELECT AVG(t2.age) FROM treatments as t1 JOIN dogs as t2 ON t1.dog_id = t2.dog_id
SELECT AVG(t2.age) FROM treatments as t1 JOIN dogs as t2 ON t1.dog_id = t2.dog_id
SELECT t2.professional_id , t2.last_name , t2.cell_number FROM treatments as t1 JOIN professionals as t2 ON t1.professional_id = t2.professional_id WHERE t2.state = "Indiana" GROUP BY t1.professional_id HAVING COUNT(*) > 2 UNION SELECT t2.professional_id , t2.last_name , t2.cell_number FROM treatments as t1 JOIN professionals as t2 ON t1.professional_id = t2.professional_id WHERE t2.state = "Wisconsin" GROUP BY t1.professional_id HAVING COUNT(*) > 2
SELECT t1.professional_id , t2.last_name , t2.cell_number FROM treatments as t1 JOIN professionals as t2 ON t1.professional_id = t2.professional_id WHERE t2.state = "Indiana" GROUP BY t1.professional_id HAVING COUNT(*) > 2 UNION SELECT t1.professional_id , t2.last_name , t2.cell_number FROM treatments as t1 JOIN professionals as t2 ON t1.professional_id = t2.professional_id WHERE t2.state = "Indiana" GROUP BY t1.professional_id HAVING COUNT(*) > 2
SELECT t2.name FROM treatments as t1 JOIN dogs as t2 ON t1.dog_id = t2.dog_id GROUP BY t1.dog_id HAVING SUM(t1.cost_of_treatment) <= 1000
SELECT t2.name FROM treatments as t1 JOIN dogs as t2 ON t1.dog_id = t2.dog_id JOIN owners as t3 ON t2.owner_id = t3.owner_id GROUP BY t3.owner_id HAVING SUM(t1.cost_of_treatment) <= 1000
SELECT first_name FROM professionals UNION SELECT first_name FROM owners EXCEPT SELECT name FROM dogs
SELECT first_name FROM professionals UNION SELECT first_name FROM owners EXCEPT SELECT name FROM dogs
SELECT t1.professional_id , t2.role_code , t2.email_address FROM treatments as t1 JOIN professionals as t2 ON t1.professional_id = t2.professional_id EXCEPT SELECT professional_id , role_code , email_address FROM treatments as t1 JOIN professionals as t2 ON t1.professional_id = t2.professional_id WHERE t1.treatment_type_code = "OPER"
SELECT t1.professional_id , t2.role_code , t2.email_address FROM treatments as t1 JOIN professionals as t2 ON t1.professional_id = t2.professional_id EXCEPT SELECT t1.professional_id , t2.role_code , t2.email_address FROM treatments as t1 JOIN professionals as t2 ON t1.professional_id = t2.professional_id
SELECT t1.owner_id , t1.first_name , t1.last_name FROM owners as t1 JOIN dogs as t2 ON t1.owner_id = t2.owner_id GROUP BY t1.owner_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.owner_id , t1.first_name , t1.last_name FROM owners as t1 JOIN dogs as t2 ON t1.owner_id = t2.owner_id GROUP BY t1.owner_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t1.professional_id , t2.role_code , t2.first_name FROM treatments as t1 JOIN professionals as t2 ON t1.professional_id = t2.professional_id GROUP BY t1.professional_id HAVING COUNT(*) >= 2
SELECT t1.professional_id , t2.role_code , t2.first_name FROM treatments as t1 JOIN professionals as t2 ON t1.professional_id = t2.professional_id GROUP BY t1.professional_id HAVING COUNT(*) >= 2
SELECT t2.breed_name FROM dogs as t1 JOIN breeds as t2 ON t1.breed_code = t2.breed_code GROUP BY t1.breed_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.breed_name FROM dogs as t1 JOIN breeds as t2 ON t1.breed_code = t2.breed_code GROUP BY t1.breed_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.owner_id , t2.last_name FROM treatments as t1 JOIN owners as t2 ON t1.dog_id = t2.owner_id JOIN professionals as t3 ON t1.professional_id = t3.professional_id WHERE t3.role_code = "Owner" GROUP BY t2.owner_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t3.owner_id , t3.last_name FROM treatments as t1 JOIN professionals as t2 ON t1.professional_id = t2.professional_id JOIN owners as t3 ON t2.owner_id = t3.owner_id GROUP BY t3.owner_id ORDER BY SUM(t1.cost_of_treatment) DESC LIMIT 1
SELECT t1.treatment_type_description FROM treatment_types as t1 JOIN treatments as t2 ON t1.treatment_type_code = t2.treatment_type_code GROUP BY t1.treatment_type_code ORDER BY SUM(t2.cost_of_treatment) LIMIT 1
SELECT t1.treatment_type_description FROM treatment_types as t1 JOIN treatments as t2 ON t1.treatment_type_code = t2.treatment_type_code GROUP BY t2.treatment_type_code ORDER BY SUM(t2.cost_of_treatment) LIMIT 1
SELECT t1.owner_id , t1.zip_code FROM owners as t1 JOIN treatments as t3 ON t1.owner_id = t3.dog_id JOIN charges as t4 ON t3.treatment_type_code = t4.charge_type GROUP BY t1.owner_id ORDER BY SUM(t4.charge_amount) DESC LIMIT 1
SELECT t1.owner_id , t1.zip_code FROM owners as t1 JOIN treatments as t3 ON t1.owner_id = t3.dog_id JOIN professionals as t2 ON t2.professional_id = t3.professional_id GROUP BY t1.owner_id ORDER BY SUM(t3.cost_of_treatment) DESC LIMIT 1
SELECT t2.professional_id , t2.cell_number FROM treatments as t1 JOIN professionals as t2 ON t1.professional_id = t2.professional_id GROUP BY t1.professional_id HAVING COUNT(*) >= 2
SELECT t1.professional_id , t2.cell_number FROM treatments as t1 JOIN professionals as t2 ON t1.professional_id = t2.professional_id GROUP BY t1.professional_id HAVING COUNT(*) >= 2
SELECT t1.first_name , t1.last_name FROM professionals as t1 JOIN treatments as t2 ON t1.professional_id = t2.professional_id WHERE t2.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM treatments)
SELECT t2.first_name , t2.last_name FROM treatments as t1 JOIN professionals as t2 ON t1.professional_id = t2.professional_id WHERE t1.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM treatments)
SELECT t1.date_of_treatment , t2.first_name FROM treatments as t1 JOIN professionals as t2 ON t1.professional_id = t2.professional_id
SELECT t1.date_of_treatment , t2.first_name FROM treatments as t1 JOIN professionals as t2 ON t1.professional_id = t2.professional_id
SELECT t1.cost_of_treatment , t2.treatment_type_description FROM treatment_types as t2 JOIN treatments as t1 ON t2.treatment_type_code = t1.treatment_type_code
SELECT t1.cost_of_treatment , t2.treatment_type_description FROM treatment_types as t2 JOIN treatments as t1 ON t2.treatment_type_code = t1.treatment_type_code
SELECT t1.first_name , t1.last_name , t2.size_description FROM owners as t1 JOIN dogs as t3 ON t1.owner_id = t3.owner_id JOIN sizes as t2 ON t3.size_code = t2.size_code WHERE t3.gender = 'f'
SELECT t2.first_name , t2.last_name , t1.size_description FROM sizes as t1 JOIN dogs as t3 ON t1.size_code = t3.size_code JOIN owners as t2 ON t2.owner_id = t3.owner_id
SELECT t1.first_name , t2.name FROM owners as t1 JOIN dogs as t2 ON t1.owner_id = t2.owner_id
SELECT t1.first_name , t2.name FROM owners as t1 JOIN dogs as t2 ON t1.owner_id = t2.owner_id
SELECT t2.name , t1.date_of_treatment FROM treatments as t1 JOIN dogs as t2 ON t1.dog_id = t2.dog_id JOIN breeds as t3 ON t2.breed_code = t3.breed_code GROUP BY t3.breed_name ORDER BY COUNT(*) asC LIMIT 1
SELECT t2.name , t1.date_of_treatment FROM treatments as t1 JOIN dogs as t2 ON t1.dog_id = t2.dog_id JOIN breeds as t3 ON t2.breed_code = t3.breed_code GROUP BY t3.breed_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT t2.first_name , t1.name FROM dogs as t1 JOIN owners as t2 ON t1.owner_id = t2.owner_id WHERE t2.state = "Virginia"
SELECT t1.first_name , t2.name FROM owners as t1 JOIN dogs as t2 ON t1.owner_id = t2.owner_id WHERE t1.state = "Virginia"
SELECT date_arrived , date_departed FROM dogs WHERE date_adopted = "2018-03-25 02:11:32"
SELECT date_arrived , date_departed FROM dogs WHERE treatment_yn = 1
SELECT t1.last_name FROM owners as t1 JOIN dogs as t2 ON t1.owner_id = t2.owner_id ORDER BY t2.date_of_birth LIMIT 1
SELECT t1.last_name FROM owners as t1 JOIN dogs as t2 ON t1.owner_id = t2.owner_id ORDER BY t2.date_of_birth LIMIT 1
SELECT email_address FROM professionals WHERE state = "Hawaii" OR state = "Wisconsin"
SELECT email_address FROM professionals WHERE state = "Hawaii" OR state = "Wisconsin"
SELECT date_arrived , date_departed FROM dogs
SELECT date_arrived , date_departed FROM dogs
SELECT COUNT(DISTINCT dog_id) FROM treatments
SELECT COUNT(DISTINCT dog_id) FROM treatments
SELECT COUNT(DISTINCT professional_id) FROM treatments
SELECT COUNT(DISTINCT professional_id) FROM treatments
SELECT role_code , street , city , state FROM professionals WHERE city LIKE '%West%'
SELECT role_code , street , city , state FROM professionals WHERE city LIKE '%West%'
SELECT first_name , last_name , email_address FROM owners WHERE state LIKE '%North%'
SELECT first_name , last_name , email_address FROM owners WHERE state LIKE '%North%'
SELECT COUNT(*) FROM dogs WHERE age < (SELECT AVG(age) FROM dogs)
SELECT COUNT(*) FROM dogs WHERE age < (SELECT AVG(age) FROM dogs)
SELECT cost_of_treatment FROM treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT cost_of_treatment FROM treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT COUNT(*) FROM dogs WHERE dog_id NOT IN (SELECT dog_id FROM treatments)
SELECT COUNT(*) FROM dogs WHERE dog_id NOT IN (SELECT dog_id FROM treatments)
SELECT COUNT(*) FROM owners WHERE owner_id NOT IN (SELECT owner_id FROM dogs)
SELECT COUNT(*) FROM owners WHERE owner_id NOT IN (SELECT owner_id FROM dogs)
SELECT COUNT(*) FROM professionals WHERE professional_id NOT IN (SELECT professional_id FROM treatments WHERE treatment_type_code = "OPER")
SELECT COUNT(*) FROM professionals WHERE professional_id NOT IN (SELECT professional_id FROM treatments)
SELECT name , age , weight FROM dogs WHERE abandoned_yn = 1
SELECT name , age , weight FROM dogs WHERE abandoned_yn = 1
SELECT AVG(age) FROM dogs
SELECT AVG(age) FROM dogs
SELECT age FROM dogs ORDER BY date_of_birth ASC LIMIT 1
SELECT age FROM dogs ORDER BY date_of_birth DESC LIMIT 1
SELECT charge_type , SUM(charge_amount) FROM charges GROUP BY charge_type
SELECT charge_type , SUM(charge_amount) FROM charges GROUP BY charge_type
SELECT MAX(charge_amount) FROM charges
SELECT MAX(charge_amount) FROM charges
SELECT email_address , cell_number , home_phone FROM professionals
SELECT email_address , cell_number , home_phone FROM professionals
SELECT DISTINCT t1.size_description , t2.breed_name FROM sizes as t1 JOIN breeds as t2 ON t1.size_code = t2.breed_type
SELECT DISTINCT breed_code , size_code FROM dogs
SELECT t2.first_name , t1.treatment_type_description FROM treatment_types as t1 JOIN treatments as t3 ON t1.treatment_type_code = t3.treatment_type_code JOIN professionals as t2 ON t2.professional_id = t3.professional_id
SELECT t2.first_name , t1.treatment_type_description FROM treatment_types as t1 JOIN treatments as t3 ON t1.treatment_type_code = t3.treatment_type_code JOIN professionals as t2 ON t2.professional_id = t3.professional_id
SELECT COUNT(*) FROM singer
SELECT COUNT(*) FROM singer
SELECT name FROM singer ORDER BY net_worth_millions ASC
SELECT name FROM singer ORDER BY net_worth_millions ASC
SELECT birth_year , citizenship FROM singer
SELECT birth_year , citizenship FROM singer
SELECT name FROM singer WHERE citizenship != "France"
SELECT name FROM singer WHERE citizenship != 'France'
SELECT name FROM singer WHERE birth_year = 1948 OR birth_year = 1949
SELECT name FROM singer WHERE birth_year = 1948 OR birth_year = 1949
SELECT name FROM singer ORDER BY net_worth_millions DESC LIMIT 1
SELECT name FROM singer ORDER BY net_worth_millions DESC LIMIT 1
SELECT citizenship , COUNT(*) FROM singer GROUP BY citizenship
SELECT citizenship , COUNT(*) FROM singer GROUP BY citizenship
SELECT citizenship FROM singer GROUP BY citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT citizenship FROM singer GROUP BY citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT citizenship , MAX(net_worth_millions) FROM singer GROUP BY citizenship
SELECT MAX(net_worth_millions) , citizenship FROM singer GROUP BY citizenship
SELECT t1.title , t2.name FROM song as t1 JOIN singer as t2 ON t1.singer_id = t2.singer_id
SELECT t1.title , t2.name FROM song as t1 JOIN singer as t2 ON t1.singer_id = t2.singer_id
SELECT DISTINCT t1.name FROM singer as t1 JOIN song as t2 ON t1.singer_id = t2.singer_id WHERE t2.sales > 300000
SELECT DISTINCT t1.name FROM singer as t1 JOIN song as t2 ON t1.singer_id = t2.singer_id WHERE t2.sales > 300000
SELECT t1.name FROM singer as t1 JOIN song as t2 ON t1.singer_id = t2.singer_id GROUP BY t1.singer_id HAVING COUNT(*) > 1
SELECT t1.name FROM singer as t1 JOIN song as t2 ON t1.singer_id = t2.singer_id GROUP BY t1.singer_id HAVING COUNT(*) > 1
SELECT t1.name , SUM(t2.sales) FROM singer as t1 JOIN song as t2 ON t1.singer_id = t2.singer_id GROUP BY t1.name
SELECT t1.name , SUM(t2.sales) FROM singer as t1 JOIN song as t2 ON t1.singer_id = t2.singer_id GROUP BY t1.name
SELECT name FROM singer WHERE singer_id NOT IN (SELECT singer_id FROM song)
SELECT name FROM singer WHERE singer_id NOT IN (SELECT singer_id FROM song)
SELECT citizenship FROM singer WHERE birth_year < 1945 INTERSECT SELECT citizenship FROM singer WHERE birth_year > 1955
SELECT citizenship FROM singer WHERE birth_year < 1945 INTERSECT SELECT citizenship FROM singer WHERE birth_year > 1955
SELECT COUNT(*) FROM other_available_features
SELECT t1.feature_type_name FROM ref_feature_types as t1 JOIN other_available_features as t2 ON t1.feature_type_code = t2.feature_type_code WHERE t2.feature_name = "AirCon"
SELECT t1.property_type_description FROM ref_property_types as t1 JOIN properties as t2 ON t1.property_type_code = t2.property_type_code
SELECT property_name FROM properties WHERE property_type_code = "House" OR property_type_code = "Apartment" AND room_count > 1
