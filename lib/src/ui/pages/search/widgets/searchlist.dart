import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/src/const/colors.dart';
import 'package:logo_e_learning/src/const/kwidgets.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight15,
        Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(6),
                  child: Items(
                      imagename:
                          "https://blog.logrocket.com/wp-content/uploads/2022/04/Progressive-image-loading-React-tutorial.png",
                      moviename: "React full course"),
                ),
                separatorBuilder: (context, index) => SizedBox(),
                itemCount: 10))
      ],
    );
  }
}

// ignore: must_be_immutable
class Items extends StatelessWidget {
  String moviename;
  String imagename;
  Items({super.key, required this.imagename, required this.moviename});

  @override
  Widget build(BuildContext context) {
    final sizer = MediaQuery.of(context).size.width;
    return Row(children: [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          width: sizer * 0.35,
          height: 70,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imagename))),
        ),
      ),
      Expanded(
          child: Text(
        moviename,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
      )),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
            backgroundColor: kwite,
            radius: 23,
            child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 20,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.play_arrow_rounded, color: kwite)))),
      )
    ]);
  }
}
