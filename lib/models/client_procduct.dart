import 'dart:convert';

import 'package:flutter/services.dart';

class ClientProduct {
  final String productName;
  final String productLabel;
  final String productsector;

  final String productImage;
  final double productPrice;
  final int inStock;
  final String storeFarDestination;
  final String storeName;
  bool? storeStatus;
  String? storeLocation;
  String? storeImage;
  String? storeDescription;

  ClientProduct({
    required this.productName,
    required this.productLabel,
    required this.productsector,
    required this.productImage,
    required this.productPrice,
    required this.inStock,
    this.storeStatus,
    required this.storeFarDestination,
    required this.storeName,
    required this.storeLocation,
    this.storeImage,
    this.storeDescription,
  });

  factory ClientProduct.fromJson(Map<String, dynamic> json) {
    final productName = json['product_name'] as String;
    final productLabel = json['product_label'] as String;
    final productsector = json['product_sector'] as String;
    final productImage = json['product_image'] as String;
    final productPrice = json['product_price'] as double;
    final inStock = json['in_stock'] as int;
    final storeFarDestination = json['store_far_destination'] as String;
    final storeStatus = json['store_status'] as bool?;
    final storeName = json['store_name'] as String;
    final storeLocation = json['store_Location'] as String?;
    final storeImage = json['store_image'] as String?;
    final storeDescription = json['store_description'] as String?;

    return ClientProduct(
      productName: productName,
      productLabel: productLabel,
      productsector: productsector,
      productImage: productImage,
      productPrice: productPrice,
      inStock: inStock,
      storeStatus: storeStatus,
      storeFarDestination: storeFarDestination,
      storeName: storeName,
      storeLocation: storeLocation,
      storeImage: storeImage,
      storeDescription: storeDescription,
    );
  }
  // Map<String, dynamic> toJson() => {
  //       'product_name': productName,
  //       'product_image': productImage,
  //       'product_label': productImage,
  //       'product_Price': productPrice,
  //       'store_far_destination': storeFarDestination,
  //       'product_status': productStatus,
  //     };

  // @override
  // String toString() {
  //   return 'product(product_Name: $productName,product_image: $productImage,product_Price: $productPrice,store_far_destination: $storeFarDestination,product_status: $productStatus)';
  // }
}
