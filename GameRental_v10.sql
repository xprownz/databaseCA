DROP DATABASE IF EXISTS gamerental;

CREATE DATABASE gamerental;

USE gamerental;


CREATE TABLE STORE(
STORE_ID NUMERIC(5) PRIMARY KEY,
STORE_STREET VARCHAR(35) NOT NULL,
STORE_CITY VARCHAR(40) NOT NULL,
STORE_PHONE varchar(20) NOT NULL
);
/*we have reduced the number of stores to 5
now we have to reflect these stores in Game table, as it has a foreign key to connect to the store table*/

CREATE TABLE GAMES(
GAME_ID varchar(15) PRIMARY KEY,
GAME_NAME VARCHAR(35) NOT NULL,
STORE_ID NUMERIC(5) NOT NULL,
INDEX (STORE_ID),
CONSTRAINT FK_GAMES_STORE FOREIGN KEY(STORE_ID) REFERENCES STORE(STORE_ID)
);

CREATE TABLE CUSTOMER(
CUSTOMER_ID NUMERIC(4) PRIMARY KEY,
CUSTOMER_FNAME VARCHAR(35) NOT NULL,
CUSTOMER_LNAME VARCHAR(35) NOT NULL,
CUSTOMER_STREET VARCHAR(35) NOT NULL,
CUSTOMER_CITY VARCHAR(40) NOT NULL,
CUSTOMER_PHONE varchar(15) NOT NULL,
STORE_ID NUMERIC(5),
INDEX (STORE_ID),
CONSTRAINT FK_CUSTOMER_STORE FOREIGN KEY(STORE_ID) REFERENCES STORE(STORE_ID)
);

CREATE TABLE RENTAL(
RENTAL_ID VARCHAR(10) PRIMARY KEY,
RENTAL_DATE DATETIME NOT NULL, 
RETURN_DATE DATETIME NOT NULL,
RENTAL_PRICE NUMERIC(5) NOT NULL,
CUSTOMER_ID NUMERIC(4),
STORE_ID NUMERIC(5),
GAME_ID VARCHAR(15),
INDEX (GAME_ID,CUSTOMER_ID,STORE_ID),
CONSTRAINT FK_RENTAL_GAME FOREIGN KEY(GAME_ID) REFERENCES GAMES(GAME_ID),
CONSTRAINT FK_CUSTOMER_RENTAL FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
CONSTRAINT FK_STORE_RENTAL FOREIGN KEY(STORE_ID) REFERENCES STORE(STORE_ID)
);

/*Alex - made some changes into the tables
 >Changed all numeric to varchar, as Numeric is much more picky 
 >Incremeted all varchar ranges
 >Removed NOT NULL commans from all FK's. 
 >Added DATA to all tables, instead of imported from CSV, I found much more easier as create INSERT statements directly from the DATA Generator.
 
*/


INSERT INTO STORE (STORE_ID,STORE_STREET,STORE_CITY,STORE_PHONE) VALUES (1,"5506 Diam St.","Parndorf","1-184-602-9203"),(2,"Ap #682-6897 Scelerisque, Rd.","Koekelberg","1-768-521-0238"),(3,"P.O. Box 211, 3479 Aliquam, Av.","Crecchio","1-846-288-8196"),(4,"Ap #778-7004 Lacus. Avenue","Beerse","1-437-533-5725"),(5,"Ap #345-3494 Erat Rd.","Bonavista","1-694-810-5965");

INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("WZI25LHK6SP","fermentum vel,",1),("VCR93FEG7WX","elit, dictum",1),("TXY30BSS0LZ","Tomb Raider",1),("GZF85ETJ9DA","felis, adipiscing",1);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("PRN96YCM4WD","dui, in",1),("EYS22CNA3LI","Lorem ipsum",1),("GOP03AQF2UL","Need for Speed 2",1),("ORI85QDV3XW","metus vitae",1);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("XMI23IYP6ZA","purus, accumsan",1),("SUL16PGH0TU","Tomb Raider",1),("XYF51CTD2DQ","Aenean massa.",1),("LHI18JLO6ZQ","sapien, cursus",1);

INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("VFS62OVM0MK","eros. Proin",2),("KUO30TFM4QE","auctor, velit",2),("DSF39DDO6YF","Need for Speed 2",2),("FQB87XXB0NG","fringilla, porttitor",2);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("VFH54ZRA5QL","Red dead redemption",2),("IPD10IAH8SQ","fringilla ornare",2),("VDB37JDM5HW","Fortnight",2),("RJE75FBJ9VV","diam eu",2);

INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("DLQ56YRO5ME","sagittis. Duis",3),("DAL29YTA1TT","Need for Speed 2",3),("NZJ37UBP9OD","Need for Speed 2",3),("CIS83GSG8PW","Need for Speed 2",3);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("MYC62BKM1AJ","ante. Vivamus",3),("DKS14BZA5JB","Tomb Raider",3),("YPZ76UTE3OC","Need for Speed 2",3),("RZG65DYC7ED","lobortis mauris.",3);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("QRF45RUT8EJ","orci luctus",3),("IFY78HXT0UZ","Fortnight",3),("YQB02YRJ1IV","tincidunt aliquam",3),("CYC32GTY9GE","eget magna.",3);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("GKD35WAV8IX","Need for Speed 2",3),("TLR41EAL7TN","Tomb Raider",3),("JZZ29FYK1KH","dapibus quam",3),("BRE30RKW2CO","vehicula risus.",3);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("SHC06VSV9QJ","Fallout 4",3),("TIY54VRF9PC","Red dead redemption",3),("OMZ81WFT4ST","luctus, ipsum",3),("LXI69YXC1ZH","iaculis enim,",3);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("OKK81CTD8BZ","Fallout 4",3),("EIA91AVD6KZ","Tomb Raider",3),("CKV89IVJ9QE","nulla vulputate",3),("BBU62VVP8PC","non massa",3);

INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("CQJ18WHX6CX","aliquet libero.",4),("MNU10LLD1JX","a nunc.",4),("OWK57CWF4TL","Integer mollis.",4),("EET54TGP4ZI","dis parturient",3);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("PPA20VDJ3FS","Fallout 4",4),("NAA77LUA1NP","at, nisi.",4),("GYC09CQM6TM","Tomb Raider",4),("PEP88WGG1PM","adipiscing fringilla,",3);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("LKJ86WZE4EK","lorem ipsum",4),("DBL19XUB8WM","Curabitur vel",4),("CUN76DFD4KX","vehicula aliquet",4),("DTQ05WIS9BA","diam nunc,",3);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("AZS33KTH5YH","hendrerit neque.",4),("ORH73NRW3QP","Red dead redemption",4),("LQF82WNL3YY","lobortis quis,",4),("GTS78GSM1LO","Donec consectetuer",3);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("WFE83HRG5QA","blandit viverra.",4),("HIU15YIN1BX","Need for Speed 2",4),("FHY76POF6RA","pretium et,",4),("OOL94RRL6YW","mattis ornare,",3);

INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("JHJ16WWC2NE","arcu iaculis",5),("PZN62HBQ6LM","Need for Speed 2",5),("KER31IMV1FS","Integer vitae",5),("USH76WXQ3XM","quis diam.",3);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("AEY02BOG9PD","dui, semper",5),("LET57XNG6XG","Need for Speed 2",5),("ZGX25GIJ0DY","Fortnight",5),("VGB32PBJ9VV","luctus vulputate,",3);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("RME78HFG2MV","Red dead redemption",5),("TBQ00GXV3QE","Fallout 4",5),("EIX64KNX8AB","Tomb Raider",5),("XRQ90GAU3TI","nunc nulla",3);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("DCR28SOJ3NY","nec ante",5),("NVU94BGE9KO","Fortnight",5),("NUS81GSI7HG","Red dead redemption",5),("EER03WLI7RP","ut eros",3);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("SKX02DPF0EK","diam lorem,",5),("RNL83YSO1JH","dolor. Fusce",5),("NZW14INL7HB","Fortnight",5),("DWI84GHM4ZP","Aliquam erat",3);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("DPG16HDH5IU","Red dead redemption",5),("CHY95QCB0LD","Fortnight",5),("GNC52VQE8KS","Mauris ut",5),("GGQ15VWZ1UU","quis accumsan",3);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("UVI56XZL6HK","Red dead redemption",5),("MLV53FAD3OI","tempor lorem,",5),("ZIS36UMY2NH","enim nec",5),("OAG28UFE8KB","sed tortor.",3);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("VFU03AAG3NM","Fortnight",5),("RXM41RXW9VE","Fallout 4",5),("CUD89LIV7XD","tellus. Suspendisse",5),("CWD41CHK0SQ","Tomb Raider",3);
INSERT INTO GAMES (GAME_ID,GAME_NAME,STORE_ID) VALUES ("UYY65FMB8DV","Fallout 4",5),("JGS05KJW2WK","nonummy ultricies",5),("BCD74QAB7SO","Fortnight",5),("ERD73UTK8PX","Tomb Raider",3);

