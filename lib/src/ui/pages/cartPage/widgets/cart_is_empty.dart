import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';

class CartisEmpty extends StatelessWidget {

  const CartisEmpty({
    Key? key,
    required this.sizeh,
    required this.sizef,
  }) : super(key: key);

  final double sizeh;

  final double sizef;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: sizeh * 0.18,
          ),
          SvgPicture.asset(
            "assets/undraw_file_searching_re_3evy.svg",
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          SizedBox(
            height: sizeh * 0.027,
          ),
          const Ktext(
            
            text:
                "Your cart is empty. keep shopping to find a couse",
            color: Colors.grey,
            size: 17,
            textalie: TextAlign.center,
          ),
          SizedBox(
            height: sizeh * 0.027,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: sizef * 0.2, right: sizef * 0.2),
            child: SizedBox(
                width: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),

                      primary:Colors.blue.shade900 // Background color
                    ),
                    onPressed: () {},
                    child: Ktext(
                        text: "Keep shopping",
                        color: kwite,
                        size: MediaQuery.of(context).size.height *
                            0.023))),
          )
        ],
      );
  }
}