import 'dart:async';

import 'package:flutter/material.dart';
import 'package:striky/core/services/googleFit/googleFit_service.dart';
import 'package:striky/presentation/view/home/fitover_screen/fit_over_screen.dart';

class FitOverviewLoader extends StatefulWidget {
  const FitOverviewLoader({super.key});

  @override
  State<FitOverviewLoader> createState() => _FitOverviewLoaderState();
}

class _FitOverviewLoaderState extends State<FitOverviewLoader> {
  final GoogleFitService _googleFitService = GoogleFitService();
  int? steps;

  @override
  void initState() {
    super.initState();
    _requestAuthorization();
    _fetchSteps();
  }

  Future<void> _requestAuthorization() async {
    try {
      await _googleFitService.requestAuthorization();
    } catch (e) {
      print('..........there is a problem in the authorization');
    }
  }

  Future<void> _fetchSteps() async {
    try {
      final stepCount = await _googleFitService.getSteps();
      setState(() {
        steps = stepCount;
      });
    } catch (e) {
      debugPrint("⚠️ Error loading steps: $e");
      setState(() {
        steps = 0; // Fallback or show error message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FitOverviewScreen(steps: steps);
  }
}
