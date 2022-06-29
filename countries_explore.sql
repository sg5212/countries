-- 1. Show the possible values of the year column in the country_stats table sorted by most recent year first
SELECT DISTINCT year 
FROM country_stats 
ORDER BY year DESC;

-- 2. Show the names of the first 5 countries in the database when sorted in alphabetical order by name.
SELECT name 
FROM countries 
ORDER BY name ASC
LIMIT 5;

-- 3. Adjust the previous query to show both the country name and the gdp from 2018, but this time show the top 5 countries by gdp.
SELECT countries.name, country_stats.gdp
FROM countries, country_stats 
WHERE countries.country_id=country_stats.country_id AND country_stats.year=2018 
GROUP BY countries.name, country_stats.gdp
ORDER BY country_stats.gdp DESC
LIMIT 5;

-- 4. How many countries are associated with each region id?
SELECT regions.region_id, COUNT(*) AS country_count 
FROM regions, countries 
WHERE regions.region_id=countries.region_id 
GROUP BY regions.region_id 
ORDER BY country_count DESC; 

-- 5. What is the average area of countries in each region id?
SELECT regions.region_id, ROUND(AVG(countries.area),0) AS avg_area 
FROM regions, countries 
WHERE regions.region_id=countries.region_id 
GROUP BY regions.region_id 
ORDER BY avg_area ASC; 

-- 6. Use the same query as above, but only show the groups with an average country area less than 1000
SELECT regions.region_id, ROUND(AVG(countries.area),0) AS avg_area 
FROM regions, countries 
WHERE regions.region_id=countries.region_id 
GROUP BY regions.region_id 
HAVING ROUND(AVG(countries.area),0) < 1000 
ORDER BY avg_area ASC;

-- 7. Create a report displaying the name and population of every continent in the database from the year 2018 in millions
SELECT continents.name, ROUND((SUM(country_stats.population) / 1000000.0),2) AS tot_pop 
FROM continents, regions, countries, country_stats 
WHERE continents.continent_id=regions.continent_id AND regions.region_id=countries.region_id AND countries.country_id=country_stats.country_id AND country_stats.year=2018 
GROUP BY continents.name 
ORDER BY SUM(country_stats.population) DESC;

-- 8. List the names of all of the countries that do not have a language
SELECT countries.name 
FROM countries 
LEFT JOIN country_languages ON countries.country_id=country_languages.country_id 
WHERE country_languages.language_id IS NULL 
ORDER BY countries.name ASC; 

-- 9. Show the country name and number of associated languages of the top 10 countries with most languages
SELECT countries.name, COUNT(*) AS lang_count 
FROM countries, country_languages 
WHERE countries.country_id=country_languages.country_id 
GROUP BY countries.name 
ORDER BY lang_count DESC, countries.name ASC 
LIMIT 10; 

-- 10. Repeat your previous query, but display a comma separated list of spoken languages rather than a count (use the aggregate function for strings, string_agg. 
SELECT countries.name, STRING_AGG(languages.language,',') string_agg
FROM countries, country_languages, languages 
WHERE countries.country_id=country_languages.country_id AND country_languages.language_id=languages.language_id
GROUP BY countries.name 
ORDER BY countries.name ASC; 

-- 11. What's the average number of languages in every country in a region in the dataset? Show both the region's name and the average. Make sure to include countries that don't have a language in your calculations. (Hint: using your previous queries and additional subqueries may be useful)
SELECT regions.name, COUNT(*) AS avg_lang_count_per_country 
FROM regions, countries, country_languages 
WHERE regions.region_id=countries.region_id AND countries.country_id=country_languages.country_id 
GROUP BY regions.name 
ORDER BY avg_lang_count_per_country DESC
LIMIT 10; 
