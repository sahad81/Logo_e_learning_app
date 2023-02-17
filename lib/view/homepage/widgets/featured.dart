// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names

import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logo_e_learning/const/strings.dart';

import 'package:logo_e_learning/controllers/controller_vishllist.dart';
import 'package:logo_e_learning/controllers/provider_courses.dart';
import 'package:logo_e_learning/const/colors.dart';
import 'package:logo_e_learning/const/kwidgets.dart';
import 'package:logo_e_learning/view/homepage/widgets/all_course_widget.dart';
import 'package:logo_e_learning/view/homepage/widgets/mobile_develiopment_widget.dart';

import 'package:logo_e_learning/view/homepage/widgets/recommended_for_you_widget.dart';

import 'package:provider/provider.dart';


import '../../../const/widgets/conncetion_error_widget.dart';
import '../../../const/widgets/loading.dart';

class Featured extends StatelessWidget {
  const Featured({super.key});

  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size.height;
    return 

         Consumer<ProviderCoursess>(
          builder: (context, value, child) {
            
          
           return RefreshIndicator(
            child:value.loading == true ||
                    Provider.of<WishListP>(context).loading == true
                ? Center(
                    child: MyLoadingWidget(),
                  )
                : value.eroor == true ||
                        Provider.of<WishListP>(context).eroor == true
                    ? ConnnectionError(size1: size1)
                    : Container(
                        child: SingleChildScrollView(
                          child: Consumer(builder: (context, value1, child) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: size1 * 0.07,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Icon(
                                          Icons.account_circle,
                                          size: size1 * 0.06,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Ktext(
                                              text: "Wellcome, sahad",
                                              color: kblack,
                                              size: 16),
                                          Ktext(
                                              text: "set a dream career.",
                                              color: kblue,
                                              size: 16),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 220,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            "assets/lpa.jpg",
                                          ),
                                          fit: BoxFit.cover)),
                                ),
         
                                //---------------------------------------recommended for you--------------------------------------->
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Ktext(
                                      text: "Recommended for you",
                                      color: kblack,
                                      size: 20,
                                      weight: FontWeight.bold),
                                ),
         value.Recommended_For_You_List.isEmpty?
         const SizedBox():const RecommendedForYouWidget(),
                            
                                const SizedBox(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Ktext(
                                      text: "Categories",
                                      color: kblack,
                                      size: 20,
                                      weight: FontWeight.bold),
                                ),
         
                                //--------------------------------------------------------------------categories----------------------------->
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  width: double.infinity,
                                  child: 
                                   
                                     Wrap(
                                      spacing: 15,
                                      children: [
                                        ...List.generate(
                                            value.categoryList.length,
                                            (index) => Container(
                                                  child: ActionChip(
                                                    backgroundColor:
                                                        Colors.blue.shade100,
                                                    padding: EdgeInsets.all(8),
                                                    label: Text(value
                                                        .categoryList[index]
                                                        .toString()),
                                                    onPressed: () {
                                                      value.selectedcategory =
                                                          value.categoryList[index];
                                                      value.filter(context,
                                                          value.categoryList[index]);
                                                    },
                                                  ),
                                                ))
                                      ],
                                    
                                  ),
                                ),
         
                                //--------------------------------------top mobile development courses---------------------->
                                Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Top courses in ',
                                        style: GoogleFonts.poppins(
                                            color: Colors.black, fontSize: 27),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Mobile Development',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: kblue)),
                                        ],
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child:value.MobileDevelopment.isEmpty
                                        ? const SizedBox()
                                        : const MobileDevelopmentWidget()),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Ktext(
                                      text: "All courses",
                                      color: kblack,
                                      size: 20,
                                      weight: FontWeight.bold),
                                ),
         
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: context
                                      .read<ProviderCoursess>()
                                      .allCourse
                                      .length,
                                  itemBuilder: (context, index) {
                                    final values =value.allCourse[index];
         
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: AllCourseWidget(
                                        id: values.id!,
                                        indru: values.modules!,
                                        discription:
                                            values.description.toString(),
                                        language: "english",
                                        teacher: values.teacher.toString(),
                                        img:
                                            "http://$ipadressimg:3000/${values.imgPath.toString()}",
                                        price: values.price.toString(),
                                        offerprice: "500",
                                        rating: "4.4",
                                        ratingcount: "200",
                                        course_titile: values.title.toString(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
            onRefresh: () {
              return value.GetAllCourses(context);
            },
                 );
       }     );
 
  }
}
