import 'package:flutter/material.dart';
import 'package:striky/core/constants/global_constants.dart';

class MainCustomButton extends StatelessWidget {
  const MainCustomButton({
    super.key, required this.title, this.preIcon, this.postIcon,required this.onPressed,
  });

  final String title;
  final Widget? preIcon;
  final Widget? postIcon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kprimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: preIcon != null,
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 25,
                  width: 25,
                  child: preIcon,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: kprimaryfont,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
              Visibility(
                visible: postIcon != null,
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 25,
                  width: 25,
                  child: preIcon,
                ),
              ),
            ],
          ),
        ));
  }
}
