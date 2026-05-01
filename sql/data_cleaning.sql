SELECT *
FROM music_data
;

SELECT *
FROM music_data
WHERE followers = ''
;


DESCRIBE music_data
;

-- CHECKING FOR NULL AND BLANK VALUES --

SELECT COUNT(*) AS total_rows,
SUM(CASE WHEN streams IS NULL THEN 1 ELSE 0 END) null_streams,
SUM(CASE WHEN artist IS NULL THEN 1 ELSE 0 END) null_artist,
SUM(CASE WHEN followers IS NULL THEN 1 ELSE 0 END) null_followers,
SUM(CASE WHEN revenue_usd IS NULL THEN 1 ELSE 0 END) null_revenue
FROM music_data
;

SELECT *
FROM music_data
;

-- REMOVING DUPLICATES --

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY artist, genre, platform, country, streams, revenue_usd, followers, `date`) AS row_num
FROM music_data
;



WITH dupli AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY artist, genre, platform, country, streams, revenue_usd, followers, `date`) AS row_num
FROM music_data
)
SELECT *
FROM dupli
WHERE row_num > 1
;


SELECT *
FROM music_data
;

SELECT COUNT(*)
FROM music_data
WHERE streams = ''
;

CREATE TABLE `music_data2` (
  `artist` text,
  `genre` text,
  `platform` text,
  `country` text,
  `streams` text,
  `revenue_usd` double DEFAULT NULL,
  `followers` double DEFAULT NULL,
  `date` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT *
FROM music_data2
;

INSERT INTO music_data2
SELECT *
FROM music_data
;

SELECT *
FROM music_data2
;

UPDATE music_data2
SET streams = NULL 
WHERE TRIM(streams) = '';

DELETE FROM music_data2
WHERE streams IS NULL;

-- STANDARDIZING THE DATA --


SELECT *
FROM music_data2
;

ALTER TABLE music_data2
MODIFY streams INT;

SELECT DISTINCT genre
FROM music_data2
;

UPDATE music_data2
SET genre = 'Hip-Hop'
WHERE genre = 'Hip Hop'
;

SELECT platform
FROM music_data2
WHERE platform LIKE 'spotify%'
;

UPDATE music_data2
SET platform = 'Spotify'
WHERE platform LIKE 'spotify%';


-- CHANGING MULTIPLE DATE FORMAT TO ONE DATE FORMAT --

SELECT `date`
FROM music_data2
;


SELECT `date`
FROM music_data2
;

SELECT `date`
FROM music_data2
WHERE `date` LIKE '%/%' 
;

SELECT `date`
FROM music_data2
WHERE `date` LIKE '%-%' 
;

SELECT `date`
FROM music_data2
WHERE `date` LIKE '%,%' 
;

UPDATE music_data2
 SET `date` = STR_TO_DATE(`date`, '%Y/%m/%d')
WHERE `date` LIKE '____/__/__'
;

UPDATE music_data2
 SET `date` = STR_TO_DATE(`date`, '%d/%m/%Y')
WHERE `date` LIKE '__/__/____'
;

UPDATE music_data2
 SET `date` = STR_TO_DATE(`date`, '%m-%d-%Y')
WHERE `date` LIKE '__-__-____'
;


UPDATE music_data2
 SET `date` = STR_TO_DATE(`date`, '%Y-%m-%d')
WHERE `date` LIKE '____-__-__'
;


UPDATE music_data2
 SET `date` = STR_TO_DATE(`date`, '%M %d, %Y')
WHERE `date` LIKE '%,%'
;

SELECT *
FROM music_data2
;

ALTER TABLE music_data2
DROP COLUMN new_date
;

SELECT *
FROM music_data2
;

