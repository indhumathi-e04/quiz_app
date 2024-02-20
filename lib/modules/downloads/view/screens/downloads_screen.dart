import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/downloads_controller.dart';

class DownloadsScreen extends StatelessWidget {
  DownloadsScreen({super.key});
  final DownloadsController controller = Get.put<DownloadsController>(
    DownloadsController(),
  );
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Downloads Page"),
      ),
    );
  }
}
