import 'package:get/get.dart';
import 'package:striky/core/services/notification/noti_service.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationController extends GetxController {
  final NotiService _notiService = NotiService();

  var notificationsEnabled = true.obs;
  var fullbodynotificationsEnabled = true.obs;
  var lowbodynotificationsEnabled = true.obs;
  var absnotificationsEnabled = true.obs;

  bool get isInitialized => _notiService.isInitialized;

  @override
  void onInit() {
    super.onInit();
    _loadNotificationSetting();
    _notiService.initNotifications();
  }

  Future<void> _loadNotificationSetting() async {
    final enabled = await _notiService.areNotificationsEnabled();
    notificationsEnabled.value = enabled;
  }

  Future<void> toggleNotifications(bool enable) async {
    notificationsEnabled.value = enable;
    await _notiService.toggleNotificationSetting(enable);
  }

  Future<void> showNotification({
    required int id,
    required String body,
  }) async {
    if (notificationsEnabled.value) {
      print('the notification is enabled  ${notificationsEnabled.value}');
      await _notiService.showNotificationIfEnabled(
        id: id,
        body: body,
      );
    } else {
      print('the notification is already disabled');
    }
  }

  Future<void> scheduleNotification({
    required int id,
    required String body,
    required int hour,
    required int minute,
  }) async {
    await _notiService.scheduleNotification(
      id: id,
      body: body,
      hour: hour,
      minute: minute,
    );
  }

  Future<void> periodicNotification({
    required int id,
    required String body,
    required tz.TZDateTime scheduledDate,
  }) async {
    await _notiService.periodicNotification(
      id: id,
      body: body,
      scheduledDate: scheduledDate,
    );
  }
}
