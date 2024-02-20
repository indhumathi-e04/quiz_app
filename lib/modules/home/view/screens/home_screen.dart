import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController controller = Get.put<HomeController>(
    HomeController(),
  );
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
