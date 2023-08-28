import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketpedia/app/data/models/products.dart';
import 'package:marketpedia/app/modules/cart/views/cart_view.dart';
import 'package:marketpedia/app/modules/main/views/main_view.dart';
import 'package:marketpedia/app/modules/product_detail/controllers/product_detail_controller.dart';
import 'package:marketpedia/app/shared/constant_color.dart';

class ProductDetailView extends StatelessWidget {
  final ProductDetailController _controller =
      Get.put(ProductDetailController());

  final Products? product;

  ProductDetailView({
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          title: Text(
            product!.productName!,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: kBlackColor,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Get.offAll(
                () => MainView(),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: kBlackColor,
            ),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(product!.productPhoto!),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                  bottom: 80,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product!.productName!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kBlackColor,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: kWhiteColor,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    '4.5',
                                    style: TextStyle(
                                      color: kWhiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      product!.productValue!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        product!.productDescription!,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Size',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.sizeOf(context).width,
                      height: 40,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _controller.sizeList.length,
                        itemBuilder: (context, index) {
                          String size = _controller.sizeList[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                              backgroundColor: kGreyColor,
                              child: Text(
                                size,
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 70,
                    decoration: BoxDecoration(
                      color: kGreyColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: kWhiteColor,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => CartView());
                  },
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 18,
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
