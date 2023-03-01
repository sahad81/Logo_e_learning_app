import 'package:flutter/material.dart';
import 'package:logo_e_learning/controllers/bottom_nav_controller.dart';
import 'package:logo_e_learning/controllers/cart_controller.dart';
import 'package:logo_e_learning/controllers/controller_vishllist.dart';
import 'package:logo_e_learning/controllers/my_learning_controller.dart';
import 'package:logo_e_learning/controllers/onbording_page.dart';
import 'package:logo_e_learning/controllers/otp_controller.dart';
import 'package:logo_e_learning/controllers/payment_controller.dart';
import 'package:logo_e_learning/controllers/login_controller.dart';
import 'package:logo_e_learning/controllers/provider_courses.dart';
import 'package:logo_e_learning/controllers/signup_controller.dart';
import 'package:logo_e_learning/controllers/user_details.dart';
import 'package:logo_e_learning/servies/signup_servieces.dart';
import 'package:logo_e_learning/view/Authentication/otp.dart';
import 'package:logo_e_learning/view/addvertisement_page/onbording.dart';
import 'package:logo_e_learning/view/homepage/categorie_view_page.dart';

import 'package:logo_e_learning/view/splash/splash_screen.dart';

import 'package:logo_e_learning/controllers/feadback_provider.dart';

import 'package:provider/provider.dart';

import 'controllers/shared_prefs_servieses.dart';

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
          ChangeNotifierProvider(create: (context) => LoginController()),
          ChangeNotifierProvider(create: (context) => SignupController()),
          ChangeNotifierProvider(create: (context) => ProviderCoursess()),
          ChangeNotifierProvider(create: (context) => WishListP()),
          ChangeNotifierProvider(create: (context) => CartProvider()),
            ChangeNotifierProvider(create: (context) => OnbordingController()),
          ChangeNotifierProvider(
            create: (context) => UserDetails(),
          ),
          ChangeNotifierProvider(
            create: (context) => OtpController(),
          ),
          ChangeNotifierProvider(
            create: (context) => BottomNavController(),
          ),
          ChangeNotifierProvider(
            create: (context) => PaymentProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => MyLearningsController(),
          )
        ],
        child: MaterialApp(
          title: 'Space Class',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: 
        
          const SplashScreen(),
          debugShowCheckedModeBanner: false,
          routes: <String, WidgetBuilder>{
            CategoryPage.routName: (context) => const CategoryPage()
          },
        ));
  }
}
