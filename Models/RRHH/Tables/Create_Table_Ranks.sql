/* Table "Ranks" TABLA DEBIL
Almacena información acerca de la cantidad de responsabilidad
que tiene un usuario, como rangos de personal. Cada rango tiene
un peso asociado, cuanto menor, mas importante y más privilegios
tiene.

rank_id         -> ID natural
rank_name       -> Nombre del rango
rank_weight     -> Peso que tiene el rango, a menor valor mas importante

PK = rank_id 
*/
 CREATE TABLE IF NOT EXISTS ranks (
	rank_id INT NOT NULL AUTO_INCREMENT,
    rank_name VARCHAR(50) UNIQUE NOT NULL,
    rank_weight INT NOT NULL,

    PRIMARY KEY (rank_id)
);
