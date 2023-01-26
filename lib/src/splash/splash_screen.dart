

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/src/ui/entry/start.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  Widget build(BuildContext context) {
 
    return AnimatedSplashScreen(
        splash: SingleChildScrollView(
          child: Column(
            children:[
        
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "LOGO",
               
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        splashIconSize: 300,
        nextScreen:Selectionpage());
        // sp.accountisraady==false ?Selectionpage():HomePage1() );
  }}
