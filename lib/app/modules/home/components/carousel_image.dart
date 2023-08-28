import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marketpedia/app/shared/constant_images.dart';

class CarouselImages extends StatelessWidget {
  final double? height;

  CarouselImages({
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      child: CarouselSlider(
        options: CarouselOptions(
          height: height,
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          viewportFraction: 1,
        ),
        items: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  ConstantImages.imageCarousel1,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  ConstantImages.imageCarousel2,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  ConstantImages.imageCarousel3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
