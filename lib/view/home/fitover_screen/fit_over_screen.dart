import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator_premium/percent_indicator_premium.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/view/home/fitover_screen/widgets/custom_info_tile.dart';
import 'package:striky/view/home/fitover_screen/widgets/loading_widget.dart';

class FitOverviewScreen extends StatelessWidget {
  final int? steps;
  final int goalSteps;

  const FitOverviewScreen(
      {super.key, required this.steps, this.goalSteps = 10000});

  @override
  Widget build(BuildContext context) {
    final bool loading = steps == null;
    final double percent = (steps ?? 0) / goalSteps;

    return Scaffold(
      extendBodyBehindAppBar:true,
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: kwaterwhite,
          )
        )),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kgradiantColor1, kgradiantColor2],
            //backup colors  Color(0xFF00C9FF), Color(0xFF92FE9D)
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: loading
                ? BuildLoading()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your Daily Steps",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: kprimaryfont,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),
                      CircularPercentIndicator(
                        loadingPercent: percent.clamp(0.0, 1.0),
                        inActiveTrackColor: Colors.white,
                        child: Center(
                          child: Text(
                            "$steps\nsteps",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: kprimaryfont,
                              fontSize: 24.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomInfoTile(label :"Target", value: "$goalSteps steps"),
                      const SizedBox(height: 12),
                      CustomInfoTile(label: 
                          "Progress", value: "${(percent * 100).toStringAsFixed(1)}%"),
                    ],
                  ),
          ),
        ),
      ),
    );
  }


}
