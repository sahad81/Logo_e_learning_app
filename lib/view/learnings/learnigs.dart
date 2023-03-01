
import 'package:flutter/material.dart';

import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';

import 'package:logo_e_learning/const/widgets/cart_bn.dart';
import 'package:logo_e_learning/const/widgets/conncetion_error_widget.dart';
import 'package:logo_e_learning/controllers/my_learning_controller.dart';
import 'package:logo_e_learning/model/mycourses.dart';
import 'package:logo_e_learning/view/learnings/My_learnings/parcahsed_courses.dart';

import 'package:provider/provider.dart';

import '../../const/strings.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwite,
        title: Ktext(text: "My courses", color: kblack, size: size1 * 0.0275),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CartBtn(),
          )
        ],
      ),
      body: Consumer<MyLearningsController>(builder: (context, value, child) {
        return value.loading == true
            ? const Center(child: CircularProgressIndicator())
            : value.error == true
                ? const ConnnectionError()
                : RefreshIndicator(
                    onRefresh: () {
                      return value.MyLearningsModules();
                    },
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        CourseDetail data = value
                            .myCourses[0].courses![0].courseDetails![index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      //Twxt1(modules: data.modules!)
                                      Curriculem(
                                        modules: data.modules!,
                                        img:
                                            "http://$ipadressimg:3000/${data.imgPath.toString()}",
                                      )));
                            },
                            leading: Container(
                              height: size1 * 0.04,
                              width: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "http://$ipadressimg:3000/${data.imgPath.toString()}"),
                                      fit: BoxFit.cover)),
                            ),
                            title: Text(
                              data.title.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(data.teacher.toString()),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text("${data.modules!.length} module")
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: value.myCourses[0].courses!.length,
                    ),
                  );
      }),
    );
  }
}
