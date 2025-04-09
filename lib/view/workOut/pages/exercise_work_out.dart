import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:striky/core/constants/container_decoration.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/view/workOut/widgets/custom_divider.dart';
import 'package:striky/view/workOut/widgets/defficulty_container.dart';
import 'package:striky/view/workOut/widgets/schedule_container.dart';
import 'package:striky/view/workOut/widgets/double_text.dart';
import 'package:striky/view/workOut/widgets/ex_gears.dart';
import 'package:striky/view/workOut/widgets/exercise_item.dart';


class ExerciseWorkOut extends StatelessWidget {
  const ExerciseWorkOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              kprimaryColor,
              kcolor3,
              kgradiantColor1,
              kgradiantColor2,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: SizedBox(height: 250, child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                       radius: 150,
                       backgroundColor: Colors.white12,
                      ),
                      SizedBox.expand(
                       
                        child: SvgPicture.asset(kfullbodyimg , fit: BoxFit.contain,)),
                    ],
                  ), ),
                ),
              ];
            },
            body: Container(
              decoration: ContainerDecoration.kContainerRoundedDecoration,
              child: Column(
                children: [
                  CustomDivider(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomScrollView(
                        slivers: [
                         
                          SliverToBoxAdapter(
                            child: ListTile(
                              title: Text(
                                'FullBody Workout',
                                style: TextFonts.kdarkboldfont16,
                              ),
                              subtitle: Text(
                                '11 Exercises | 25 min | 320 Calories Burn',
                                style: TextFonts.kdarkgrayfont14,
                              ),
                            )
                          ),
                          SliverToBoxAdapter(
                            child: Column(
                              children: [
                               ScheduleContainer( time: '09:00 AM', date: '5/27',onTap: () { },),
                               DefficultyContainer(defficulty: 'begginer', onTap: (){}),
                               
                              ],
                            ),
                          ),
                           SliverToBoxAdapter(
                            child: DoubleText(text1: 'You’ll Need', text2: '5 Items'),
                          ),
                           SliverToBoxAdapter(
                            child: SizedBox(
                              height: 180,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => ExGears(image: kbarbell,name:  'Barbell'),
                                 itemCount: 10,),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: DoubleText(text1: 'Exercises', text2: '3 Sets'),
                          ),
                          SliverToBoxAdapter(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => ExerciseItem(title: 'Warm up', subtitle: '12x', image: kfullbodyimg),
                               itemCount: 10,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
