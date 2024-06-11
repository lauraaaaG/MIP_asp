// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Process_Production {

    // Variabili fisse per la produzione annuale e l'energia per unità di prodotto
    uint256 public constant annualProductionVolume = 21000; // in cubic meters per year

    //Dizionario per energia
    struct Energy_consumption {
        uint256 electricalEnergyPerUnit;// in KWh per cubic meter
        uint256 thermalEnergyPerUnit;// in KWh per cubic meter (converted from tep)
        uint256 methaneProducedThermalEnergy;// in Standard cubic meters per cubic meter
    }

    Energy_consumption public consum_energy = Energy_consumption(200, 40, 65);
 
    // Dizionario per gli adesivi usati
    struct Adhesive {
        string typology;
        uint256 quantity;// in tons per cubic meter
    }
    
    Adhesive public glue = Adhesive("pMDI", 2400); 
 
    // Quantità di vernici utilizzate
    uint256 public paintUsage = 0; // in liters per cubic meter (assumed)
 
    // Lista dei criteri rispettati
    string[] public complianceCriteria;
 
    constructor() {
        // Inizializzazione dei criteri rispettati
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
 
    // Funzione per ottenere un criterio di compliance specifico
    function getComplianceCriterion(uint index) public view returns (string memory) {
        require(index < complianceCriteria.length, "Index out of bounds");
        return complianceCriteria[index];
    }
}