import 'package:datacollection/datacollection.dart';
import 'package:test/test.dart';

void main() {
  test("PaginationResponse", () {
    var json = {
      "sort": {
        "keys": [
          "name",
          "address",
          "width",
          "created_at",
          "updated_at",
          "deleted_at"
        ],
        "order_by": null,
        "order_type": "asc"
      },
      "current_page": 1,
      "data": [
        {
          "id": 234,
          "name": "tet",
          "note": null,
          "address": "192.168.10.10",
          "type": "network",
          "is_auto": true,
          "is_bill": true,
          "is_beep": true,
          "is_order": false,
          "width": 80,
          "paper": 1,
          "device_id": 0,
          "vendor_id": 0,
          "product_id": 0,
          "store_id": 2814,
          "categories": [],
          "company_id": 2554,
          "deleted_at": null,
          "created_by": 2530,
          "updated_by": 2530,
          "deleted_by": null,
          "created_at": "2022-11-23T04:43:28.000000Z",
          "updated_at": "2022-11-23T04:43:28.000000Z"
        },
        {
          "id": 228,
          "name": "printer 2d",
          "note": null,
          "address": "192.168.1.1",
          "type": "network",
          "is_auto": true,
          "is_bill": false,
          "is_beep": true,
          "is_order": true,
          "width": 80,
          "paper": 1,
          "device_id": null,
          "vendor_id": null,
          "product_id": null,
          "store_id": 2810,
          "categories": [],
          "company_id": 2554,
          "deleted_at": null,
          "created_by": null,
          "updated_by": 2530,
          "deleted_by": null,
          "created_at": "2022-10-15T11:03:55.000000Z",
          "updated_at": "2022-11-23T16:43:01.000000Z"
        },
        {
          "id": 227,
          "name": "printer 1",
          "note": null,
          "address": "192.168.1.1",
          "type": "network",
          "is_auto": true,
          "is_bill": false,
          "is_beep": true,
          "is_order": true,
          "width": 58,
          "paper": null,
          "device_id": null,
          "vendor_id": null,
          "product_id": null,
          "store_id": 2810,
          "categories": [],
          "company_id": 2554,
          "deleted_at": null,
          "created_by": null,
          "updated_by": 1,
          "deleted_by": null,
          "created_at": "2022-10-15T11:03:55.000000Z",
          "updated_at": "2022-10-17T02:50:07.000000Z"
        }
      ],
      "first_page_url": "http://mylekha.io/api/v1.0/client/printers?page=1",
      "from": 1,
      "last_page": 1,
      "last_page_url": "http://mylekha.io/api/v1.0/client/printers?page=1",
      "links": [
        {"url": null, "label": "&laquo; Previous", "active": false},
        {
          "url": "http://mylekha.io/api/v1.0/client/printers?page=1",
          "label": "1",
          "active": true
        },
        {"url": null, "label": "Next &raquo;", "active": false}
      ],
      "next_page_url": null,
      "path": "http://mylekha.io/api/v1.0/client/printers",
      "per_page": "5",
      "prev_page_url": null,
      "to": 3,
      "total": 3
    };

    var result = PaginationResponse<dynamic>.fromJson(json);
    expect(result.sort != null, true);
    if (result.sort != null) {
      expect(result.sort!.keys.length > 0, true);
    }
  });

  test("CollectionResponse", () {
    var json = {
      'data': [
        {
          "id": 234,
          "name": "tet",
          "note": null,
          "address": "192.168.10.10",
          "type": "network",
          "is_auto": true,
          "is_bill": true,
          "is_beep": true,
          "is_order": false,
          "width": 80,
          "paper": 1,
          "device_id": 0,
          "vendor_id": 0,
          "product_id": 0,
          "store_id": 2814,
          "categories": [],
          "company_id": 2554,
          "deleted_at": null,
          "created_by": 2530,
          "updated_by": 2530,
          "deleted_by": null,
          "created_at": "2022-11-23T04:43:28.000000Z",
          "updated_at": "2022-11-23T04:43:28.000000Z"
        },
        {
          "id": 228,
          "name": "printer 2d",
          "note": null,
          "address": "192.168.1.1",
          "type": "network",
          "is_auto": true,
          "is_bill": false,
          "is_beep": true,
          "is_order": true,
          "width": 80,
          "paper": 1,
          "device_id": null,
          "vendor_id": null,
          "product_id": null,
          "store_id": 2810,
          "categories": [],
          "company_id": 2554,
          "deleted_at": null,
          "created_by": null,
          "updated_by": 2530,
          "deleted_by": null,
          "created_at": "2022-10-15T11:03:55.000000Z",
          "updated_at": "2022-11-23T16:43:01.000000Z"
        },
        {
          "id": 227,
          "name": "printer 1",
          "note": null,
          "address": "192.168.1.1",
          "type": "network",
          "is_auto": true,
          "is_bill": false,
          "is_beep": true,
          "is_order": true,
          "width": 58,
          "paper": null,
          "device_id": null,
          "vendor_id": null,
          "product_id": null,
          "store_id": 2810,
          "categories": [],
          "company_id": 2554,
          "deleted_at": null,
          "created_by": null,
          "updated_by": 1,
          "deleted_by": null,
          "created_at": "2022-10-15T11:03:55.000000Z",
          "updated_at": "2022-10-17T02:50:07.000000Z"
        }
      ]
    };

    var result = CollectionResponse<dynamic>.fromJson(json);

    expect(result.data.length > 0, true);
  });

  test("DataResponse", () {
    var json = {
      "data": {
        "id": 234,
        "name": "tet",
        "note": null,
        "address": "192.168.10.10",
        "type": "network",
        "is_auto": true,
        "is_bill": true,
        "is_beep": true,
        "is_order": false,
        "width": 80,
        "paper": 1,
        "device_id": 0,
        "vendor_id": 0,
        "product_id": 0,
        "store_id": 2814,
        "categories": [],
        "company_id": 2554,
        "deleted_at": null,
        "created_by": 2530,
        "updated_by": 2530,
        "deleted_by": null,
        "created_at": "2022-11-23T04:43:28.000000Z",
        "updated_at": "2022-11-23T04:43:28.000000Z",
        "creator_name": "multi store owner",
        "editor_name": "multi store owner",
        "destroyer_name": null,
        "store_name": "Store USA"
      }
    };

    var result = DataResponse.fromJson(json);

    expect(result.data != null, true);
  });
}
