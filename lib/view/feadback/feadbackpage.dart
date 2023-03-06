import 'package:flutter/material.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/controllers/feadback_provider.dart';


import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FeedBack extends StatelessWidget {
  FeedBack({super.key});

  var formKey = GlobalKey<FormState>();

//for textfiled

  bool condetion = false;
//for internet connection
  bool internet = false;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      context.read<Feadbackprovider>().onpressed(false);
      Provider.of<Feadbackprovider>(context, listen: false).start();
    });

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor:kwite,
          centerTitle: true,
          title: Ktext(text: "Feedback", color: kblack, size: 20)
        ),
        body: Builder(builder: (context) {
          return SafeArea(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 40, 25, 0),
            child: Consumer<Feadbackprovider>(builder: (context, data, _) {
              return Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Focus(
                        onFocusChange: (suffixchange) {
                          data.focusnametrfn(true);
                        },
                        //name------------------------
                        child: TextFormField(
                          onChanged: (val) {
                            data.isnameiscrfn(val);
                            // setState(() {
                            //   isnameiscrt = isByteLength(, 2, 15);
                            // });
                          },
                          controller: data.namecontroler,
                          decoration: InputDecoration(
                              suffixIcon: data.focusname
                                  ? data.isnameiscrt == false
                                      ? const Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        )
                                      : const Icon(
                                          Icons.done,
                                          color: Colors.green,
                                        )
                                  : const SizedBox(),
                              labelText: 'Name',
                              hintText: 'Name',
                              icon: const Icon(Icons.account_circle),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: data.isnameiscrt == false
                                          ? Colors.red
                                          : Colors.green))),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Focus(
                        onFocusChange: (suffixchange) {
                          data.focusmailfn(true);
                          //   setState(
                          //     () {
                          //       focusmail = true;
                          //     },
                          //   );
                        },

                        //email-------------------
                        child: TextFormField(
                          showCursor: true,
                          controller: data.emailcontroler,
                          onChanged: (val) {
                            data.ismailiscrtfn(val);
                            // setState(() {
                            //   isemailcorrect = isEmail(val);
                            // });
                          },
                          // validator: ((value) {
                          //   if (value!.isEmpty) {
                          //     return 'Enter email address';
                          //   }
                          //   return null;
                          // }),
                          decoration: InputDecoration(
                              suffixIcon: data.focusmail
                                  ? data.isemailcorrect == false
                                      ? const Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        )
                                      : const Icon(
                                          Icons.done,
                                          color: Colors.green,
                                        )
                                  : const SizedBox(),
                              labelText: 'Email',
                              hintText: 'Email',
                              icon: const Icon(Icons.email),
                              //  border: OutlineInputBorder()
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: data.isemailcorrect == false
                                          ? Colors.red
                                          : Colors.green))),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Focus(
                        onFocusChange: (suffixchange) {
                          data.focussubfn(true);
                          // setState(() {
                          //   focusedsub = true;
                          // });
                          //subject--------------------------------------------
                        },
                        child: TextFormField(
                          showCursor: true,
                          controller:data. subcontroler,
                          onChanged: (vali) {
                            data.issubiscrtfn(vali);
                            // setState(() {
                            //   subcontrolercrt = isByteLength(vali, 2, 40);
                            // });
                          },
                          decoration: InputDecoration(
                              suffixIcon: data.focusedsub
                                  ? data.subcontrolercrt == false
                                      ? const Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        )
                                      : const Icon(
                                          Icons.done,
                                          color: Colors.green,
                                        )
                                  : const SizedBox(),
                              labelText: 'Subject',
                              hintText: 'Subject',
                              icon: const Icon(Icons.subject),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: data.subcontrolercrt == false
                                          ? Colors.red
                                          : Colors.green))),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Focus(
                        onFocusChange: (suffixchange) {
                          data.focusmsgfn(true);
                   
                        },

                        //message------------------------------------
                        child: TextFormField(
                          controller: data.messagecontroler,
                          onChanged: (value) {
                            data.msgiscrtfn(value);
                           
                          },
                          decoration: InputDecoration(
                              suffixIcon: data.focusedmsg
                                  ? data.messagecontrolercrt == false
                                      ? const Icon(
                                          Icons.close,
                                          color: Colors.red,
                                        )
                                      : const Icon(
                                          Icons.done,
                                          color: Colors.green,
                                        )
                                  : const SizedBox(),
                              labelText: 'Message',
                              hintText: 'Message',
                              icon: const Icon(Icons.message),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: data.messagecontrolercrt == false
                                          ? Colors.red
                                          : Colors.green))),
                          style: const TextStyle(fontSize: 25),
                          maxLines: 5,
                          minLines: 3,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            data.onpressed(true);
                          
                            internet =
                                await InternetConnectionChecker().hasConnection;

                            internet == false
                                // ignore: use_build_context_synchronously
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:Text(
                                            "Check your internet conection")))
                                : null;
                          
                          
                            // ignore: use_build_context_synchronously
                            internet ? validation(context) : null;
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(150, 50),
                              maximumSize: const Size(150, 50),
                              backgroundColor: Colors.blue.shade900
                              ),
                          child: const Text(
                            'SEND',
                            style: TextStyle(color: Colors.white),
                          )),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
              );
            }),
          ));
        }));
  }

  validation(BuildContext context) {
    final data = Provider.of<Feadbackprovider>(context, listen: false);
    if (data.isnameiscrt &&
        data.isemailcorrect &&
        data.messagecontrolercrt &&
        data.subcontrolercrt) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 3),
        content: Text(' Sandig email.....'),
        backgroundColor: Colors.green,
      ));
     data.sendmail(context);

  Navigator.of(context).pop();
    }
  }

}

// send mail to my email // Email.js

