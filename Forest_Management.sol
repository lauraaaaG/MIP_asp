// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Forest_Management {

  mapping(string => uint256) public woodMix;
  string[] public complianceCriteria;

      constructor() {
        // Inizializzazione del dizionario woodMix
        woodMix["poplar"] = 75;
        woodMix["fir tree"] = 25;
        woodMix["other"] = 0;

        // Inizializzazione della lista dei criteri rispettati
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
    }

      // Funzione per ottenere la percentuale di un tipo di legno specifico
    function getWoodPercentage(string memory woodType) public view returns (uint256) {
        return woodMix[woodType];
    }

    // Funzione per ottenere un criterio di compliance specifico
    function getComplianceCriterion(uint index) public view returns (string memory) {
        require(index < complianceCriteria.length, "Index out of bounds");
        return complianceCriteria[index];
    }

}
