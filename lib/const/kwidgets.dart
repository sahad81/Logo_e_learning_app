
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Ktext extends StatelessWidget {
  const Ktext(
      {super.key,
      this.textalie=TextAlign.start,
      required this.text,
      required this.color,
      required this.size,
       this.weight});
  final String text;
  final Color color;
  final double size;
  final FontWeight? weight;
  final    textalie ;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign:textalie,
      style: GoogleFonts.poppins(
        color: color,
      
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
Widget kheight15 =const SizedBox(height: 15);
Widget kheight30 =const SizedBox(height: 30);



// ignore: camel_case_types
class klog_sighn extends StatelessWidget {
   // ignore: non_constant_identifier_names
   const klog_sighn({super.key, required this.titile,  required this.colorss});
// ignore: non_constant_identifier_names
final Color colorss;
final String titile;
  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
                  
                    border: Border.all(
                      color:colorss,
                      width: 2,
                    )),
        child: Center(child: Text(titile)),),
    );
  }
}