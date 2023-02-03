import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:logo_e_learning/src/const/colors.dart';
import 'package:logo_e_learning/src/const/kwidgets.dart';
import 'package:logo_e_learning/src/splash/splash_screen.dart';
import 'package:logo_e_learning/src/ui/entry/user_sercies.dart';
import 'package:logo_e_learning/src/ui/pages/account/feadback/account_provider.dart';
import 'package:logo_e_learning/src/ui/pages/account/feadback/feadbackpage.dart';
import 'package:logo_e_learning/src/ui/pages/account/personal_details/personal_details.dart';
import 'package:logo_e_learning/src/ui/pages/account/widgets/list_tile.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/homepage.dart';
import 'package:logo_e_learning/src/widgets/cart_bn.dart';
import 'package:share_plus/share_plus.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kwite,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Ktext(text: "Account", color: kblack, size: 17),
        actions: const [
          CartBtn(),
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        kheight15,
        Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: const NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAArtPg9Bxk84GOY0AKcBUl9snbsY4gLsBcgIP1Utxgw&s'),
                radius: MediaQuery.of(context).size.width * 0.2,
              ),
              kheight15,
              Ktext(text: "name", color: kblack, size: 20),
              Ktext(text: "sahadkatakadan@gmail.com", color: kblack, size: 20),
              kheight15,
              InkWell(
                  child: Ktext(
                      text: "Switch to instractore account",
                      color: kblue,
                      size: 15)),
              kheight15,
              ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: 15, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Ktext(
                                  text: "Personal Details",
                                  color: kblack,
                                  size: 22,
                                  weight: FontWeight.bold,
                                ),
                                Divider(
                                  thickness: 3,
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: Ktext(
                                        text: "Name        : Sahad",
                                        color: kblack,
                                        size: 19)),
                                kheight15,
                                InkWell(
                                    onTap: () {},
                                    child: Ktext(
                                        text: "Email         : Sahad@gmail.com",
                                        color: kblack,
                                        size: 19)),
                                kheight15,
                                InkWell(
                                    onTap: () {},
                                    child: Ktext(
                                        text: "phone       : 90120202",
                                        color: kblack,
                                        size: 19)),
                                kheight15,
                                InkWell(
                                    onTap: () {},
                                    child: Ktext(
                                        text: "password : ******",
                                        color: kblack,
                                        size: 19)),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.03),
                                  child: ElevatedButton(
                                   style: ButtonStyle(  backgroundColor: MaterialStateProperty.all(Colors.blue.shade900),),
                                      onPressed: () {},
                                      child: Text("Edit")),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  leading:
                      Ktext(text: "Personal Details", color: kblack, size: 19),
                  trailing: Icon(
                    Icons.arrow_right,
                  )),
              ListTileA(
                fn: () {},
                title: "About ____",
              ),
              ListTile(
                onTap: () {
                  Share.share('link not fount');
                },
                trailing: Icon(
                  Icons.arrow_right,
                ),
                leading: Ktext(text: "Share App", color: kblack, size: 18),
              ),
              ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FeedBack(),
                    ));
                  },
                  title: Ktext(text: "Feedback", color: kblack, size: 19),
                  trailing: Icon(
                    Icons.arrow_right,
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: ((context) => AlertDialog(
                                title: const Text("Sign Out Account"),
                                content:
                                    const Text('Are you sure to sign out  .'),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        return Navigator.of(context).pop();
                                      },
                                      child: const Text('CANCEL',
                                          style:
                                              TextStyle(color: Colors.black))),
                                  TextButton(
                                      onPressed: () {
                                        //   <! second time-->
                                     UserServieces().removeUser(context);
                                      },
                                      child: Text('ACCEPT',
                                          style: TextStyle(color: kblack)))
                                ])));
                  },
                  child: Text(
                    "Sign out",
                    style: TextStyle(color: kblue),
                  ))
            ],
          ),
        )
      ]),
    );
  }
}
