import 'package:get/get.dart';

import '../modules/cart/views/cart_view.dart';
import '../modules/favorite/views/favorite_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/views/main_view.dart';
import '../modules/product_detail/views/product_detail_view.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () => ProductDetailView(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
    ),
  ];
}
