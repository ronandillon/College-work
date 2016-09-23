CREATE VIEW Cust3Cat AS
SELECT V.CustomerID
FROM ViewingTable V, Estate E
WHERE V.EstateID = E.EstateID
GROUP BY V.CustomerID
HAVING COUNT(DISTINCT E.Category) >=3
SELECT COUNT(*)
FROM Cust3Cat



SELECT C.CustomerID
FROM Cust3Cat C, SalesTable S
WHERE C.CustID = S.CustID AND S.AgreedPrice IN
(SELECT MAX(S.AgreedPrice)
FROM Cust3Cat C1, SalesTable S1
WHERE C1.CustomerID = S1.CustomerID)


SELECT E.Category, AVG(V.Duration)
FROM ViewingTable V, Estate E
WHERE V.EstateID = E.EstateID
GROUP BY E.Category


SELECT S.CustomerID, T.Month, T.Year, S.AgreedPrice
FROM SalesTable S, Estate E, Time T
WHERE S.EstateID = E.EstateID AND S.TimeID =
T.TimeID AND E.Category = “flat” AND (T.Month,
T.Year, S.AgreedPrice) IN (
SELECT T1.Month, T1.Year,
MAX(S1.AgreedPrice)
FROM SalesTable S1, Estate E1, Time T1
WHERE S1.EstateID = E1.EstateID AND
S1.TimeID = T1.TimeID AND E1.Category =
“flat”
GROUP BY T1.Month, T1.Year



SELECT E.Category, E.City, T.Moth, T.Year,
E.AgreedPrice
FROM SalesTable S, Time T, Estate E
WHERE S.TimeID = T.TimeID AND E.EstateID =
S.EstateID AND (P.AgreedPrice, P.City, T.month,
T.year) IN (
SELECT MAX(E1.AgreedPrice), E1.City,
T1.Month, T1.Year)
FROM SalesTable S1, Time T1, Estate E1
WHERE S1.TimeID = T1.TimeID AND
E1.EstateID = S1.EstateID
GROUP BY T.Month, T.Year, E.City)

