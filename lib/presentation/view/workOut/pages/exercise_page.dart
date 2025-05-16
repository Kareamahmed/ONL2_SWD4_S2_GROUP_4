import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:striky/core/constants/container_decoration.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/data/models/workout/exercise_model.dart';
import 'package:striky/data/source/API/DBRabid_service.dart';
import 'package:striky/presentation/view/myPhotos/widgets/custom_appbar.dart';
import 'package:striky/presentation/view/workOut/widgets/custom_stepper.dart';
import 'package:striky/presentation/view/workOut/widgets/desc_widget.dart';
import 'package:striky/presentation/view/workOut/widgets/double_text.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key, required this.id});
  final String id;

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  late Future<Exercise> _exerciseFuture;

  @override
  void initState() {
    super.initState();
    _exerciseFuture = ExerciseDBService().getExerciseById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: '',
        onpressed1: () => GoRouter.of(context).pop(),
        onpressed2: () {},
      ),
      body: FutureBuilder<Exercise>(
        future: _exerciseFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final exercise = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    decoration: ContainerDecoration.kContainerwaterDecoration
                        .copyWith(color: const Color(0xff697fb2)),
                    height: 200,
                    width: double.infinity,
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: exercise.gifUrl,
                        height: 150,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ListTile(
                    title: Text(
                      exercise.name,
                      style: TextFonts.kdarkboldfont16,
                    ),
                    subtitle: Text(
                      '${exercise.bodyPart} | ${exercise.equipment}',
                      style: TextFonts.kdarkgrayfont14,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: DescWidget(
                    desc: exercise.instructions.join(' '),
                  ),
                ),
                SliverToBoxAdapter(
                  child: DoubleText(
                    text1: 'How To Do It',
                    text2: '${exercise.instructions.length} Steps',
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomStepper(
                    instructions: exercise.instructions,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
