// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Forest_Management {

  mapping(string => uint256) public woodMix;
  string[] public complianceCriteria;

  // Weekly poplar supply
  uint256 public weeklyPoplarSupply = 2500; // in tons

  // Percentage of wood from different countries
  mapping(string => uint256) public woodSourcePercentage;

   // Transport details
  struct Transport {
      string transportType;
      string fuelType;
      uint256 capacity;
    }

  Transport public transportInfo = Transport("truck", "diesel", 24);

    // NUTS codes
  string[] public NUTSCodes;

      constructor() {
        // Initialization of woodMix
        woodMix["poplar"] = 75;
        woodMix["fir tree"] = 25;
        woodMix["other"] = 0;

        // Initialization of compliance criteria
        complianceCriteria.push("Employees have the right to freely form associations, select representatives, and engage in collective bargaining with their employer.");
        complianceCriteria.push("There is no forced labor.");
        complianceCriteria.push("Child labor is prohibited, ensuring that workers under the legal minimum age are not employed.");
        complianceCriteria.push("There is no discrimination in employment opportunities or treatment.");
        complianceCriteria.push("Working conditions do not pose risks to safety or health.");
        complianceCriteria.push("There is equal remuneration on diverse groups, regular payment, length and seasonality of work and minimum wages.");
        complianceCriteria.push("Job creation, support to local suppliers and local community education programmes are promoted.");
        complianceCriteria.push("Benefits like support for basic commodities and workforce facilities are guaranteed.");
        complianceCriteria.push("The company strives to ensure that its suppliers and the entities it interacts with comply with current regulations.");
        complianceCriteria.push("Employees maximum working hours, adequate period of rest, holidays, sick, maternity and family leave are respected.");

      // Initialization of woodSourcePercentage
        woodSourcePercentage["Italy"] = 75;
        woodSourcePercentage["Hungary"] = 10;
        woodSourcePercentage["France"] = 15;

        // Initialization of NUTS codes
        NUTSCodes.push("ITC16");
        NUTSCodes.push("ITC18");
        NUTSCodes.push("ITC48");
        NUTSCodes.push("ITC4A");
        NUTSCodes.push("ITC4B");
        NUTSCodes.push("FRK21");
        NUTSCodes.push("HU120");
        NUTSCodes.push("HU322");
        NUTSCodes.push("HU332");
        NUTSCodes.push("HU331");
        NUTSCodes.push("HU321");
    }

      // Function to get the % of the wood species
    function getWoodPercentage(string memory woodType) public view returns (uint256) {
        return woodMix[woodType];
    }

    // Function to get a compliance criterion
    function getComplianceCriterion(uint index) public view returns (string memory) {
        require(index < complianceCriteria.length, "Index out of bounds");
        return complianceCriteria[index];
    }

    // Function to get the percentage of wood from a specific country
    function getWoodSourcePercentage(string memory country) public view returns (uint256) {
        return woodSourcePercentage[country];
    }

    // Function to get the transport information
    function getTransportInfo() public view returns (string memory, string memory, uint256) {
        return (transportInfo.transportType, transportInfo.fuelType, transportInfo.capacity);
    }

    // Function to get all NUTS codes
    function getNUTSCodes() public view returns (string[] memory) {
        return NUTSCodes;
    }
}