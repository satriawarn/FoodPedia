import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: CachedNetworkImage(
                        // TODO 1
                        imageUrl:
                            'https://edamam-product-images.s3.amazonaws.com/web-img/e42/e42f9119813e890af34c259785ae1cfb.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEN7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIEIr21tXrJ7PBN5bM52eVWDxr%2FOPUFvmNfGk%2BBQxBkHwAiEAyZK55mGXex%2B60FOg6O5dSAO0StmoRUTmoWUTCv9zTwQq0gQIJxAAGgwxODcwMTcxNTA5ODYiDNIy%2B38sFWdoXnbnlyqvBG0nppY89eRJC1IJSe2O2Ep30V2qxZt5tLVf3U%2BsjS02YRMSp%2FNKYwIFuRu3fkI7KBFAjjZ%2F3B8EkjGVnXvTVWMPxo45VNd%2Bf7g4A0P8C%2Bx8JFqc5OTKNrJ2YkVdwlBVDRLt3FP1j5vaTT76OXKkonrZhi8epG0N99r4GXP1cwPK5M%2FMoBhF8B1X1G5%2FTgOHGBS8PB5nJrbJ5iw3Jvkspw2311ru1pAh74u4SPxkohWBHmK28qtQqbO6uTltTILbQRQWGTAdZRuQSyICsk%2Fl%2BMpb%2FzAgR0PMqd%2BuZJztmK%2FpgIWorEru%2Blq7%2B0s23Xn%2BEpkAaZYMVL7nJ98GBVXjGiz2Wx3%2BldxXA3I7pd6bNCWulJYBLHo3Cg9SUCvRMOKrE2XFvXLXHJH8boxwL6mQtEs7LyHRHC7MMeSa2fbYPAx1FBbC16RKXBWYOFnQSYP2CgWeWkjbEpRJpATqglw5esfAFHqpKsSFVu1kQOBxyZ4u5Qfv%2FYv3yGdjgbZzFwIhsaYzfHvGawxmUGALx8SoZKfW%2BvEeqPpRDDQ6phr%2F%2FIM3iEct8V7R9VjxNINRM9feNvNzJQqbYY%2BO9%2Fe5Y1Pj0YtFnfw0gNkdd78C%2FylaFoHJ1DYVQoXMlul0HJJAg%2BCV%2FoaHsQ5ShuTzoSrKvbqvf7l%2B3wdxmea8hC1DMWpfoo%2BcYNg15wY078y%2BigBLv8YyCsH0s62wwBX5OpXOvGretWSNS8NcrafkmbsjlrHGJf4wqLLelgY6qQHjQNyViZ1WcYxFDheyI6GP712aMTSwpy1q%2B6%2Fxn9aAWhS9aT3RVZ6w7935PxD80jlDOymElkh4PfwT67MFYnBULgzQ1PLr30dqTdi8F4SYxQze7rE9Mzd2CqvtOfkhXgHDCHw3Pi%2FlmvfuUwNI04obc6fZv4Blz2IumhRitg2conGdYM0H65dcp3IHFbncESnlTA7aa%2FPrHV0NgZ0cM0y%2FiMxIKkDt7PMa&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20220720T072426Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFGZLAIIVW%2F20220720%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=e4f666b04a75bcd0f95d1914b585c495d27ee2956f0786bffe1eb66409a7df0a',
                        alignment: Alignment.topLeft,
                        fit: BoxFit.fill,
                        width: size.width,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: shim),
                        child: const BackButton(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    // TODO 2
                    'Chicken Vesuvio',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Chip(
                      // TODO 3
                      label: Text('16CAL'),
                    )),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)),
                    ),
                    onPressed: () {
                      // TODO 4
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                      'assets/images/icon_bookmark.svg',
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Bookmark',
                      style: TextStyle(color: Colors.white),
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
