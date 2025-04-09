import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:striky/controllers/photo/photo_controller.dart';
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
  final PhotoController photoController = Get.put(PhotoController());

  @override
  void initState() {
    super.initState();
    photoController.loadPics();
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
          child: Icon(Icons.arrow_back_ios_new_rounded,
              size: 20, color: Colors.black87),
          onpressed: () {
            GoRouter.of(context).pop();
          },
        ),
        actions: [
          CustomIconContainer(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: SvgPicture.asset(
                ktwodots,
              ),
            ),
            onpressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Container(
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
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'Track Your Progress Each Month With ',
                                style: TextFonts.kdarkboldfont16,
                              ),
                              TextSpan(
                                text: 'Photo',
                                style: TextFonts.kdarkboldfont16
                                    .copyWith(color: kprimaryColor),
                              ),
                            ])),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomPurpleButton(
                                  text: 'Learn More',
                                  onpressed: () {},
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SvgPicture.asset(
                        kprogressimg,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
                height: 100,
                width: double.infinity,
                decoration: ContainerDecoration.kContainerwaterDecoration,
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
                      )
                    ])),
          ),
          SliverToBoxAdapter(
            child: GestureDetector(
              onTap: () => GoRouter.of(context).push(AppRoutes.camerascreen),
              child: ListTile(
                title: Text(
                  'Gallery',
                  style: TextFonts.kdarkboldfont16,
                ),
                subtitle: Text(
                  'See more',
                  style: TextFonts.kgraynormalfont12,
                ),
                trailing: CircleAvatar(
                  radius: 30,
                  backgroundColor: kprimaryColor,
                  child: SvgPicture.asset(
                    kcameraicon,
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ),
          Obx(() {
            if (photoController.photos.isEmpty) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'No photos yet. Capture your progress!',
                    style: TextFonts.kgraynormalfont12,
                  ),
                ),
              );
            } else {
              return SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final image = photoController.photos[index];

                    return GestureDetector(
                      onTap: () {
                        showBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                                height: MediaQuery.sizeOf(context).height * 0.8,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                        child: Image.file(
                                          image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: kprimaryColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                              ),
                                              onPressed: () async {
                                                await photoController
                                                    .deleteAPic(image);
                                                GoRouter.of(context).pop();
                                              },
                                              child: Text(
                                                'delete',
                                                style: TextFonts
                                                    .kwhitenormalfont12,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                ));
                          },
                        );
                      },
                      child: SizedBox(
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
                  childCount: photoController.photos.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
              );
            }
          }),
        ]),
      ),
    );
  }
}
