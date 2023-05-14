CREATE TABLE igraci (
    igrac_id INT PRIMARY KEY auto_increment,
    ime VARCHAR(50) not null,
    prezime VARCHAR(50) not null,
    datum_rodjenja DATE not null,
    adresa VARCHAR(100) not null,
    telefon_oditelja VARCHAR(20) not null,
    email_roditelja VARCHAR(50)
);

CREATE TABLE mesta (
    mesto_id INT PRIMARY KEY auto_increment,
    naziv VARCHAR(50) not null,
    opis VARCHAR(200),
    lokacija VARCHAR(50) not null,
    znamenitosti VARCHAR(200)
);

CREATE TABLE raspored (
    reaspored_id INT PRIMARY KEY auto_increment,
    trener_id INT,
    mesto_id INT not null,
    datum DATE not null,
    vreme TIME not null,
    FOREIGN KEY (trener_id) REFERENCES treneri(trener_id),
    FOREIGN KEY (mesto_id) REFERENCES mesta(mesto_id)
);

CREATE TABLE treneri (
    trener_id INT PRIMARY KEY not null,
    ime VARCHAR(50) not null,
    prezime VARCHAR(50) not null,
    datum_rodjenja DATE not null,
    kvalifikacije VARCHAR(200) not null
);

ALTER TABLE raspored ADD COLUMN igrac_id INT;
ALTER TABLE raspored ADD FOREIGN KEY (igrac_id) REFERENCES igraci(igrac_id);

ALTER TABLE igraci ADD COLUMN mesto_id INT;
ALTER TABLE igraci ADD FOREIGN KEY (mesto_id) REFERENCES mesta(mesto_id);
