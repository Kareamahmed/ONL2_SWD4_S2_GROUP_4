
import 'package:flutter/material.dart';
import 'package:striky/view/home/widget/icon_button.dart' as custom;
import 'package:striky/view/profile/widgets/custom_switch.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome Back,', style: TextStyle(color: Colors.black54)),
            Row(
              children: [
                Text(
                  'Ana',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 270),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ],
            ),
            Row(
              children: [
               CustomSwitch(isOn: false, onToggle: (){}),
                SizedBox(width: 215),
                custom.IconButton(Icons.search),
                SizedBox(width: 10),
                custom.IconButton(Icons.notifications),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
        //SizedBox(height: 30,),
      ],
    );
  }
}
