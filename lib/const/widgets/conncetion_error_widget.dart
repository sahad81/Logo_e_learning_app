
import 'package:flutter/material.dart';
import 'package:logo_e_learning/controllers/cart_controller.dart';
import 'package:logo_e_learning/controllers/my_learning_controller.dart';
import 'package:logo_e_learning/controllers/search_controller.dart';
import 'package:logo_e_learning/controllers/user_details.dart';

import 'package:provider/provider.dart';

import '../colors.dart';
import '../kwidgets.dart';
import '../../controllers/controller_wishllist.dart';
import '../../controllers/provider_courses.dart';

class ConnnectionError extends StatelessWidget {
  const ConnnectionError({
    super.key,
   
  });



  @override
  Widget build(BuildContext context) {
    final size1=MediaQuery.of(context).size.height;
    return Consumer<ProviderCoursess>(
      builder: (context, value, child) {
        
      
      return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
                   Column(
                      children: [
                        Ktext(
                            text: "No Connction",
                            color: kblack,
                            size: 20),
                        Ktext(
                            text:
                                "Plesae check your internet connectivity \n and try agan",
                            textalie: TextAlign.center,
                            color: kblack,
                            size: 13)
                      ],
                    )
             ,
              SizedBox(
                 height: size1 * 0.012,
              ),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<WishListP>(context, listen: false)
                        .GetWishlist(context);
                    value.GetAllCourses(context);
                      Provider.of<CartProvider>(context, listen: false)
                        .GetCartslist(context);
                         Provider.of<MyLearningsController>(context, listen: false).MyLearningsModules();
                          Provider.of<ProviderCoursess>(context, listen: false).GetAllCourses(context);
            Provider.of<UserDetails>(context, listen: false).getUserDetails();
            Provider.of<SearchController>(context,listen: false).getsearchedCourses("");
                  },
                  child: const Text("Retry")),
            ],
          ),
        );
    }  );
  }
}
