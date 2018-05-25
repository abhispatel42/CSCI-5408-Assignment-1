Query 1

SELECT trip_headsign 
FROM trips
WHERE trip_id IN (SELECT stopTimes.trip_id
			FROM stopTimes
			INNER JOIN stops
			ON stopTimes.stop_id = stops.stop_id
			WHERE stops.name_stop = 'spring Garden Rd [eastbound] before South Park St');
----------------------------------------------------------------------------------------------------------------------------
Query 2
					
SELECT trip_headsign
FROM trips
WHERE trip_id IN (SELECT stopTimes.trip_id FROM stopTimes WHERE departure_time BETWEEN '1:00:00 PM' AND '2:00:00 PM');

----------------------------------------------------------------------------------------------------------------------------
Query 3

SELECT name_stop
FROM stops
WHERE stop_id IN(SELECT stop_id 
		FROM stopTimes
		WHERE trip_id IN (SELECT trip_id
				FROM trips
				WHERE route_id = '1-114'
				AND trip_headsign = '1 SPRING GARDEN TO BRIDGE TERMINAL'));
----------------------------------------------------------------------------------------------------------------------------
Query 4
										
CREATE TABLE concate(
route_id VARCHAR(255),
trip_headsign VARCHAR(255),
trip_id VARCHAR(255),
stop_id VARCHAR(255),
arrival_time VARCHAR(255),
departure_time VARCHAR(255),
name_stop VARCHAR(255));

INSERT INTO concate
SELECT trips.route_id, trips.trip_headsign, trips.trip_id, stopTimes.stop_id, stopTimes.arrival_time, stopTimes.departure_time, stops.name_stop
FROM trips
RIGHT JOIN stopTimes ON trips. trip_id = stopTimes.trip_id
LEFT JOIN stops ON stopTimes.stop_id = stops.stop_id

SELECT name_stop 
FROM concate
GROUP BY name_stop
ORDER BY COUNT 	(route_id) DESC
LIMIT 3;

SELECT name_stop 
FROM concate
GROUP BY name_stop
ORDER BY COUNT 	(arrival_time) DESC
LIMIT 3;