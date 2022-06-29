<html lang="en">
<head>
  <h1>Countries</h1>
  <meta charset="utf-8">
</head>
<body>

<div class="alert alert-info">
Creating, Importing, Exploring
</div>

</body>
</html>

## Part 1: Create an ER Diagram by inspecting tables

![ER Diagram for 'countries'](https://github.com/sg5212/caers/blob/main/img/part1_countries_er_diagram.png)

Describe the kind of relationship between each table (e.g. some_table has a one to many relationship with another_table)

- 'countries' has a one to many relationship with 'country_stats', 'country_languages', and 'regions.' 

- 'regions' has a one to many relationship with 'continents' and 'countries.' 

- 'continents' has a one to many relationship with 'regions.'

- 'country_stats' has a one to many relationship with 'countries.'

- 'country_languages' has a one to many relationship with 'countries' and 'languages.'

- 'languages' has a one to many relationship with 'country_languages.'

- 'region_areas' has no relationship with any tables.


Why do you think this kind of relationship exists (e.g. this relationship exists because of a foreign key in some_table that references another_table)

- 'countries' has a one to many relationship with 'country_stats' because the primary key of 'country_stats' (country_id) references the primary key of 'countries' which also makes country_id a foreign key in 'country_stats' (since it is from 'countries').

- 'countries' has a one to many relationship with 'country_languages' because the primary key of 'country_languages' (country_id) references the primary key of 'countries' which also makes country_id a foreign key in 'country_languages' (since it is from 'countries').

- 'countries' has a one to many relationship with 'regions' because the primary key of 'regions' (region_id) is a foreign key in 'countries.'

- 'regions' has a one to many relationship with 'continents' because the primary key of 'continents' (continent_id) is a foreign key of 'regions.'

- 'country_languages' has a one to many relationship with 'languages' because its primary key  language_id is referenced from 'languages' and therefore is used as a primary key and foreign key in 'country_languages.'
