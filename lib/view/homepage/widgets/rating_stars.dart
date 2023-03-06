import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  const Stars({super.key, required this.count,});
final int count;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*count*0.05,
      height: 30,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Icon(
              Icons.star,
              color: Color.fromARGB(255, 224, 177, 35),
              size: 20,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: .6,
            );
          },
          itemCount: count),
    );
  }
}
