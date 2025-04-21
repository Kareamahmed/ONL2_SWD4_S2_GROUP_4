import 'package:health/health.dart';

class GoogleFitService {
  final Health _health = Health();

  Future<void> requestAuthorization() async {
    final isAvailable = await _health.isHealthConnectAvailable();

    if (!isAvailable) {
      await _health.installHealthConnect();
      throw Exception("Health Connect not installed");
    }

    final types = [HealthDataType.STEPS];
    final permissions = [HealthDataAccess.READ];

    final success =
        await _health.requestAuthorization(types, permissions: permissions);
    if (!success) throw Exception("Authorization failed");
  }

  Future<int> getSteps() async {
    await requestAuthorization();
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    final data = await _health.getHealthDataFromTypes(
        types: [HealthDataType.STEPS], startTime: midnight, endTime: now);
    return data.fold<int>(
        0, (sum, entry) => sum + (entry.value as num).toInt());
  }
}
