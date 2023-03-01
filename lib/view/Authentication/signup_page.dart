// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconforest_flutter_cmoon_icons/flutter_cmoon_icons.dart';

import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/controllers/signup_controller.dart';
import 'package:logo_e_learning/view/Authentication/login_page.dart';

import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Scaffold(

      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [Colors.white, Colors.blue.shade200],
        )),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: Size.height * .1,
              ),
              
           
                  Ktext(
                      text: "Space Class",
                      color: kblack,
                      size: Size.height * 0.034,
                      weight: FontWeight.bold),
                  kheight15,
                  Ktext(
                    text: "Register Now! ",
                    color: Colors.grey,
                    size: Size.height * 0.028,
                    weight: FontWeight.bold,
                  ),
            
              kheight30,
              Consumer<SignupController>(builder: (context, value, child) {
                return Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                           autofocus: false,
                                      textInputAction: TextInputAction.next,
                            controller: value.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your name";
                              } else {
                                return null;
                              }
                            },
                            decoration:  InputDecoration(
                              
                               prefixIcon:  const Icon(Icons.email),
                                        
                        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
                        fillColor: const Color.fromARGB(255, 202, 227, 254),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                              
                              
                              labelText: "Name")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                           autofocus: false,
                                      textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (!isEmail(value.toString())) {
                                return "please enter valid eamil address";
                              } else {
                                return null;
                              }
                            },
                            controller: value.email,
                            decoration:  InputDecoration(
                                 prefixIcon:  const Icon(Icons.email),
                                        
                        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
                        fillColor: const Color.fromARGB(255, 202, 227, 254),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                              
                              
                              labelText: "Email")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                           autofocus: false,
                                      textInputAction: TextInputAction.next,
                          controller: value.password1,
                          obscureText: Provider.of<SignupController>(context)
                              .passwordishiden1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter valid password";
                            } else if (value.length < 6) {
                              return ("Password Must be more than 5 characters");
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            
                             prefixIcon:  const Icon(Icons.vpn_key_rounded),
                                        
                        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
                        fillColor: const Color.fromARGB(255, 202, 227, 254),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                              suffix: InkWell(
                                onTap: () {
                                  value.togglepasswordviewsignUp();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(
                                    value.passwordishiden2 == false
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(color: kblack)),
                        ),
                      ),
                      Padding(  
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                             autofocus: false,
                                      textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value !=
                                Provider.of<SignupController>(context,
                                        listen: false)
                                    .password1
                                    .text) {
                              return ("Password and confirm Password does not match");
                            } else if (value!.isEmpty) {
                              return "Plese enter a valid password";
                            }
                            return null;
                          },
                          controller: value.password2,
                          obscureText: value.passwordishiden2,
                          decoration: InputDecoration(
                               prefixIcon:  const Icon(Icons.vpn_key_rounded),
                                        
                        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
                        fillColor: const Color.fromARGB(255, 202, 227, 254),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                              suffix: InkWell(
                                onTap: () {
                                  value.togglepassword2view();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(
                                    value.passwordishiden2 == false
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                              labelText: " Confirm Password",
                              labelStyle: TextStyle(color: kblack)),
                        ),
                      ),
                    ],
                  ),
                );
              }),
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
                    ElevatedButton(
                 style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: Colors.blue.shade900
  ),
                onPressed: () {
                    if (_formkey.currentState!.validate()) {
                    Provider.of<SignupController>(context, listen: false)
                        .sighnUp(context);
                  } 
              }, child:  Padding(
                padding: const EdgeInsets.all(10),
                 child: Consumer<SignupController>(
                      builder: (context, value, child) {
                    return Center(
                        child: value.loading == true
                            ? CircularProgressIndicator()
                            : Ktext(
                                text: "Register",
                                color: kwite,
                                size: 20,
                                weight: FontWeight.w600,
                              ));
                  }),
              )),
         
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
                Padding(
          padding: const EdgeInsets.only(top: 16,),
          child: ElevatedButton(
          style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: Colors.blue.shade900
  ),
                         
                          onPressed: () {},
                          
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12,bottom: 12,right: 30,left: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 25,
                                  child: CircleAvatar(
                                    
                                    backgroundColor: Colors.transparent,
                                    child: Image.asset(
                                    'assets/google.png',),
                                  ),
                                ),
                                const Text(
                                  'Register With Google',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
        ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Column(
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
              )
            ]),
          ),
        ),
      )),
    );
  }
}
