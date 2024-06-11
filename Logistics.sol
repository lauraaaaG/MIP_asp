// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Logistics {

    uint256 public constant annualSalesVolume = 21000; // Volume di pannelli venduti per anno in m^3
 
    // Strutture per il packaging
    struct Packaging {
        string typology;
        uint256 quantity; //kg
        uint256 riciclability_percentage;
    }
 
    // Dizionario di packaging
    mapping(string => Packaging) public packaging;
 
    // Strutture per i mezzi di trasporto
    struct Transport {
        string typology;
        string fuel;
        uint256 capacity;
        mapping(string => ContainerDetail) details;
    }
 
    struct ContainerDetail {
        uint256 numberofContainers; //units
        uint256 distance; // in km
    }
 
    // Dizionario di mezzi di trasporto
    mapping(string => Transport) public transports;
 
    constructor() {
        // Inizializzazione dei packaging
        packaging["materiale 1"] = Packaging("Polyester", 17000, 100);
        packaging["materiale 2"] = Packaging("Polypropilen", 15000, 100);
        packaging["materiale 3"] = Packaging("Wood", 700, 100);
 
        // Inizializzazione dei mezzi di trasporto
        transports["wheel"].typology = "Truck";
        transports["wheel"].fuel = "Diesel";
        transports["wheel"].capacity = 24;
        setContainerDetails("wheel", "China", 235, 119);
        setContainerDetails("wheel", "France", 18, 82);
        setContainerDetails("wheel", "UK", 178, 136);
        setContainerDetails("wheel", "Other", 104, 628);
 
        transports["train"].typology = "Rail";
        transports["train"].fuel = "Diesel";
        transports["train"].capacity = 24;
        setContainerDetails("train", "France", 18, 813);
        setContainerDetails("train", "UK", 178, 1087);
 
        transports["container boat"].typology = "Ship";
        transports["container boat"].fuel = "HFO";
        transports["container boat"].capacity = 24;
        setContainerDetails("container boat", "China", 235, 9186);
        setContainerDetails("container boat", "UK", 178, 221);
    }
 
    function setContainerDetails(string memory transport, string memory country, uint256 containers, uint256 distance) internal {
        transports[transport].details[country] = ContainerDetail(containers, distance);
    }
 
    function getContainerDetails(string memory transport, string memory country) public view returns (ContainerDetail memory) {
        return transports[transport].details[country];
    }

    }