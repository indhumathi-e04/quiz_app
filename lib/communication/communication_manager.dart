import 'dart:convert';

import 'package:get/get.dart' as get_package;

import '../network/network_manager.dart';

enum RequestType { get, post, put, delete }

class CommunicationManager extends get_package.GetxService {
  final NetworkManager _networkManager;

  CommunicationManager({required NetworkManager networkManager})
      : _networkManager = networkManager;
}
