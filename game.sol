pragma solidity ^0.8.19+;

contract AngelBase {

    event NewAngel(uint angelId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulas = 10 ** dnaDigits;

    struct Angel {
        string name;
        uint dna;
    }

    Angel[] public angels;

    function _createAngel(string memory _name, uint _dna) private {
       uint randAngelId = angels.push(Angel(_name, _dna)) - 1;
        emit NewAngel(randAngelId, _name, _dna);
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulas;
    }

    function createRandomAngel(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createAngel(_name, randDna);
    }
}