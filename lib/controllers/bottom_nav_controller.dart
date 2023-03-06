import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view/account/my_account.dart';
import '../view/homepage/homepage.dart';
import '../view/learnings/learnigs.dart';
import '../view/search/search_page.dart';
import '../view/wish_list/wishlist_page.dart';

class BottomNavController extends ChangeNotifier {
  int selectedIndex = 0;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  List<IconData> icons = [
    Icons.home,
    Icons.search,
    Icons.video_library_rounded,
    CupertinoIcons.heart,
    Icons.person
  ];
  List<String> items = [
    "Featured",
    "Search",
    "My learning",      
    "Wishlist",
    "Account"
  ];

  List<Widget> page = [
    const HomePage(),
    const Searchsreen(),
     const LearningPage(),
    const Wishlist(),
    const MyAccount()
  ];
  selectecdIndexUpdate(int index) {
    _currentIndex = index;
    selectedIndex = index;
    notifyListeners();
  }
  void selectedValue0 (){
    selectedIndex=0;
  _currentIndex=0;
      notifyListeners();
    
  }
}
