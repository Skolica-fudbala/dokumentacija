CREATE TABLE clanovi (
    clan_id INT PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    sifra VARCHAR(50) NOT NULL,
    datum_rodjenja VARCHAR(50) NOT NULL,
    datum_upisa VARCHAR(50) NOT NULL,
    sistematski_pregled INTEGER NOT NULL
);

CREATE TABLE mesta (
    mesto_id INT PRIMARY KEY auto_increment,
    naziv VARCHAR(50) not null,
	drzava VARCHAR(200),
    lokacija VARCHAR(50) not null,
    opis VARCHAR(200),
    znamenitosti VARCHAR(200)
);

CREATE TABLE raspored (
    reaspored_id INT PRIMARY KEY auto_increment,
    dan varchar (100) not null,
    datum_vreme varchar (100) not null,
    FOREIGN KEY (mesto_id) REFERENCES mesta(mesto_id)
);

CREATE TABLE treneri (
    trener_id INT PRIMARY KEY NOT NULL,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    godine_iskustva VARCHAR(50) NOT NULL,
    kontakt VARCHAR(50) NOT NULL,
    datum_rodjenja VARCHAR(50) NOT NULL,
    grad VARCHAR(15) NOT NULL,
    telefon VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    datum_zaposlenja VARCHAR(50) NOT NULL
);

CREATE TABLE raspored_trener (
    id_rt INT PRIMARY KEY NOT NULL,
    id_rasporeda int,
    FOREIGN KEY (id_rasporeda)
        REFERENCES raspored (raspored_id),
	id_trener int,
    FOREIGN KEY (id_trener)
        REFERENCES trener (trener_id)
);

CREATE TABLE raspored_clan (
    id_rc INT PRIMARY KEY NOT NULL,
    id_rasporeda int,
    FOREIGN KEY (id_rasporeda)
        REFERENCES raspored (raspored_id),
	id_clana int,
    FOREIGN KEY (id_clana)
        REFERENCES clanovi (clan_id)
);

