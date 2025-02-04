import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/app_images.dart';

class AppLogo extends StatelessWidget {
  final String? img;
  final double? height;

  const AppLogo({
    super.key, this.img, this.height,
  });

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return Container(
      height: sizeH * 0.36,
      width: sizeW * 1,
      decoration: BoxDecoration(
        color: const Color(0xFF53A6A6),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: sizeH*.1),
          child: SvgPicture.asset(
            img??AppImages.appLogo,

          ),
        )
      ),
    );
  }
}
