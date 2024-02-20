import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/ui_constants.dart';
import '../../../../routes/app_route_constants.dart';
import '../../../common/view/widgets/custom_widgets/custom_dropdownfield.dart';
import '../view_model/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final DashboardController controller = Get.put<DashboardController>(
    DashboardController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: CustomDropDownField(
            labelText: 'Exam Name',
            items: [],
            onSaved: (value) {},
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
