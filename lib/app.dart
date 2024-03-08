import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:learn_getx_g9/home/home_binding.dart';
import 'package:learn_getx_g9/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => const HomePage(),
          binding: HomeBinding(),
        )
      ],
    );
  }
}
