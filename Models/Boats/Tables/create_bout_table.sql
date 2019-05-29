CREATE TABLE
IF NOT EXISTS boat_document_types
(
    boat_document_type_id INT NOT NULL AUTO_INCREMENT,
    boat_document_type VARCHAR
(100) NOT NULL,
    required BOOLEAN NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY
(boat_document_type_id)
);
CREATE TABLE
IF NOT EXISTS boat_documents
(
    boat_document_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    boat_document_type_id INT NOT NULL,
    url VARCHAR
(250) NOT NULL,
    last_update_date DATETIME,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY
(boat_document_id)
);

CREATE TABLE
IF NOT EXISTS boat_electricity
(
    boat_electricity_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    cable_type_id INT NOT NULL,
    socket_type_id INT NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY
(boat_electricity_id)
);
CREATE TABLE
IF NOT EXISTS boats
(
    boat_id INT NOT NULL AUTO_INCREMENT,
    client_id INT NOT NULL,
    name VARCHAR
(100) UNIQUE NOT NULL,
    model VARCHAR
(100),
    loa DECIMAL
(6,2) NOT NULL,
    draft DECIMAL
(6,2),
    beam DECIMAL
(6,2),
    creation_date DATETIME NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY
(boat_id)
);
CREATE TABLE
IF NOT EXISTS cable_types
(
    cable_type_id INT NOT NULL AUTO_INCREMENT,
    cable_type VARCHAR
(100) UNIQUE NOT NULL,
    voltage SMALLINT NOT NULL,
    description VARCHAR
(200),
    price DECIMAL
(12,4) NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY
(cable_type_id)
);
CREATE TABLE
IF NOT EXISTS captains
(
    captain_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    name VARCHAR
(100) UNIQUE NOT NULL,
    phone VARCHAR
(15),
    email VARCHAR
(100),
    payment_permission BOOLEAN NOT NULL,
    aceptation_permission BOOLEAN NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY
(captain_id)
);

CREATE TABLE
IF NOT EXISTS engines
(
    engine_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    model VARCHAR
(100) NOT NULL,
    brand VARCHAR
(100) NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY
(engine_id)
);

CREATE TABLE
IF NOT EXISTS responsible
(
    responsable_id INT NOT NULL AUTO_INCREMENT,
    boat_id INT NOT NULL,
    name VARCHAR
(100) UNIQUE NOT NULL,
    phone VARCHAR
(15),
    email VARCHAR
(100),
    payment_permission BOOLEAN NOT NULL,
    aceptation_permission BOOLEAN NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,
    
    PRIMARY KEY
(responsable_id)
);

CREATE TABLE
IF NOT EXISTS slip_types
(
    slip_type_id INT NOT NULL AUTO_INCREMENT,
    slip_type VARCHAR
(100) NOT NULL,
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY
(slip_type_id)
);

CREATE TABLE
IF NOT EXISTS slips_occupation
(
    slip_occupation_id INT NOT NULL AUTO_INCREMENT,
    slip_id INT NOT NULL,
    boat_id INT NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    creation_date DATETIME DEFAULT NOW
(),
    creation_responsable VARCHAR
(100),
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY
(slip_occupation_id)
);
CREATE TABLE
IF NOT EXISTS slips
(
    slip_id INT NOT NULL AUTO_INCREMENT,
    slip_type_id INT NOT NULL,
    slip_name VARCHAR
(100),
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY
(slip_id)
);

CREATE TABLE
IF NOT EXISTS socket_types
(
    socket_type_id INT NOT NULL AUTO_INCREMENT,
    socket_type VARCHAR
(100) UNIQUE NOT NULL,
    description VARCHAR
(200),
    logical_deleted BOOLEAN NOT NULL DEFAULT 0,
    logical_deleted_date DATETIME DEFAULT NULL,

    PRIMARY KEY
(socket_type_id)
);