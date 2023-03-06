import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:logo_e_learning/const/widgets/cart_bn.dart';
import 'package:logo_e_learning/controllers/search_controller.dart';
import 'package:logo_e_learning/view/search/widgets/searchlist.dart';
import 'package:provider/provider.dart';

class Searchsreen extends StatelessWidget {
  const Searchsreen({super.key});
 
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
              Consumer<SearchController>(
                builder: (context, value1, child) {
                  
                return
                 SizedBox(
                  width: MediaQuery.of(context).size.width*0.82,
                  height: 50,
                  child: TextField(
                  onChanged: (value) {
                    value1.getsearchedCourses(value);
                  },
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
                );}
              ),
             const Spacer(),
             const CartBtn()
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
