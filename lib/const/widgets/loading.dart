import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The background of the loading screen
        Container(
          color: Colors.white,
        ),
        // The Shimmer effect
        Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: 150.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}