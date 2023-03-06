// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously
import 'dart:async';
import 'dart:developer';
import 'package:open_file/open_file.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/const/widgets/snackbar.dart';
import 'package:logo_e_learning/model/mycourses.dart';
import 'package:logo_e_learning/servies/my_learnings.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';

class MyLearningsController extends ChangeNotifier {
  bool _loading = false;
  bool _error = false;
  bool get error => _error;
  bool get loading => _loading;
  List<MyCoursesModel> myCourses = [];
String? videio_name;
int? selectedSectionindex;
  double process = 0.0;
  bool _video_paused=false;
  bool get video_poused=>_video_paused;

  MyLearningsModules() async {
    _loading = true;
    _error = false;
    notifyListeners();
    final data = await MyLearningServices().getMycourses();
    if (data == null) {
      _loading = false;
      _error = true;
      notifyListeners();
    } else {
      log("my learning set");
      myCourses.add(data);
      _loading = false;
      notifyListeners();
    }
  }

//--videoTitile name in the top==>
tackvideo_name(String name){
  videio_name=name;
notifyListeners();
}
setselectedindex(int index){
  selectedSectionindex=index;
  notifyListeners();
}
//---dowloadingPath provide->

  Future<String> _path(String path) async {
    final downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
    return "${downloadsDirectory!.path}/$path";
  }

//-dowloading notes--->
  Future downloadNotes(String link, BuildContext context) async {
    try {
    var  status = await Permission.storage.request();
      if (status.isGranted) {
        showDialog(
          builder: (context) {
            return AlertDialog(
              content: SizedBox(
                height: 80,
                child: Column(
                  children: [
                    Ktext(text: "Dowloading", color: kblack, size: 20),
                    const Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            );
          },
          context: context,
        );

        Dio dio = Dio();
        String path = await _path("note.pdf");
        await dio.download(
          link,
          path,
          onReceiveProgress: (count, total) {
            process = count / total;
            notifyListeners();
            log("${process * 100}------------------");
            if (process * 100 == 100.0) {
              showSnackBar("Note downloaded", Colors.green, context);
              log(path);
              OpenFile.open(path);
            }
          },
          deleteOnError: true,
        ).then((value) => Navigator.pop(context));
      } else {
        log("Permission denied");
      }
    } catch (e) {
      log(e.toString());
    }
    log("${process * 100}------------------");
  }


//--pouse&play video-->
pouse$play(bool v ){
  _video_paused=v;
  notifyListeners();

}



  Future<void> requestPermission(context) async {
    final status = await Permission.storage.request();
    if (status.isDenied) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Permission Required'),
          content: const Text(
              'Please grant permission to access storage in order to download the file.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Permission.storage.request();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
}

}
