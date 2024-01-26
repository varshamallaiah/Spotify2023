-- Retrieve the names of all tracks released in the year 2021.
select track_name, released_year
from spotified
where released_year = 2021;

-- Find the total number of streams for all tracks in the dataset.
select SUM(streams) as total_streams
from spotified;

-- List the distinct musical keys present in the dataset.
select distinct`key`
from spotified;


-- Count the number of tracks that are present in Spotify playlists.
SELECT count(track_name) as no_of_tracks
FROM spotified;


-- Find the tracks with the highest danceability percentage. 
select track_name, (`danceability_%`)
from spotified
order by 2 desc
LIMIT 1;

