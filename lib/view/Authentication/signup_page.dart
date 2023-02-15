// ignore_for_file: non_constant_identifier_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconforest_flutter_cmoon_icons/flutter_cmoon_icons.dart';
import 'package:logo_e_learning/controllers/provider_authentication.dart';
import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/view/Authentication/login_page.dart';


import 'package:logo_e_learning/view/Authentication/login_page.dart';import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false, //new line
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [Colors.white, Colors.blue.shade200],
        )),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: Size.height * .1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Ktext(
                        text: "Space Class",
                        color: kblack,
                        size: Size.height * 0.034,
                        weight: FontWeight.bold),
                    kheight15,
                    Ktext(
                      text: "Welcome back! ",
                      color: kwite,
                      size: Size.height * 0.028,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                kheight30,
                TextFormField(
                    decoration: const InputDecoration(labelText: "Name")),
                TextFormField(
                    decoration: const InputDecoration(labelText: "Email")),
                TextFormField(
                    decoration:
                        const InputDecoration(labelText: "Phone number")),
                TextFormField(
                  obscureText: Provider.of<Authentication>(context)
                      .passwordishideniSignup,
                  decoration: InputDecoration(
                      suffix: InkWell(
                        onTap: () {
                          Provider.of<Authentication>(context, listen: false)
                              .togglepasswordviewsignUp();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Provider.of<Authentication>(context, listen: false)
                                        .passwordishideniSignup ==
                                    false
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(color: kblack)),
                ),
                TextFormField(
                  obscureText:
                      Provider.of<Authentication>(context).passwordishiden,
                  decoration: InputDecoration(
                      suffix: InkWell(
                        onTap: () {
                          Provider.of<Authentication>(context, listen: false)
                              .togglepasswordviewsignUp();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Provider.of<Authentication>(context, listen: false)
                                        .passwordishiden ==
                                    false
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(color: kblack)),
                ),
                SizedBox(
                  height: Size.height * 0.02,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'By continuing you agree to our',
                          style: TextStyle(
                            color: kwite,
                            fontSize: 15,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // open desired screen
                            }),
                      TextSpan(
                          text: '  Terms and services\n',
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 15,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // open desired screen
                            }),
                    ]),
                  ),
                ),
                kheight15,
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: Size.height * 0.060,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Colors.blue.shade900,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        )),
                    child: Center(
                        child: Ktext(
                      text: "Register",
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
                      width: MediaQuery.of(context).size.height * 0.13,
                      height: 1,
                      color: kwite,
                    ),
                    Ktext(text: ' Or Continue with ', color: kwite, size: 12),
                    Container(
                      width: MediaQuery.of(context).size.height * 0.13,
                      height: 1,
                      color: kwite,
                    ),
                  ],
                ),
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
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Ktext(
                              text: "Already have an account?",
                              color: kwite,
                              size: 15),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Ktext(
                                text: "Log in",
                                color: Colors.blue.shade900,
                                size: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ]),
        ),
      )),
    );
  }
}
