--------------------- Badge 1 --------------------- 
-- SELECT * FROM garden_plants.flower LIMIT 50;
-- SELECT 'hello' as "greeting";
-- SHOW databases;
SHOW schemas in ACCOUNT;
SHOW tables;

-- -- Creating tables
-- create or replace table garden_plants.veggies.ROOT_DEPTH (
--    ROOT_DEPTH_ID number(1), 
--    ROOT_DEPTH_CODE text(1), 
--    ROOT_DEPTH_NAME text(7), 
--    UNIT_OF_MEASURE text(2),
--    RANGE_MIN number(2),
--    RANGE_MAX number(2)
--    ); 


-- insert into garden_plants.veggie.root_depth 
-- values
-- (
--     2,
--     'M',
--     'Medium',
--     'cm',
--     45,
--     60
-- )
-- ;


-- SELECT * FROM garden_plants.veggie.root_depth;

-- Create Dora api integration
-- THE APP:

-- https://ysa.snowflakeuniversity.com

-- Right-click the link above and choose Open Link in New Tab.

-- YOUR UNI ID:

-- 005VI00000QvbQTYAZ

-- YOUR ASSIGNED UUID: (Do Not Share)

-- 4afeb481-9013-4794-b7be-ffa3eda28909
-- use role accountadmin;

-- create or replace api integration dora_api_integration
-- api_provider = aws_api_gateway
-- api_aws_role_arn = 'arn:aws:iam::321463406630:role/snowflakeLearnerAssumedRole'
-- enabled = true
-- api_allowed_prefixes = ('https://awy6hshxy4.execute-api.us-west-2.amazonaws.com/dev/edu_dora');

-- create or replace external function util_db.public.grader(
--       step varchar
--     , passed boolean
--     , actual integer
--     , expected integer
--     , description varchar)
-- returns variant
-- api_integration = dora_api_integration 
-- context_headers = (current_timestamp, current_account, current_statement, current_account_name) 
-- as 'https://awy6hshxy4.execute-api.us-west-2.amazonaws.com/dev/edu_dora/grader'
-- ; 

-- use database util_db; 
-- use schema public; 

-- select grader(step, (actual = expected), actual, expected, description) as graded_results from
-- (SELECT 
--  'DORA_IS_WORKING' as step
--  ,(select 123) as actual
--  ,123 as expected
--  ,'Dora is working!' as description
-- ); 

-- Testing
-- SELECT * 
-- FROM GARDEN_PLANTS.INFORMATION_SCHEMA.SCHEMATA
-- where schema_name in ('FLOWERS','FRUITS','VEGGIES'); 

-- select count(*) as schemas_found, '3' as schemas_expected 
-- from GARDEN_PLANTS.INFORMATION_SCHEMA.SCHEMATA
-- where schema_name in ('FLOWERS','FRUITS','VEGGIES'); 

-- -- DORA DWW01
-- use database UTIL_DB;
-- use schema PUBLIC;
-- use role ACCOUNTADMIN;

-- --Do NOT EDIT ANYTHING BELOW THIS LINE
-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
--  SELECT
--  'DWW01' as step
--  ,( select count(*)  
--    from GARDEN_PLANTS.INFORMATION_SCHEMA.SCHEMATA 
--    where schema_name in ('FLOWERS','VEGGIES','FRUITS')) as actual
--   ,3 as expected
--   ,'Created 3 Garden Plant schemas' as description
-- ); 

-- -- Dora DWW02
-- use database UTIL_DB;
-- use schema PUBLIC;
-- use role ACCOUNTADMIN;

-- --Do NOT EDIT ANYTHING BELOW THIS LINE

-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
--  SELECT 'DWW02' as step 
--  ,( select count(*) 
--    from GARDEN_PLANTS.INFORMATION_SCHEMA.SCHEMATA 
--    where schema_name = 'PUBLIC') as actual 
--  , 0 as expected 
--  ,'Deleted PUBLIC schema.' as description
-- ); 

-- -- DOra dww03
-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
--  SELECT 'DWW03' as step 
--  ,( select count(*) 
--    from GARDEN_PLANTS.INFORMATION_SCHEMA.TABLES 
--    where table_name = 'ROOT_DEPTH') as actual 
--  , 1 as expected 
--  ,'ROOT_DEPTH Table Exists' as description
-- ); 

-- -- dora dww04
-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
--  SELECT 'DWW04' as step
--  ,( select count(*) as SCHEMAS_FOUND 
--    from UTIL_DB.INFORMATION_SCHEMA.SCHEMATA) as actual
--  , 2 as expected
--  , 'UTIL_DB Schemas' as description
-- ); 

-- --dora dww05
-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from ( 
--  SELECT 'DWW05' as step 
-- ,( select row_count 
--   from GARDEN_PLANTS.INFORMATION_SCHEMA.TABLES 
--   where table_name = 'ROOT_DEPTH') as actual 
-- , 3 as expected 
-- ,'ROOT_DEPTH row count' as description
-- );


-----------------
-- Loading Data --

-- create table garden_plants.veggies.vegetable_details
-- (
-- plant_name varchar(25)
-- , root_depth_code varchar(1)    
-- );

-- SELECT vegdet.plant_name
--     , rd.root_depth_name
--     , rd.unit_of_measure
--     , rd.range_min
--     , rd.range_max 
-- FROM garden_plants.veggies.vegetable_details vegdet
-- JOIN garden_plants.veggies.root_depth rd 
--     ON vegdet.root_depth_code = rd.root_depth_code
-- limit 100;

-- create or replace table garden_plants.veggieS.VEGETABLE_DETAILS (
--    PLANT_NAME TEXT(20), 
--    ROOT_DEPTH_CODE text(1)
--    ); 

-- -- Dora dww06
-- use database UTIL_DB;
-- use schema PUBLIC;
-- use role ACCOUNTADMIN;
-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
--  SELECT 'DWW06' as step
--  ,( select count(*) 
--    from GARDEN_PLANTS.INFORMATION_SCHEMA.TABLES 
--    where table_name = 'VEGETABLE_DETAILS') as actual
--  , 1 as expected
--  ,'VEGETABLE_DETAILS Table' as description
-- ); 

-- SELECT * FROM garden_plants.veggies.vegetable_details;
-- -- Dupe data for plant_name = 'Spinach' and root_depth_code = 'D'
-- DELETE from garden_plants.veggies.vegetable_details
-- WHERE plant_name = 'Spinach' and root_depth_code = 'D';

