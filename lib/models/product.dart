class Product {
  final String productName;
  final String productImage;
  final double productPrice;
  String? storeFarDestination;
  String? productStatus;

  Product({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    this.productStatus,
    this.storeFarDestination,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    final productName = json['product_name'] as String;
    final productImage = json['product_image'] as String;
    final productPrice = json['product_price'] as double;
    final storeFarDestination = json['store_far_destination'] as String?;
    final productStatus = json['product_status'] as String?;

    return Product(
      productName: productName,
      productImage: productImage,
      productPrice: productPrice,
      productStatus: productStatus,
      storeFarDestination: storeFarDestination,
    );
  }
}
