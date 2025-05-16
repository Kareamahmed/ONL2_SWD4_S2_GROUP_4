import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/presentation/cubits/auth/setInfo/setinfo_cubit.dart';
import 'package:striky/presentation/view/auth/set_info/widgets/age_input_field.dart';
import 'package:striky/presentation/view/auth/set_info/widgets/gender_selector.dart';
import 'package:striky/presentation/view/auth/set_info/widgets/height_picker.dart';
import 'package:striky/presentation/view/auth/set_info/widgets/weight_picker.dart';
import 'package:striky/presentation/view/auth/set_info/widgets/next_button.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:go_router/go_router.dart';

class SetInfo extends StatefulWidget {
  const SetInfo({super.key, required this.goal});
  final String goal;

  @override
  State<SetInfo> createState() => _SetInfoState();
}

class _SetInfoState extends State<SetInfo> {
  int _selectedWeight = 0;
  int _selectedHeight = 0;
  bool isMale = true;
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('Goal: ${widget.goal}');
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                SvgPicture.asset(kcompleteprofile),
                Text('Let’s complete your profile',
                    style: TextFonts.kwhiteboldfont25.copyWith(fontSize: 22)),
                Text('It will help us to know more about you!',
                    style: TextFonts.kwhitenormalfont12),
                GenderSelector(
                  isMale: isMale,
                  onChanged: (value) => setState(() => isMale = value),
                ),
                AgeInputField(controller: ageController),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HeightPicker(
                    selectedHeight: _selectedHeight,
                    onHeightSelected: (value) =>
                        setState(() => _selectedHeight = value),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: WeightPicker(
                    selectedWeight: _selectedWeight,
                    onWeightSelected: (value) =>
                        setState(() => _selectedWeight = value),
                  ),
                ),
                BlocConsumer<SetinfoCubit, SetinfoState>(
                  listener: (context, state) {
                    if (state is SetinfoSuccess) {
                      GoRouter.of(context).push(AppRoutes.uploadPic);
                    } else if (state is SetinfoFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errMsg)),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is SetinfoLoading) {
                      return CircularProgressIndicator(color: Colors.white);
                    }

                    // Show button for all other states (Success or Initial)
                    return NextButton(
                      goal: widget.goal,
                      isMale: isMale,
                      ageController: ageController,
                      height: _selectedHeight,
                      weight: _selectedWeight,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
