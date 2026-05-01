-- NOW EXPLORATORY DATA ANALYSIS --
-- ============================================
-- MUSIC STREAMING DATA ANALYSIS
-- ============================================

-- This analysis explores key performance metrics in the dataset:
-- 1. Identifying top artists based on total streams
-- 2. Comparing revenue generation across streaming platforms
-- 3. Analyzing geographic distribution of streams
-- 4. Evaluating relationship between artist popularity and revenue

-- The goal is to uncover trends in audience engagement,
-- platform performance, and monetization efficiency.


-- Section 1: Artist Performance
-- Section 2: Platform Analysis
-- Section 3: Geographic Insights
-- Section 4: Revenue vs Popularity




-- Top Performing Artists by Streams --
-- Analyzed total streaming volume by artist to identify top-performing artists based on cumulative streams.--
SELECT artist, SUM(streams) total_streams
FROM music_data2
GROUP BY artist
ORDER BY total_streams DESC
LIMIT 10;



-- Average Revenue by Platform --
-- Evaluated platform-level monetization by calculating average revenue per stream source --
SELECT platform, AVG(revenue_usd) avg_revenue
FROM music_data2
GROUP BY platform
ORDER BY avg_revenue DESC;



-- Streaming Distribution by Country --
-- Analyzed geographic distribution of streams to identify high-engagement markets.--
SELECT country, SUM(streams) total_streams
FROM music_data2
GROUP BY country
ORDER BY total_streams DESC;



-- Artist Performance (Streams vs Revenue) --
-- Compared artist-level streaming performance with average revenue to assess the relationship between popularity and monetization.--
SELECT artist,
       SUM(streams) total_streams,
       AVG(revenue_usd) avg_revenue
FROM music_data2
GROUP BY artist
ORDER BY total_streams DESC;




