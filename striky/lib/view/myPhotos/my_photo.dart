import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:striky/core/constants/container_decoration.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:striky/view/myPhotos/widgets/custom_icon_container.dart';
import 'package:striky/view/myPhotos/widgets/custom_purple_button.dart';

class MyPhoto extends StatefulWidget {
  const MyPhoto({super.key});

  @override
  State<MyPhoto> createState() => _MyPhotoState();
}

class _MyPhotoState extends State<MyPhoto> {
  late Future<List<File>> futureFiles;

  @override
  void initState() {
    super.initState();
    futureFiles = _loadpics();
  }

  Future<List<File>> _loadpics() async {
    final Directory appdir = await getApplicationDocumentsDirectory();
    final Directory gallaryDir = Directory(path.join(appdir.path, 'gallary'));
    if (await gallaryDir.exists()) {
      final List<FileSystemEntity> files = gallaryDir.listSync();
      return files
          .where((file) => file.path.endsWith('.jpg'))
          .map((file) => File(file.path))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Progress Photo',
          style: TextFonts.kdarkboldfont16,
        ),
        backgroundColor: Colors.white,
        leading: CustomIconContainer(
          child: Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: Colors.black87),
          onpressed: () {
            GoRouter.of(context).pop();
          },
        ),
        actions: [
          CustomIconContainer(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: SvgPicture.asset(ktwodots),
            ),
            onpressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(10),
              height: 150,
              width: double.infinity,
              decoration: ContainerDecoration.kContainerwaterDecoration,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Track Your Progress Each Month With ',
                                  style: TextFonts.kdarkboldfont16,
                                ),
                                TextSpan(
                                  text: 'Photo',
                                  style: TextFonts.kdarkboldfont16.copyWith(color: kprimaryColor),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomPurpleButton(
                                text: 'Learn More',
                                onpressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SvgPicture.asset(kprogressimg),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.all(10),
                height: 100,
                width: double.infinity,
                decoration: ContainerDecoration.kContainerwaterDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Compare my Photo',
                        style: TextFonts.kdarkboldfont16,
                      ),
                      CustomPurpleButton(
                        text: 'Compare',
                        onpressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                trailing: GestureDetector(
                  onTap: () => GoRouter.of(context).push(AppRoutes.camerascreen),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: kprimaryColor,
                    child: SvgPicture.asset(
                      kcameraicon,
                      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                ),
                title: Text(
                  'Gallary',
                  style: TextFonts.kdarkboldfont16,
                ),
                subtitle: Text(
                  'See more',
                  style: TextFonts.kgraynormalfont12,
                ),
              ),
            ),
          ),
          FutureBuilder<List<File>>(
            future: futureFiles,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Center(child: Text('Error: ${snapshot.error}')),
                );
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return SliverToBoxAdapter(
                  child: Center(child: Text('No photos available.')),
                );
              }

              final images = snapshot.data!;

              return SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final image = images[index];
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.file(
                            image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: images.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
