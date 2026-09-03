# 📊 Power BI Dashboard

## 📌 Purpose

This section contains an interactive Power BI dashboard for analyzing employee transportation and corporate shuttle performance.

The dashboard helps management monitor demand, routes, vehicles, delays, cancellations, vendors and transportation costs.

---

## 🎯 Dashboard Objectives

The dashboard helps to:

- Monitor transportation KPIs
- Analyze employee demand
- Identify high-demand routes
- Monitor vehicle utilization
- Analyze delays and cancellations
- Compare vendors
- Monitor transportation costs
- Support data-driven decisions

---

## 🔗 1. Power BI Data Model

The dashboard uses six datasets:

- Employees
- Vehicles
- Routes
- Trips
- Bookings
- Incidents

### Relationships

```text
Employees[Employee_ID] → Bookings[Employee_ID]

Routes[Route_ID] → Bookings[Route_ID]

Trips[Trip_ID] → Bookings[Trip_ID]

Vehicles[Vehicle_ID] → Trips[Vehicle_ID]

Trips[Trip_ID] → Incidents[Trip_ID]
```

Most relationships follow a **One-to-Many (1:*)** structure.

The data model connects employee, booking, route, vehicle, trip and incident information for analysis.

---

## 📐 2. Power BI Measures

Simple DAX measures are used to calculate the main transportation KPIs.

### Basic Measures

```DAX
Total Employees = COUNTROWS(Employees)

Total Vehicles = COUNTROWS(Vehicles)

Total Routes = COUNTROWS(Routes)

Total Trips = COUNTROWS(Trips)

Total Bookings = COUNTROWS(Bookings)
```

### Trip Performance

```DAX
Completed Trips =
CALCULATE(
    COUNTROWS(Trips),
    Trips[Trip_Status] = "Completed"
)

Cancelled Trips =
CALCULATE(
    COUNTROWS(Trips),
    Trips[Trip_Status] = "Cancelled"
)
```

### Cancellation Rate

```DAX
Cancellation Rate =
DIVIDE(
    [Cancelled Trips],
    [Total Trips]
)
```

Format this measure as **Percentage**.

### Cost Analysis

```DAX
Total Transportation Cost =
SUM(Trips[Trip_Cost_INR])

Average Trip Cost =
AVERAGE(Trips[Trip_Cost_INR])
```

### Incident Analysis

```DAX
Total Incidents =
COUNTROWS(Incidents)

Average Delay =
AVERAGE(Incidents[Delay_Minutes])
```

### Demand Analysis

```DAX
High Demand Routes =
CALCULATE(
    COUNTROWS(Routes),
    Routes[Demand_Level] = "High"
)

Medium Demand Routes =
CALCULATE(
    COUNTROWS(Routes),
    Routes[Demand_Level] = "Medium"
)

Low Demand Routes =
CALCULATE(
    COUNTROWS(Routes),
    Routes[Demand_Level] = "Low"
)
```

### Vehicle Utilization

```DAX
Vehicle Utilization % =
DIVIDE(
    [Total Bookings],
    SUMX(
        Trips,
        RELATED(Vehicles[Capacity])
    )
)
```

Format this measure as **Percentage**.

---

## 🚐 3. Vehicle Utilization

Vehicle utilization measures how effectively available vehicle capacity is being used.

### Formula

```text
Vehicle Utilization % =

Total Bookings
÷
(Vehicle Capacity × Total Trips)
× 100
```

### Example

For Vehicle V001:

- Capacity = 20
- Total Trips = 4
- Total Bookings = 9

```text
Utilization = 9 ÷ (20 × 4) × 100

             = 11.25%
```

### Business Meaning

Low utilization may indicate unused vehicle capacity.

This can help the transportation team:

- Review vehicle allocation
- Consider smaller vehicles
- Review low-demand routes
- Adjust trip frequency
- Improve capacity planning
- Reduce unnecessary transportation costs

---

# 📊 4. Dashboard Pages

## Page 1 — Executive Dashboard

### KPI Cards

- Total Employees
- Total Vehicles
- Total Routes
- Total Trips
- Total Bookings
- Cancellation Rate
- Average Trip Cost

### Charts

- Bookings by Pickup Location
- Trip Status
- Bookings by Route
- Transportation Cost by Vendor

### Slicers

- Trip Date
- Route Name
- Pickup Location
- Vendor Name
- Trip Status

---

## Page 2 — Route & Demand Analysis

### KPI Cards

- Total Bookings
- High-Demand Routes
- Medium-Demand Routes
- Low-Demand Routes

### Charts

- Route-wise Booking Demand
- Routes by Demand Level
- Employees by Pickup Location
- Route Distance Comparison

### Table

- Route ID
- Route Name
- Pickup Location
- Demand Level
- Distance KM
- Total Bookings

### Slicers

- Trip Date
- Route Name
- Pickup Location
- Demand Level

---

## Page 3 — Vehicle, Vendor & Cost Analysis

### KPI Cards

- Total Vehicles
- Total Transportation Cost
- Average Trip Cost
- Total Incidents
- Average Delay

### Charts

- Trips by Vehicle
- Vehicle Capacity
- Transportation Cost by Vendor
- Incidents by Type
- Incident Severity

### Table

- Vehicle ID
- Vehicle Number
- Vehicle Type
- Vendor
- Capacity
- Total Trips
- Total Bookings
- Utilization %

### Slicers

- Vendor Name
- Vehicle Type
- Vehicle Number
- Trip Status
- Trip Date

---

# 🎛️ 5. Interactive Filters

The dashboard contains interactive slicers and filters.

Users can filter the dashboard by:

- Trip Date
- Route
- Pickup Location
- Vehicle
- Vendor
- Trip Status
- Demand Level

When a filter is selected, the relevant KPI cards, charts and tables update automatically.

This makes the dashboard interactive and useful for management decision-making.

---

# 💡 6. Key Business Insights

The dashboard helps identify:

- High-demand pickup locations
- High-demand routes
- Low-demand routes
- Underutilized vehicles
- Frequent transportation incidents
- Traffic-related delays
- Trip cancellations
- Vendor-wise transportation costs
- Opportunities for better capacity planning

---

# 🔄 7. Project Data Flow

```text
Dataset
   ↓
Excel Analysis
   ↓
SQL Analysis
   ↓
Power BI Dashboard
   ↓
Business Insights
   ↓
Business Recommendations
```

---

# 📁 8. File Structure

```text
09_PowerBI/
│
├── PowerBI_Dashboard.pbix
└── README.md
```

### PowerBI_Dashboard.pbix

Contains the interactive Power BI dashboard with:

- KPI Cards
- Charts
- Tables
- Slicers
- Interactive Filters
- Three dashboard pages

### README.md

Contains documentation for:

- Data model
- Relationships
- DAX measures
- Vehicle utilization
- Dashboard pages
- KPIs
- Business insights

---

## 🛠️ Tool

**Microsoft Power BI**

## 👩‍💻 Author

**Komal**

Business Analyst | Excel | SQL | Power BI

## 📌 Project Type

End-to-End Business Analysis Portfolio Project

## 🎯 Outcome

The Power BI dashboard provides a centralized view of employee transportation performance and supports data-driven decisions related to demand, routes, vehicles, vendors and transportation costs.
