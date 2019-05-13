/* Borra todos los rows previos */
DELETE FROM boat_documents;
TRUNCATE TABLE boat_documents;

CALL SP_CREATE_BOAT_DOCUMENT(1, 1, "https://dropbox.io/o8HKnYIrFqeo0dr8");
CALL SP_CREATE_BOAT_DOCUMENT(1, 2, "https://dropbox.io/UXg8TE3luSCDcERf");
CALL SP_CREATE_BOAT_DOCUMENT(1, 3, "https://dropbox.io/21a737YevJQWL4lA");
CALL SP_CREATE_BOAT_DOCUMENT(1, 4, "https://dropbox.io/pMCym3IBp7SNpu17");


CALL SP_READ_BOAT_DOCUMENTS();

CALL SP_DELETE_BOAT_DOCUMENT(1);

CALL SP_UPDATE_BOAT_DOCUMENT(3, 1, 5, "https://dropbox.io/pMCym3IBp7SNpu17");
CALL SP_READ_BOAT_DOCUMENTS();