USE world;
SELECT * FROM city ORDER BY Population ASC;
SELECT * FROM country ORDER BY Population ASC; 
SELECT * FROM countrylanguage ORDER BY Percentage DESC; 
SET SQL_SAFE_UPDATES=1;

#Task 1
SELECT DISTINCT COUNT(Name) FROM city 
	WHERE CountryCode = 'USA' ORDER BY Population ASC; 

#Task 2
SELECT Name, Population, LifeExpectancy FROM country 
	WHERE Name = 'Argentina' ORDER BY Population ASC; 

#Task 3
SELECT Name, Population, LifeExpectancy FROM country 
	WHERE LifeExpectancy IS NOT NULL ORDER BY LifeExpectancy DESC LIMIT 5; 

#Task 4
SELECT * FROM country country JOIN city city ON country.Code = city.CountryCode 
	WHERE city.ID = 653;
 
#Task 5 
SELECT Name, Language, Percentage FROM country country JOIN countrylanguage lang ON country.Code = lang.CountryCode 
	WHERE country.Region = 'Southeast Asia';
    
# Task 6 
SELECT Name FROM city 
	WHERE Name LIKE 'F%' LIMIT 25;

#Task 7
SELECT DISTINCT COUNT(city.Name) FROM country country 
	JOIN city city ON country.Code = city.CountryCode 
	WHERE city.CountryCode = 'CHN';
    
#Task 8 
SELECT Name, Population FROM country 
	WHERE Population IS NOT NULL AND Population != 0 
    ORDER BY Population ASC LIMIT 5; 
    
#Task 9 
SELECT DISTINCT COUNT(Name) FROM country; 

#Task 10
SELECT Name, SurfaceArea FROM country 
	ORDER BY SurfaceArea DESC LIMIT 10; 

#Task 11
SELECT city.Name, city.Population FROM country country 
	JOIN city city ON country.Code = city.CountryCode
    WHERE city.CountryCode ='JPN' ORDER BY city.Population LIMIT 5;	

#Task 12 
SET SQL_SAFE_UPDATES=0;
UPDATE country
SET HeadOfState='Elizabeth II'
WHERE HeadOfState='Elisabeth II';
SELECT Name, Code FROM country 
	WHERE HeadOfState = 'Elizabeth II'
	ORDER BY SurfaceArea DESC LIMIT 10;
    
#Task 13
SELECT Name, SurfaceArea, Population, ROUND(Population / SurfaceArea, 2) AS Ratio FROM country
	WHERE Population IS NOT NULL AND Population != 0
    ORDER BY Ratio DESC LIMIT 10;
	
#Task 14 
SELECT DISTINCT Language FROM countrylanguage;

#Task 15
SELECT Name, GNP FROM country
	ORDER BY GNP DESC LIMIT 10;

#Task 16
SELECT DISTINCT Language, COUNT(Language) as Frequency FROM countrylanguage
	GROUP BY Language
	ORDER BY Frequency DESC LIMIT 10;

#Task 17
SELECT Name, cl.Percentage FROM countrylanguage cl
	JOIN country co ON co.Code=cl.CountryCode
	WHERE cl.Language='German' AND cl.Percentage>50
	ORDER BY cl.Percentage DESC;
    
#Task 18
SELECT Name, LifeExpectancy FROM country
	WHERE LifeExpectancy=(
		SELECT MIN(LifeExpectancy) FROM country
		WHERE LifeExpectancy!=0
	);
    
#Task 19
SELECT GovernmentForm FROM country
	GROUP BY GovernmentForm
	ORDER BY Count(GovernmentForm) DESC LIMIT 3;

#Task 20
SELECT COUNT(IndepYear) FROM country
	WHERE IndepYear IS NOT NULL;