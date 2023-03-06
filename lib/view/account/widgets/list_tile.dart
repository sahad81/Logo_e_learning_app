import 'package:flutter/material.dart';
import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';

// ignore: must_be_immutable
class ListTileA extends StatelessWidget {
   ListTileA({super.key, required this.fn,required this.title});
Function? fn;
String ? title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Ktext(text: title!, color: kblack, size: 18),
      onTap: (){
        fn!;
      },
      trailing:const Icon(Icons.arrow_right)
      
          );
  }
}