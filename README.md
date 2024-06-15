# Introduction

These smart contracts are designed to provide access to a blockchain system, ensuring that the Material Impact Passport for wooden substances can be verified and certified at every stage. To achieve this, a series of smart contracts have been developed, each targeting a specific aspect of the value chain. These contracts are tailored for the company Bonzano, ensuring that all information related to forest management, logistics, and production processes are accurately tracked and verified.

The primary purpose of these smart contracts is to ensure compliance with social sustainability indicators as per OECD and PEFC guidelines, providing a transparent and immutable record of all operations. This ensures that every stakeholder in the supply chain can trust the data and certifications provided, ultimately supporting sustainability and accountability.

Below are the details of the smart contracts created for each part of the value chain:

# Smart Contract for Forest_Management

Manages and tracks forest resources and ensures compliance with social sustainability indicators (from OECD and PEFC Guidelines).

### Wood Mix
- `mapping woodMix`: initialized in the constructor function.
  - Types of wood used to produce a panel.
  - Types of wood respective percentages.

#### Public Getter Function
- `getWoodPercentage`: used to retrieve the percentage of a specified wood type.

### Compliance Criteria
- `array complianceCriteria`: used to store a list of compliance standards, populated with social sustainability indicators, initialized in the constructor function.
- `getComplianceCriterion`: public getter function used to retrieve a specific compliance criterion by its index.

# SMART CONTRACT – Logistics

Manages and tracks logistics-related information, including the annual sales volume of products, details about packaging materials, and transportation means along with their specific container details for the different destinations.

### Metrics Tracked

#### Annual Sales Volume
- `constant annualSalesVolume`: set to represent the volume of sold panels per year (in m³).

#### Packaging Materials Tracking
- `struct Packaging`:
  - Typology (type of material).
  - Quantity (in kilograms).
  - Recyclability percentage.
- `mapping packaging`: initialized in the constructor function, used to store and retrieve packaging details based on material name.

#### Means of Transport
- `struct Transport`:
  - Typology (type of transport).
  - Fuel type.
  - Capacity.
  - Container details for specific destinations (number of containers and distance travelled).
- Each `Transport` struct contains a nested mapping to store `ContainerDetail` structs for the different destinations.
- `struct ContainerDetail`: stores the number of containers and the distance travelled (in km) for each destination.
- `mapping transports`: initialized in the constructor function, used to store and retrieve transport details based on transport typology.

#### Internal Function
- `setContainerDetails`: used internally to set the number of containers and distance for specific transport and destination pairs.

#### Public Getter Function
- `getContainerDetails`: allows to retrieve the container details for a specific transport and destination.

# Smart contract for Process and Production

Manages and tracks various aspects of a production process, including the annual production volume, energy consumption, adhesive usage, paint usage, and compliance with social sustainability indicators (from OECD and PEFC Guidelines).

### Metrics Tracked

#### Annual Production Volume
- `constant annualProductionVolume`: defined to store the annual production volume (in m³).

#### Energy Consumption
- Electrical energy consumption per unit of production (in KWh per m³).
- Thermal energy consumption per unit of production (in KWh per m³).
- Methane consumption for producing thermal energy (in standard m³ per m³).

#### Adhesive Usage
- Typology of adhesive used.
- Quantity of adhesive used (in tons per m³).

#### Paint Usage
- `variable paintUsage`: defined to store the amount of paint used per unit of production (in l/m³).

### Compliance Criteria
- `array complianceCriteria`: used to store a list of compliance standards, populated with social sustainability indicators, initialized in the constructor function.
- `getComplianceCriterion`: public getter function provided to retrieve a specific compliance criterion by its index.
