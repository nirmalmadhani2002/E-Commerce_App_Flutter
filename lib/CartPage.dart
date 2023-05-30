import 'package:e_commerce_app_flutter/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'all_Product.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cart"),
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
        ],
      ),
      body: Center(
        child: Column(
          children: [
            // Expanded(
            //   flex: 1,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Obx(
            //             ()=>  Text(
            //                 "Total Quantity : ${productController.totalQuantity}"),
            //
            //         ),
            //       Obx(
            //           ()=> Text(
            //                 "Total Price : ${productController.totalPrice}"),
            //         ),
            //     ],
            //   ),
            // ),
            Expanded(
              child: Obx(
                () {
                  return ListView.builder(
                      itemCount: productController.addedProducts.length,
                      itemBuilder: (context, index) {
                        return  ListTile(
                            isThreeLine: true,
                            leading: Text("${index +1}"),
                            title: Text(productController.addedProducts[index].name),
                            subtitle: Text(
                                "${productController.addedProducts[index].description} \n \$${productController.addedProducts[index].price.toStringAsFixed(2)}"),
                            trailing: IconButton(icon:Icon(Icons.remove_circle_outline),onPressed:(){
                              productController.removeProduct(product: productController.addedProducts[index]);
                            } ,)
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
