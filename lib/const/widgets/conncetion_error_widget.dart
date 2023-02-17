import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/controllers/cart_controller.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../kwidgets.dart';
import '../../controllers/controller_vishllist.dart';
import '../../controllers/provider_courses.dart';

class ConnnectionError extends StatelessWidget {
  const ConnnectionError({
    super.key,
    required this.size1,
  });

  final double size1;

  @override
  Widget build(BuildContext context) {
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
                  },
                  child: const Text("Retry")),
            ],
          ),
        );
    }  );
  }
}
