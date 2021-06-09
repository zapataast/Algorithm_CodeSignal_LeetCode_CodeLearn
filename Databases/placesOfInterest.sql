CREATE PROCEDURE placesOfInterest()
BEGIN      
	SELECT country,
        SUM(case when leisure_activity_type	 = 'Adventure park' then number_of_places else 0 end) as adventure_park,
        SUM(case when leisure_activity_type	 = 'Golf' then number_of_places else 0 end) as golf, 
        SUM(case when leisure_activity_type	 = 'River cruise' then number_of_places else 0 end) as river_cruise,
        SUM(case when leisure_activity_type	 = 'Kart racing' then number_of_places else 0 end) as kart_racing
    FROM countryActivities
    GROUP BY country
    ORDER BY country;
END
