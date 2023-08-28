import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:marketpedia/app/data/models/products.dart';

// HomeController
class HomeController extends GetxController {
  List<IconData> icon = [
    Icons.laptop_mac,
    Icons.mouse,
    Icons.keyboard,
    Icons.speaker,
    Icons.access_alarm,
  ];

  Future<List<Products>> getProduct() async {
    final Uri url = Uri.parse(
        'https://bs.aossalestrax.co.id/TestProgrammer_Services/api/GetMasterData');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {
          "key": "YhNnM/2K++gp/FMWA+m0Pg==",
          "pmethod": "Get Product",
          "pemail": "JK",
          "pwhere6": "1",
          "pwhere7": "4"
        },
      ),
    );

    print('API Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String dataString = responseData['data'];
      final Map<String, dynamic> data = json.decode(dataString);
      final List<dynamic> productsData = data['Table'] as List<dynamic>;

      final List<Products> products = productsData
          .map((data) => Products.fromJson(data as Map<String, dynamic>))
          .toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
