// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:logo_e_learning/src/const/strings.dart';
import 'package:logo_e_learning/src/ui/entry/user_sercies.dart';
import 'package:logo_e_learning/src/widgets/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VishListP extends ChangeNotifier {
  AddToWishlist( context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
       String? userDetails = prefs.getString('user_details');
       
      final response = await Dio().post(
        "$BaseUrl/user/addToWishlist",
        data: {"courseId": "63d2324cf241ba8e4da512ad"},
        options: Options(
          headers: {
            "Authorization":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0aW1lIjoiV2VkIEZlYiAwMSAyMDIzIDEzOjE3OjE2IEdNVCswNTMwIChJbmRpYSBTdGFuZGFyZCBUaW1lKSIsInVzZXJJZCI6IjYzY2NjMzQwZjcxZjEwN2ZjYTM3NDE4NyIsImlhdCI6MTY3NTIzNzYzNn0.ycEjzBfrtmTzJBE1VfY1iIAPtG8G0dXYYr_J_p13V0Y"
          },
        ),
      ); //
      if (response.statusCode == 200 || response.statusCode == 201) {
        showSnackBar("Successfully added to Wishlist", Colors.green, context);
      }
    } on SocketException {
      showSnackBar("No internet connection", Colors.red, context);
    } on TimeoutException {
      showSnackBar("No internet connection", Colors.red, context);
    } on DioError catch (e) {
      if (e.response!.statusCode == null) {
        showSnackBar("somthing Wrong", Colors.red, context);
      } else if (e.response!.statusCode == 400) {
        showSnackBar("course already exist", Colors.red, context);
      }
    }
  }

//   AddToWishlist()async{
//  try {
//        String apiUrl = "$BaseUrl/user";

//  final dio = Dio(
//     BaseOptions(
//        connectTimeout: 3000,
//        baseUrl: apiUrl,
//        responseType: ResponseType.json,
//        contentType: ContentType.json.toString(),
//   ));

//  dio.options.headers["Authorization"] = { "jwtToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0aW1lIjoiV2VkIEZlYiAwMSAyMDIzIDEzOjE3OjE2IEdNVCswNTMwIChJbmRpYSBTdGFuZGFyZCBUaW1lKSIsInVzZXJJZCI6IjYzY2NjMzQwZjcxZjEwN2ZjYTM3NDE4NyIsImlhdCI6MTY3NTIzNzYzNn0.ycEjzBfrtmTzJBE1VfY1iIAPtG8G0dXYYr_J_p13V0Y"};
//  await dio.post("/addToWishlist" , data: {

// });
//  } on DioError catch (e) {
//      if (e.response == null) {
//         log("eroor");
//       } else {
//         log(e.message);
//       }
//     }

//   catch (e) {
//    log(e.toString());
//  }
//   }
  // Future<void> makePutRequest() async {
  //   final url = Uri.parse('$BaseUrl/user/addToWishlist');
  //   final headers = {
  //     "Authorization": {
  //       "jwtToken":
  //           "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0aW1lIjoiV2VkIEZlYiAwMSAyMDIzIDEzOjE3OjE2IEdNVCswNTMwIChJbmRpYSBTdGFuZGFyZCBUaW1lKSIsInVzZXJJZCI6IjYzY2NjMzQwZjcxZjEwN2ZjYTM3NDE4NyIsImlhdCI6MTY3NTIzNzYzNn0.ycEjzBfrtmTzJBE1VfY1iIAPtG8G0dXYYr_J_p13V0Y"
  //     }
  //   };
  //   final json ={"courseId": "6358c80dab15df4d1f75ce49"};
  //   final response = await http.post(url, headers: headers, body: json);
  //   print('Status code: ${response.statusCode}');
  //   print('Body: ${response.body}');

  // }
}
