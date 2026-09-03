-- ============================================================
-- 1. DATABASE TABLES
-- ============================================================

-- Employees Table

CREATE TABLE Employees (
    Employee_ID VARCHAR(10),
    Employee_Name VARCHAR(100),
    Department VARCHAR(50),
    Pickup_Location VARCHAR(100),
    Office_Location VARCHAR(100)
);


-- Vehicles Table

CREATE TABLE Vehicles (
    Vehicle_ID VARCHAR(10),
    Vehicle_Number VARCHAR(30),
    Vehicle_Type VARCHAR(50),
    Vendor_Name VARCHAR(100),
    Capacity INT,
    Status VARCHAR(30)
);


-- Routes Table

CREATE TABLE Routes (
    Route_ID VARCHAR(10),
    Route_Name VARCHAR(100),
    Pickup_Location VARCHAR(100),
    Office_Location VARCHAR(100),
    Distance_KM DECIMAL(10,2),
    Demand_Level VARCHAR(20)
);


-- Trips Table

CREATE TABLE Trips (
    Trip_ID VARCHAR(10),
    Trip_Date DATE,
    Route_ID VARCHAR(10),
    Vehicle_ID VARCHAR(10),
    Vendor_Name VARCHAR(100),
    Scheduled_Pickup TIME,
    Actual_Pickup TIME,
    Scheduled_Arrival TIME,
    Actual_Arrival TIME,
    Trip_Status VARCHAR(30),
    Trip_Cost_INR DECIMAL(10,2),
    Delay_Reason VARCHAR(100)
);


-- Bookings Table

CREATE TABLE Bookings (
    Booking_ID VARCHAR(10),
    Trip_ID VARCHAR(10),
    Employee_ID VARCHAR(10),
    Route_ID VARCHAR(10),
    Vehicle_ID VARCHAR(10),
    Booking_Date DATE,
    Booking_Status VARCHAR(30)
);


-- Incidents Table

CREATE TABLE Incidents (
    Incident_ID VARCHAR(10),
    Trip_ID VARCHAR(10),
    Incident_Date DATE,
    Incident_Type VARCHAR(100),
    Severity VARCHAR(30),
    Delay_Minutes INT,
    Description VARCHAR(255)
);


-- ============================================================
-- 2. BASIC DATA CHECK
-- ============================================================

-- Total employees

SELECT COUNT(*) AS Total_Employees
FROM Employees;


-- Total vehicles

SELECT COUNT(*) AS Total_Vehicles
FROM Vehicles;


-- Total routes

SELECT COUNT(*) AS Total_Routes
FROM Routes;


-- Total trips

SELECT COUNT(*) AS Total_Trips
FROM Trips;


-- Total bookings

SELECT COUNT(*) AS Total_Bookings
FROM Bookings;


-- ============================================================
-- 3. EMPLOYEE ANALYSIS
-- ============================================================

-- Employees by department

SELECT
    Department,
    COUNT(*) AS Employee_Count
FROM Employees
GROUP BY Department
ORDER BY Employee_Count DESC;


-- Employees by pickup location

SELECT
    Pickup_Location,
    COUNT(*) AS Employee_Count
FROM Employees
GROUP BY Pickup_Location
ORDER BY Employee_Count DESC;


-- ============================================================
-- 4. ROUTE ANALYSIS
-- ============================================================

-- Show all routes

SELECT *
FROM Routes;


-- High-demand routes

SELECT
    Route_ID,
    Route_Name,
    Pickup_Location,
    Demand_Level
FROM Routes
WHERE Demand_Level = 'High';


-- Low-demand routes

SELECT
    Route_ID,
    Route_Name,
    Pickup_Location,
    Demand_Level
FROM Routes
WHERE Demand_Level = 'Low';


-- Count routes by demand level

SELECT
    Demand_Level,
    COUNT(*) AS Route_Count
FROM Routes
GROUP BY Demand_Level;


-- ============================================================
-- 5. BOOKING ANALYSIS
-- ============================================================

-- Total bookings for each route

SELECT
    Route_ID,
    COUNT(*) AS Total_Bookings
FROM Bookings
GROUP BY Route_ID
ORDER BY Total_Bookings DESC;


-- Booking status

SELECT
    Booking_Status,
    COUNT(*) AS Booking_Count
FROM Bookings
GROUP BY Booking_Status;


-- ============================================================
-- 6. VEHICLE ANALYSIS
-- ============================================================

-- Show all vehicles

SELECT *
FROM Vehicles;


-- Vehicles by vendor

SELECT
    Vendor_Name,
    COUNT(*) AS Vehicle_Count
FROM Vehicles
GROUP BY Vendor_Name;


-- Vehicles by type

SELECT
    Vehicle_Type,
    COUNT(*) AS Vehicle_Count
FROM Vehicles
GROUP BY Vehicle_Type;


-- ============================================================
-- 7. TRIP ANALYSIS
-- ============================================================

-- Show all trips

SELECT *
FROM Trips;


-- Trips by status

SELECT
    Trip_Status,
    COUNT(*) AS Trip_Count
FROM Trips
GROUP BY Trip_Status;


-- Trips by vendor

SELECT
    Vendor_Name,
    COUNT(*) AS Trip_Count
FROM Trips
GROUP BY Vendor_Name
ORDER BY Trip_Count DESC;


-- ============================================================
-- 8. COST ANALYSIS
-- ============================================================

-- Total transportation cost

SELECT
    SUM(Trip_Cost_INR) AS Total_Cost
FROM Trips;


-- Average transportation cost

SELECT
    AVG(Trip_Cost_INR) AS Average_Trip_Cost
FROM Trips;


-- Total cost by vendor

SELECT
    Vendor_Name,
    SUM(Trip_Cost_INR) AS Total_Cost
FROM Trips
GROUP BY Vendor_Name
ORDER BY Total_Cost DESC;


-- ============================================================
-- 9. INCIDENT ANALYSIS
-- ============================================================

-- Total incidents

SELECT
    COUNT(*) AS Total_Incidents
FROM Incidents;


-- Incidents by type

SELECT
    Incident_Type,
    COUNT(*) AS Incident_Count
FROM Incidents
GROUP BY Incident_Type
ORDER BY Incident_Count DESC;


-- Incidents by severity

SELECT
    Severity,
    COUNT(*) AS Incident_Count
FROM Incidents
GROUP BY Severity
ORDER BY Incident_Count DESC;


-- ============================================================
-- 10. SIMPLE ROUTE + BOOKING ANALYSIS
-- ============================================================

SELECT
    r.Route_Name,
    COUNT(b.Booking_ID) AS Total_Bookings
FROM Routes r
LEFT JOIN Bookings b
    ON r.Route_ID = b.Route_ID
GROUP BY r.Route_Name
ORDER BY Total_Bookings DESC;


-- ============================================================
-- 11. SIMPLE VEHICLE + TRIP ANALYSIS
-- ============================================================

SELECT
    v.Vehicle_Number,
    COUNT(t.Trip_ID) AS Total_Trips
FROM Vehicles v
LEFT JOIN Trips t
    ON v.Vehicle_ID = t.Vehicle_ID
GROUP BY v.Vehicle_Number
ORDER BY Total_Trips DESC;

