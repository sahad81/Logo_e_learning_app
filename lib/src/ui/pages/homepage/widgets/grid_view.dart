import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/src/const/colors.dart';
import 'package:logo_e_learning/src/const/kwidgets.dart';
import 'package:logo_e_learning/src/ui/pages/homepage/widgets/rating_stars.dart';

class GridViewCard extends StatelessWidget {
  GridViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size1 = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomRight,
        colors: [Colors.white, Colors.blueGrey],
      )),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: GridView.count(
          mainAxisSpacing: 1,
          childAspectRatio: 2/2.8,
          crossAxisSpacing: 1,
          shrinkWrap: true,
          crossAxisCount: 2,
          children: List.generate(10, (index) => const MAincard()),
        ),
      ),
    );
  }
}

class MAincard extends StatelessWidget {
  const MAincard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
   clipBehavior: Clip.hardEdge,
  shape: RoundedRectangleBorder(
  		borderRadius: BorderRadius.circular(10),),
      child: Container(
      
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
            color: Colors.grey.shade300,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.17,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://blog.logrocket.com/wp-content/uploads/2021/06/Building-card-widget-Flutter.jpg",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Ktext(text: "Full Flutter course", color: kblack, size: 15),
                    Row(
                      children: const [
                        Text("5.5"),
                        SizedBox(
                          width: 6,
                        ),
                        Stars(),
                        Expanded(
                            child: Ktext(
                                text: "(2000)",
                                color: Color.fromARGB(255, 241, 216, 138),
                                size: 13))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: const [
                          Text(
                            '₹490',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' ₹600',
                            style: TextStyle(
                                fontSize: 14,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey),
                          ),
                        ]),
                        // SizedBox(width: MediaQuery.of(context).size.width*0.035,),
                        Container(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    CupertinoIcons.heart,
                                    size: 27,
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      CupertinoIcons.shopping_cart,
                                      size: 27,
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
