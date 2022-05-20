class CurrencyModel {
    CurrencyModel({
        this.data,
        this.meta,
    });

    List<Datum>? data;
    Meta? meta;

    factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );
}

class Datum {
    Datum({
        this.id,
        this.attributes,
    });

    int? id;
    Attributes? attributes;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
    );
}

class Attributes {
    Attributes({
        this.name,
        this.code,
        this.price,
        this.createdAt,
        this.updatedAt,
        this.publishedAt,
    });

    String? name;
    String? code;
    String? price;
    DateTime? createdAt;
    DateTime? updatedAt;
    DateTime? publishedAt;

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        code: json["code"],
        price: json["price"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
    );
}

class Meta {
    Meta({
        this.pagination,
    });

    Pagination? pagination;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
    );

}

class Pagination {
    Pagination({
        this.page,
        this.pageSize,
        this.pageCount,
        this.total,
    });

    int? page;
    int? pageSize;
    int? pageCount;
    int? total;

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
    );

}
