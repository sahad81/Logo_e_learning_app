
import 'package:flutter/material.dart';
import 'package:logo_e_learning/controllers/bottom_nav_controller.dart';
import 'package:provider/provider.dart';


class BottomNavigationScreen extends StatelessWidget {
const   BottomNavigationScreen({super.key});




  @override
  Widget build(BuildContext context) {
    final value=Provider.of<BottomNavController>(context);
    return Scaffold(
      body: value.page[value.currentIndex],
      bottomNavigationBar: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
        child: SizedBox(
          height: 60,
          width: double.infinity,
          child: ListView.builder(
            itemCount: value.icons.length,
            itemBuilder: (ctx, i) => 
            GestureDetector(
              onTap: () {
               value.selectecdIndexUpdate(i);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: MediaQuery.of(context).size.width * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                    value.  icons[i],
                        size: 25,
                        color:
                            i ==value.selectedIndex ? Colors.black : Colors.white),
                    Text(
                    value.items[i],
                      style: TextStyle(
                        color: i ==  value.selectedIndex ? Colors.black : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
