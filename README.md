# Blockchain in preserving Historical Documents
کاربرد بلاکچین در حفظ اسناد تاریخی: یک راهکار امن و قابل اعتماد
بر اساس مزایایی که بلاکچین برای حفظ اسناد تاریخی دارد، استفاده از این فناوری به عنوان یک راهکار امن و قابل اعتماد برای حفظ اسناد تاریخی می‌تواند به شدت مفید باشد. با استفاده از بلاکچین، می‌توان اسناد تاریخی را به صورت دائمی، بدون امکان تغییر و با اطمینان از اصالت آن‌ها ذخیره کرد. همچنین، استفاده از بلاکچین می‌تواند هزینه‌های حفظ اسناد را کاهش داده و فرآیند بازیابی اسناد را تسهیل کند.
## بلاکچین به عنوان یک فناوری نوظهور مزایای زیادی در حفظ اسناد تاریخی و نگهداری آثار ارزشمند خواهد داشت. در زیر به برخی از این مزایا اشاره می‌کنم:

* مزایای استفاده از بلاکچین در حفظ اسناد تاریخی
* افزایش امنیت اسناد و جلوگیری از تغییرات غیرمجاز
* ایجاد شفافیت و قابلیت ردیابی در تاریخچه اسناد
* کاهش هزینه‌های نگهداری و حفظ اسناد
* افزایش سرعت و کارایی در فرآیند تأیید و احراز اسناد
* افزایش قابلیت دسترسی و بهره‌وری از اسناد
* کاهش احتمال از دست رفتن و یا آسیب دیدن اسناد
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
