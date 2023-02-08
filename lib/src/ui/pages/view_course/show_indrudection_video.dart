import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/strings.dart';
import 'package:validators/validators.dart';
import 'package:video_player/video_player.dart';

class ShowIndrudectionVideo extends StatefulWidget {
  ShowIndrudectionVideo({super.key, required this.url});

  final String url;
  @override
  State<ShowIndrudectionVideo> createState() => _ShowIndrudectionVideoState();
}

class _ShowIndrudectionVideoState extends State<ShowIndrudectionVideo> {
  ChewieController? _chewieController;
 late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    setState(() {
      log(widget.url);
    });
    _videoPlayerController = VideoPlayerController.network(
"$BaseUrl/${widget.url}");
    _videoPlayerController.initialize().then((value) {
      _chewieController =
          ChewieController(videoPlayerController: _videoPlayerController);
          setState(() {
            
          });
              });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController !.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: _chewieController != null && _videoPlayerController != null
          ? SizedBox(child: Chewie(controller: _chewieController!))
          : Text(
              "loading",
              style: TextStyle(color: kblack),
            ),
    ));
  }
}
