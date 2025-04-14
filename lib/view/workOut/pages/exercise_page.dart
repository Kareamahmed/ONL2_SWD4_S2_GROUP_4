import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:striky/core/constants/container_decoration.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/view/myPhotos/widgets/custom_appBar.dart';
import 'package:striky/view/workOut/widgets/custom_stepper.dart';
import 'package:striky/view/workOut/widgets/desc_widget.dart';
import 'package:striky/view/workOut/widgets/double_text.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          title: '',
          onpressed1: () {
            GoRouter.of(context).pop();
          },
          onpressed2: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                  decoration: ContainerDecoration.kContainerwaterDecoration
                      .copyWith(color: Color(0xff697fb2)),
                  height: 150,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(kfullbodyimg),
                      SvgPicture.asset(kplay),
                    ],
                  )),
            ),
        
            SliverToBoxAdapter(
                              child: ListTile(
                                title: Text(
                                  'Jamping Jack ',
                                  style: TextFonts.kdarkboldfont16,
                                ),
                                subtitle: Text(
                                  'Easy  | 320 Calories Burn',
                                  style: TextFonts.kdarkgrayfont14,
                                ),
                              )
                            ),
                            SliverToBoxAdapter(
                              child: DescWidget(desc:'A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide Read A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide Read',)
                            ),
                            SliverToBoxAdapter(
                              child: DoubleText(text1: 'How To Do It', text2: '5 Steps'),
                            ),
                            SliverToBoxAdapter(
                              child: CustomStepper(),
                            )
          ],
        ),
      ),
      
    );
  }
}
