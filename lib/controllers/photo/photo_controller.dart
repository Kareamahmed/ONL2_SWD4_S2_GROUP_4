import 'package:get/get.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:typed_data';

class PhotoController extends GetxController {
  var photos = <File>[].obs;
  RxBool isFlashOn = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadPics(); 
  }



// Future<void> savePicToGallery(File imageFile) async {
//   try {
//     final bytes = await imageFile.readAsBytes(); // Read the file as bytes

//     final result = await ImageGallerySaver.saveImage(
//       Uint8List.fromList(bytes),
//       quality: 100,
//       name: "MyApp_${DateTime.now().millisecondsSinceEpoch}"
//     );

//     if (result['isSuccess']) {
//       Get.snackbar('Success', 'Image saved to Gallery');
//     } else {
//       Get.snackbar('Error', 'Failed to save image');
//     }
//   } catch (e) {
//     print('Error saving image to gallery: $e');
//   }
// }


  Future<void> takeAPic(File newPic) async {
    final appDir = await getApplicationDocumentsDirectory();
    final galleryDir = Directory(path.join(appDir.path, 'gallery'));

    if (!await galleryDir.exists()) {
      await galleryDir.create(recursive: true);
    }

    final String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final savedImage = await newPic.copy('${galleryDir.path}/$fileName');

    photos.insert(0, savedImage);
    await loadPics(); 
  }




Future<void> deleteAPic(File pic) async {
  try {
    await pic.delete();  
    photos.remove(pic);  
  } catch (e) {
    print('Error deleting photo: $e');  
  }
}




  Future<void> loadPics() async {
    final Directory appDir = await getApplicationDocumentsDirectory();
    final Directory galleryDir = Directory(path.join(appDir.path, 'gallery'));

    if (await galleryDir.exists()) {
      final List<FileSystemEntity> files = galleryDir.listSync();
      photos.value = files
          .where((file) => file.path.endsWith('.jpg'))
          .map((file) => File(file.path))
          .toList();
    } else {
      photos.clear();
    }
  }


  
  void toggleFlash() {
    isFlashOn.value = !isFlashOn.value;  
  }

}
