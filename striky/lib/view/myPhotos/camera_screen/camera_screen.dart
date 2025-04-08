import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:striky/core/constants/global_constants.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isCameraReady = false;
  int _selectedCameraIndex = 0;
  bool _isflashon = false;

  @override
  void initState() {
    super.initState();
    _isflashon = false;
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

  Future<void> initCamera() async {
    _cameras = await availableCameras();
    if (_cameras!.isNotEmpty && _cameras != null) {
      _cameraController = CameraController(_cameras![0], ResolutionPreset.high);
      await _cameraController!.initialize();
      setState(() {
        _isCameraReady = true;
      });
    }
  }

Future<void> _takeaPic() async {
  if (!_cameraController!.value.isInitialized) return;

  final XFile file = await _cameraController!.takePicture();
  final appdir = await getApplicationDocumentsDirectory();
  
  final gallaryDir = Directory(path.join(appdir.path, 'gallary'));

  if (!await gallaryDir.exists()) {
    await gallaryDir.create(recursive: true);
  }

  final String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
  final savedImage = await File(file.path).copy('${gallaryDir.path}/$fileName');

  print('Photo saved permanently at: ${savedImage.path}');
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
    return Stack(children: [
      SizedBox.expand(child: CameraPreview(_cameraController!)),
      Positioned(
        top: 30,
        left: 20,
        child: GestureDetector(
                onTap:(){
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
                      child: Icon(
                        Icons.close_rounded,)
                    )),
              ),
      ),
      Positioned(
        bottom: 10,
        left: 10,
        right: 10,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          alignment: Alignment.bottomCenter,
          width: MediaQuery.sizeOf(context).width,
           decoration:  BoxDecoration(
             color:Colors.white.withValues(green: .5, blue: 0.5,red:  0.5,alpha:  0.7),
             borderRadius: BorderRadius.circular(35),
           ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _isflashon = !_isflashon;
                    _cameraController!.setFlashMode(
                        _isflashon ? FlashMode.torch : FlashMode.off);
                  });
                },
                icon: _isflashon
                    ? const Icon(Icons.flash_on, color: Colors.white)
                    : const Icon(Icons.flash_off,color: Colors.white,),
              ),
              GestureDetector(
                onTap: _takeaPic,
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          kgradiantColor2,
                          kgradiantColor1,
                        ])),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        kcameraicon,
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        height: 40,
                        width: 40,
                      ),
                    )),
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
        ),
      ),
    ]);
  }
}
