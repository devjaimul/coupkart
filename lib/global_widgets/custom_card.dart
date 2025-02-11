import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String img;
  final String title;
  final String name;
  final String save;
  const CustomCard({
    super.key, required this.img, required this.title, required this.name, required this.save,
  });

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(sizeH * .008),
      child: Container(
        padding: EdgeInsets.all(sizeH * .015),
        width: sizeW * .5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 2),
              blurRadius: 5,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          spacing: sizeH * .01,
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  // border: Border.fromBorderSide(BorderSide(color: Colors.black))
                ),
                child: Image(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                  height: sizeH*.2,
                )),
            CustomTextOne(
              text: title,
              textAlign: TextAlign.start,
              fontSize: sizeH * .016,
              textOverflow: TextOverflow.ellipsis,
              maxLine: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: CustomTextOne(
                    text: name,
                    fontSize: sizeH * .013,
                    textOverflow: TextOverflow.ellipsis,
                    color: AppColors.textColor,
                    maxLine: 1,
                  ),
                ),
                Expanded(
                  child: CustomTextOne(
                    text: "Save  \$$save",
                    fontSize: sizeH * .013,
                    color: AppColors.primaryColor,
                    textOverflow: TextOverflow.ellipsis,
                    maxLine: 1,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}