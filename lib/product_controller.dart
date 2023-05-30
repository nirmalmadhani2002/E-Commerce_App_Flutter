import 'package:get/get.dart';
import 'Product_modal.dart';

class ProductController extends GetxController{
  RxList addedProducts = [].obs;
  get totalQuantity => addedProducts.length;

  get totalPrice{
    RxInt price = 0.obs;

    addedProducts.forEach((e) {
      price += e.price.value;
    });
    return price.value;
  }
  void addProduct({required Product product}){
    addedProducts.add(product);
  }
  void removeProduct({required Product product}){
    addedProducts.remove(product);
  }
}