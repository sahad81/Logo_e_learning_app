import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logo_e_learning/model/UserDetails_model.dart';

import '../const/strings.dart';
import '../controllers/shared_prefs_servieses.dart';

class UserDetailsServices {
  Future getUserDetails() async {
    try {
      final tocken = await UserServieces.getToken();

      final response = await Dio().get("$BaseUrl/user/userProfile",
          options: Options(
            headers: {"Authorization": tocken},
          )).timeout(const Duration(seconds: 15));
      if (response.statusCode == 200 || response.statusCode == 201) {
      
       final data =UserDetailsModel.fromJson(response.data);
        log(data.userDetails!.name.toString());
        return data;
      }
    } on SocketException {
      log("stock Exception ---user details");
    } on TimeoutException {
      log("timeOut ---user details");
    } catch (e) {
      log("catch error in user details");
    }
  }
}
