-- Identify the artist(s) with the highest average valence percentage.
select `artist(s)_name`, avg(`valence_%`)
from spotified
group by 1
order by 2 desc
limit 1;


-- List the top 10 tracks with the most streams in Spotify charts.
SELECT
    track_name,
    streams
FROM
    spotified
WHERE
    in_spotify_charts = 1
ORDER BY
    streams DESC
LIMIT 10;


-- Find the tracks with danceability percentage above 80% and energy percentage below 60%.
select track_name,  `danceability_%`, `energy_%`
from spotified
where `danceability_%` > 80 and `energy_%` <60;

-- Calculate the average acousticness percentage for tracks in Deezer charts.
select  avg(`acousticness_%`) as avg_acousticness
from spotified
where in_deezer_charts =1;

-- Retrieve the tracks released on a weekend (Saturday or Sunday).
SELECT track_name, CONCAT (
    released_year,
    '-',
    released_month,
    '-',
    released_day
  ) AS release_date
FROM spotified
WHERE DAYOFWEEK (CONCAT (released_year,'-',released_month,'-',released_day)) IN (1, 7);


