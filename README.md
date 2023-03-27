# blockchain-in-preserving-historical-documents
کاربرد بلاکچین در حفظ اسناد تاریخی: یک راهکار امن و قابل اعتماد
```solidity
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
```
در این کد، یک قرارداد هوشمند با نام DocumentStorage تعریف شده است که مجوز آن تنها برای صاحب قرارداد (owner) اعطا شده است. برای هر سند، یک ساختار داده‌ای به نام Document تعریف شده است که شامل شناسه (id)، عنوان (title)، محتوا (content) و زمان ایجاد (timestamp) سند است. این سند در یک نگاشت (mapping) به شناسه خود نگهداری می‌شود.

با فراخوانی تابع addDocument توسط صاحب قرارداد، یک سند جدید با عنوان و محتوای داده شده به لیست اسناد اضافه می‌شود. همچنین، یک رویداد با اطلاعات شناسه، عنوان و زمان ایجاد سند، برای کاربران دیگر قابل مشاهده است.
