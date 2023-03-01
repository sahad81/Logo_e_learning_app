// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names, unused_catch_clause, unused_field, prefer_final_fields, avoid_print
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/const/widgets/snackbar.dart';
import 'package:logo_e_learning/servies/cart_servieces.dart';
import '../model/getcart_model.dart';
import 'package:url_launcher/url_launcher.dart';
class CartProvider extends ChangeNotifier {
  bool _error = false;
  bool _loading = false;
  String _errorMessage = '';

  bool get loading => _loading;
  bool get eroor => _error;
  List<CartModel> cartList = [];


//-----------------------cart amount------------------->
  double totalcartAmount() {
    double amount = 0;
    for (var i = 0; i < cartList[0].data!.length; i++) {
      amount = amount +
          double.parse(cartList[0].data![i].courseDetails![0].price.toString());
    }
    return amount;
  }


//---------------------------------checking item is in cart or not------------------------------//
  bool checkinCart(id) {
    bool isinCart = false;
    log(cartList[0].data!.length.toString());
    for (int i = 0; i < cartList[0].data!.length; i++) {
      if (cartList[0].data![i].courseDetails![0].id == id) {
        isinCart = true;
        log(isinCart.toString());
      }
    }
    return isinCart;
  }


//---------------------------------------Get cartlist------------------------>
  GetCartslist(context) async {
      _loading = true;
    _error = false;
   cartList.clear();
    notifyListeners();
    final data = await CartServieces().GetCartServieces(context);
    // log(data);
   
    if (data == null) {
      _loading = false;
      _error = true;
      log("eroor");
      notifyListeners();
    } else {
      log('yes');
      cartList.add(data);
      _loading = false;
      notifyListeners();
    }
  }


//-----------------------------------add to cart------------------------------------->
  addTocart(String id, context) async {
    await CartServieces().addtocart(id, context);
    GetCartslist(context);
   
  }
//-----------------------------------add to wishlist------------------------------------->
  RemoveFromCart(String id, context) async {
    await CartServieces().RemoveFromCart(id, context);
    GetCartslist(context);
  }



 Future<void> checkOut(BuildContext context)async{
final  url="https://www.youtube.com/watch?v=T0qbFgbFhg0&ab_channel=HeyFlutter%E2%80%A4com";

if (!await launchUrl(Uri.parse(url ))) {
  // ignore: use_build_context_synchronously
  throw showSnackBar("No internet", Colors.red, context);
}
  }
}
