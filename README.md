# Forest Management, Logistics, and Process Production Smart Contracts

## Overview

These smart contracts are designed to manage and track various aspects of forest management, logistics, and production processes. The contracts ensure compliance with social sustainability indicators from OECD and PEFC Guidelines and facilitate interactions between manufacturers, wood suppliers, logistics operators, and regulatory bodies.

## Forest Management Smart Contract

### Description
The Forest Management contract is designed to manage and track forest resources and ensure compliance with social sustainability indicators.

### Key Components

- **Wood Mix**: A mapping `woodMix`, initialized in the constructor function.
  - Types of wood used to produce a panel.
  - Types of wood respective percentages.
  - Public getter function `getWoodPercentage` to retrieve the percentage of a specified wood type.

- **Compliance Criteria**: An array `complianceCriteria` stores a list of compliance standards, initialized in the constructor function.
  - Public getter function `getComplianceCriterion` to retrieve a specific compliance criterion by its index.

- **Weekly Poplar Supply**: A constant `weeklyPoplarSupply`, representing the weekly supply of poplar wood (in tons).

- **Wood Source Percentages**: A mapping `woodSourcePercentage`, initialized in the constructor function, stores the percentage of wood sourced from different countries.
  - Public getter function `getWoodSourcePercentage` to retrieve the percentage of wood sourced from a specified country.

- **Transport Information**: `Transport` struct:
  - Transport type.
  - Fuel type.
  - Capacity (in tons).
  - Public getter function `getTransportInfo` to retrieve all the information related to transports.

- **NUTS Codes**: An array `NUTSCodes` stores NUTS codes of the forests from which the wood comes from.
  - Initialized in the constructor function.
  - Public getter function `getNUTSCodes` to return all the codes.

### Usage
This contract should be deployed by the manufacturer (Bonzano) and other wood suppliers to update wood composition, origin, means of transport, and to ensure compliance with regulatory standards. Regulatory bodies and auditors can interact with it to verify adherence to compliance regulations.

## Logistics Smart Contract

### Description
The Logistics contract manages and tracks logistics-related information, including annual sales volume, packaging materials, and transportation details.

### Key Components

- **Annual Sales Volume**: A constant `annualSalesVolume` representing the volume of sold panels per year (in m³).

- **Packaging Materials Tracking**: `Packaging` struct:
  - Typology (type of material).
  - Quantity (in kilograms).
  - Recyclability percentage.
  - A mapping `packaging`, initialized in the constructor function, stores and retrieves packaging details based on material name.

- **Means of Transport**: `Transport` struct:
  - Typology (type of transport).
  - Fuel type.
  - Capacity.
  - Container details for specific destinations (number of containers and distance traveled).
  - Nested mapping to store `ContainerDetail` structs for different destinations.
  - `ContainerDetail` struct stores the number of containers and the distance traveled (in km) for each destination.
  - Mapping `transports` initialized in the constructor function stores and retrieves transport details based on transport typology.
  - `setContainerDetails` function sets the number of containers and distance for specific transport and destination pairs.
  - `getContainerDetails` function retrieves the container details for a specific transport and destination.

### Usage
This contract should be deployed by logistics operators to set details of containers for specific transport types and destinations, and packaging materials used.

## Process Production Smart Contract

### Description
The Process Production contract manages and tracks various aspects of the production process, including annual production volume, energy consumption, adhesive usage, paint usage, and compliance with social sustainability indicators.

### Key Components

- **Annual Production Volume**: A constant `annualProductionVolume` stores the annual production volume (in m³).

- **Energy Consumption**:
  - Electrical energy consumption per unit of production (in KWh per m³).
  - Thermal energy consumption per unit of production (in KWh per m³).
  - Methane consumption for producing thermal energy (in standard m³ per m³).

- **Adhesive Usage**:
  - Typology of adhesive used.
  - Quantity of adhesive used (in tons per m³).

- **Paint Usage**: A variable `paintUsage` stores the amount of paint used per unit of production (in l/ m³).

- **Compliance Criteria**: An array `complianceCriteria` stores a list of compliance standards, initialized in the constructor function.
  - Public getter function `getComplianceCriterion` retrieves a specific compliance criterion by its index.

### Usage
This contract should be deployed by process and production operators in the manufacturing company (Bonzano) to manage and update production-related data of the panels and ensure compliance with regulatory standards. Regulatory bodies and auditors can interact with it to verify and audit the production data for compliance and performance evaluation.

## Deployment and Interaction

These contracts are designed to be deployed and interacted with by relevant stakeholders, including manufacturers, wood suppliers, logistics operators, and regulatory bodies. Each contract provides public getter functions to retrieve necessary data and ensure transparency and compliance with established guidelines.

### Example Interactions

- **Forest Management**: Update wood composition and origin, track transport information, and ensure compliance with social sustainability indicators.
- **Logistics**: Set and retrieve packaging material details, manage transport and container details for different destinations.
- **Process Production**: Track production volume, energy consumption, adhesive and paint usage, and compliance with social sustainability indicators.

## Conclusion

These smart contracts provide a robust framework for managing and tracking forest management, logistics, and production processes, ensuring compliance with social sustainability standards and facilitating transparent interactions between stakeholders.
