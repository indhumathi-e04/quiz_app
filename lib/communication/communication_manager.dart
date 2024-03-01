import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as get_package;

import '../constants/ui_constants.dart';
import '../modules/common/data/remote/models/base_api_response.dart';
import '../modules/common/data/remote/models/result_state.dart';
import '../network/network_manager.dart';
import 'constants/api_constants.dart';
import 'constants/api_endpoints.dart';
import 'constants/error_code_constants.dart';
import 'helpers/dio_interceptor.dart';
import 'helpers/interceptor/firebase_interceptor.dart';

enum RequestType { get, post, put, delete }

class CommunicationManager extends get_package.GetxService {
  final NetworkManager _networkManager;

  CommunicationManager({required NetworkManager networkManager})
      : _networkManager = networkManager;

  Future<ResultState> callApiInterface({
    required String endPoint,
    RequestType requestType = RequestType.get,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? jsonBody,
  }) async {
    bool isNetworkConnected = await _networkManager.connectionStatus;
    if (isNetworkConnected) {
      try {
        Dio dioClient = Dio(
          BaseOptions(
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            followRedirects: true,
            contentType: ApiConstants.contentTypeValue,
            responseType: ResponseType.json,
            baseUrl: ApiEndpoints.baseUrl,
          ),
        );
        if (kDebugMode) {
          dioClient.interceptors.add(
            DioInterceptor(),
          );
        }
        // dioClient.interceptors.add(DioFirebaseInterceptor());
        String basicAuth =
            'Basic ${base64.encode(utf8.encode('${UIConstants.mobileClient}:AyiniMobileAppPwd'))}';
        dioClient.options.headers = {'authorization': basicAuth};
        Response? response;
        BaseResponse baseReponse;

        switch (requestType) {
          case RequestType.get:
            response = await dioClient.get(
              endPoint,
              queryParameters: queryParameters,
            );
            break;
          case RequestType.post:
            response = await dioClient.post(
              endPoint,
              queryParameters: queryParameters,
              data: jsonEncode(jsonBody),
            );
            break;
          case RequestType.put:
            response = await dioClient.put(
              endPoint,
              queryParameters: queryParameters,
              data: jsonEncode(jsonBody),
            );
            break;
          case RequestType.delete:
            response = await dioClient.delete(
              endPoint,
              queryParameters: queryParameters,
              data: jsonEncode(jsonBody),
            );
            break;
        }

        if (response.data != null) {
          baseReponse = BaseResponse.fromJson(response.data);
          if (response.statusCode == ResponseCodeConstants.success ||
              response.statusCode == ResponseCodeConstants.created ||
              response.statusCode == ResponseCodeConstants.updated) {
            return Success(
              data: baseReponse.data,
            );
          } else {
            return Error(
              errorMessage: baseReponse.error,
              errorCode: response.statusCode.toString(),
            );
          }
        } else {
          return Error(
            errorCode: response.statusCode.toString(),
          );
        }
      } catch (exception) {
        return Error(
          errorMessage: "Internal server error",
          errorCode: ResponseCodeConstants.internalServer.toString(),
        );
      }
    } else {
      return Error(
        errorMessage: "No Internet Connection",
        errorCode: ResponseCodeConstants.noInternet.toString(),
      );
    }
  }
}