-- -- dora dww07
-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
--  SELECT 'DWW07' as step
--  ,( select row_count 
--    from GARDEN_PLANTS.INFORMATION_SCHEMA.TABLES 
--    where table_name = 'VEGETABLE_DETAILS') as actual
--  , 41 as expected
--  , 'VEG_DETAILS row count' as description
-- ); 

--------------
-- Lesson 8 --
--------------
-- USE database garden_plants;
-- use schema veggies;
-- use role SYSADMIN;
-- create table garden_plants.veggies.flower_details
-- (
-- plant_name varchar(25)
-- , root_depth_code varchar(1)    
-- );

-- -- Dora 8?
-- use database UTIL_DB;
-- use schema PUBLIC;
-- use role ACCOUNTADMIN;
-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from ( 
--    SELECT 'DWW08' as step 
--    ,( select iff(count(*)=0, 0, count(*)/count(*))
--       from table(information_schema.query_history())
--       where query_text like 'execute notebook%Uncle Yer%') as actual 
--    , 1 as expected 
--    , 'Notebook success!' as description 
-- ); 


-- use role SYSADMIN;
-- create table garden_plants.fruits.fruit_details
-- (
-- plant_name varchar(25)
-- , root_depth_code varchar(1)    
-- );
select * FROM garden_plants.fruits.fruit_details;
-- truncate table garden_plants.fruits.fruit_details;
-- DELETE FROM garden_plants.fruits.fruit_details WHERE plant_name = '';

-- -- Dora 8b
-- use database UTIL_DB;
-- use schema PUBLIC;
-- use role ACCOUNTADMIN;
-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
--  SELECT 'DWW09' as step
--  ,( select iff(count(*)=0, 0, count(*)/count(*)) 
--     from snowflake.account_usage.query_history
--     where query_text like 'execute streamlit "GARDEN_PLANTS"."FRUITS".%'
--    ) as actual
--  , 1 as expected
--  ,'SiS App Works' as description

-- ); 

-- -- dora 10
-- use database UTIL_DB;
-- use schema PUBLIC;
-- use role ACCOUNTADMIN;
-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
--  SELECT 'DWW10' as step
--   ,( select count(*) 
--     from UTIL_DB.INFORMATION_SCHEMA.stages
--     where stage_name='MY_INTERNAL_STAGE' 
--     and stage_type is null) as actual
--   , 1 as expected
--   , 'Internal stage created' as description
--  ); 

---------------------
-- Load data from staged file --

-- create or replace table garden_plants.veggies.vegetable_details_soil_type
-- ( plant_name varchar(25)
--  ,soil_type number(1,0)
-- );

-- create file format garden_plants.veggies.PIPECOLSEP_ONEHEADROW 
--     type = 'CSV'--csv is used for any flat file (tsv, pipe-separated, etc)
--     field_delimiter = '|' --pipes as column separators
--     skip_header = 1 --one header row to skip
--     ;

-- SHOW stages;

-- copy into garden_plants.veggies.vegetable_details_soil_type
-- from @util_db.public.my_internal_stage
-- files = ( 'VEG_NAME_TO_SOIL_TYPE_PIPE.TXT')
-- file_format = (format_name= garden_plants.veggies.PIPECOLSEP_ONEHEADROW);

SELECT * FROM garden_plants.veggies.vegetable_details_soil_type;

-- -- dora 11
-- use database UTIL_DB;
-- use schema PUBLIC;
-- use role ACCOUNTADMIN;
-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
--   SELECT 'DWW11' as step
--   ,( select row_count 
--     from GARDEN_PLANTS.INFORMATION_SCHEMA.TABLES 
--     where table_name = 'VEGETABLE_DETAILS_SOIL_TYPE') as actual
--   , 42 as expected
--   , 'Veg Det Soil Type Count' as description
--  ); 

-- create file format garden_plants.veggies.COMMASEP_DBLQUOT_ONEHEADROW 
--     TYPE = 'CSV'--csv for comma separated files
--     FIELD_DELIMITER = ',' --commas as column separators
--     SKIP_HEADER = 1 --one header row  
--     FIELD_OPTIONALLY_ENCLOSED_BY = '"' --this means that some values will be wrapped in double-quotes bc they have commas in them
--     ;

create or replace file format garden_plants.veggies.L9_CHALLENGE_FF 
    TYPE = 'CSV'--csv for comma separated files
    FIELD_DELIMITER = '\t' --commas as column separators
    SKIP_HEADER = 1 --one header row  
    FIELD_OPTIONALLY_ENCLOSED_BY = '"' --this means that some values will be wrapped in double-quotes bc they have commas in them
    ;

-- --The data in the file, with no FILE FORMAT specified
-- select $1
-- from @util_db.public.my_internal_stage/LU_SOIL_TYPE.tsv;

-- --Same file but with one of the file formats we created earlier  
-- select $1, $2, $3
-- from @util_db.public.my_internal_stage/LU_SOIL_TYPE.tsv
-- (file_format => garden_plants.veggies.TabSEP_DBLQUOT_ONEHEADROW);

-- --Same file with dora ready filetype
-- select $1, $2, $3
-- from @util_db.public.my_internal_stage/LU_SOIL_TYPE.tsv
-- (file_format => garden_plants.veggies.L9_CHALLENGE_FF );

-- create or replace table garden_plants.veggies.LU_SOIL_TYPE(
-- SOIL_TYPE_ID number,	
-- SOIL_TYPE varchar(15),
-- SOIL_DESCRIPTION varchar(75)
--  );

-- copy into garden_plants.veggies.LU_SOIL_TYPE
-- from @util_db.public.my_internal_stage
-- files = ( 'LU_SOIL_TYPE.tsv')
-- file_format = (format_name= garden_plants.veggies.L9_CHALLENGE_FF);

-- select * FROM garden_plants.veggies.LU_SOIL_TYPE;

-------
-- Create table and load using all data --
use role SYSADMIN;
create or replace table garden_plants.veggies.VEGETABLE_DETAILS_PLANT_HEIGHT(
PLANT_NAME varchar(25),
UOM varchar(1),
RANGE_MIN number(2),
RANGE_MAX number(2)
);

