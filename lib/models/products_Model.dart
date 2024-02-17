class PaginatedProducts {
  late List<ProductModel> products;
  int? currentPage;
  int? lastPage;
  int? total;
  String? nextPageUrl;
  String? prevPageUrl;

  PaginatedProducts({
    required this.products,
    this.currentPage,
    this.lastPage,
    this.total,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  PaginatedProducts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      products = <ProductModel>[];
      json['data'].forEach((v) {
        products.add(ProductModel.fromJson(v));
      });
    }
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    total = json['total'];
    nextPageUrl = json['next_page_url'];
    prevPageUrl = json['prev_page_url'];
  }
}

class ProductModel {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? description;
  int? quantity;
  String? categoryId;
  int? supplierId;
  int? price;
  int?
      pPrice; // Assuming p_price is an integer and represents a promotional or previous price
  List<dynamic>? images; // Assuming images is a list of image URLs or objects

  ProductModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.quantity,
    this.categoryId,
    this.supplierId,
    this.price,
    this.pPrice,
    this.images,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = DateTime.tryParse(json['created_at']);
    updatedAt = DateTime.tryParse(json['updated_at']);
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    categoryId = json['category_id'];
    supplierId = json['supplier_id'];
    price = json['price'];
    pPrice = json['p_price'];
    images = json[
        'images']; // Directly assigning the list, assuming it doesn't require further processing
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "created_at": createdAt?.toIso8601String(),
      "updated_at": updatedAt?.toIso8601String(),
      "name": name,
      "description": description,
      "quantity": quantity,
      "category_id": categoryId,
      "supplier_id": supplierId,
      "price": price,
      "p_price": pPrice,
      "images": images, // Direct serialization of the list
    };
  }
}
