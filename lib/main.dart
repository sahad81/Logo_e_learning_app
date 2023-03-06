import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:logo_e_learning/controllers/bottom_nav_controller.dart';
import 'package:logo_e_learning/controllers/cart_controller.dart';
import 'package:logo_e_learning/controllers/controller_wishllist.dart';
import 'package:logo_e_learning/controllers/my_learning_controller.dart';
import 'package:logo_e_learning/controllers/onbording_page.dart';
import 'package:logo_e_learning/controllers/otp_controller.dart';
import 'package:logo_e_learning/controllers/payment_controller.dart';
import 'package:logo_e_learning/controllers/login_controller.dart';
import 'package:logo_e_learning/controllers/provider_courses.dart';
import 'package:logo_e_learning/controllers/search_controller.dart';
import 'package:logo_e_learning/controllers/signup_controller.dart';
import 'package:logo_e_learning/controllers/user_details.dart';
import 'package:logo_e_learning/view/homepage/categorie_view_page.dart';
import 'package:logo_e_learning/view/splash/splash_screen.dart';
import 'package:logo_e_learning/controllers/feadback_provider.dart';

import 'package:provider/provider.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
    debug: true, // optional: set to false to disable printing logs to console (default: true)
    ignoreSsl: true // option: set to false to disable working with http links (default: false)
  );
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
             ChangeNotifierProvider(create: (context) => SearchController()),
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
        
           // ignore: prefer_const_constructors
           SplashScreen(),
          debugShowCheckedModeBanner: false,
          routes: <String, WidgetBuilder>{
            CategoryPage.routName: (context) => const CategoryPage()
          },
        ));
  }
}
