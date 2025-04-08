import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:striky/view/auth/login/widgets/main_custom_button.dart';

class UploadPic extends StatelessWidget {
  const UploadPic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: SvgPicture.asset(skipButton),
        )],
      ),
      body: Column(
        children: [
          Text('Upload your ',style: TextFonts.kwhiteboldfont25,),
          Text('profile picture',style: TextFonts.kwhiteboldfont25,),
           SvgPicture.asset(kavatar)  ,
          MainCustomButton(title: 'Upload', onPressed: (){
            GoRouter.of(context).push(AppRoutes.navigationButtomBarPage);
          },),  

        ],
      ),
      
    );
  }
}