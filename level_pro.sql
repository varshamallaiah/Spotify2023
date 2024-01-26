-- Identify the artist(s) with the highest total streams across all their tracks.
select (`artist(s)_name`), sum(streams) as total_streams
from spotified
group by 1
order by 2 desc
limit 1;


-- Find the tracks that are present in both Apple Music and Deezer charts.
select track_name
from spotified
where in_apple_charts =1 and in_deezer_charts = 1;


-- Calculate the median danceability percentage for all tracks.
WITH RankedDanceability AS (
    SELECT
        `danceability_%`,
        ROW_NUMBER() OVER (ORDER BY `danceability_%`) AS RowAsc,
        ROW_NUMBER() OVER (ORDER BY `danceability_%` DESC) AS RowDesc
    FROM
        spotified
)
SELECT
    AVG(`danceability_%`) AS median_danceability_percentage
FROM
    RankedDanceability
WHERE
    RowAsc = RowDesc
       OR RowAsc + 1 = RowDesc
       OR RowAsc = RowDesc + 1;


-- Identify the tracks with the highest liveness percentage in Spotify playlists.
SELECT
    track_name,
    `liveness_%`
FROM
    spotified
WHERE
    in_spotify_playlists = 1
ORDER BY
    `liveness_%` DESC
LIMIT 1;


-- Find the tracks with the highest speechiness percentage in Shazam charts.
select track_name, `speechiness_%`
from spotified
where in_shazam_charts = 1
order by `speechiness_%` desc
limit 5;