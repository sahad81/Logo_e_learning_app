import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/const/kwidgets.dart';

class Profile extends StatelessWidget {
  // final String name;
  
  // final String number;
  // final String Email;
  // final int? id;

  const Profile({
  //  this.id,
  
    Key? key,
    // required this.name,
   
    // required this.number,
    // required this.Email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Material(
          color: const Color(0xFF15485D),
    
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF15485D),
        title: const Text('Personal Details'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                 
                  const SizedBox(
                    height: 10,
                  ),
                 
                
                
                
                  Text(
                    '     NAME  :  na,e',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  kheight15,
                  const Text(
                    '     Email  :  email@gmail.com',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                kheight15,
                  Text(
                    '     NUMBER  :  num',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                 kheight15,
                Text(
                    '     NUMBER  :  num',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
