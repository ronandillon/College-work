DROP TABLE SalesFact CASCADE CONSTRAINTS PURGE;

DROP TABLE Owner CASCADE CONSTRAINTS PURGE;

DROP TABLE VisitingFact CASCADE CONSTRAINTS PURGE;

DROP TABLE Time CASCADE CONSTRAINTS PURGE;

DROP TABLE Agent CASCADE CONSTRAINTS PURGE;

DROP TABLE Customer CASCADE CONSTRAINTS PURGE;

DROP TABLE Estate CASCADE CONSTRAINTS PURGE;

CREATE TABLE Estate
(
	Estate_ID             VARCHAR2(20) NOT NULL ,
	Ecategory             VARCHAR2(20) NULL ,
	Area                 VARCHAR2(20) NULL ,
	City                 VARCHAR2(20) NULL ,
	Province             VARCHAR2(20) NULL ,
	Rooms                INTEGER NULL ,
	Bedrooms             INTEGER NULL ,
	Garage               CHAR(1) NULL ,
	Meters               INTEGER NULL ,
CONSTRAINT  XPKEstate PRIMARY KEY (Estate_ID)
);

CREATE TABLE Customer
(
	Customer_ID            VARCHAR2(20) NOT NULL ,
	Cname                 VARCHAR2(20) NULL ,
	Surname              VARCHAR2(20) NULL ,
	Budget               NUMBER(10,2) NULL ,
	Address              VARCHAR2(50) NULL ,
	City                 VARCHAR2(20) NULL ,
	Phone                INTEGER NULL ,
CONSTRAINT  XPKCustomer PRIMARY KEY (Customer_ID)
);

CREATE TABLE Agent
(
	Agent_ID              VARCHAR2(20) NOT NULL ,
	Aname                 VARCHAR2(20) NULL ,
	Surname              VARCHAR2(20) NULL ,
	Office               VARCHAR2(20) NULL ,
	Address              VARCHAR2(50) NULL ,
	City                 VARCHAR2(20) NULL ,
	Phone                INTEGER NULL ,
CONSTRAINT  XPKAgent PRIMARY KEY (Agent_ID)
);

CREATE TABLE Time
(
	Time_ID               VARCHAR2(20) NOT NULL ,
	Tday                  INTEGER NULL ,
	Tmonth                INTEGER NULL ,
	Tyear                 INTEGER NULL ,
CONSTRAINT  XPKTime PRIMARY KEY (Time_ID)
);

CREATE TABLE VisitingFact
(
	Estate_ID             VARCHAR2(20) NOT NULL ,
	Customer_ID            VARCHAR2(20) NOT NULL ,
	Agent_ID              VARCHAR2(20) NOT NULL ,
	Time_ID               VARCHAR2(20) NOT NULL ,
	Vduration             INTEGER NULL ,
CONSTRAINT  XPKVisitingFact PRIMARY KEY (Estate_ID,Customer_ID,Agent_ID,Time_ID),
CONSTRAINT R_E1 FOREIGN KEY (Estate_ID) REFERENCES Estate (Estate_ID),
CONSTRAINT R_C1 FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID),
CONSTRAINT R_A1 FOREIGN KEY (Agent_ID) REFERENCES Agent (Agent_ID),
CONSTRAINT R_T1 FOREIGN KEY (Time_ID) REFERENCES Time (Time_ID)
);

CREATE TABLE Owner
(
	Owner_ID              VARCHAR2(20) NOT NULL ,
	Oname                 VARCHAR2(20) NULL ,
	Surname              VARCHAR2(20) NULL ,
	Address              VARCHAR2(50) NULL ,
	City                 VARCHAR2(20) NULL ,
	Phone                INTEGER NULL ,
CONSTRAINT  XPKOwner PRIMARY KEY (Owner_ID)
);

CREATE TABLE SalesFact
(
	Owner_ID              VARCHAR2(20) NOT NULL ,
	Agent_ID              VARCHAR2(20) NOT NULL ,
	Time_ID               VARCHAR2(20) NOT NULL ,
	Estate_ID             VARCHAR2(20) NOT NULL ,
	Customer_ID            VARCHAR2(20) NOT NULL ,
	OfferPrice           NUMBER(10,2) NULL ,
	AgreedPrice          NUMBER(10,2) NULL ,
	Status               VARCHAR2(20) NULL ,
CONSTRAINT  XPKSalesFact PRIMARY KEY (Owner_ID,Agent_ID,Time_ID,Estate_ID,Customer_ID),
CONSTRAINT R_O1 FOREIGN KEY (Owner_ID) REFERENCES Owner (Owner_ID),
CONSTRAINT R_A2 FOREIGN KEY (Agent_ID) REFERENCES Agent (Agent_ID),
CONSTRAINT R_T2 FOREIGN KEY (Time_ID) REFERENCES Time (Time_ID),
CONSTRAINT R_E2 FOREIGN KEY (Estate_ID) REFERENCES Estate (Estate_ID),
CONSTRAINT R_C2 FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID)
);

