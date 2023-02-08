import 'package:flutter/material.dart';
import 'package:iconforest_flutter_cmoon_icons/flutter_cmoon_icons.dart';
import 'package:logo_e_learning/controllers/provider_authentication.dart';
import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/src/mainpage/screen_main_page.dart';
import 'package:logo_e_learning/src/ui/addvertisement_page/page_one.dart';

import 'package:logo_e_learning/src/ui/pages/homepage/homepage.dart';
import 'package:logo_e_learning/src/ui/entry/signup_page.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false, //new line
        body: SafeArea(
            child: Form(
          key: formkey,
          child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Colors.blue.shade200],
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
                          text: "Space Class",
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.050,
                  ),
                  TextFormField(
                      controller:
                          Provider.of<Authentication>(context).email_controler,
                      validator: (value) {
                        if (!isEmail(value.toString())) {
                          return "please enter valid eamil address";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Email..",
                          labelStyle: TextStyle(color: kblack))),
                  kheight30,
                  TextFormField(
                    controller: Provider.of<Authentication>(context)
                        .password_controller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter valid password";
                      }
                    },
                    obscureText:
                        Provider.of<Authentication>(context).passwordishiden,
                    decoration: InputDecoration(
                        suffix: InkWell(
                          onTap: () {
                            Provider.of<Authentication>(context, listen: false)
                                .togglepasswordviewlogin();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Provider.of<Authentication>(context,
                                              listen: false)
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.054),
                  InkWell(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        Provider.of<Authentication>(context, listen: false)
                            .loginpostfunction(context);
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.061,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: Colors.blue.shade900,
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
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
                        width: MediaQuery.of(context).size.width * 0.26,
                        height: 1,
                        color: kwite,
                      ),
                      Ktext(text: ' Or Continue with ', color: kwite, size: 12),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.26,
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
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.026,
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
              )),
        )));
  }
}
