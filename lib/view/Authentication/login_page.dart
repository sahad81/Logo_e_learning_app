import 'package:flutter/material.dart';
import 'package:logo_e_learning/controllers/login_controller.dart';
import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/view/Authentication/signup_page.dart';

import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        //new line
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
              SizedBox(height: size.height * 0.19),
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
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  controller:
                      Provider.of<LoginController>(context).email_controler,
                  validator: (value) {
                    if (!isEmail(value.toString())) {
                      return "please enter valid eamil address";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      prefixIcon:const Icon(Icons.email),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
                      fillColor: const Color.fromARGB(255, 202, 227, 254),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: "Email..",
                      labelStyle: TextStyle(color: kblack))),
              kheight30,
              TextFormField(
                autofocus: false,
                textInputAction: TextInputAction.next,
                controller:
                    Provider.of<LoginController>(context).password_controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter valid password";
                  } else if (value.length < 6) {
                    return ("Password Must be more than 5 characters");
                  }
                  return null;
                },
                obscureText:
                    Provider.of<LoginController>(context).passwordishiden,
                    
                decoration: InputDecoration(
                  prefixIcon:  const Icon(Icons.vpn_key_rounded),
                  
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
                    fillColor: const Color.fromARGB(255, 202, 227, 254),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    suffix: InkWell(
                      onTap: () {
                        Provider.of<LoginController>(context, listen: false)
                            .togglepasswordviewlogin();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Provider.of<LoginController>(context, listen: false)
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
        
              SizedBox(height: MediaQuery.of(context).size.height * 0.054),
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: Colors.blue.shade900
  ),
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    Provider.of<LoginController>(context, listen: false)
                        .loginpostfunction(context);
                  } 
              }, child:  Padding(
                padding: const EdgeInsets.all(10),
                child: Ktext(
                      text: "Log in",
                      color: kwite,
                      size: 20,
                      weight: FontWeight.w600,
                    ),
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
                                  'Login With Google',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
        ),
                    
              ],
            ),
         
             
             SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align
                  (
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
                ],
              ),
            ]),
          )),
    )));
  }
}
