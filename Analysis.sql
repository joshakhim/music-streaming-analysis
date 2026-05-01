-- DATA EXPLORATORY ANALYSIS --


-- Top Performing Artists by Streams --
-- Analyzed total streaming volume by artist to identify top-performing artists based on cumulative streams. --

SELECT artist, SUM(streams) total_streams
FROM music_data2
GROUP BY artist
ORDER BY total_streams DESC
LIMIT 10
; 


-- Average Revenue by Platform --
-- Evaluated platform-level monetization by calculating average revenue per stream source. --

SELECT platform, AVG(revenue_usd) avg_revenue
FROM music_data2
GROUP BY platform 
ORDER BY avg_revenue DESC
; 


-- Streaming Distribution by Country --
-- Analyzed geographic distribution of streams to identify high-engagement markets. --

SELECT country, SUM(streams) total_streams
FROM music_data2
GROUP BY country
ORDER BY total_streams DESC
; 


-- Artist Performance (Streams vs Revenue) --
-- Compared artist-level streaming performance with average revenue to assess the relationship between popularity and monetization. --

SELECT artist,
	SUM(streams) total_streams,
	AVG(revenue_usd) avg_revenue
FROM music_data2
GROUP BY artist
ORDER BY total_streams DESC
;
