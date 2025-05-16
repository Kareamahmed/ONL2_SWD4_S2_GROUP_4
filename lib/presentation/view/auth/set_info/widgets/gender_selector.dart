import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:striky/core/constants/global_constants.dart';

class GenderSelector extends StatelessWidget {
  final bool isMale;
  final ValueChanged<bool> onChanged;

  const GenderSelector({
    super.key,
    required this.isMale,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: ['Male', 'Female'].map((gender) {
          final selected = (gender == 'Male') == isMale;
          return GestureDetector(
            onTap: () => onChanged(gender == 'Male'),
            child: Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: selected ? kprimaryColor : ksecondaryColor,
                border: Border.all(color: kprimaryColor, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SvgPicture.asset(
                      k2user,
                      colorFilter: ColorFilter.mode(
                        selected ? ksecondaryColor : kprimaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    gender,
                    style: TextStyle(
                      color: selected ? ksecondaryColor : kprimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
