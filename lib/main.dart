import 'package:flutter/material.dart';
import 'package:logo_e_learning/src/mainpage/screen_main_page.dart';
import 'package:logo_e_learning/src/splash/splash_screen.dart';
import 'package:logo_e_learning/src/ui/addvertisement_page/page_three.dart';
import 'package:logo_e_learning/src/ui/entry/login_page.dart';
import 'package:logo_e_learning/src/ui/entry/provider_authentication.dart';
import 'package:logo_e_learning/src/ui/pages/account/feadback/account_provider.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/provider_courses.dart';
import 'package:logo_e_learning/src/ui/pages/wish_list/controller_vishllist.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
     MultiProvider(
   providers: [
ChangeNotifierProvider(create: (context) => Feadbackprovider() 


),
ChangeNotifierProvider(create: (context) => Authentication() ),
ChangeNotifierProvider(create: (context) => ProviderCoursess() ),
ChangeNotifierProvider(create: (context) => VishListP() )
    ],
child:      MaterialApp(
      title: 'Space Class',
      theme: ThemeData(
     
        primarySwatch: Colors.blueGrey,
      ),
      home:  
      SplashScreen(),
        debugShowCheckedModeBanner: false,
    ));
  }
}
