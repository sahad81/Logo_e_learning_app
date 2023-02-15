import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/widgets/cart_bn.dart';

class curriculem extends StatelessWidget {
  const curriculem({super.key});

  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [CartBtn()],
        backgroundColor: kwite,
        leading: const BackButton(
          color: Colors.black, // <-- SEE HERE
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: size1 * 0.26,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://blog.logrocket.com/wp-content/uploads/2021/06/Building-card-widget-Flutter.jpg",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
