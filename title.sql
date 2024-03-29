UPDATE movies
SET rank = ts_rank(lexemesSummary,plainto_tsquery(
(
SELECT title FROM movies WHERE url='star-wars-episode-v---the-empire-strikes-back'
)
));
CREATE TABLE recommendationsBasedOnTitleEmpire AS SELECT url, rank FROM movies WHERE rank > 0.50 ORDER BY rank DESC LIMIT 50;
\copy (SELECT * FROM recommendationsBasedOnTitleEmpire10) to '/home/pi/RSL/top50recommendationsTitleEmpire.csv' WITH csv;