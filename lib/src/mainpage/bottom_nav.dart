import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logo_e_learning/src/const/colors.dart';

ValueNotifier<int>indexnotifire=ValueNotifier(0);

class BottomNavigationwidget extends StatelessWidget {
   const BottomNavigationwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: indexnotifire, builder:(context,int newtab,_) {
   return BottomNavigationBar(
      currentIndex: newtab
,
onTap: (value) {
indexnotifire.value=value;
},
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blue.shade300,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      selectedIconTheme: const IconThemeData(
        color: Colors.white
      ),
      items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
      BottomNavigationBarItem(icon: Icon(Icons.video_library_rounded), label: "My Learning"),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: "Wishlist"),
      BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "account"),
    ]);
      
    },);
  }
}
