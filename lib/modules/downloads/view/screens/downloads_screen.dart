import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../common/view/widgets/custom_widgets/custom_elevated_button.dart';
import '../../../common/view/widgets/name_badge.dart';
import '../../../practice/view/screens/practice_screen.dart';
import '../view_model/downloads_controller.dart';

class DownloadsScreen extends StatelessWidget {
  DownloadsScreen({super.key});
  final DownloadsController controller = Get.put<DownloadsController>(
    DownloadsController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
          UIConstants.defaultPadding * 2,
        ),
        child: Section(
          title: "Your Downloads",
          subtitle:
              "Here's a list of all your downloads. You can utilize the downloaded tests to take your tests offline.",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: List.generate(
                  3,
                  (int index) {
                    return Obx(
                      () => Container(
                        margin: const EdgeInsets.only(
                          right: UIConstants.defaultMargin,
                        ),
                        child: ChoiceChip(
                          padding: const EdgeInsets.all(
                            UIConstants.defaultPadding * 0.5,
                          ),
                          label: Text(
                            controller.choicechipsLabelText[index],
                          ),
                          labelStyle: Theme.of(context).textTheme.bodySmall,
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(0.05),
                          selectedColor:
                              Theme.of(context).colorScheme.secondary,
                          selected: controller.value.value == index,
                          onSelected: (bool selected) {
                            controller.value.value = selected ? index : null;
                          },
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
              const SizedBox(
                height: UIConstants.defaultHeight * 0.5,
              ),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: UIConstants.defaultHeight,
                  );
                },
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, index) {
                  return Downloads(
                    downloadedDate: "4th March 2024",
                    testDetails: TestDetailsModel(
                      testTitle: "NEET - 2023 Full Length Mock Test",
                      creatorName: "Manimaran K V",
                      isVerified: true,
                      totalQuestions: 10,
                      timeLimit: 90,
                      attemptsCount: 1500,
                      coins: 10,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Downloads extends StatelessWidget {
  const Downloads({
    required this.testDetails,
    required this.downloadedDate,
    super.key,
  });
  final TestDetailsModel testDetails;
  final String downloadedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        UIConstants.defaultPadding,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.05),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(
          UIConstants.defaultBorderRadius,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            testDetails.testTitle ?? "",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: UIConstants.defaultHeight * 0.5,
          ),
          NameBadge(
            name: testDetails.creatorName ?? "",
            isVerifiedUser: testDetails.isVerified ?? false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Downloaded at $downloadedDate",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              CustomElevatedButton(
                buttonHeight: UIConstants.defaultHeight * 2.5,
                buttonWidth: UIConstants.defaultWidth * 8,
                buttonText: "Attempt",
                onPressed: () {},
                isLoading: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
