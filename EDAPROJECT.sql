-- EDA
SELECT * FROM layoffs_staging2;

SELECT MAX(total_laid_off), MIN(total_laid_off)
FROM layoffs_staging2;

SELECT MAX(percentage_laid_off), MIN(percentage_laid_off)
FROM layoffs_staging2;

SELECT * FROM layoffs_staging2
WHERE percentage_laid_off = 1;

SELECT * FROM layoffs_staging2
WHERE total_laid_off > 100
ORDER BY 4 DESC;

SELECT * FROM layoffs_staging2
where percentage_laid_off = 1
ORDER BY 9 DESC;

SELECT country, location, total_laid_off 
FROM layoffs_staging2
ORDER BY total_laid_off DESC;

SELECT company , SUM(total_laid_off)
FROM layoffs_staging2 
GROUP BY company
ORDER BY 2 DESC;

SELECT MIN(`date`),MAX(`date`)
FROM layoffs_staging2;

SELECT industry ,SUM(total_laid_off)
FROM layoffs_staging2 
GROUP BY industry
ORDER BY 2 DESC;

SELECT company ,SUM(total_laid_off)
FROM layoffs_staging2 
GROUP BY company
ORDER BY 2 DESC;

SELECT country ,SUM(total_laid_off)
FROM layoffs_staging2 
GROUP BY country
ORDER BY 2 DESC;

SELECT stage ,SUM(total_laid_off)
FROM layoffs_staging2 
GROUP BY stage
ORDER BY 2 DESC;

SELECT YEAR(`date`) ,SUM(total_laid_off)
FROM layoffs_staging2 
GROUP BY YEAR(`date`)
ORDER BY 2 DESC;
 
 
SELECT country ,AVG(total_laid_off)
FROM layoffs_staging2 
GROUP BY country
ORDER BY 2 DESC;

SELECT SUBSTRING(`date`,1,7) as `month`, SUM( total_laid_off)
FROM layoffs_staging2
WHERE `date` IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC; 

WITH Rolling_Total as
(
SELECT SUBSTRING(`date`,1,7) as `month`, SUM( total_laid_off) as total_off
FROM layoffs_staging2
WHERE `date` IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`,total_off, SUM(total_off) OVER (ORDER BY `MONTH`) as rolling_total
FROM Rolling_total;


SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company,YEAR(`date`)
ORDER BY 3 DESC;


SELECT country, SUM(funds_raised_millions) AS FUNDS
FROM layoffs_staging2
WHERE funds_raised_millions IS NOT NULL
GROUP BY country
ORDER BY 2 DESC;








