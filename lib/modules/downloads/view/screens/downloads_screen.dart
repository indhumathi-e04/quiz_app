import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../common/view/widgets/custom_widgets/custom_elevated_button.dart';
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
          UIConstants.defaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Downloads",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: UIConstants.defaultHeight * 0.5,
            ),
            Text(
              "Here's a list of all your downloads. You can utilize the downloaded tests to take your tests offline.",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(
              height: UIConstants.defaultHeight * 0.5,
            ),
            Wrap(
              // list of length 3
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
                          UIConstants.defaultPadding,
                        ),
                        label: Text(controller.choicechipsLabelText[index]),
                        selectedColor: Colors.grey,
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
                return const Downloads(
                  downloadedDate: "4th March 2024",
                  examTitle: 'NEET - 2024 Full Length Mock Test',
                  examName: 'Manimaran K V',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Downloads extends StatelessWidget {
  const Downloads({
    required this.examTitle,
    required this.examName,
    required this.downloadedDate,
    super.key,
  });
  final String examTitle;
  final String examName;
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                examTitle,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Row(
                children: [
                  Icon(
                    Icons.delete,
                    size: UIConstants.defaultHeight * 1.2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: UIConstants.defaultHeight * 0.5,
                  ),
                  Icon(
                    Icons.refresh,
                    size: UIConstants.defaultHeight * 1.2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Text(
                examName,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(
                width: UIConstants.defaultWidth * 0.5,
              ),
              Icon(
                Icons.verified,
                size: UIConstants.defaultHeight * 1.2,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Downloaded at $downloadedDate",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              CustomElevatedButton(
                buttonWidth: 60,
                buttonHeight: 20,
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