-- use role ACCOUNTADMIN;
-- DROP file format garden_plants.veggies.COMMASEP_DBLQUOT_ONEHEADROW;
use role SYSADMIN;
-- create or replace file format garden_plants.veggies.COMMASEP_DBLQUOT_ONEHEADROW 
--     TYPE = 'CSV'--csv for comma separated files
--     FIELD_DELIMITER = ',' --commas as column separators
--     SKIP_HEADER = 1 --one header row  
--     FIELD_OPTIONALLY_ENCLOSED_BY = '"' --this means that some values will be wrapped in double-quotes bc they have commas in them
--     ;


-- -- Review parsing after file uplaod to stage
-- select $1, $2, $3, $4
-- from @util_db.public.my_internal_stage/veg_plant_height.csv
-- (file_format => garden_plants.veggies.COMMASEP_DBLQUOT_ONEHEADROW );

-- -- Upload to table
-- copy into garden_plants.veggies.VEGETABLE_DETAILS_PLANT_HEIGHT
-- from @util_db.public.my_internal_stage
-- files = ( 'veg_plant_height.csv')
-- file_format = (format_name= garden_plants.veggies.COMMASEP_DBLQUOT_ONEHEADROW);

-- SELECT * FROM garden_plants.veggies.VEGETABLE_DETAILS_PLANT_HEIGHT;

-- --Dora 12
-- use database UTIL_DB;
-- use schema PUBLIC;
-- use role ACCOUNTADMIN;
-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (  
--       SELECT 'DWW12' as step 
--       ,( select row_count 
--         from GARDEN_PLANTS.INFORMATION_SCHEMA.TABLES 
--         where table_name = 'VEGETABLE_DETAILS_PLANT_HEIGHT') as actual 
--       , 41 as expected 
--       , 'Veg Detail Plant Height Count' as description   
-- ); 
--Dora 13
-- use database UTIL_DB;
-- use schema PUBLIC;
-- use role ACCOUNTADMIN;
-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (  
--      SELECT 'DWW13' as step 
--      ,( select row_count 
--        from GARDEN_PLANTS.INFORMATION_SCHEMA.TABLES 
--        where table_name = 'LU_SOIL_TYPE') as actual 
--      , 8 as expected 
--      ,'Soil Type Look Up Table' as description   
-- ); 

-- -- Dora 14
-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from ( 
--      SELECT 'DWW14' as step 
--      ,( select count(*) 
--        from GARDEN_PLANTS.INFORMATION_SCHEMA.FILE_FORMATS 
--        where FILE_FORMAT_NAME='L9_CHALLENGE_FF' 
--        and FIELD_DELIMITER = '\t') as actual 
--      , 1 as expected 
--      ,'Challenge File Format Created' as description  
-- ); 

---------------
-- Lesson 10 --
---------------
-- use role sysadmin;

-- // Create a new database and set the context to use the new database
-- create database library_card_catalog comment = 'DWW Lesson 10 ';

-- //Set the worksheet context to use the new database
-- use database library_card_catalog;
-- use database library_card_catalog;
-- use role sysadmin;

-- // Create the book table and use AUTOINCREMENT to generate a UID for each new row

-- create or replace table book
-- ( book_uid number autoincrement
--  , title varchar(50)
--  , year_published number(4,0)
-- );

-- // Insert records into the book table
-- // You don't have to list anything for the
-- // BOOK_UID field because the AUTOINCREMENT property 
-- // will take care of it for you

-- insert into book(title, year_published)
-- values
--  ('Food',2001)
-- ,('Food',2006)
-- ,('Food',2008)
-- ,('Food',2016)
-- ,('Food',2015);

-- // Check your table. Does each row have a unique id? 
-- select * from book;


-- // Create Author table
-- create or replace table author (
--    author_uid number 
--   ,first_name varchar(50)
--   ,middle_name varchar(50)
--   ,last_name varchar(50)
-- );

-- // Insert the first two authors into the Author table
-- insert into author(author_uid, first_name, middle_name, last_name)  
-- values
-- (1, 'Fiona', '','Macdonald')
-- ,(2, 'Gian','Paulo','Faleschini');

-- // Look at your table with it's new rows
-- select * 
-- from author;

-- use role sysadmin;

-- //See how the nextval function works
-- -- select seq_author_uid.nextval;

-- create or replace sequence library_card_catalog.public.seq_author_uid
-- start = 3 
-- increment = 1 
-- ORDER
-- comment = 'Use this to fill in the AUTHOR_UID every time you add a row';

-- //Add the remaining author records and use the nextval function instead 
-- //of putting in the numbers
-- insert into author(author_uid,first_name, middle_name, last_name) 
-- values
-- (seq_author_uid.nextval, 'Laura', 'K','Egendorf')
-- ,(seq_author_uid.nextval, 'Jan', '','Grover')
-- ,(seq_author_uid.nextval, 'Jennifer', '','Clapp')
-- ,(seq_author_uid.nextval, 'Kathleen', '','Petelinsek');

-- SELECT * FROM library_card_catalog.public.author;

-- use database library_card_catalog;
-- use role sysadmin;


-- // Create the relationships table
-- // this is sometimes called a "Many-to-Many table"
-- create table book_to_author
-- ( book_uid number
--   ,author_uid number
-- );

-- //Insert rows of the known relationships
-- insert into book_to_author(book_uid, author_uid)
-- values
--  (1,1)  // This row links the 2001 book to Fiona Macdonald
-- ,(1,2)  // This row links the 2001 book to Gian Paulo Faleschini
-- ,(2,3)  // Links 2006 book to Laura K Egendorf
-- ,(3,4)  // Links 2008 book to Jan Grover
-- ,(4,5)  // Links 2016 book to Jennifer Clapp
-- ,(5,6); // Links 2015 book to Kathleen Petelinsek


-- //Check your work by joining the 3 tables together
-- //You should get 1 row for every author
-- select * 
-- from book_to_author ba 
-- join author a 
-- on ba.author_uid = a.author_uid 
-- join book b 
-- on b.book_uid=ba.book_uid; 

-- -- DORA 15
-- use database UTIL_DB;
-- use schema PUBLIC;
-- use role ACCOUNTADMIN;
-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (  
--      SELECT 'DWW15' as step 
--      ,( select count(*) 
--       from LIBRARY_CARD_CATALOG.PUBLIC.Book_to_Author ba 
--       join LIBRARY_CARD_CATALOG.PUBLIC.author a 
--       on ba.author_uid = a.author_uid 
--       join LIBRARY_CARD_CATALOG.PUBLIC.book b 
--       on b.book_uid=ba.book_uid) as actual 
--      , 6 as expected 
--      , '3NF DB was Created.' as description  
-- ); 