INSERT INTO ESTATE VALUES ('1', 'house', 'a1', 'dublin', 'dublin', 5, 2, 'N', 360);
INSERT INTO ESTATE VALUES ('2', 'studio', 'a5', 'dublin', 'dublin', 3, 1, 'N', 200);
INSERT INTO ESTATE VALUES ('3', 'flat', 'a7', 'dublin', 'dublin', 7, 3, 'Y', 560);

INSERT INTO CUSTOMER VALUES ('1', 'Ronan', 'Dillon', 50000.00, 'bancroft ave', 'dublin', 0864490244);
INSERT INTO CUSTOMER VALUES ('2', 'Fleetwood', 'Mac', 760000.00, 'dundalk', 'louth', 0853658700);
INSERT INTO CUSTOMER VALUES ('3', 'Paul', 'Simon', 390000.00, 'swords', 'dublin', 0890909188);

INSERT INTO AGENT VALUES ('1', 'Sting', 'Police', 'building1', 'long mile road', 'dublin', 0864420955);
INSERT INTO AGENT VALUES ('2', 'Bob', 'Barker', 'building2', 'wicklow street', 'dublin', 0853659811);
INSERT INTO AGENT VALUES ('3', 'Andrew', 'Lad', 'office1', 'sandy lane', 'dublin', 0890909111);

INSERT INTO TIME VALUES ('1', 11, 10, 2015);
INSERT INTO TIME VALUES ('2', 2, 10, 2015);
INSERT INTO TIME VALUES ('3', 1, 11, 2015);

INSERT INTO OWNER VALUES ('1', 'Bob', 'Marley', 'Drumcondra', 'dublin', 0890911111);
INSERT INTO OWNER VALUES ('2', 'Alan', 'Davis', 'Phibsborough', 'dublin', 0856385997);
INSERT INTO OWNER VALUES ('3', 'Kimmy', 'Carr', 'Greystones', 'dublin', 0860803011);

INSERT INTO VISITINGFACT VALUES ('1','1','1','1',50);
INSERT INTO VISITINGFACT VALUES ('2','1','2','2',60);
INSERT INTO VISITINGFACT VALUES ('3','1','3','3',30);
  
INSERT INTO SALESFACT VALUES ('1','1','1','1','1',24000.00,31000.00,'sold');
INSERT INTO SALESFACT VALUES ('2','2','2','2','2',450000.00,610000.00,'sold');
INSERT INTO SALESFACT VALUES ('3','3','3','3','3',240400.00,454000.00,'rented');




--How many customers have visited properties of at least 3 different categories?
CREATE OR REPLACE VIEW Cat3 AS
SELECT V.Customer_ID
FROM VisitingFact V, Estate S
WHERE V.Estate_ID LIKE S.Estate_ID
GROUP BY V.Customer_ID
HAVING COUNT(DISTINCT S.Ecategory) >=3;

SELECT COUNT(*)
FROM Cat3;

--Customers that paid the highest price among all other customers who have viewed properties of at least 3 different categories?
SELECT C.Customer_ID
FROM Cat3 C, SALESFACT S
WHERE C.Customer_ID = S.Customer_ID AND S.AgreedPrice IN
(SELECT MAX(S.AgreedPrice)
FROM Cat3 C1, SALESFACT S1
WHERE C1.Customer_ID = S1.Customer_ID);

--Average duration of viewings per property in each category
SELECT E.Ecategory, AVG(V.Vduration)
FROM VISITINGFACT V, Estate E
WHERE V.Estate_ID = E.Estate_ID
GROUP BY E.Ecategory;

--The customer that bought a flat at the highest price for each month?
SELECT S.Customer_ID, D.Tmonth, D.Tyear, S.AgreedPrice
FROM SALESFACT S, Estate E, Time D
WHERE S.Estate_ID = E.Estate_ID AND S.Time_ID = D.Time_ID AND E.Ecategory = 'flat' AND (D.Tmonth,
D.Tyear, S.AgreedPrice) IN (
SELECT D1.Tmonth, D1.Tyear, MAX(S1.AgreedPrice)
FROM SALESFACT S1, Estate E1, Time D1
WHERE S1.Estate_ID = E1.Estate_ID AND S1.Time_ID = D1.Time_ID AND E1.Ecategory = 'flat'
GROUP BY D1.Tmonth, D1.Tyear);

--The type of property sold for the highest price in each month in each city
SELECT E.Ecategory, E.City, D.Tmonth, D.Tyear,
S.AgreedPrice
FROM SALESFACT S, Time D, Estate E
WHERE S.Time_ID = D.Time_ID AND E.Estate_ID =
S.Estate_ID AND (S.AgreedPrice, E.City, D.Tmonth,
D.Tyear) IN (
SELECT MAX(S1.AgreedPrice), E1.City, D1.Tmonth, D1.Tyear
FROM SALESFACT S1, Time D1, Estate E1
WHERE S1.Time_ID = D1.Time_ID AND E1.Estate_ID = S1.Estate_ID
GROUP BY D1.Tmonth, D1.Tyear, E1.City);

