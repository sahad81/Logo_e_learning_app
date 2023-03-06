import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    required this.titleText,
  });
  final List<Module> modules;
  final String img;
  final String titleText;

  @override
  State<Curriculem> createState() => _CurriculemState();
//videoveriabels--->
  VideoPlayerController videoPlayerController =
      VideoPlayerController.network("");
  ValueNotifier<Future<void>?> videoFuture = ValueNotifier(null);
  ChewieController? chewiecontroller;

  Future<void> play(String url, context) async {
    if (url.isEmpty) return;
    if (videoPlayerController.value.isInitialized) {
      await videoPlayerController.dispose();
    }
    videoPlayerController = VideoPlayerController.network(url);

    // Add listener to detect when video is paused
    videoPlayerController.addListener(() {
      if (videoPlayerController.value.isPlaying == false &&
          videoPlayerController.value.isBuffering == false) {
        log('Paused');
        Provider.of<MyLearningsController>(context, listen: false)
            .pouse$play(true);
      }
    });

    // Add listener to detect when video is resumed
    videoPlayerController.addListener(() {
      if (videoPlayerController.value.isPlaying == true &&
          videoPlayerController.value.isBuffering == false) {
        log('Played');
        Provider.of<MyLearningsController>(context, listen: false)
            .pouse$play(false);
      }
    });

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
    Future.delayed(const Duration(microseconds: 2)).then((value) {
      data!.tackvideo_name("");
      data!.setselectedindex(-1);
    });
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
              Provider.of<MyLearningsController>(context).videio_name == ""
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        Provider.of<MyLearningsController>(context)
                            .videio_name
                            .toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            color: kblack,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Ktext(
                    text: "Curriculum",
                    color: Colors.blue,
                    size: 20,
                    weight: FontWeight.bold),
              ),
              const Divider(
                thickness: 1,
              ),
              Consumer<MyLearningsController>(
                builder: (context, value, child) {
                  return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 6, left: 20, right: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: value.selectedSectionindex == index
                                    ? Colors.blueAccent
                                    : Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ListTile(
                                trailing: value.selectedSectionindex == index
                                    ? Icon(
                                        value.video_poused
                                            ? Icons.pause_circle
                                            : Icons.play_circle,
                                        color: kblack,
                                      )
                                    : const SizedBox(),
                                title: Text(
                                  widget.modules[index].vidioTitle.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      color: value.selectedSectionindex == index
                                          ? kwite
                                          : kblack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                subtitle: InkWell(
                                    onTap: () {
                                      value.downloadNotes(
                                          "http://$ipadressimg:3000/${widget.modules[0].notesPath}",
                                          context);
                                    },
                                    child: Ktext(
                                        text: " Download notes",
                                        color:
                                            value.selectedSectionindex == index
                                                ? kblack
                                                : kblue,
                                        size: 10)),
                                onTap: () {
                                  value.setselectedindex(index);
                                  value.tackvideo_name(widget
                                      .modules[index].vidioTitle
                                      .toString());
                                  widget.videoFuture.value = widget.play(
                                      "http://$ipadressimg:3000/${widget.modules[index].vedioPath}",
                                      context);
                                },
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(),
                      itemCount: widget.modules.length);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
