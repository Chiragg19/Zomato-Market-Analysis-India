-- QUERY 1: The "Market Gap" Finder
-- Finding cuisines with high ratings but low competition (less than 50 restaurants)
SELECT cuisines, COUNT(*) as restaurant_count, AVG(rate) as avg_rating
FROM zomato_data
GROUP BY cuisines
HAVING COUNT(*) < 50 AND AVG(rate) > 4.0
ORDER BY avg_rating DESC;

-- QUERY 2: The "Performance" Ranker (Using Window Functions)
-- Ranking restaurants by votes within each location to see the 'Market Leaders'
SELECT name, location, votes,
RANK() OVER (PARTITION BY location ORDER BY votes DESC) as rank_in_location
FROM zomato_data
WHERE rate > 4.5;

-- QUERY 3: The "Revenue" Insight
-- Comparing average ratings of restaurants that offer online ordering vs those that don't
SELECT online_order, AVG(rate) as average_rating, COUNT(*) as total_restaurants
FROM zomato_data
GROUP BY online_order;