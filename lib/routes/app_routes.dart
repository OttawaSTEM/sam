import 'package:get/get.dart';

import '../pages/scan/ui/scan.dart';
// import '../pages/control/ui/control.dart';

const transitionMS = 500;

abstract class AppRoutes {
  static const String scan = '/';
  // static const String control = '/control';
}

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.scan,
      page: () => const ScanPage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: transitionMS),
    ),
    // GetPage(
    //   name: AppRoutes.control,
    //   page: () => const ControlPage(),
    //   transition: Transition.leftToRightWithFade,
    //   transitionDuration: const Duration(milliseconds: transitionMS),
    // ),
  ];
}
