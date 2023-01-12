import 'package:flutter/material.dart';
import 'package:iconforest_flutter_cmoon_icons/flutter_cmoon_icons.dart';
import 'package:logo_e_learning/src/const/colors.dart';
import 'package:logo_e_learning/src/const/kwidgets.dart';
import 'package:logo_e_learning/src/mainpage/screen_main_page.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/homepage.dart';
import 'package:logo_e_learning/src/ui/admin/signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false, //new line
        body: SafeArea(
            child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Color.fromARGB(255, 131, 151, 161)],
                ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ListView(shrinkWrap: true, children: [
                    SizedBox(height: size.height * 0.20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Ktext(
                            text: "L O G O",
                            color: kblack,
                            size: 40,
                            weight: FontWeight.bold),
                        kheight15,
                        Ktext(
                          text: "Welcome back! ",
                          color: kwite,
                          size: 25,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    kheight30,
                    kheight15,
                    TextFormField(

                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return 'enter Amount';
                        //   }
                        //   return null;
                        // },
                        //  controller: ,
                        // keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Email..",
                            labelStyle: TextStyle(color: kblack))),
                    kheight30,
                    TextFormField(
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'enter Amount';
                      //   }
                      //   return null;
                      // },
                      //  controller: ,
                      // keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(color: kblack)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Ktext(
                              text: "forget password?",
                              color: Colors.blue.shade900,
                              size: 15),
                        )
                      ],
                    ),
                    SizedBox(height: 50),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Screenmainpage(),
                        ));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 57,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: Colors.blueGrey,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            )),
                        child: Center(
                            child: Ktext(
                          text: "Log in",
                          color: kwite,
                          size: 20,
                          weight: FontWeight.w600,
                        )),
                      ),
                    ),
                    kheight30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 130,
                          height: 1,
                          color: kwite,
                        ),
                        Ktext(
                            text: ' Or Continue with ', color: kwite, size: 12),
                        Container(
                          width: 130,
                          height: 1,
                          color: kwite,
                        ),
                      ],
                    ),
                    kheight15,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.facebook,
                              color: kwite,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FlutterCmoonIcons.icon_google1,
                              color: kwite,
                              size: 25,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.phone,
                              color: kwite,
                              size: 30,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Ktext(
                                text: "Don't have an account?",
                                color: kwite,
                                size: 15),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: Ktext(
                                  text: "Sign up",
                                  color: Colors.blue.shade900,
                                  size: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ))));
  }
}
