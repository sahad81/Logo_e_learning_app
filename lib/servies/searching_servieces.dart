// ignore_for_file: body_might_complete_normally_nullable

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logo_e_learning/const/strings.dart';
import 'package:logo_e_learning/model/search_model.dart';

class SearchingServieces {
  Future<SearchModel?> fetchSearchedData(String data) async {
    try {
      Dio dio = Dio();
      final response = await dio.get(
        '$BaseUrl/courses/search',
        queryParameters: {"searchData": data},
      ).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final data = SearchModel.fromJson(response.data);
        log(data.data.toString());
        return data;
      }
      log(response.data);
    } on SocketException {
      log("socketExaption in search");
      return null;
    } on TimeoutException {
      log("timeout in search");
      return null;
    } on DioError {

      log("dio error in search");
      return null;
    } catch (e) {
      log("catch erro in search");
      return null;
    }
  
  }
}
