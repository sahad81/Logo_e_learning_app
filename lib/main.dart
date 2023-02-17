import 'package:flutter/material.dart';
import 'package:logo_e_learning/controllers/cart_controller.dart';
import 'package:logo_e_learning/controllers/controller_vishllist.dart';
import 'package:logo_e_learning/controllers/payment_controller.dart';
import 'package:logo_e_learning/controllers/provider_authentication.dart';
import 'package:logo_e_learning/controllers/provider_courses.dart';
import 'package:logo_e_learning/controllers/user_details.dart';
import 'package:logo_e_learning/view/homepage/categorie_view_page.dart';

import 'package:logo_e_learning/view/splash/splash_screen.dart';


import 'package:logo_e_learning/controllers/feadback_provider.dart';

import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Feadbackprovider()),
          ChangeNotifierProvider(create: (context) => Authentication()),
          ChangeNotifierProvider(create: (context) => ProviderCoursess()),
          ChangeNotifierProvider(create: (context) => WishListP()),
          ChangeNotifierProvider(create: (context) => CartProvider()),
          ChangeNotifierProvider(create: (context) => UserDetails(),),
                    ChangeNotifierProvider(create: (context) => PaymentProvider(),)
                  ],
        child: MaterialApp(
          title: 'Space Class',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
          routes: <String,WidgetBuilder>{
         CategoryPage.routName:(context) => CategoryPage()
          },
        ));
  }
}
