# Purchase Order Viewer

SAP BTP CAP (Node.js) application with Fiori Elements List Report to search and display Purchase Orders.

## Features

- **Selection screen** filters: PO Number, Vendor, Status, Document Date, Purchasing Org.
- **List Report** showing all matching POs
- **Object Page** with PO header details and line items
- OData V4 service (`/odata/v4/po`)

## Local Development

```sh
# Install dependencies
npm install

# Start development server (auto-reloads on file changes)
node_modules\.bin\cds.cmd watch
```

Open **http://localhost:4004** and click **Fiori Preview** next to `PurchaseOrders`.

> Direct preview URL: `http://localhost:4004/$fiori-preview/POService/PurchaseOrders#preview-app`

## Project Structure

```
├── db/
│   ├── schema.cds            CDS data model (PurchaseOrders, PurchaseOrderItems)
│   └── data/                 Sample CSV data for local dev
├── srv/
│   ├── po-service.cds        OData V4 service definition
│   └── po-service-fiori.cds  Fiori/UI5 annotations (filters, columns, facets)
└── app/
    └── po-app/webapp/        Fiori Elements app (manifest, Component, i18n)
```

## Deployment to SAP BTP (Cloud Foundry)

```sh
# 1. Build MTA archive
mbt build -t gen/mta-archives

# 2. Target org & space
cf8 target -o org_pocus -s POC

# 3. Deploy (requires explicit approval)
cf8 deploy gen/mta-archives/my-btp-app_sam_1.0.0.mtar
```