-- Create json data to ingest
-- // JSON DDL Scripts
-- use database library_card_catalog;
-- use role sysadmin;

-- // Create an Ingestion Table for JSON Data
-- create or replace table library_card_catalog.public.author_ingest_json
-- (
--   raw_author variant
-- );

-- //Create File Format for JSON Data 
-- create or replace file format library_card_catalog.public.json_file_format
-- type = 'JSON' 
-- compression = 'AUTO' 
-- enable_octal = TRUE
-- allow_duplicate = FALSE 
-- strip_outer_array = TRUE
-- strip_null_values = FALSE 
-- ignore_utf8_errors = FALSE; 

-- -- TESTING variant data ingest, json will ingest row at a time
-- select $1 -- only one column of json blocks/values
-- from @util_db.public.my_internal_stage/author_with_header.json
-- (file_format => library_card_catalog.public.json_file_format );

-- TRUNCATE table if exists library_card_catalog.public.author_ingest_json;

-- copy into library_card_catalog.public.author_ingest_json
-- from @util_db.public.my_internal_stage
-- files = ( 'author_with_header.json')
-- file_format = (format_name= library_card_catalog.public.json_file_format);

-- SELECT raw_author FROM library_card_catalog.public.author_ingest_json;

-- //returns AUTHOR_UID value from top-level object's attribute
-- select raw_author:AUTHOR_UID
-- from author_ingest_json;

//returns the data in a way that makes it look like a normalized table
-- SELECT 
--  raw_author:AUTHOR_UID
-- ,raw_author:FIRST_NAME::STRING as FIRST_NAME
-- ,raw_author:MIDDLE_NAME::STRING as MIDDLE_NAME
-- ,raw_author:LAST_NAME::STRING as LAST_NAME
-- FROM AUTHOR_INGEST_JSON;

-- Dora 16
-- use database UTIL_DB;
-- use schema PUBLIC;
-- use role ACCOUNTADMIN;
-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from
-- (
--   SELECT 'DWW16' as step
--   ,( select row_count 
--     from LIBRARY_CARD_CATALOG.INFORMATION_SCHEMA.TABLES 
--     where table_name = 'AUTHOR_INGEST_JSON') as actual
--   ,6 as expected
--   ,'Check number of rows' as description
--  ); 

// Create an Ingestion Table for the NESTED JSON Data
-- create or replace table library_card_catalog.public.nested_ingest_json 
-- (
--   raw_nested_book VARIANT
-- );

-- -- TESTING nested json ingest
-- select $1 -- only one column of json blocks/values
-- from @util_db.public.my_internal_stage/json_book_author_nested.txt
-- (file_format => library_card_catalog.public.json_file_format );

-- copy into library_card_catalog.public.nested_ingest_json
-- from @util_db.public.my_internal_stage
-- files = ( 'json_book_author_nested.txt')
-- file_format = (format_name= library_card_catalog.public.json_file_format);

-- SELECT raw_nested_book:authors
--     , raw_nested_book:year_published 
-- FROM library_card_catalog.public.nested_ingest_json;

//Use these example flatten commands to explore flattening the nested book and author data
-- USE database library_card_catalog;
-- USE schema public;
-- select * --,value:first_name
-- from nested_ingest_json
--     ,lateral flatten(input => raw_nested_book:authors);

-- select * --value:first_name
-- from nested_ingest_json
-- ,table(flatten(raw_nested_book:authors));

-- //Add a CAST command to the fields returned
-- SELECT value:first_name::varchar, value:last_name::varchar
-- from nested_ingest_json
-- ,lateral flatten(input => raw_nested_book:authors);

-- //Assign new column  names to the columns using "AS"
-- select value:first_name::varchar as first_nm
-- , value:last_name::varchar as last_nm
-- from nested_ingest_json
-- ,lateral flatten(input => raw_nested_book:authors);

-- DORA 17
-- use database UTIL_DB;
-- use schema PUBLIC;
-- use role ACCOUNTADMIN;
-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (   
--      SELECT 'DWW17' as step 
--       ,( select row_count 
--         from LIBRARY_CARD_CATALOG.INFORMATION_SCHEMA.TABLES 
--         where table_name = 'NESTED_INGEST_JSON') as actual 
--       , 5 as expected 
--       ,'Check number of rows' as description  
-- ); 

-- Lesson 12
-- EXAMPLE UNUSED -> Put file in area `PUT file:///Users/username/SVN/CUSTOMERREPO/examples/json/ @~/json/;`
-- ManPages -> https://community.snowflake.com/s/article/json-data-parsing-in-snowflake
-- create database SOCIAL_MEDIA_FLOODGATES comment = 'DWW Lesson 12';
-- create or replace table  SOCIAL_MEDIA_FLOODGATES.Public.TWEET_INGEST
-- (
--   RAW_STATUS VARIANT
-- );

-- //Create File Format for social JSON Data 
-- create or replace file format SOCIAL_MEDIA_FLOODGATES.public.json_file_format
-- type = 'JSON' 
-- compression = 'AUTO' 
-- enable_octal = TRUE
-- allow_duplicate = FALSE 
-- strip_outer_array = TRUE
-- strip_null_values = FALSE 
-- ignore_utf8_errors = FALSE; 

-- -- -- TESTING nested json ingest
-- select $1 -- only one column of json blocks/values
-- from @util_db.public.my_internal_stage/nutrition_tweets.json
-- (file_format => SOCIAL_MEDIA_FLOODGATES.public.json_file_format );

-- copy into SOCIAL_MEDIA_FLOODGATES.Public.TWEET_INGEST
-- from @util_db.public.my_internal_stage
-- files = ( 'nutrition_tweets.json')
-- file_format = (format_name= SOCIAL_MEDIA_FLOODGATES.public.json_file_format);

//simple select statements -- are you seeing 9 rows?
-- select raw_status
-- from tweet_ingest;

-- select raw_status:entities
-- from tweet_ingest;

-- select raw_status:entities:hashtags
-- from tweet_ingest;

-- //Explore looking at specific hashtags by adding bracketed numbers
-- //This query returns just the first hashtag in each tweet
-- select raw_status:entities:hashtags[0].text
-- from tweet_ingest;

