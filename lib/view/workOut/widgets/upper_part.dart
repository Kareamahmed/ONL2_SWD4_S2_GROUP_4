import 'package:flutter/material.dart';
import 'package:striky/view/workOut/widgets/chart.dart';
import 'package:striky/view/workOut/widgets/data_demonstrator.dart';

class UpperPart extends StatefulWidget {
  const UpperPart({
    super.key,
  });

  @override
  State<UpperPart> createState() => _UpperPartState();
}

class _UpperPartState extends State<UpperPart> {
  bool visible = true;
  @override
  void initState() {
    visible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
            onTap: () {
                setState(() {
                  visible = !visible;
                });
              },
          child: Stack(
                children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Chart(),
          ),
          Visibility(
            visible: visible,
            child: DataDemonstrator()),
                ],
              ),
        ));
  }
}
