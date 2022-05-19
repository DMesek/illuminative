import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_id.dart';

class AttendanceNotifier {
  static const _firstRunKey = 'firstRun';
  static const _attendanceKey = 'attendance';

  static Future checkIn() async {
    final prefs = await SharedPreferences.getInstance();
    final notFirstRun = prefs.containsKey(_firstRunKey);
    if (notFirstRun) return;

    FirebaseFirestore.instance.collection(_attendanceKey).add(myId.toJson());
    prefs.setBool(_firstRunKey, false);
  }
}
