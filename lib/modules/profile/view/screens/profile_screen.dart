import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController controller = Get.put<ProfileController>(
    ProfileController(),
  );
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Profile Page"),
      ),
    );
  }
}
