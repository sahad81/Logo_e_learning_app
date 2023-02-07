import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/controllers/cart_controller.dart';
import 'package:logo_e_learning/src/const/colors.dart';

import 'package:logo_e_learning/src/ui/pages/cartPage/cart_page.dart';
import 'package:provider/provider.dart';

class CartBtn extends StatelessWidget {
  const CartBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      Provider.of<CartProvider>(context,listen: false).GetCartslist(context);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const CartPage(),));
    }, icon: Icon(CupertinoIcons.cart,color: kblack,));
  }
}
