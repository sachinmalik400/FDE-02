namespace com.po;

using { cuid, managed } from '@sap/cds/common';

entity PurchaseOrders : managed {
    key PoNumber       : String(10);
        Vendor         : String(10);
        VendorName     : String(80);
        DocumentDate   : Date;
        PostingDate    : Date;
        PurchasingOrg  : String(4);
        PurchasingGrp  : String(3);
        Currency       : String(5);
        Status         : String(1) enum {
            Open      = 'O';
            Partial   = 'P';
            Closed    = 'C';
        };
        StatusText     : String(10);
        NetAmount      : Decimal(13,2);
        Items          : Composition of many PurchaseOrderItems on Items.PoNumber = $self;
}

entity PurchaseOrderItems : managed {
    key PoNumber       : Association to PurchaseOrders;
    key ItemNumber     : String(5);
        Material       : String(18);
        MaterialDesc   : String(40);
        Quantity       : Decimal(13,3);
        Unit           : String(3);
        NetPrice       : Decimal(13,2);
        Currency       : String(5);
        Plant          : String(4);
        DeliveryDate   : Date;
        GRQuantity     : Decimal(13,3);
        IRQuantity     : Decimal(13,3);
}
