import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:striky/presentation/cubits/auth/Pic_cubit/pic_cubit_cubit.dart';
import 'package:striky/presentation/view/auth/login/widgets/main_custom_button.dart';

class UploadPic extends StatefulWidget {
  const UploadPic({super.key});

  @override
  State<UploadPic> createState() => _UploadPicState();
}

class _UploadPicState extends State<UploadPic> {
  String? _userId;
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userId = prefs.getString(kshareduserId);
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _uploadPic(BuildContext context) {
    if (_userId == null) {
      Flushbar(
        message: 'User ID not found. Please log in again.',
        duration: const Duration(seconds: 3),
      ).show(context);
      return;
    }

    if (_selectedImage == null) {
      Flushbar(
        message: 'Please select an image.',
        duration: const Duration(seconds: 3),
      ).show(context);
      return;
    }

    context.read<PicCubitCubit>().setPic(_userId!, _selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: SvgPicture.asset(skipButton),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text('Upload your ', style: TextFonts.kwhiteboldfont25),
          Text('profile picture', style: TextFonts.kwhiteboldfont25),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: _pickImage,
            child: _selectedImage != null
                ? CircleAvatar(
                    radius: 60,
                    backgroundImage: FileImage(_selectedImage!),
                  )
                : SvgPicture.asset(kavatar),
          ),
          const SizedBox(height: 30),
          BlocConsumer<PicCubitCubit, PicCubitState>(
            listener: (context, state) {
              if (state is PicCubitSuccess) {
                Flushbar(
                  message: 'Profile picture uploaded successfully',
                  duration: const Duration(seconds: 3),
                ).show(context);

                GoRouter.of(context).push(AppRoutes.navigationButtomBarPage);
              } else if (state is PicCubitFailure) {
                Flushbar(
                  message: state.errMsg,
                  duration: const Duration(seconds: 3),
                ).show(context);
              }
            },
            builder: (context, state) {
              if (state is PicCubitLoading) {
                return const CircularProgressIndicator();
              }

              return MainCustomButton(
                title: 'Upload',
                onPressed: () => _uploadPic(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
