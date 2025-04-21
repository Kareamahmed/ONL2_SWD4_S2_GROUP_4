import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:striky/core/constants/container_decoration.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';

class ScheduleContainer extends StatelessWidget {
  const ScheduleContainer({
    super.key,
    required this.time,
    required this.date,
    required this.onTap,
  });

  final String time;
  final String date;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 60,
          width: MediaQuery.sizeOf(context).width,
          decoration: ContainerDecoration.kContainerwaterDecoration
              .copyWith(borderRadius: BorderRadius.circular(20)),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(kCalendar),
            ),
            Text(
              'Schedule Workout',
              style: TextFonts.kdarkgrayfont14.copyWith(fontSize: 12),
            ),
            Spacer(),
            Text(
              '$date, $time',
              style: TextFonts.kdarkgrayfont14.copyWith(fontSize: 12),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_forward_ios,
                color: kstandardgrey,
                size: 15,
              ),
            )
          ])),
    );
  }
}