-- //This version adds a WHERE clause to get rid of any tweet that 
-- //doesn't include any hashtags
-- select raw_status:entities:hashtags[0].text
-- from tweet_ingest
-- where raw_status:entities:hashtags[0].text is not null;

-- //Perform a simple CAST on the created_at key
-- //Add an ORDER BY clause to sort by the tweet's creation date
-- select raw_status:created_at::date
-- from tweet_ingest
-- order by raw_status:created_at::date;

//Flatten statements can return nested entities only (and ignore the higher level objects)
-- select value as urls
-- from tweet_ingest
-- ,lateral flatten(input => raw_status:entities:urls);

-- select value
-- from tweet_ingest
-- ,table(flatten(raw_status:entities:urls));

//Flatten and return just the hashtag text, CAST the text as VARCHAR
-- select value:text::varchar as hashtag_used
-- from tweet_ingest
-- ,lateral flatten
-- (input => raw_status:entities:hashtags);

-- //Add the Tweet ID and User ID to the returned table so we could join the hashtag back to it's source tweet
-- select raw_status:user:name::text as user_name //raw_status is original col name of table
-- ,raw_status:id as tweet_id
-- ,value:text::varchar as hashtag_used //value references flattened data with no join needed I guess
-- from tweet_ingest
-- ,lateral flatten
-- (input => raw_status:entities:hashtags);

-- -- dora 18
-- use database UTIL_DB;
-- use schema PUBLIC;
-- use role ACCOUNTADMIN;
-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from
-- (
--    SELECT 'DWW18' as step
--   ,( select row_count 
--     from SOCIAL_MEDIA_FLOODGATES.INFORMATION_SCHEMA.TABLES 
--     where table_name = 'TWEET_INGEST') as actual
--   , 9 as expected
--   ,'Check number of rows' as description  
--  ); 

-- create or replace view social_media_floodgates.public.urls_normalized as
-- (select raw_status:user:name::text as user_name
-- ,raw_status:id as tweet_id
-- ,value:display_url::text as url_used
-- from tweet_ingest
-- ,lateral flatten
-- (input => raw_status:entities:urls)
-- );

-- SELECT * FROM social_media_floodgates.public.urls_normalized;

-- CREATE or replace view social_media_floodgates.public.HASHTAGS_NORMALIZED AS
-- (
--     Select raw_status:user:name::text as user_name
--         ,raw_status:id as tweet_id
--         ,value:text::text as hashtag_used
--     FROM social_media_floodgates.public.tweet_ingest,
--     lateral flatten(input => raw_status:entities:hashtags)
-- );

-- SELECT * FROM social_media_floodgates.public.HASHTAGS_NORMALIZED;

-- DORA 19
-- use database UTIL_DB;
-- use schema PUBLIC;
-- use role ACCOUNTADMIN;
-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from
-- (
--   SELECT 'DWW19' as step
--   ,( select count(*) 
--     from SOCIAL_MEDIA_FLOODGATES.INFORMATION_SCHEMA.VIEWS 
--     where table_name = 'HASHTAGS_NORMALIZED') as actual
--   , 1 as expected
--   ,'Check number of rows' as description
--  ); 

---------------------- Badge 2---------------------- 
--------------------------
-- Drop sample database --
--------------------------
-- use role accountadmin;
-- drop database snowflake_sample_data;
-- -- Add  back database using download icon in ui
-- alter database THAT_REALLY_COOL_SAMPLE_STUFF rename to snowflake_sample_data;
-- use role sysadmin;
-- show databases;
-- -- Grant usage, or "imported privileges" to the sysadmin after creating with accountadmin
-- use role accountadmin;
-- GRANT IMPORTED PRIVILEGES on database snowflake_sample_data to sysadmin;
-- use role sysadmin;
-- show databases;
--------------------------
-- View shared database --
--------------------------
-- --Check the range of values in the Market Segment Column
-- select distinct c_mktsegment
-- from snowflake_sample_data.tpch_sf1.customer;
-- --Find out which Market Segments have the most customers
-- select c_mktsegment, count(*)
-- from snowflake_sample_data.tpch_sf1.customer
-- group by c_mktsegment
-- order by count(*);
-- -- Nations Table
-- select n_nationkey, n_name, n_regionkey
-- from snowflake_sample_data.tpch_sf1.nation;
-- select count(*) from snowflake_sample_data.tpch_sf1.region;
-- -- Regions Table
-- select r_regionkey, r_name
-- from snowflake_sample_data.tpch_sf1.region;
-- -- Join the Tables and Sort
-- select r_name as region, n_name as nation
-- from snowflake_sample_data.tpch_sf1.nation
-- join snowflake_sample_data.tpch_sf1.region
-- on n_regionkey = r_regionkey
-- order by r_name, n_name asc;
-- --Group and Count Rows Per Region
-- select r_name as region, count(n_name) as num_countries
-- from snowflake_sample_data.tpch_sf1.nation
-- join snowflake_sample_data.tpch_sf1.region
-- on n_regionkey = r_regionkey
-- group by r_name;
-- New DB
-- create database UTIL_DB comment = 'CMCW Lesson 2';
-- show stages in database util_db;select grader(step, (actual = expected), actual, expected, description) as graded_results from 
  ( SELECT 
  'DORA_IS_WORKING' as step
 ,(select 223) as actual
 , 223 as expected
 ,'Dora is working!' as description
); 
-- -- where did you put the function?
-- show user functions in account;
-- use role ACCOUNTADMIN;
-- use role sysadmin;
-- -- did you put it here?
-- select *
-- from util_db.information_schema.functions
-- where function_name = 'GRADER'
-- and function_catalog = 'UTIL_DB'
-- and function_owner = 'ACCOUNTADMIN'
-- ;
-- Updating grader to allow sysadmin usage
-- grant usage on function util_db.public.GRADER(VARCHAR, BOOLEAN, NUMBER, NUMBER, VARCHAR) to sysadmin;
-- -- DORA cmcw000
-- use database util_db;
-- use schema public;
-- select GRADER(step,(actual = expected), actual, expected, description) as graded_results from (
-- SELECT 'DORA_IS_WORKING' as step
--  ,(select 223 ) as actual
--  ,223 as expected
--  ,'Dora is working!' as description
-- );
--------------
-- Lesson 3 --
--------------
-- Create new database
use role sysadmin;
create database intl_db;
use schema intl_db.public;
-- Create new warehouse w/ above role
create warehouse INTL_WH with warehouse_size = 'XSMALL' warehouse_type = 'STANDARD' auto_suspend = 600 --600 seconds/10 mins
auto_resume = TRUE;
-- Set context for the warehouse
use warehouse INTL_WH;
-- Create table in wh
create
or replace table intl_db.public.INT_STDS_ORG_3166 (
    iso_country_name varchar(100),
    country_name_official varchar(200),
    sovreignty varchar(40),
    alpha_code_2digit varchar(2),
    alpha_code_3digit varchar(3),
    numeric_country_code integer,
    iso_subdivision varchar(15),
    internet_domain_code varchar(10)
);
show tables;
-- Create file format
create
or replace file format util_db.public.PIPE_DBLQUOTE_HEADER_CR type = 'CSV' --use CSV for any flat file
compression = 'AUTO' field_delimiter = '|' --pipe or vertical bar
record_delimiter = '\r' --carriage return
skip_header = 1 --1 header row
field_optionally_enclosed_by = '\042' --double quotes
trim_space = FALSE;
-- Create new stage in new database
use role sysadmin;
show stages in account;
create stage util_db.public.aws_s3_bucket url = 's3://uni-cmcw';
-- List files in stage, since using a url this lists files in the locaiton (s3 bucket)
list @util_db.public.aws_s3_bucket;
-- :)
-- Copy file into table from stage
COPY into intl_db.public.INT_STDS_ORG_3166
FROM
    @util_db.public.aws_s3_bucket files = ('ISO_Countries_UTF8_pipe.csv') --Case Sensative
    file_format = (
        format_name = util_db.public.PIPE_DBLQUOTE_HEADER_CR
    );
