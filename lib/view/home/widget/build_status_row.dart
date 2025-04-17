
import 'package:flutter/widgets.dart';
import 'package:striky/view/home/widget/stat_card.dart';


class BuildStatusRow extends StatelessWidget {
  const BuildStatusRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: StatCard('Water Intake', '4 Liters')),
        const SizedBox(width: 10),
        Expanded(child: StatCard('Sleep', '8h 20m')),
      ],
    );
  }
}