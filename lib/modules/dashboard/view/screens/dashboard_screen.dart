import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../../routes/app_route_constants.dart';
import '../../../common/view/widgets/custom_widgets/custom_dropdownfield.dart';
import '../../../practice/view/screens/practice_screen.dart';
import '../view_model/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final DashboardController controller = Get.put<DashboardController>(
    DashboardController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(
            UIConstants.defaultPadding,
          ),
          child: const Placeholder(),
        ),
        title: Container(
          margin: const EdgeInsets.symmetric(
            vertical: UIConstants.defaultPadding * 6,
          ),
          padding: const EdgeInsets.only(
            top: UIConstants.defaultPadding * 2,
          ),
          child: GestureDetector(
            onTap: () {
              controller.scaffoldKey.currentState?.openEndDrawer();
            },
            child: CustomDropDownField(
              labelText: 'Exam Name',
              items: const [],
              onSaved: (value) {},
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: UIConstants.defaultPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                  width: 15,
                  child: Placeholder(),
                ),
                const SizedBox(
                  height: UIConstants.defaultHeight,
                ),
                Text(
                  "250 coins",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: const ExamNamePallete(),
      ),
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: AppRouteConstants.routeHome,
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              activeIcon: Icon(
                Icons.home_rounded,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.flag_outlined,
              ),
              activeIcon: Icon(
                Icons.flag_rounded,
              ),
              label: "Practice",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.download_outlined,
              ),
              activeIcon: Icon(
                Icons.download_rounded,
              ),
              label: "Downloads",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              activeIcon: Icon(
                Icons.person_rounded,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}

class ExamNamePallete extends StatelessWidget {
  const ExamNamePallete({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(
              UIConstants.defaultHeight,
            ),
            child: Section(
              title: "Exam Category",
              subtitle: "Select the exam category from the following list",
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return ExpansionTile(
                childrenPadding: const EdgeInsets.all(
                  UIConstants.defaultPadding,
                ),
                title: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        right: UIConstants.defaultHeight,
                      ),
                      height: UIConstants.defaultHeight * 4,
                      width: UIConstants.defaultWidth * 4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.05),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("SEMOOL"),
                        Text(
                          "NEET-UG,IIT,JEE",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ],
                ),
                children: [
                  ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: UIConstants.defaultHeight,
                      );
                    },
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(
                          UIConstants.defaultHeight,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(0.05),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius: BorderRadius.circular(
                            UIConstants.defaultBorderRadius,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                right: UIConstants.defaultMargin,
                              ),
                              padding: const EdgeInsets.only(
                                right: UIConstants.defaultHeight,
                              ),
                              height: UIConstants.defaultHeight * 2,
                              width: UIConstants.defaultWidth * 2,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.05),
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                              ),
                            ),
                            const Text("NEET - UG"),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            }),
            separatorBuilder: ((context, index) {
              return const SizedBox(
                height: UIConstants.defaultHeight,
              );
            }),
            itemCount: 2,
          ),
        ],
      ),
    );
  }
}
