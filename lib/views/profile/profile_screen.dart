
import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/global_widgets/dialog.dart';
import 'package:coup_kart/helpers/prefs_helper.dart';
import 'package:coup_kart/routes/app_routes.dart';
import 'package:coup_kart/utils/app_colors.dart';
import 'package:coup_kart/utils/app_constant.dart';
import 'package:coup_kart/utils/app_icons.dart';
import 'package:coup_kart/views/profile/profile_information.dart';
import 'package:coup_kart/views/profile/subscription/subscription_screen.dart';
import 'package:coup_kart/views/profile/support_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'setting/setting_screen.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;


    return Scaffold(
appBar: AppBar(),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: sizeH*.02,
          children: [
            Stack(
              fit: StackFit.loose,
              children: [
                Image.asset("assets/images/proicon.png",width: 140.w,height: 140.h,),
                Positioned(
                    top: 55.h,
                    right: 35.w,
                    child: CustomTextOne(text: "\$48.50",color: Colors.white,fontSize: sizeH*.03,))
              ],
            ),
            // Container(
            //
            //   height:sizeH*.16,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     border: Border.all(
            //       color: AppColors.primaryColor,
            //       width: 2.w,
            //     ),
            //   ),
            //   child: CircleAvatar(
            //       radius: sizeH*.1,
            //       backgroundColor: Colors.transparent,
            //
            //       child: Center(child: CustomTextOne(text: "\$48.50",color: AppColors.primaryColor,fontSize: sizeH*.03,)))
            // ),
        
            SizedBox(height: sizeH * .01),
            // Name
            CustomTextOne(
              text: "Total Saved",
            ),
        
        
        
            const Divider(
              thickness: 1,
              indent: 40,
              endIndent: 40,
            ),
            SizedBox(height: sizeH * .01),
            // Profile buttons
            _buildProfileOption(
              icon: Image.asset(AppIcons.person,height: 18.h),
              label: 'Profile Information',
              onTap: () async {
                await Get.to(()=> const ProfileInformation());
              },
            ),
            _buildProfileOption(
              icon: Image.asset(AppIcons.subscription,height: 18.h),
              label: 'Subscription',
              onTap: ()  {
          Get.to(()=> SubscriptionScreen());
              },
            ),
            _buildProfileOption(
              icon: Icon(Icons.support_agent,color: AppColors.primaryColor.withOpacity(0.6),),
              label: 'Support',
              onTap: ()  {
                Get.to( ()=>  SupportScreen());
              },
            ),
            _buildProfileOption(
              icon: Icon(Icons.settings_outlined,color: AppColors.primaryColor.withOpacity(0.5),size: 22.sp,),
              label: 'Settings',
              onTap: () {
                Get.to( ()=> const SettingScreen());
              },
            ),
        
        
            // Logout button
            _buildProfileOption(
              isTrue: true,
              icon: Icon(Icons.logout,color: AppColors.primaryColor.withOpacity(0.5),size: 22.sp,),
              label: 'Logout',
              iconColor: Colors.red,
              labelColor: Colors.red,
              borderColor: Colors.red,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog(
                      title: "Are you sure you want to \n LogOut ",
                      onCancel: () {
                    Get.back();
                      },
                      onConfirm: () async{
                        // Perform logout logic
                       Get.offAllNamed(AppRoutes.signInScreen);
                       await PrefsHelper.remove(AppConstants.isLogged);
                      },
                    );
                  },
                );
              },
        
            ),
        
          ],
        ),
      ),
    );
  }

  // Helper widget to build the profile options
  Widget _buildProfileOption({
    required Widget icon,
    required String label,
    required VoidCallback onTap,
    Color iconColor = Colors.white,
    Color labelColor = Colors.white,
    Color borderColor = Colors.white24,
    final bool? isTrue,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric( horizontal: 25.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
      decoration: BoxDecoration(
        color: AppColors.textFieldFillColor,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            children: [
              SizedBox(width: 10.w),
             icon,
              SizedBox(width: 20.w),
              CustomTextTwo(text: label),
              const Spacer(),
              isTrue == true
                  ? const Icon(null)
                  : Icon(Icons.arrow_forward_ios, color: AppColors.primaryColor.withOpacity(0.5), size: 20.h),
              SizedBox(width: 10.w),
            ],
          ),
        ),
      ),
    );
  }
  


}