-- testing copy into from url s3 bucket
SELECT
    *
FROM
    intl_db.public.INT_STDS_ORG_3166
limit
    50;
select
    count(*) as found,
    '249' as expected
from
    INTL_DB.PUBLIC.INT_STDS_ORG_3166;
-- -- dora cmcw01
    -- use role accountadmin;
    -- use database UTIL_DB;
    -- use schema PUBLIC;
    -- select grader(step, (actual = expected), actual, expected, description) as graded_results from(
    --  SELECT 'CMCW01' as step
    --  ,( select count(*)
    --    from snowflake.account_usage.databases
    --    where database_name = 'INTL_DB'
    --    and deleted is null) as actual
    --  , 1 as expected
    --  ,'Created INTL_DB' as description
    --  );
    -- use role sysadmin;
select
    count(*) as OBJECTS_FOUND
from
    INTL_DB.INFORMATION_SCHEMA.TABLES
where
    table_schema = 'PUBLIC'
    and table_name = 'INT_STDS_ORG_3166';
select
    row_count
from
    INTL_DB.INFORMATION_SCHEMA.TABLES
where
    table_schema = 'PUBLIC'
    and table_name = 'INT_STDS_ORG_3166';
-- -- DORA cmcw02 & 3
    -- use role sysadmin;
    -- use database UTIL_DB;
    -- use schema PUBLIC;
    -- select grader(step, (actual = expected), actual, expected, description) as graded_results from(
    -- SELECT 'CMCW02' as step
    --  ,( select count(*)
    --    from INTL_DB.INFORMATION_SCHEMA.TABLES
    --    where table_schema = 'PUBLIC'
    --    and table_name = 'INT_STDS_ORG_3166') as actual
    --  , 1 as expected
    --  ,'ISO table created' as description
    -- );
    -- select grader(step, (actual = expected), actual, expected, description) as graded_results from(
    -- SELECT 'CMCW03' as step
    --  ,(select row_count
    --    from INTL_DB.INFORMATION_SCHEMA.TABLES
    --    where table_name = 'INT_STDS_ORG_3166') as actual
    --  , 249 as expected
    --  ,'ISO Table Loaded' as description
    -- );
-- select
--     iso_country_name,
--     country_name_official,
--     alpha_code_2digit,
--     r_name as region
-- from
--     INTL_DB.PUBLIC.INT_STDS_ORG_3166 i
--     left join SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.NATION n on upper(i.iso_country_name) = n.n_name
--     left join SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.REGION r on n_regionkey = r_regionkey;

-- -- View of joined data from local and shared databases
-- create view intl_db.public.NATIONS_SAMPLE_PLUS_ISO (
--         iso_country_name,
--         country_name_official,
--         alpha_code_2digit,
--         region
--     ) AS
-- select
--     iso_country_name,
--     country_name_official,
--     alpha_code_2digit,
--     r_name as region
-- from
--     INTL_DB.PUBLIC.INT_STDS_ORG_3166 i
--     left join SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.NATION n on upper(i.iso_country_name) = n.n_name
--     left join SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.REGION r on n_regionkey = r_regionkey;

-- SELECT * FROM intl_db.public.nations_sample_plus_iso;

-- -- DORA CMCW04
-- select grader(step, (actual = expected), actual, expected, description) as graded_results from(
-- SELECT 'CMCW04' as step
--  ,( select count(*) 
--    from INTL_DB.PUBLIC.NATIONS_SAMPLE_PLUS_ISO) as actual
--  , 249 as expected
--  ,'Nations Sample Plus Iso' as description
-- );

-- Files to load: s3://uni-cmcw/country_code_to_currency_code.csv, s3://uni-cmcw/currencies.csv
-- Table DDL
create or replace table intl_db.public.CURRENCIES 
(
  currency_ID integer, 
  currency_char_code varchar(3), 
  currency_symbol varchar(4), 
  currency_digital_code varchar(3), 
  currency_digital_name varchar(30)
)
  comment = 'Information about currencies including character codes, symbols, digital codes, etc.';
create or replace table intl_db.public.COUNTRY_CODE_TO_CURRENCY_CODE 
  (
    country_char_code varchar(3), 
    country_numeric_code integer, 
    country_name varchar(100), 
    currency_name varchar(100), 
    currency_char_code varchar(3), 
    currency_numeric_code integer
  ) 
  comment = 'Mapping table currencies to countries';
-- FIle Format for csv
create or replace file format util_db.public.CSV_COMMA_LF_HEADER
  type = 'CSV' 
  field_delimiter = ',' 
  record_delimiter = '\n' -- the n represents a Line Feed character
  skip_header = 1 
