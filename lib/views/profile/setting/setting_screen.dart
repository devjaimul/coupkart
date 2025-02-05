
import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/global_widgets/dialog.dart';
import 'package:coup_kart/routes/app_routes.dart';
import 'package:coup_kart/utils/app_colors.dart';
import 'package:coup_kart/views/profile/setting/about_screen.dart';
import 'package:coup_kart/views/profile/setting/change%20password/change_password.dart';
import 'package:coup_kart/views/profile/setting/privacy_policy_screen.dart';
import 'package:coup_kart/views/profile/setting/terms_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';




class SettingScreen extends StatelessWidget {

  const SettingScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: CustomTextOne(text: "Setting",fontSize: 18.sp,color: AppColors.textColor,),
      ),
      body: Padding(
        padding: EdgeInsets.all(sizeH * .008),
        child: Column(
          children: [
            _buildProfileOption(
              icon: Icons.lock,
              label: 'Change Password',
              onTap: () {
              Get.to(()=>const ChangePassword());
              },
            ),
            _buildProfileOption(
              icon: Icons.privacy_tip,
              label: 'Privacy Policy',
              onTap: () {
                Get.to(const PrivacyPolicyScreen());
              },
            ),
            _buildProfileOption(
              icon: Icons.info_outline,
              label: 'Terms & Services',
              onTap: () {
                Get.to(const TermsScreen());
              },
            ),
            _buildProfileOption(
              icon: Icons.help_outline,
              label: 'About Us',
              onTap: () {
                Get.to(const AboutScreen());
              },
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child:    _buildProfileOption(
                color: AppColors.primaryColor,
                icon: Icons.delete,
                textColor: Colors.white,
                iconColor: Colors.red,
                label: 'Delete Account',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => CustomDialog(
                      title: "Do you want to delete your account ?",
                      confirmButtonText: 'Delete',
                      confirmButtonColor: Colors.red,
                      onCancel: () {
                        // Handle Cancel Button Action
                        Get.back();
                      },
                      onConfirm: () {
                        // Handle Log Out Action
                        Get.offAllNamed(AppRoutes.signInScreen);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build the profile options
  Widget _buildProfileOption({
    required IconData icon,
    required String label,
    Color? color,
    Color? textColor,
    Color? iconColor,
    required VoidCallback onTap,
    Color borderColor = AppColors.primaryColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color:color,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            children: [
              SizedBox(width: 10.w),
              Icon(icon, color:iconColor??  AppColors.primaryColor.withOpacity(0.5), size: 20.h),
              SizedBox(width: 20.w),
              CustomTextTwo(text: label,color: textColor,),
              const Spacer(),
              Icon(Icons.arrow_forward_ios, color:AppColors.primaryColor.withOpacity(0.5 ), size: 18.h),
              SizedBox(width: 10.w),

            ],
          ),
        ),
      ),
    );
  }
}
