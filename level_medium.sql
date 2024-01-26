-- Calculate the average energy percentage for tracks released in 2020.
select avg(`energy_%`)
from spotified
where `released_year` = 2020;


-- Identify the top 5 artists with the most tracks in Spotify charts.
SELECT
    (`artist(s)_name`),
    COUNT(*) AS tracks_in_spotify_charts
FROM
    spotified
WHERE
    in_spotify_charts = 1
GROUP BY
    1
ORDER BY
    tracks_in_spotify_charts DESC
LIMIT 5;


-- List the tracks with the highest instrumentalness percentage.
select track_name, max(`instrumentalness_%`) as highest_instrumentalness
from spotified
group by 1
order by 2 desc
limit 1;

SELECT
    track_name,
    `instrumentalness_%`
FROM
    spotified
ORDER BY
    `instrumentalness_%` DESC
LIMIT 1;


-- Find the total number of streams for tracks in both Spotify and Apple Music playlists.
SELECT 
    track_name,
    SUM(streams) AS total_streams
FROM spotified
WHERE in_spotify_playlists = 1 OR in_apple_playlists = 1
GROUP BY track_name;

-- Retrieve the tracks released in the month of May.
select track_name
from spotified
where released_month = 5;




