import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/utils/app_colors.dart';
import 'package:coup_kart/utils/app_icons.dart';
import 'package:coup_kart/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    CircularProgressIndicator(),
    CircularProgressIndicator(),
    CircularProgressIndicator(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.transparent, // Transparent background to show the container color
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor, // Color of selected item
          unselectedItemColor: Colors.grey, // Color of unselected items
          selectedLabelStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
          showSelectedLabels: false, // Hide the text labels
          showUnselectedLabels: false, // Hide the text labels
          items: [
            _buildNavItem(
              index: 0,
              icon: AppIcons.home,
              selectedIcon: AppIcons.homeFill,
              label: "Home",
            ),
            _buildNavItem(
              index: 1,
              icon: AppIcons.explore,
              selectedIcon: AppIcons.exploreFill,
              label: "Explore",
            ),
            _buildNavItem(
              index: 2,
              icon: AppIcons.favourite,
              selectedIcon: AppIcons.favouriteFill,
              label: "Favourite",
            ),
            _buildNavItem(
              index: 3,
              icon: AppIcons.profile,
              selectedIcon: AppIcons.profileFill,
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required int index,
    required String icon,
    required String selectedIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Container(

        decoration: BoxDecoration(
          color: _selectedIndex == index ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                _selectedIndex == index ? selectedIcon : icon,
                height: 20.h,
                  width: 20.w,
              ),

              if (_selectedIndex == index)
                Padding(
                  padding:  EdgeInsets.only(top: 2.h),
                  child: CustomTextTwo(text: label,color: Colors.white,),
                ),
            ],
          ),
        ),
      ),
      label: "",
    );
  }
}
