// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      no: json['no'] as int?,
      productId: json['productId'] as String?,
      productName: json['productName'] as String?,
      productDescription: json['productDescription'] as String?,
      productValue: json['productValue'] as String?,
      productType: json['productType'] as String?,
      productPhoto: json['productPhoto'] as String?,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'no': instance.no,
      'productId': instance.productId,
      'productName': instance.productName,
      'productDescription': instance.productDescription,
      'productValue': instance.productValue,
      'productType': instance.productType,
      'productPhoto': instance.productPhoto,
    };
