// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Process_Production {

    // Annual production volume
    uint256 public annualProductionVolume; // in cubic meters per year

    //Energy consumption struct
    struct Energy_consumption {
        uint256 electricalEnergy;// in KWh per cubic meter
        uint256 thermalEnergyfromBiomasses;// in tep per cubic meter
        uint256 methaneProducedThermalEnergy;// in Standard cubic meters per cubic meter
    }

    Energy_consumption public consumEnergy;
 
    // Glue struct
    struct Adhesive {
        string typology;
        uint256 quantity;// in tons per year
    }
    
    Adhesive public glue;
 
    // Paint
    uint256 public paintUsage; // in liters per cubic meter
 
    // List of compliance criteria
    string[] public complianceCriteria;
 
    constructor() {
        // Initialization of variables

        annualProductionVolume = 21000; // in cubic meters per year

        consumEnergy = Energy_consumption({
            electricalEnergy: 200,
            thermalEnergyfromBiomasses: 40, // 0.04 scaled by 1000
            methaneProducedThermalEnergy: 65
        });

        glue = Adhesive({
            typology: "pMDI",
            quantity: 2400
        });

        paintUsage = 0; // in liters per cubic meter (assumed)

        complianceCriteria.push("Employees have the right to freely form associations, select representatives, and engage in collective bargaining with their employer.");
        complianceCriteria.push("There is no forced labor.");
        complianceCriteria.push("Child labor is prohibited, ensuring that workers under the legal minimum age-usually 15 or the age of compulsory school attendance, whichever is higher- are not employed.");
        complianceCriteria.push("There is no discrimination in employment opportunities or treatment.");
        complianceCriteria.push("Working conditions do not pose risks to safety or health.");
        complianceCriteria.push("There is equal remuneration on diverse groups, regular payment, length and seasonality of work and minimum wages.");
        complianceCriteria.push("Job creation, support to local suppliers and local community education programmes are promoted.");
        complianceCriteria.push("Benefits like support for basic commodities and workforce facilities are guaranteed.");
        complianceCriteria.push("The company strives to ensure that its suppliers and the entities it interacts with comply with current regulations.");
        complianceCriteria.push("Employees maximum working hours, adequate period of rest, holidays, sick, maternity and family leave are respected.");
    }
 
    // Functions to get all the data
    function getAnnualProductionVolume() public view returns (uint256) {
        return annualProductionVolume;
    }

    function getElectricalEnergy() public view returns (uint256) {
        return consumEnergy.electricalEnergy;
    }

    function getThermalEnergyfromBiomasses() public view returns (uint256) {
        return consumEnergy.thermalEnergyfromBiomasses;
    }

    function getScaledThermalEnergyfromBiomasses() public view returns (string memory) {
        uint256 scaledValue = consumEnergy.thermalEnergyfromBiomasses;
        uint256 integerPart = scaledValue / 1000;
        uint256 fractionalPart = scaledValue % 1000;
        return string(abi.encodePacked(uint2str(integerPart), ".", uint2str(fractionalPart)));
    }

    // Helper function to convert uint to string
    function uint2str(uint256 _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }

    function getMethaneProducedThermalEnergy() public view returns (uint256) {
        return consumEnergy.methaneProducedThermalEnergy;
    }

    function getAdhesiveTypology() public view returns (string memory) {
        return glue.typology;
    }

    function getAdhesiveQuantity() public view returns (uint256) {
        return glue.quantity;
    }

    function getPaintUsage() public view returns (uint256) {
        return paintUsage;
    }

    function getComplianceCriterion(uint index) public view returns (string memory) {
        require(index < complianceCriteria.length, "Index out of bounds");
        return complianceCriteria[index];
    }
}
