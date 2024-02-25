import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../common/view/widgets/name_badge.dart';
import '../../../practice/view/screens/practice_screen.dart';
import '../view_model/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    super.key,
  });
  final ProfileController controller = Get.find<ProfileController>();
  final TestDetailsModel testDetails = TestDetailsModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
          UIConstants.defaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: UIConstants.defaultHeight * 6,
              width: UIConstants.defaultHeight * 6,
              child: Placeholder(),
            ),
            NameBadge(
              name: testDetails.creatorName ?? "",
              isVerifiedUser: testDetails.isVerified ?? false,
            ),
            Text(
              "manimaran@gmail.com",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(
              height: UIConstants.defaultHeight,
            ),
            SizedBox(
              height: UIConstants.defaultHeight * 4,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: UIConstants.defaultWidth,
                  );
                },
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Status(
                    credits: controller.credits[index],
                    statusName: controller.status[index],
                  );
                },
              ),
            ),
            const SizedBox(
              height: UIConstants.defaultHeight,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return ProfileTile(
                  profileIcon: controller.profileIcons[index],
                  profileTitle: controller.profileTitle[index],
                  profileSubTitle: controller.profileSubTitle[index],
                );
              }),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: UIConstants.defaultHeight,
                );
              },
              itemCount: 6,
            ),
          ],
        ),
      ),
    );
  }
}

class Status extends StatelessWidget {
  const Status({
    required this.credits,
    required this.statusName,
    super.key,
  });
  final int credits;
  final String statusName;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          Text(
            credits.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            statusName,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.profileTitle,
    required this.profileSubTitle,
    required this.profileIcon,
  });
  final String profileTitle;
  final String profileSubTitle;
  final String profileIcon;

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: UIConstants.defaultHeight * 4,
                width: UIConstants.defaultWidth * 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.05),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                child: Center(
                  child: Text(
                    profileIcon.toUpperCase(),
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                width: UIConstants.defaultHeight,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profileTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    profileSubTitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          const Icon(
            Icons.chevron_right_outlined,
          ),
        ],
      ),
    );
  }
}
