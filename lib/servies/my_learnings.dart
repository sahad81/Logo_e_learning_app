


 import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logo_e_learning/controllers/shared_prefs_servieses.dart';
import 'package:logo_e_learning/model/mycourses.dart';

import '../const/strings.dart';

class MyLearningServices {



 Future getMycourses ()async{
Dio dio = Dio();
            final tocken = await UserServieces.getToken();
      try {
           final response = await dio
          .get("$BaseUrl/user/enrolledCourses",
              options: Options(headers: {
                "Authorization": tocken,
              })).timeout(const Duration(seconds: 15));
if (response.statusCode== 200) {

final data= MyCoursesModel.fromJson(response.data);  
return data;
}

       } on SocketException {
      // ShowDialiogfn(context, "Check your network settings and try again",
      //     "Can't reacah the internet");
          return ;
    } on TimeoutException {
      // ShowDialiogfn(context, "Check your network settings and try again",
      //     "Can't reacah the internet");
          return ;
    } on DioError {
      // ShowDialiogfn(context, "Check your network settings and try again",
      //     "Can't reacah the internet");
          return;
    } catch (e) {
      
   
      // ShowDialiogfn(context, "Check your network settings and try again",
      //     "Can't reacah the interen");
            return ;
    }
}

 }