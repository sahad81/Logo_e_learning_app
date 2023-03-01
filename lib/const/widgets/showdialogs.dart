// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';


ShowDialiogfn(context, String content, String title1) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(
                title1,
                style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              ),
              content: Text(
                content,
                style:  TextStyle(color: Colors.grey.shade700),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'close',
                      style: TextStyle(color: Colors.blue),
                    )),
              ]);
        });
}
