import 'dart:core';

import 'package:flutter/material.dart';
import 'package:logo_e_learning/const/widgets/conncetion_error_widget.dart';
import 'package:logo_e_learning/controllers/bottom_nav_controller.dart';
import 'package:logo_e_learning/controllers/cart_controller.dart';
import 'package:logo_e_learning/controllers/controller_vishllist.dart';
import 'package:logo_e_learning/controllers/login_controller.dart';
import 'package:logo_e_learning/controllers/my_learning_controller.dart';
import 'package:logo_e_learning/controllers/shared_prefs_servieses.dart';
import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/controllers/user_details.dart';

import 'package:logo_e_learning/view/feadback/feadbackpage.dart';
import 'package:logo_e_learning/view/account/widgets/list_tile.dart';
import 'package:logo_e_learning/const/widgets/cart_bn.dart';

import 'package:provider/provider.dart';
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
      body: Provider.of<UserDetails>(
        context,
      ).loading
          ? const CircularProgressIndicator()
          : Provider.of<UserDetails>(
              context,
            ).eroor
              ? const ConnnectionError()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      kheight15,
                      Center(
                        child: Column(
                          children: [
                            Consumer(builder: (context, value, child) {
                              return Column(
                                children: [
                                  Icon(
                                    Icons.account_circle,
                                    size: MediaQuery.of(context).size.height *
                                        0.2,
                                  ),
                                  kheight15,
                                  Ktext(
                                      text: Provider.of<UserDetails>(context,
                                              listen: false)
                                          .userDetailslist[0]
                                          .userDetails!
                                          .name
                                          .toString(),
                                      color: kblack,
                                      size: 20),
                                  Ktext(
                                      text:
                                          Provider.of<LoginController>(context)
                                              .email
                                              .toString(),
                                      color: kblack,
                                      size: 20),
                                ],
                              );
                            }),
                            kheight15,
                            InkWell(
                                child: Ktext(
                                    text: "Switch to instractore account",
                                    color: kblue,
                                    size: 15)),
                            kheight15,
                            ListTileA(
                              fn: () {},
                              title: "About Space Class",
                            ),
                            ListTile(
                              onTap: () {
                                Share.share('link not fount');
                              },
                              trailing: const Icon(
                                Icons.arrow_right,
                              ),
                              leading: Ktext(
                                  text: "Share App", color: kblack, size: 18),
                            ),
                            ListTile(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => FeedBack(),
                                  ));
                                },
                                title: Ktext(
                                    text: "Feedback", color: kblack, size: 19),
                                trailing: const Icon(
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
                                              title: const Text(
                                                  "Sign Out Account"),
                                              content: const Text(
                                                  'Are you sure to sign out  .'),
                                              actions: <Widget>[
                                                TextButton(
                                                    onPressed: () {
                                                      return Navigator.of(
                                                              context)
                                                          .pop();
                                                    },
                                                    child: const Text('CANCEL',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black))),
                                                TextButton(
                                                    onPressed: () {

                                                      //   <! second time-->
                                                   
                                                      UserServieces()
                                                          .removeUser(context).then((value) {
         
                                                          });
                                                         Provider.of<BottomNavController>(
                                                              context,
                                                              listen: false)
                                                          .selectedValue0();
                                                    },
                                                    child: Text('ACCEPT',
                                                        style: TextStyle(
                                                            color: kblack)))
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
