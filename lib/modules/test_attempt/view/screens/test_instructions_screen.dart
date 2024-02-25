import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../common/view/widgets/custom_widgets/custom_elevated_button.dart';
import '../view_model/test_instructions_controller.dart';

class TestInstructionsScreen extends StatelessWidget {
  TestInstructionsScreen({super.key});

  final TestInstructionsController controller =
      Get.find<TestInstructionsController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Instructions",
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(UIConstants.defaultBorderRadius),
                child: Container(),
              ),
            ),
            Container(
              color: Theme.of(context).colorScheme.background,
              height: UIConstants.defaultHeight * 6,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        UIConstants.defaultPadding,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Selected Language",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            "English",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        UIConstants.defaultPadding,
                      ),
                      child: CustomElevatedButton(
                        buttonText: "Start test",
                        onPressed: controller.onStartTestTapped,
                        isLoading: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
