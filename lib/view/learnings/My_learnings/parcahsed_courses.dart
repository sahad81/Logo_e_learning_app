import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';

import 'package:logo_e_learning/controllers/my_learning_controller.dart';
import 'package:logo_e_learning/model/mycourses.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import '../../../const/strings.dart';

// ignore: must_be_immutable
class Curriculem extends StatefulWidget {
  Curriculem({
    super.key,
    required this.modules,
    required this.img,
  });
  final List<Module> modules;
  final String img;

  @override
  State<Curriculem> createState() => _CurriculemState();
//videoveriabels--->
  VideoPlayerController videoPlayerController =
      VideoPlayerController.network("");
  ValueNotifier<Future<void>?> videoFuture = ValueNotifier(null);
  ChewieController? chewiecontroller;

//videoPlaying------->
  Future<void> play(String url) async {
    if (url.isEmpty) return;
    if (videoPlayerController.value.isInitialized) {
      await videoPlayerController.dispose();
    }
    videoPlayerController = VideoPlayerController.network(url);
    return videoPlayerController.initialize().then((value) => {
          chewiecontroller = ChewieController(
              videoPlayerController: videoPlayerController, looping: true),
          videoPlayerController.play()
        });
  }
}

class _CurriculemState extends State<Curriculem> {
  MyLearningsController? data;
  @override
  void initState() {
    data = Provider.of<MyLearningsController>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.chewiecontroller != null) {
      widget.chewiecontroller!.dispose();
    }
    widget.videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.modules.toString());

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: 
 () {
   
 },
 
 child: const Icon(Icons.message),     
      ),
      // appBar: AppBar(
      //   backgroundColor: kwite,
      //   leading: const BackButton(
      //     color: Colors.black, // <-- SEE HERE
      //   ),
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder(
                valueListenable: widget.videoFuture,
                builder: (context, value, child) {
                  return AspectRatio(
                      aspectRatio: 16 / 9,
                      child: value == null
                          ? InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(widget.img))),
                              ),
                            )
                          : FutureBuilder(
                              future: value,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return SizedBox(
                                      height: 300,
                                      child: Chewie(
                                          controller:
                                              widget.chewiecontroller!));
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ));
                },
              ),
               Padding(
                padding: const EdgeInsets.all(6),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: const [
                    Ktext(text: "Curriculum", color: Colors.blue, size: 20,weight: FontWeight.bold),
                   
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 6,left: 10,right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: ListTile(
                          trailing: Icon(
                            Icons.play_circle,
                            color: kblack,
                          ),
                          title: Text(
                            widget.modules[index].vidioTitle.toString(),
                          ),
                          subtitle: InkWell(
                            onTap:() {
                               log("notes");
                              
                            },
                            child: Ktext(text: " Download notes", color:kblue, size: 10)),
                          onTap: () {
                            widget.videoFuture.value = widget.play(
                                "http://$ipadressimg:3000/${widget.modules[index].vedioPath}");
                                
                          },
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(),
                  itemCount: widget.modules.length)
            ],
          ),
        ),
      ),
    );
  }
}
