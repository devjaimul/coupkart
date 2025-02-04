import 'package:coup_kart/global_widgets/custom_text.dart';
import 'package:coup_kart/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    return Scaffold(

      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding:  EdgeInsets.all(sizeH*.016),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextOne(text: "Hello 👋"),
              CustomTextOne(text: "Henry Johnson",color: AppColors.primaryColor,),
            ],
          ),
        ),
      ),
    );
  }
}
