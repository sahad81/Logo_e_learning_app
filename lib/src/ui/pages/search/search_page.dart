import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/src/ui/pages/search/widgets/searchlist.dart';
import 'package:logo_e_learning/src/widgets/cart_bn.dart';

class Searchsreen extends StatelessWidget {
  Searchsreen({super.key});
 
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.82,
                height: 50,
                child: TextField(
                
                  style: const TextStyle(),
                  textInputAction: TextInputAction.search,
                    
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(.4),
                      suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: "search",
                      hintStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white),
                      )),
                ),
              ),
             Spacer(),
             CartBtn()
            ],
          ),

//check textfield is open or not=================================
        
            const Expanded(
                
                    child: SearchWidget()),
     
        ],
      ),
    )));
  }
}
