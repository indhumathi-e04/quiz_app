import 'package:get/get.dart';

class ProfileController extends GetxController {
  List<int> credits = [
    50,
    60,
    100,
  ];
  List<String> status = [
    "ATTEMPTED",
    "COMPLETED",
    "CREATED",
  ];
  List<String> profileIcons = [
    "E",
    "Y",
    "C",
    "R",
    "C",
    "S",
  ];
  List<String> profileTitle = [
    "Edit Profile",
    "Your Quizzes",
    "Coin Balance",
    "Rate Our App",
    "Contact Support",
    "Sign Out",
  ];
  List<String> profileSubTitle = [
    "Edit your name, mobile number, etc.",
    "Create, manage and share your own quizzes",
    "Buy or Redeem your coins",
    "Enjoying the app ? Rate us now.",
    "Connect with us for any type of queries.",
    "Sign out from the application",
  ];
}
