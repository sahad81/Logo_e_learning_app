import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Stars extends StatelessWidget {
  const Stars({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.25,
      height:30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
       return Icon(Icons.star,color:Color.fromARGB(255, 241, 216, 138),size: 20,);
      }, separatorBuilder: (context, index) {
        return SizedBox(width: .6,);
      }, itemCount: 3),
    );
  }
}