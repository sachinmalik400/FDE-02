using POService from './po-service';

// ── List Report annotations ─────────────────────────────────────────────────

annotate POService.PurchaseOrders with @(

    UI.SelectionFields: [
        PoNumber,
        Vendor,
        Status,
        DocumentDate,
        PurchasingOrg
    ],

    UI.LineItem: [
        { $Type: 'UI.DataField', Value: PoNumber,      Label: 'PO Number'     },
        { $Type: 'UI.DataField', Value: Vendor,        Label: 'Vendor'        },
        { $Type: 'UI.DataField', Value: VendorName,    Label: 'Vendor Name'   },
        { $Type: 'UI.DataField', Value: DocumentDate,  Label: 'Doc Date'      },
        { $Type: 'UI.DataField', Value: PurchasingOrg, Label: 'Purch. Org'    },
        { $Type: 'UI.DataField', Value: Currency,      Label: 'Currency'      },
        { $Type: 'UI.DataField', Value: NetAmount,     Label: 'Net Amount'    },
        { $Type: 'UI.DataField', Value: Status,        Label: 'Status'        }
    ],

    UI.HeaderInfo: {
        TypeName      : 'Purchase Order',
        TypeNamePlural: 'Purchase Orders',
        Title         : { Value: PoNumber },
        Description   : { Value: VendorName }
    },

    // Object page header
    UI.FieldGroup #GeneralInfo: {
        $Type : 'UI.FieldGroupType',
        Label : 'General Information',
        Data  : [
            { $Type: 'UI.DataField', Value: PoNumber      },
            { $Type: 'UI.DataField', Value: Vendor        },
            { $Type: 'UI.DataField', Value: VendorName    },
            { $Type: 'UI.DataField', Value: DocumentDate  },
            { $Type: 'UI.DataField', Value: PostingDate   },
            { $Type: 'UI.DataField', Value: PurchasingOrg },
            { $Type: 'UI.DataField', Value: PurchasingGrp },
            { $Type: 'UI.DataField', Value: Currency      },
            { $Type: 'UI.DataField', Value: NetAmount     },
            { $Type: 'UI.DataField', Value: StatusText    }
        ]
    },

    UI.Facets: [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneralInfo'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'PO Items',
            Target: 'Items/@UI.LineItem'
        }
    ]
);

// ── PO field labels ──────────────────────────────────────────────────────────

annotate POService.PurchaseOrders with {
    PoNumber      @title: 'Purchase Order';
    Vendor        @title: 'Vendor';
    VendorName    @title: 'Vendor Name';
    DocumentDate  @title: 'Document Date';
    PostingDate   @title: 'Posting Date';
    PurchasingOrg @title: 'Purchasing Org.';
    PurchasingGrp @title: 'Purchasing Group';
    Currency      @title: 'Currency';
    NetAmount     @title: 'Net Amount'  @Measures.ISOCurrency: Currency;
    Status        @title: 'Status';
    StatusText    @title: 'Status Text';
};

// ── PO Items line item ───────────────────────────────────────────────────────

annotate POService.PurchaseOrderItems with @(
    UI.LineItem: [
        { $Type: 'UI.DataField', Value: ItemNumber,  Label: 'Item'          },
        { $Type: 'UI.DataField', Value: Material,    Label: 'Material'      },
        { $Type: 'UI.DataField', Value: MaterialDesc,Label: 'Description'   },
        { $Type: 'UI.DataField', Value: Quantity,    Label: 'Quantity'      },
        { $Type: 'UI.DataField', Value: Unit,        Label: 'UoM'           },
        { $Type: 'UI.DataField', Value: NetPrice,    Label: 'Net Price'     },
        { $Type: 'UI.DataField', Value: DeliveryDate,Label: 'Delivery Date' },
        { $Type: 'UI.DataField', Value: GRQuantity,  Label: 'GR Qty'        },
        { $Type: 'UI.DataField', Value: IRQuantity,  Label: 'IR Qty'        }
    ]
);
