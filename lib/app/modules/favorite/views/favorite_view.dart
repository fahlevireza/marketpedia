import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Center(
          child: Text(
            'Belum ada data',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
