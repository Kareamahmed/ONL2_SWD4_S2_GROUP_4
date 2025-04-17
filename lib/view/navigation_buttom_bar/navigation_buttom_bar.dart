import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/view/analysis_screen/analysis_screen.dart';
import 'package:striky/view/home/home.dart';
import 'package:striky/view/myPhotos/my_photo.dart';
import 'package:striky/view/profile/profile.dart';
import 'package:striky/view/workOut/pages/work_out.dart';

class NavigationButtomBarPage extends StatefulWidget {
  const NavigationButtomBarPage({super.key});

  @override
  State<NavigationButtomBarPage> createState() => _NavigationButtomBarState();
}

class _NavigationButtomBarState extends State<NavigationButtomBarPage> {
  int _currentIndex = 0;
  PageController controller = PageController(initialPage: 0);

  List Pages = [
    Home(),
    AnalysisScreen(),
    WorkOut(),
    MyPhoto(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body:  PageView.builder(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: Pages.length,
            itemBuilder: (context, index) => Pages[index],
          ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, 
        backgroundColor: Colors.black,
        selectedItemColor: kselectedIconColor,
        unselectedItemColor: kunselectedIconColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            controller.jumpToPage(index);
          });
        },
        items:  [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(khomeactive,
            height: ( _currentIndex == 0)? 40 : 30,
            width: ( _currentIndex == 0)? 40 : 30, 
            colorFilter:   ColorFilter.mode( ( _currentIndex == 0)? kselectedIconColor : kunselectedIconColor, BlendMode.srcIn),),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(kactivity,
            height: ( _currentIndex == 1)? 40 : 30,
            width: ( _currentIndex == 1)? 40 : 30,
             colorFilter:   ColorFilter.mode( ( _currentIndex == 1)? kselectedIconColor : kunselectedIconColor, BlendMode.srcIn),),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(kgridicon,
            height: ( _currentIndex == 2)? 40 : 30,
            width: ( _currentIndex == 2)? 40 : 30,
                        colorFilter:   ColorFilter.mode( ( _currentIndex == 2)? kselectedIconColor : kunselectedIconColor, BlendMode.srcIn),
                        ),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(kcameraicon,
            height: ( _currentIndex == 3)? 40 : 30,
            width: ( _currentIndex == 3)? 40 : 30,  
              colorFilter:   ColorFilter.mode( ( _currentIndex == 3)? kselectedIconColor : kunselectedIconColor, BlendMode.srcIn),),

            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(kprofileicon,
            height: ( _currentIndex == 4)? 40 : 30,
            width: ( _currentIndex == 4)? 40 : 30,          
             colorFilter:   ColorFilter.mode( ( _currentIndex == 4)? kselectedIconColor : kunselectedIconColor, BlendMode.srcIn),),
            label: '',
          ),
        ],
      ),
    );
  }
}