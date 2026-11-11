using { com.po as db } from '../db/schema';

service POService @(path: '/odata/v4/po') {

    @readonly
    entity PurchaseOrders as projection on db.PurchaseOrders {
        *,
        Items
    };

    @readonly
    entity PurchaseOrderItems as projection on db.PurchaseOrderItems;
}
