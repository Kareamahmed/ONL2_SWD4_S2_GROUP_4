import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:striky/controllers/photo/photo_controller.dart';
import 'package:striky/core/constants/global_constants.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final photocontroller = Get.put(PhotoController());
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isCameraReady = false;
  int _selectedCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    availableCameras().then((cameras) {
      _cameras = cameras;
      if (_cameras!.isNotEmpty) {
        _cameraController =
            CameraController(_cameras![0], ResolutionPreset.high);
        _cameraController!.initialize().then((_) {
          setState(() {
            _isCameraReady = true;
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraReady) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [
        SizedBox.expand(child: CameraPreview(_cameraController!)),
        Positioned(
          top: 30,
          left: 20,
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    kgradiantColor2,
                    kgradiantColor1,
                  ])),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.close_rounded),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Obx(() {
            // Make sure you're observing reactive variables
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.bottomCenter,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      // Toggle flash
                      photocontroller.toggleFlash();
                      if (photocontroller.isFlashOn.value) {
                        _cameraController!.setFlashMode(FlashMode.torch);
                      } else {
                        _cameraController!.setFlashMode(FlashMode.off);
                      }
                    },
                    icon: Icon(
                      photocontroller.isFlashOn.value
                          ? Icons.flash_on
                          : Icons.flash_off,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      try {
                        if (_cameraController != null &&
                            _cameraController!.value.isInitialized) {
                          final image = await _cameraController!.takePicture();
                          photocontroller.takeAPic(File(image.path));
                        }
                      } catch (e) {
                        debugPrint('Error while taking picture: $e');
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          kgradiantColor2,
                          kgradiantColor1,
                        ]),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          kcameraicon,
                          colorFilter:
                              ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_cameras != null && _cameras!.isNotEmpty) {
                        _selectedCameraIndex =
                            (_selectedCameraIndex + 1) % _cameras!.length;

                        await _cameraController?.dispose();

                        _cameraController = CameraController(
                          _cameras![_selectedCameraIndex],
                          ResolutionPreset.high,
                        );

                        await _cameraController!.initialize();
                        setState(() {});
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        kcameraswitcher,
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
