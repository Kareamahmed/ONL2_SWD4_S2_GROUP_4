import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:striky/view/auth/login/widgets/main_custom_button.dart';
import 'package:striky/view/auth/set_info/custom_info_fields.dart';
import 'package:wheel_picker/wheel_picker.dart';

class SetInfo extends StatefulWidget {
  const SetInfo({super.key});

  @override
  State<SetInfo> createState() => _SetInfoState();
}

class _SetInfoState extends State<SetInfo> {
  int _selectedWeight = 0;
  int _selectedHeight = 0;
  bool ismale = true;
  final _weightController = WheelPickerController(itemCount: 121);
  final _heightController = WheelPickerController(itemCount: 200);

  void _showWeightPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          color: ksecondaryColor,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Select Your Weight",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: WheelPicker(
                  controller: _weightController,
                  onIndexChanged: (index, value) {
                    setState(() {
                      print(_selectedWeight);
                      _selectedWeight = index + 30;
                    });
                  },
                  builder: (context, index) {
                    return Center(
                      child: Text("${index + 30} kg",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500)),
                    );
                  },
                  style: WheelPickerStyle(
                    itemExtent: 50,
                    squeeze: 1.2,
                    magnification: 1.3,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Confirm"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showHeightPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          color: ksecondaryColor,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Select Your Weight",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: WheelPicker(
                  controller: _heightController,
                  onIndexChanged: (index, value) {
                    setState(() {
                      print(_selectedHeight);
                      _selectedHeight = index + 30;
                    });
                  },
                  builder: (context, index) {
                    return Center(
                      child: Text("${index + 30} CM",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500)),
                    );
                  },
                  style: WheelPickerStyle(
                    itemExtent: 50,
                    squeeze: 1.2,
                    magnification: 1.3,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Confirm"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showGenderPicker(context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: ksecondaryColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                ismale = true;
                              });
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kprimaryColor,
                                  width: 2,
                                ),
                                color: ismale ? kprimaryColor : ksecondaryColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  Expanded(child: SvgPicture.asset(k2user,
                                   colorFilter:!ismale?ColorFilter.mode(
                                        kprimaryColor, BlendMode.srcIn): ColorFilter.mode(
                                        ksecondaryColor, BlendMode.srcIn),)),
                                  Text('Male',
                                    style: TextStyle(color: !ismale ? kprimaryColor : ksecondaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                ismale = false;
                              });
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: ismale ? ksecondaryColor : kprimaryColor,
                                border: Border.all(
                                  color: kprimaryColor,
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                      child: SvgPicture.asset(
                                    k2user,
                                    colorFilter:ismale?ColorFilter.mode(
                                        kprimaryColor, BlendMode.srcIn): ColorFilter.mode(
                                        ksecondaryColor, BlendMode.srcIn),
                                  )),
                                  Text(
                                    'Female',
                                    style: TextStyle(color: ismale ? kprimaryColor : ksecondaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]))
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: SvgPicture.asset(kcompleteprofile),
              ),
              Text(
                textAlign: TextAlign.center,
                'Let’s complete your profile',
                style: TextFonts.kwhiteboldfont25.copyWith(fontSize: 22),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'It will help us to know more about you!',
                  style: TextFonts.kwhitenormalfont12,
                ),
              ),
              CustomInfoFields(
                onpressed: () {
                  _showGenderPicker(context);
                },
                prefix: k2user,
                suffix: Icon(Icons.keyboard_arrow_down, color: klightgrey),
                title: 'Choose Gender',
              ),
              CustomInfoFields(
                onpressed: () {
                  showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      initialDate: DateTime.now());
                },
                prefix: kCalendar,
                title: 'Date of Birth',
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomInfoFields(
                      onpressed: () {
                        _showWeightPicker(context);
                      },
                      prefix: kweightScale,
                      title: _selectedWeight != 0
                          ? '$_selectedWeight KG'
                          : 'Your Weight',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SvgPicture.asset(kButtonKg),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomInfoFields(
                      onpressed: () {
                        _showHeightPicker(context);
                      },
                      prefix: kswap,
                      title: _selectedHeight != 0
                          ? '$_selectedHeight CM'
                          : 'Your Height',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SvgPicture.asset(kButtonCm),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MainCustomButton(
                  title: 'Next',
                  onPressed: () {
                    GoRouter.of(context).push(AppRoutes.setGoal);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}