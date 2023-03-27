pragma solidity ^0.8.7;

contract DocumentStorage {
    address public owner;
    uint public documentCount = 0;

    struct Document {
        uint id;
        string title;
        string content;
        uint timestamp;
    }

    mapping(uint => Document) public documents;

    event DocumentAdded(
        uint id,
        string title,
        uint timestamp
    );

    constructor() {
        owner = msg.sender;
    }

    function addDocument(string memory _title, string memory _content) public {
        require(msg.sender == owner, "Only owner can add documents");

        documentCount++;
        documents[documentCount] = Document(documentCount, _title, _content, block.timestamp);

        emit DocumentAdded(documentCount, _title, block.timestamp);
    }
}
