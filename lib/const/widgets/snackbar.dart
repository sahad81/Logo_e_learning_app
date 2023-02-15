import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


   showSnackBar(String popname, Color color, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(popname),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(15),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(10),
        ))));
  }