import 'package:flutter/material.dart';
import 'package:logo_e_learning/src/splash/splash_screen.dart';
import 'package:logo_e_learning/src/ui/pages/account/feadback/account_provider.dart';
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
    ],
child:      MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        primarySwatch: Colors.blueGrey,
      ),
      home: const SplashScreen(),
    ));
  }
}
