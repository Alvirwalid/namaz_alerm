import 'package:get/get.dart';
import 'package:namaz_time_shedule/feature/controller/notification_services.dart';
import 'package:namaz_time_shedule/feature/model/prayermodel.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    Get.put(Services()).inItLocalNotification();
    Get.put(Services()).requestPermissions();
    super.onInit();
  }

  List<PrayerTimesModel> timeList = [
    PrayerTimesModel(
        name: 'সাহরি',
        body: 'সাহরি এর সময় হয়েছে',
        time: DateTime.now().add(Duration(seconds: 5)).toString()),
    PrayerTimesModel(
        name: 'ফযর',
        body: 'ফযর এর সময় হয়েছে',
        time: DateTime.now().add(Duration(seconds: 15)).toString()),
    PrayerTimesModel(
        name: 'ঈশরাক',
        body: 'ঈশরাক এর সময় হয়েছে',
        time: DateTime.now().add(Duration(seconds: 25)).toString()),
    PrayerTimesModel(
        name: 'যোহর',
        body: 'যোহর এর সময় হয়েছে',
        time: DateTime.now().add(Duration(seconds: 35)).toString()),
    PrayerTimesModel(
        name: 'আসর',
        body: 'আসর এর সময় হয়েছে',
        time: DateTime.now().add(Duration(seconds: 45)).toString()),
    PrayerTimesModel(
        name: 'ঈফতার',
        body: 'ঈফতার এর সময় হয়েছে',
        time: DateTime.now().add(Duration(seconds: 55)).toString()),
    PrayerTimesModel(
        name: 'ঈশা',
        body: 'ঈশা এর সময় হয়েছে',
        time: DateTime.now().add(Duration(seconds: 65)).toString()),
    PrayerTimesModel(
        name: 'সাহরি',
        body: 'সাহরি এর সময় হয়েছে',
        time: DateTime.now().add(Duration(seconds: 75)).toString()),
    PrayerTimesModel(
        name: 'ফযর',
        body: 'ফযর এর সময় হয়েছে',
        time: DateTime.now().add(Duration(seconds: 85)).toString()),
    PrayerTimesModel(
        name: 'ঈশরাক',
        body: 'ঈশরাক এর সময় হয়েছে',
        time: DateTime.now().add(Duration(seconds: 95)).toString()),
    PrayerTimesModel(
        name: 'যোহর',
        body: 'যোহর এর সময় হয়েছে',
        time: DateTime.now().add(Duration(seconds: 105)).toString()),
    PrayerTimesModel(
        name: 'আসর',
        body: 'আসর এর সময় হয়েছে',
        time: DateTime.now().add(Duration(seconds: 115)).toString()),
    PrayerTimesModel(
        name: 'ঈফতার',
        body: 'ঈফতার এর সময় হয়েছে',
        time: DateTime.now().add(Duration(seconds: 125)).toString()),
    PrayerTimesModel(
        name: 'ঈশা',
        body: 'ঈশা এর সময় হয়েছে',
        time: DateTime.now().add(Duration(seconds: 135)).toString()),

  ];



  getNotification() {
    int id = 0;

    for (var c in timeList) {
      id++;
      if (id <= timeList.length) {
        Get.put(Services()).zoneSheduleTime(
            id: id,
            dateTime: DateTime.parse(c.time.toString()),
            body: c.body,
            title: c.name);
      }
    }
  }
}
