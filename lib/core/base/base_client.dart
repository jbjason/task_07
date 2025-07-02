// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:task_07/core/error/api_exception.dart';
import 'package:task_07/core/network/my_network.dart';
import 'package:task_07/core/util/my_dialog.dart';
import 'package:task_07/core/util/my_string.dart';

class BaseClientClass {
  static final dio = Dio(BaseOptions(connectTimeout: Duration(seconds: 30)));

  static Future<dynamic> getData({
    String url = MyNetwork.baseUrl,
    required String path,
    Object? body,
    Map<String, dynamic>? parameters,
    Options? options,
    required BuildContext ctx,
  }) async {

    try {
      Logger().i("$url/$path/$parameters");
      final response = await dio.get(
        "$url/$path",
        queryParameters: parameters,
        data: body ?? jsonEncode({}),
        // options: options ??
        //     Options(headers: {
        //       'accept': 'text/plain',
        //       'Content-Type': 'application/json',
        //       'Authorization': 'bearer $availableToken',
        //     }),
      );
      Logger().t(response.data);
      if (response.statusCode == 200) return response.data;
      MyDialog().showFailedToast(msg: MyString.errorMsg, context: ctx);
    } on DioException catch (e) {
      ApiException.handleException(e, ctx);
    } catch (e) {
      Logger().e(e);
      MyDialog().showFailedToast(
          title: "Unexpected Error!", msg: e.toString(), context: ctx);
    }
  }

  static Future<dynamic> postData({
    String url = MyNetwork.baseUrl,
    required String path,
    Object? body,
    Map<String, dynamic>? parameters,
    Options? options,
    required BuildContext ctx,
  }) async {
    try {
      Logger().t("$url/$path");
      final response = await dio.post(
        "$url/$path",
        queryParameters: parameters,
        data: body ?? jsonEncode({}),
        // options: options ??
        //     Options(
        //       headers: {
        //         'accept': 'text/plain',
        //         'Content-Type': 'application/json',
        //         'Authorization': 'bearer $availableToken',
        //       },
        //     ),
      );
      Logger().t(response.data);
      if (response.statusCode == 200) return response.data;
      MyDialog().showFailedToast(msg: MyString.errorMsg, context: ctx);
    } on DioException catch (e) {
      ApiException.handleException(e, ctx);
    } catch (e) {
      Logger().e(e);
      MyDialog().showFailedToast(
          title: "Unexpected Error!", msg: e.toString(), context: ctx);
    }
  }

  static Future<dynamic> patchData({
    String url = MyNetwork.baseUrl,
    required String path,
    Object? body,
    Map<String, dynamic>? parameters,
    Options? options,
    required BuildContext ctx,
  }) async {
    try {
      Logger().t("$url/$path");
      final response = await dio.patch(
        "$url/$path",
        queryParameters: parameters,
        data: body ?? jsonEncode({}),
        // options: options ??
        //     Options(
        //       headers: {
        //         'accept': 'text/plain',
        //         'Content-Type': 'application/json',
        //         'Authorization': 'bearer $availableToken',
        //       },
        //     ),
      );
      Logger().t(response.data);
      if (response.statusCode == 200) return response.data;
      MyDialog().showFailedToast(msg: MyString.errorMsg, context: ctx);
    } on DioException catch (e) {
      Logger().e(e);
      ApiException.handleException(e, ctx);
    } catch (e) {
      Logger().e(e);
      MyDialog().showFailedToast(
          title: "Unexpected Error!", msg: e.toString(), context: ctx);
    }
  }

  static Future<dynamic> putData({
    required String path,
    Object? body,
    Map<String, dynamic>? parameters,
    Options? options,
    required BuildContext ctx,
  }) async {
    try {
      Logger().t("${MyNetwork.baseUrl}/$path");
      final response = await dio.put(
        "${MyNetwork.baseUrl}/$path",
        queryParameters: parameters,
        data: body ?? jsonEncode({}),
        // options: options ??
        //     Options(headers: {
        //       'accept': 'text/plain',
        //       'Content-Type': 'application/json',
        //       'Authorization': 'bearer $availableToken',
        //     }),
      );
      Logger().t(response.data);
      if (response.statusCode == 200) return response.data;
      MyDialog().showFailedToast(msg: MyString.errorMsg, context: ctx);
    } on DioException catch (e) {
      ApiException.handleException(e, ctx);
    } catch (e) {
      Logger().e(e);
      MyDialog().showFailedToast(
          title: "Unexpected Error!", msg: e.toString(), context: ctx);
    }
  }

  static Future<dynamic> deleteData({
    required String path,
    Object? body,
    Map<String, dynamic>? parameters,
    Options? options,
    required BuildContext ctx,
  }) async {
    try {
      Logger().t("${MyNetwork.baseUrl}/$path");
      final response = await dio.delete(
        "${MyNetwork.baseUrl}/$path",
        queryParameters: parameters,
        data: body,
        // options: options ??
        //     Options(headers: {
        //       'accept': 'text/plain',
        //       'Content-Type': 'application/json',
        //       'Authorization': 'bearer $availableToken',
        //     }),
      );
      Logger().t(response.data);
      if (response.statusCode == 200) return response.data;
      MyDialog().showFailedToast(msg: MyString.errorMsg, context: ctx);
    } on DioException catch (e) {
      ApiException.handleException(e, ctx);
    } catch (e) {
      Logger().e(e);
      MyDialog().showFailedToast(
          title: "Unexpected Error!", msg: e.toString(), context: ctx);
    }
  }
}
