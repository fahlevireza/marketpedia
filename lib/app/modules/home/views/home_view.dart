import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketpedia/app/data/models/products.dart';
import 'package:marketpedia/app/modules/home/controllers/home_controller.dart';
import 'package:marketpedia/app/modules/product_detail/views/product_detail_view.dart';
import 'package:marketpedia/app/shared/constant_color.dart';
import 'package:marketpedia/app/shared/constant_images.dart';
import 'package:marketpedia/app/modules/home/components/carousel_image.dart';

class HomeView extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          title: Text(
            'Marketpedia',
            style: TextStyle(
              fontSize: 18,
              color: kWhiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.sizeOf(context).width,
            height: 900,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CarouselImages(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Categories',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View more',
                        style: TextStyle(fontSize: 16, color: kRedColor),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 80,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: _controller.icon.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          left: 5,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                        width: 70,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: kGreyColor.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(1, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            _controller.icon[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Products',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View more',
                        style: TextStyle(fontSize: 16, color: kRedColor),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    child: FutureBuilder<List<Products>?>(
                      future: _controller.getProduct(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (snapshot.data == null) {
                          return Center(child: Text('No data available'));
                        } else {
                          final products = snapshot.data!;
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() =>
                                      ProductDetailView(product: product));
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 7,
                                    horizontal: 5,
                                  ),
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: kGreyColor.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(1, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: kGreyColor,
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    kGreyColor.withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 3,
                                                offset: Offset(1, 2),
                                              ),
                                            ],
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                product.productPhoto!,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            top: 20,
                                            bottom: 20,
                                            right: 20,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    product.productName!,
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                  Icon(
                                                    Icons.favorite,
                                                    color: kBlackColor,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Text(product.productValue!),
                                              SizedBox(height: 5),
                                              Container(
                                                width: 70,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      ConstantImages
                                                          .imageStarReview,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
