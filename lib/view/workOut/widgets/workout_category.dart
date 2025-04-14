import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:striky/core/constants/container_decoration.dart';
import 'package:striky/core/constants/global_constants.dart';

class WorkoutCategory extends StatelessWidget {
  final String image;
  final String name;
  final String additionalText;
  final Function? onpress;

  const WorkoutCategory({
    super.key,
    required this.image,
    required this.name,
    this.onpress,
    this.additionalText = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: ContainerDecoration.kFloatingContainerDecoration,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SvgPicture.asset(image),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(name, style: TextStyle(fontSize: 17)),
            ),
            Spacer(),
            if (additionalText.isNotEmpty)
              Flexible(
                child: Text(
                  additionalText,
                  style: TextStyle(fontSize: 14, color: klightgrey),
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            IconButton(
              onPressed: () {
                if (onpress != null) {
                  onpress!();
                }
              },
              icon: Icon(Icons.arrow_forward_ios, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
