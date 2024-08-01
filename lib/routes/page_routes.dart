import 'package:flutter_application_1/feature/attendance/attendance_binding.dart';
import 'package:flutter_application_1/feature/attendance/attendance_page.dart';
import 'package:flutter_application_1/feature/loader/loading_page.dart';
import 'package:get/get.dart';
import 'page_names.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: PageName.LOADER,
      page: () => const LoadingPage(),
    ),
    GetPage(
      name: PageName.ATTENDANCE,
      page: () => const AttendancePage(),
      binding: AttendanceBinding(),
    ),
  ];
}