;
--Testing File format and files in stage
select $1, $2, $3, $4
from @util_db.public.aws_s3_bucket/currencies.csv
(file_format => util_db.public.CSV_COMMA_LF_HEADER );

-- Copy file into table from stage
COPY into intl_db.public.CURRENCIES
FROM
    @util_db.public.aws_s3_bucket files = ('currencies.csv') --Case Sensative
    file_format = (
        format_name = util_db.public.CSV_COMMA_LF_HEADER
    );
SELECT * FROM intl_db.public.CURRENCIES;

COPY into intl_db.public.COUNTRY_CODE_TO_CURRENCY_CODE
FROM
    @util_db.public.aws_s3_bucket files = ('country_code_to_currency_code.csv') --Case Sensative
    file_format = (
        format_name = util_db.public.CSV_COMMA_LF_HEADER
    );
SELECT * FROM intl_db.public.COUNTRY_CODE_TO_CURRENCY_CODE;

-- -- DOra cmcw05 & 6
-- select grader(step, (actual = expected), actual, expected, description) as graded_results from(
-- SELECT 'CMCW05' as step
--  ,(select row_count 
--   from INTL_DB.INFORMATION_SCHEMA.TABLES 
--   where table_schema = 'PUBLIC' 
--   and table_name = 'COUNTRY_CODE_TO_CURRENCY_CODE') as actual
--  , 265 as expected
--  ,'CCTCC Table Loaded' as description
-- );
-- select grader(step, (actual = expected), actual, expected, description) as graded_results from(
-- SELECT 'CMCW06' as step
--  ,(select row_count 
--   from INTL_DB.INFORMATION_SCHEMA.TABLES 
--   where table_schema = 'PUBLIC' 
--   and table_name = 'CURRENCIES') as actual
--  , 151 as expected
--  ,'Currencies table loaded' as description
-- );

CREATE or replace view intl_db.public.simple_currency AS (
SELECT cccc.country_char_code as cty_code, cccc.currency_char_code as cur_code
FROM intl_db.public.COUNTRY_CODE_TO_CURRENCY_CODE cccc
ORDER by cccc.country_char_code
);
use database intl_db;
use schema public;
SELECT count(*) FROM simple_currency;

-- -- DORA cmcw07
-- use database util_db;
-- use schema public;
-- select grader(step, (actual = expected), actual, expected, description) as graded_results from(
--  SELECT 'CMCW07' as step 
-- ,( select count(*) 
--   from INTL_DB.PUBLIC.SIMPLE_CURRENCY ) as actual
-- , 265 as expected
-- ,'Simple Currency Looks Good' as description
-- );

-- Change views to "secure"
alter view intl_db.public.NATIONS_SAMPLE_PLUS_ISO
set secure; 

alter view intl_db.public.SIMPLE_CURRENCY
set secure; 

-- -- Dora cmcw08 & 9
use role accountadmin;
use database util_db;
use schema public;
show shares in account;

--the above command puts information into memory that can be accessed using result_scan(last_query_id())
-- If you have to run this check more than once, always run the SHOW command immediately prior
select grader(step, (actual = expected), actual, expected, description) as graded_results from (
 SELECT 'CMCW08' as step
 ,( select IFF(count(*)>0,1,0) 
    from table(result_scan(last_query_id())) 
    where "kind" = 'OUTBOUND'
    and "database_name" = 'INTL_DB') as actual
 , 1 as expected
 ,'Outbound Share Created From INTL_DB' as description
); 

show resource monitors in account;

--the above command puts information into memory that can be accessed using result_scan(last_query_id())
-- If you have to run this check more than once, always run the SHOW command immediately prior
select grader(step, (actual = expected), actual, expected, description) as graded_results from (
 SELECT 'CMCW09' as step
 ,( select IFF(count(*)>0,1,0) 
    from table(result_scan(last_query_id())) 
    where "name" = 'DAILY_3_CREDIT_LIMIT'
    and "credit_quota" = 3
    and "frequency" = 'DAILY') as actual
 , 1 as expected
 ,'Resource Monitors Exist' as description
); 

select grader(step, (actual = expected), actual, expected, description) as graded_results from ( 
SELECT 'CMCW12' as step 
,( select count(*) 
   from SNOWFLAKE.ORGANIZATION_USAGE.ACCOUNTS 
   where account_name = 'ACME' 
   and region like 'GCP_%' 
   and deleted_on is null
  ) as actual 
, 1 as expected 
,'ACME Account Added on GCP Platform' as description 
); 

select grader(step, (actual = expected), actual, expected, description) as graded_results from (
SELECT 
  'CMCW13' as step
 ,( select count(*) 
   from SNOWFLAKE.ORGANIZATION_USAGE.ACCOUNTS 
   where account_name = 'AUTO_DATA_UNLIMITED' 
   and region like 'AZURE_%'
   and deleted_on is null) as actual
 , 1 as expected
 ,'ADU Account Added on AZURE' as description
); 

--------------------------- Badge 3--------------------------- 
Use role sysadmin;
CREATE database Smoothies;

Use database SMOOTHIES;
Use SCHEMA public;

CREATE or replace table FRUIT_OPTIONS (
        FRUIT_ID    NUMBER,
        FRUIT_NAME  VARCHAR(25)
);

Create file format smoothies.public.two_headerrow_pct_delim
    type = CSV,
    skip_header = 2,
    field_delimiter = '%',
    trim_space = True;

Create stage smoothies.public.my_uploaded_files;
SHOW stages in smoothies.public;
-- After manualy copying file
LS @my_uploaded_files;

select $2 as FRUIT_ID, $1 as FRUIT_NAME
FROM @smoothies.public.my_uploaded_files/fruits_available_for_smoothies.txt
(file_format => smoothies.public.two_headerrow_pct_delim);

COPY INTO smoothies.public.fruit_options
from (select $2 as FRUIT_ID, $1 as FRUIT_NAME
FROM @smoothies.public.my_uploaded_files/fruits_available_for_smoothies.txt)
file_format = (format_name = smoothies.public.two_headerrow_pct_delim)
on_error = abort_statement
purge = true;

SELECT * FROM smoothies.public.fruit_options LIMIT 50;

Create table smoothies.public.orders
(
ingredients varchar(200)
);

--truncate table smoothies.public.orders;
SELECT * FROM smoothies.public.orders;

