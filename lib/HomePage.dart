import 'dart:async';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app_flutter/Product_modal.dart';
import 'package:e_commerce_app_flutter/all_Product.dart';
import 'package:e_commerce_app_flutter/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool a = false;
  bool b = true;
  bool c = true;
  bool d = true;
  bool e = true;
  int l = 0;

  @override
  void initState() {
    l = 0;
    Timer.periodic(Duration(seconds: 3), (Timer l) {
      return get();
    });
  }

  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverSafeArea(
              top: false,
              sliver: SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                centerTitle: true,
                title: Text(
                  "E-mart app",
                  style: GoogleFonts.brawler(fontSize: 30),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.light_mode,
                    ),
                    onPressed: () {
                      (Get.isDarkMode)
                          ? Get.changeThemeMode(ThemeMode.light)
                          : Get.changeThemeMode(ThemeMode.dark);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart_checkout,
                    ),
                    onPressed: () {
                      Get.toNamed('/cart_page');
                    },
                  ),
                ],
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 0,
                  ),
                ),
              ),
            ),
          )
        ],
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: IndexedStack(
                  index: l,
                  children: [
                    Center(
                      child: Image.network(
                        "https://static.toiimg.com/photo/msid-90907309/90907309.jpg",
                      ),
                    ),
                    Center(
                      child: Image.network(
                        "https://cdn.thewirecutter.com/wp-content/media/2022/07/laptop-under-500-2048px-acer-1.jpg",
                      ),
                    ),
                    Center(
                      child: Image.network(
                        "https://m.media-amazon.com/images/I/71vFKBpKakL._SX522_.jpg",
                      ),
                    ),
                    Center(
                      child: Image.network(
                        "https://cdn.thewirecutter.com/wp-content/media/2022/07/laptop-under-500-2048px-acer-1.jpg",
                      ),
                    ),
                    Center(
                      child: Image.network(
                        "https://m.media-amazon.com/images/I/31O8D6p7sfL._SY445_SX342_QL70_FMwebp_.jpg",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              Expanded(
                flex: 10,
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (ctx, index) => ListTile(
                      isThreeLine: true,
                      leading: Container(
                        alignment: Alignment.center,
                        width: 80,
                        height: 80,
                        child: Image.network(products[index].imageUrl),
                      ),
                      title: Text(products[index].name),
                      subtitle: Text(
                          "${products[index].description} \n \$${products[index].price.toStringAsFixed(2)}"),
                      trailing: IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          productController.addProduct(
                              product: products[index]);
                        },
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  get() {
    setState(() {
      if (l == 0) {
        l = 1;
      } else if (l == 1) {
        l = 2;
      } else if (l == 2) {
        l = 0;
      }
    });
  }
}
