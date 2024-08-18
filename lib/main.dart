import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_routes.dart';

Future main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // https://flutter.github.io/samples/web/material_3_demo/#/
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
      //   useMaterial3: true,

      //   brightness: Brightness.light,
      //   primarySwatch: Colors.blue,
      //   colorSchemeSeed: Colors.blue,
      // ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
    );
  }
}