alter table smoothies.public.orders add column name_on_order varchar(100);
alter table smoothies.public.orders add column order_filled BOOLEAN default False;

insert into smoothies.public.orders(ingredients, name_on_order) values ('Elderberries Figs Guava Honeydew ', 'Bagman Banana');

delete from smoothies.public.orders where name_on_order is not null;
-- update smoothies.public.orders set order_filled = TRUE WHERE contains(INGREDIENTS, 'Elderberries');

-- Recreate Table with all settings set (also adding a timestamp)
Drop table if exists smoothies.public.orders;
create or replace table smoothies.public.orders (
       order_uid integer default smoothies.public.order_seq.nextval,
       order_filled boolean default false,
       name_on_order varchar(100),
       ingredients varchar(200),
       constraint order_uid unique (order_uid),
       order_ts timestamp_ltz default current_timestamp()
);

SELECT * FROM smoothies.public.orders;

use database smoothies;
use schema public;
create or replace sequence order_seq
    start = 1,
    increment = 2,
    order,
    comment='Provide a unique id for each smoothie'
    ;

SHOW sequences;

truncate table SMOOTHIES.PUBLIC.ORDERS ;
alter table SMOOTHIES.PUBLIC.ORDERS 
add column order_uid integer --adds the column
default smoothies.public.order_seq.nextval  --sets the value of the column to sequence
constraint order_uid unique enforced; --makes sure there is always a unique value in the column

SELECT * FROM SMOOTHIES.PUBLIC.ORDERS;

-- Set variable & access
set this = -10.5;
set that = 2;
set the_other = 1000;

-- select $ex_var1 + $ex_var2;

-- Create UDF and run w/ a var?
create function sum_mystery_bag_vars (var1 number, var2 number, var3 number)
    returns number as 'select var1+var2+var3';

select sum_mystery_bag_vars($this, $that, $the_other);

use database util_db;
use schema public;
create function NEUTRALIZE_WHINING (var1 text)
    returns text as 'select initcap(var1)';

set alternating_catch_phrase = 'aLtErNaTiNg CaPs';
select NEUTRALIZE_WHINING($alternating_catch_phrase);


-- Add column to orders table for matching to AP nutritional info
use role sysadmin;

select * from smoothies.public.fruit_options;
alter table smoothies.public.fruit_options add column search_on varchar(100);
update smoothies.public.fruit_options set search_on = fruit_name;
select * from smoothies.public.fruit_options;
update smoothies.public.fruit_options set search_on = 'Apple' Where fruit_name = 'Apples';
update smoothies.public.fruit_options set search_on = 'Blueberry' Where fruit_name =  'Blueberries';
update smoothies.public.fruit_options set search_on = 'Raspberry' Where fruit_name = 'Raspberries';
update smoothies.public.fruit_options set search_on = 'Strawberry' Where fruit_name = 'Strawberries';
-- update smoothies.public.fruit_options set search_on = 'Jackfruit' Where fruit_name = 'Jackfruit';

-- truncate table smoothies.public.orders;
select * from smoothies.public.orders;

update smoothies.public.orders set order_filled = TRUE where name_on_order in ('Divya', 'Xi');


----------------------------
-- DORA
----------------------------
-- USE Role accountadmin;
use database util_db;
use schema public;
-- select grader(step, (actual = expected), actual, expected, description) as graded_results from 
--   ( SELECT 
--   'DORA_IS_WORKING' as step
--  ,(select 223) as actual
--  , 223 as expected
--  ,'Dora is working!' as description
-- ); 

-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
--   SELECT 'DABW001' as step
--  ,( select count(*) 
--    from SMOOTHIES.PUBLIC.FRUIT_OPTIONS) as actual
--  , 25 as expected
--  ,'Fruit Options table looks good' as description
-- );

-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
-- SELECT 'DABW002' as step
--  ,(select IFF(count(*)>=5,5,0)
--     from (select ingredients from smoothies.public.orders
--     group by ingredients)
--  ) as actual
--  ,  5 as expected
--  ,'At least 5 different orders entered' as description
-- );

-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
--   SELECT 'DABW003' as step
--  ,(select ascii(fruit_name) from smoothies.public.fruit_options
-- where fruit_name ilike 'z%') as actual
--  , 90 as expected
--  ,'A mystery check for the inquisitive' as description
-- );

-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
--   SELECT 'DABW004' as step
--  ,( select count(*) from smoothies.information_schema.columns
--     where table_schema = 'PUBLIC' 
--     and table_name = 'ORDERS'
--     and column_name = 'ORDER_FILLED'
--     and column_default = 'FALSE'
--     and data_type = 'BOOLEAN') as actual
--  , 1 as expected
--  ,'Order Filled is Boolean' as description
-- );

-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
--  SELECT 'DABW005' as step
--  ,(select IFF(count(*)>=2, 2, 0) as num_sis_apps
--     from (
--         select count(*) as tally
--         from snowflake.account_usage.query_history
--         where query_text like 'execute streamlit%'
--         group by query_text)
--  ) as actual
--  , 2 as expected
--  ,'There seem to be 2 SiS Apps' as description
-- );

-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
--   SELECT 'DABW006' as step
--  ,( select util_db.public.sum_mystery_bag_vars($this,$that,$the_other)) as actual
--  , 991.5 as expected
--  ,'Mystery Bag Function Output' as description
-- );

-- select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
--  SELECT 'DABW007' as step
--  ,( select hash(neutralize_whining('bUt mOm i wAsHeD tHe dIsHes yEsTeRdAy'))) as actual
--  , -4759027801154767056 as expected
--  ,'WHINGE UDF Works' as description
-- );

select GRADER(step, (actual = expected), actual, expected, description) as graded_results from (
   SELECT 'DABW008' as step 
   ,( select sum(hash_ing) from
      (select hash(ingredients) as hash_ing
       from smoothies.public.orders
       where order_ts is not null 
       and name_on_order is not null 
       and (name_on_order = 'Kevin' and order_filled = FALSE and hash_ing = 7976616299844859825) 
       or (name_on_order ='Divya' and order_filled = TRUE and hash_ing = -6112358379204300652)
       or (name_on_order ='Xi' and order_filled = TRUE and hash_ing = 1016924841131818535))
     ) as actual 
   , 2881182761772377708 as expected 
   ,'Followed challenge lab directions' as description
); 
-----

--------------------------- Badge 4
