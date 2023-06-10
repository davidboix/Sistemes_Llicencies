-- 1.Quines pel·lícules i series han guardat a la llista (favorits) els clients
SELECT hc.Preferit,c.Nom_Usuari, p.Nom
FROM ha_consumit hc
INNER JOIN compte c ON hc.ID_Compte = c.ID_Compte
INNER JOIN produccions p ON hc.ID_Produccio = p.ID_Produccio;

-- 2.Quines pel·lícules / series conformen el top 10 -són les més vistes-.compte
SELECT Nom,Num_Visualitzacio
FROM compte compt
INNER JOIN ha_consumit hc ON compt.ID_Compte = hc.ID_Compte
INNER JOIN produccions pr ON hc.ID_Produccio = pr.ID_Produccio
ORDER BY hc.Num_Visualitzacio DESC
LIMIT 10;

-- 3. Quines pelicules duren més de 90 minuts (+ de 1 hora i 30 minuts) ordenades de mes duració a menys duració.
SELECT produccions.ID_Produccio AS "ID Pelicula", produccions.Nom, produccions.Nacionalitat,pel.Durada
FROM pelicules pel
INNER JOIN produccions ON pel.ID_Produccio = produccions.ID_Produccio
WHERE pel.Durada > 90
ORDER BY pel.Durada DESC;

-- 4. Quines pelicules i series son de les nacionalitats Estats Units i  regne unit.
SELECT pro.ID_Produccio AS "ID_Producio",pro.Nom,pro.Nacionalitat, pro.`Any`
FROM produccions pro
WHERE pro.Nacionalitat IN ('Estados Unidos','Reino Unido');

-- 5. Quines pelicules i series començen amb vocals.
SELECT *
FROM produccions prod
WHERE prod.Nom LIKE 'A%' OR prod.Nom LIKE 'E%' OR prod.Nom LIKE 'I%' OR prod.Nom LIKE 'O%' OR prod.Nom LIKE 'U%';

-- 6. Quants comptes tenen el contracte amb la modalitat 'Gratis'
SELECT *
FROM compte compt
INNER JOIN modalitat modal ON compt.ID_Modalitat = modal.ID_Modalitat
HAVING COUNT(compt.ID_Modalitat LIKE 'G%');

-- 7. Mostra les pelicules i series que siguin de la categoria 'Drama'
SELECT prod.Nom,prod.Nacionalitat,genere.Nom
FROM produccions prod
INNER JOIN pertany_a ON prod.ID_Produccio = pertany_a.ID_Produccio
INNER JOIN genere ON pertany_a.ID_Categoria = genere.ID_Categoria
WHERE genere.Nom = "Drama";

-- 8. Mostra els actors que actuen en pelicules que son de Estats Units
SELECT *
FROM produccions prod
INNER JOIN pelicules ON prod.ID_Produccio = pelicules.ID_Produccio
INNER JOIN actuen ON pelicules.ID_Produccio = actuen.ID_Produccio
INNER JOIN actors ON actors.ID_Actor = actuen.ID_Actor
WHERE actors.Nacionalitat LIKE "Estados Unidos";

-- 9. Quins comptes s'han donat de alta entre 1 de Gener de 2023 i el 31 de Desembre de 2023**
SELECT *
FROM clients
WHERE clients.Edat BETWEEN '2023-01-01' AND '2023-12-31';
