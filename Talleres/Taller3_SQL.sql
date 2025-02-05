-- 1. ¿Cuántos artistas son? R:275
SELECT COUNT(*)
FROM artists art;

-- 2. ¿A que artista pertenece el album "Voodoo Lounge"? R:The Rolling Stones
SELECT 
	art.Name as "Nombre del artista",
	alb.Title as "Nombre del album"
FROM artists art
INNER JOIN albums alb on art.ArtistId =alb.ArtistId
WHERE alb.Title = "Voodoo Lounge";

--3.¿Cuales son los albums que tiene el artista "Ozzy Osbourne"?
SELECT 
	art.Name as "Nombre del artista",
	alb.Title as "Nombre del album"
FROM artists art
INNER JOIN albums alb on art.ArtistId =alb.ArtistId 
WHERE art.Name ="Ozzy Osbourne";

--4.¿Cuántas canciones tiene el artista "Red Hot Chili Peppers"? R:48
SELECT 
	art.Name , COUNT(*)
FROM artists art
INNER JOIN albums alb on art.ArtistId =alb.ArtistId 
INNER JOIN tracks trk on alb.AlbumId = trk.AlbumId 
WHERE art.Name = "Red Hot Chili Peppers"
GROUP BY art.Name ;

-- 5.¿Cuáles son los 3 tracks mas largos (tiempo)? R: Occupation/precipice, Through a looking glass y Greetings from Earth.
SELECT 
	trk.Name as "Cancion",
	trk.Milliseconds as "Tiempo (milisegundos)"
FROM tracks trk
ORDER BY trk.Milliseconds DESC 
LIMIT 3;

--6.¿Cuál es el género de la canción que menos peso (Bytes) tiene? R: É Uma Partida De Futebol
SELECT
	trk.Name as "Nombre de la canción",
	gen.Name as "Género",
	trk.Bytes as "Bytes"
FROM tracks trk
INNER JOIN genres gen on trk.GenreId =gen.GenreId 
ORDER BY trk.Bytes ASC 
LIMIT 1;

--7.¿Cuál es el género con más canciones? R:Rock con 1.297 canciones 
SELECT 
	gen.Name as "Género" ,COUNT(*) as "Número de canciones"
FROM tracks trk
INNER JOIN genres gen on trk.GenreId =gen.GenreId 
GROUP BY gen.Name 
ORDER BY COUNT(*) DESC 
LIMIT 1;

--8.Indicar el top 10 de los artistas con más canciones R: IronMaiden,U2,LedZep,Metallica,Lost,DeepPur,PearlJam,LennyKrav,VariousArt,TheOff
SELECT 
	art.Name as "Nombre del artista", COUNT(*) 
FROM artists art
INNER JOIN albums alb on art.ArtistId =alb.ArtistId 
INNER JOIN tracks trk on alb.AlbumId =trk.AlbumId 
GROUP BY art.Name 
ORDER BY COUNT(*) DESC
LIMIT 10;

--9.¿Cuántos invoices tiene cada empleado? Organizar desde el mayor al menor. R: Jean-146,Margaret-140 y Steve-126
SELECT 
	emp.FirstName as "Nombre" , 
	emp.LastName as "Apellido",
	COUNT(*)
FROM employees emp
INNER JOIN customers ctm on emp.EmployeeId =ctm.SupportRepId 
INNER JOIN invoices inv on ctm.CustomerId =inv.CustomerId 
GROUP BY emp.FirstName 
ORDER BY COUNT(*) DESC 

--10.¿Cuál es la canción que más existe en las play list? R: 2 Minutes To Midnight
SELECT 
	trk.Name as "Nombre de la cancion",COUNT(*)
FROM tracks trk
INNER JOIN playlist_track pt ON trk.TrackId =pt.TrackId 
INNER JOIN playlists pl on pt.PlaylistId =pl.PlaylistId 
GROUP BY trk.Name 
ORDER BY COUNT(*) DESC
LIMIT 1




