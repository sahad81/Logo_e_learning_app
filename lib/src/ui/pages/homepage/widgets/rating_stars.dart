import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  const Stars({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
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
          itemCount: 5),
    );
  }
}
