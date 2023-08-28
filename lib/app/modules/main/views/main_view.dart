import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketpedia/app/modules/cart/views/cart_view.dart';
import 'package:marketpedia/app/modules/favorite/views/favorite_view.dart';
import 'package:marketpedia/app/modules/home/views/home_view.dart';
import 'package:marketpedia/app/modules/main/controllers/main_controller.dart';
import 'package:marketpedia/app/modules/profile/views/profile_view.dart';
import 'package:marketpedia/app/shared/constant_color.dart';

class MainView extends StatelessWidget {
  final MainController _controller = Get.put(MainController());

  final tabs = [
    HomeView(),
    CartView(),
    FavoriteView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => tabs[_controller.currentIndex.value],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            onTap: (index) {
              _controller.updateIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: _controller.currentIndex.value,
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: kPrimaryColor,
                ),
                icon: Icon(
                  Icons.home,
                  color: kGreyColor,
                ),
                label: 'Home',
                backgroundColor: kWhiteColor,
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.assignment_sharp,
                  color: kPrimaryColor,
                ),
                icon: Icon(
                  Icons.assignment_sharp,
                  color: kGreyColor,
                ),
                label: 'Pesanan',
                backgroundColor: kWhiteColor,
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.bookmark,
                  color: kPrimaryColor,
                ),
                icon: Icon(
                  Icons.bookmark,
                  color: kGreyColor,
                ),
                label: 'Favorit',
                backgroundColor: kWhiteColor,
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.people,
                  color: kPrimaryColor,
                ),
                icon: Icon(
                  Icons.people,
                  color: kGreyColor,
                ),
                label: 'Profil',
                backgroundColor: kWhiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
