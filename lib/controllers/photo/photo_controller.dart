import 'package:get/get.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class PhotoController extends GetxController {
  var photos = <File>[].obs;
  RxBool isFlashOn = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadPics(); 
  }

  Future<void> takeAPic(File newPic) async {
    final appDir = await getApplicationDocumentsDirectory();
    final galleryDir = Directory(path.join(appDir.path, 'gallery'));

    if (!await galleryDir.exists()) {
      await galleryDir.create(recursive: true);
    }

    final String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final savedImage = await newPic.copy('${galleryDir.path}/$fileName');

    print('Photo saved permanently at: ${savedImage.path}');
    photos.insert(0, savedImage);
    await loadPics(); 
  }




Future<void> deleteAPic(File pic) async {
  try {
    await pic.delete();  // Delete the file from storage
    print('Deleted photo at: ${pic.path}');
    photos.remove(pic);  // Remove from the observable list
    print('Removed from observable list');  // Debugging line
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