INSERT INTO CUSTOMER (CUSTOMER_ID,CUSTOMER_FNAME,CUSTOMER_LNAME,CUSTOMER_STREET,CUSTOMER_CITY,CUSTOMER_PHONE) VALUES (1,"Lee","Williamson","696-1125 Mauris Road","Avelgem","08 90 58 52 48"),(2,"Zelenia","Berger","9593 Vulputate, Street","Herselt","09 07 46 68 56"),(3,"Reed","Fry","609-9102 Massa. Road","Motherwell","01 83 06 44 56"),(4,"Kelly","Ochoa","Ap #480-7616 Ridiculus Rd.","Mansfield-et-Pontefract","03 87 07 38 51");
INSERT INTO CUSTOMER (CUSTOMER_ID,CUSTOMER_FNAME,CUSTOMER_LNAME,CUSTOMER_STREET,CUSTOMER_CITY,CUSTOMER_PHONE) VALUES (5,"Leroy","Blackwell","5561 Non Av.","Renlies","06 65 55 58 00"),(6,"Lareina","Conway","Ap #214-626 Elit. St.","Noicattaro","07 10 08 37 15"),(7,"Wing","Dillard","327-2123 Mus. Street","Bouffioulx","04 58 35 28 58"),(8,"Charity","Hammond","397-992 Nunc Rd.","Brindisi","02 48 32 48 72");
INSERT INTO CUSTOMER (CUSTOMER_ID,CUSTOMER_FNAME,CUSTOMER_LNAME,CUSTOMER_STREET,CUSTOMER_CITY,CUSTOMER_PHONE) VALUES (9,"Lester","Banks","Ap #806-1274 A Rd.","Molenbeersel","06 96 08 54 92"),(10,"Sierra","Vazquez","518-2251 Amet Road","Bergeggi","02 72 72 00 78"),(11,"Harriet","Valencia","8639 Nec, Rd.","Sambalpur","04 55 15 04 80"),(12,"Britanney","Wise","Ap #211-5072 Sit St.","Paulatuk","01 81 93 86 02");

/*UPDATE DATETIME VALUES FROM THE INSERTS BELOW*/

INSERT INTO RENTAL (RENTAL_ID,RENTAL_DATE,RETURN_DATE,RENTAL_PRICE,CUSTOMER_ID,STORE_ID,GAME_ID) VALUES ("FWA97SK","25/11/2018","30/11/17",10,2,1,"WZI25LHK6SP"),("SMR70WP","07/05/2019","08/08/18",30,2,1,"RJE75FBJ9VV");
INSERT INTO RENTAL (RENTAL_ID,RENTAL_DATE,RETURN_DATE,RENTAL_PRICE,CUSTOMER_ID,STORE_ID,GAME_ID) VALUES ("OQX30MX","02/05/2018","20/05/18",22,10,2,"VCR93FEG7WX"),("PYL50PT","01/10/2018","02/04/18",15,3,2,"RZG65DYC7ED");
INSERT INTO RENTAL (RENTAL_ID,RENTAL_DATE,RETURN_DATE,RENTAL_PRICE,CUSTOMER_ID,STORE_ID,GAME_ID) VALUES ("SHR61BP","25/06/2018","15/03/19",23,7,2,"EYS22CNA3LI"),("WNI31QQ","25/11/2018","23/10/18",16,8,2,"CYC32GTY9GE");
INSERT INTO RENTAL (RENTAL_ID,RENTAL_DATE,RETURN_DATE,RENTAL_PRICE,CUSTOMER_ID,STORE_ID,GAME_ID) VALUES ("IKV60OL","16/06/2018","09/05/19",24,9,3,"XYF51CTD2DQ"),("TJF19ZS","28/02/2018","31/07/19",17,5,3,"YPZ76UTE3OC");
INSERT INTO RENTAL (RENTAL_ID,RENTAL_DATE,RETURN_DATE,RENTAL_PRICE,CUSTOMER_ID,STORE_ID,GAME_ID) VALUES ("GMR36IA","24/05/2019","05/08/18",10,10,4,"LHI18JLO6ZQ"),("EXJ33JS","02/11/2019","22/11/17",18,5,4,"ORI85QDV3XW");
INSERT INTO RENTAL (RENTAL_ID,RENTAL_DATE,RETURN_DATE,RENTAL_PRICE,CUSTOMER_ID,STORE_ID,GAME_ID) VALUES ("PNO66SE","18/03/2019","02/11/18",20,1,5,"YQB02YRJ1IV"),("IHW00DD","25/10/2019","19/05/18",10,1,5,"GZF85ETJ9DA");




/*WHICH GAMES ARE AVAILABLE IN WHICH STORE AND THE RENTAL PRICES. wE HAVE TO CREATE A SELECT STATEMENT FOR IT*/
/*WHICH CUSTOMERS HAVE GAMES CURRENTLY RENTED, AND SHOW GAMES RENTED IN THE PAST*/




