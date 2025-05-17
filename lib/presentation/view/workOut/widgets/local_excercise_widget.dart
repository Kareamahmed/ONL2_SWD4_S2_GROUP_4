import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/presentation/providers/exercise_provider.dart';
import 'package:striky/presentation/view/workOut/pages/exercise_page.dart';

class LocalExerciseWidget extends StatefulWidget {
  final String bodyPart;
  const LocalExerciseWidget({super.key, required this.bodyPart});

  @override
  State<LocalExerciseWidget> createState() => _LocalExerciseWidgetState();
}

class _LocalExerciseWidgetState extends State<LocalExerciseWidget> {
  @override
  void initState() {
    super.initState();
    // Delay fetch to ensure context is available
    Future.microtask(() {
      Provider.of<ExerciseProvider>(context, listen: false)
          .fetchExercisesByBodyPart(widget.bodyPart.toLowerCase());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.error.isNotEmpty) {
          return Center(child: Text('Error: ${provider.error}'));
        }

        return ListView.builder(
          itemCount: provider.exercises.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final exercise = provider.exercises[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: ClipOval(
                  child: Image.network(
                    exercise.gifUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                  ),
                ),
                 
                trailing: SvgPicture.asset(karrowright),
                title: Text(exercise.name),
                subtitle: Text(exercise.target),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExercisePage(id: exercise.id),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
