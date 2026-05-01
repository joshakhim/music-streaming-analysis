-- NOW EXPLORATORY DATA ANALYSIS --


SELECT *
FROM layoffs_cleaned
WHERE company LIKE 'blackba%'
;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_cleaned;

SELECT *
FROM layoffs_cleaned
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC
;

SELECT company, SUM(total_laid_off)
FROM layoffs_cleaned
GROUP BY company
ORDER BY 2 DESC
;

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_cleaned
;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_cleaned
GROUP BY YEAR(`date`)
ORDER BY 1  DESC
;


;SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_cleaned
GROUP BY YEAR(`date`)
ORDER BY 1  DESC
;


SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off) 
FROM layoffs_cleaned
GROUP BY `MONTH`
ORDER BY 1  ASC;

WITH Rolling_total AS 
(
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off) total_off
FROM layoffs_cleaned
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off
, SUM(total_off) OVER(ORDER BY `MONTH`) rolling_total
FROM Rolling_total;


SELECT company, SUM(total_laid_off)
FROM layoffs_cleaned
GROUP BY company
ORDER BY 2 DESC
;

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_cleaned
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC
;


SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_cleaned
GROUP BY company, YEAR(`date`)
;

WITH Company_Year (company, years, total_laid_off)  AS 
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_cleaned
GROUP BY company, YEAR(`date`)
),Company_year_rank AS
( 
SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) ranking
FROM Company_Year
)
SELECT *
FROM Company_year_rank
WHERE ranking <= 5
;
