import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NavigatorStateExtension on NavigatorState {
  void goNamed(String routeName, Map<String, String> params,
      Map<String, dynamic> queryParams) {
    this.context.goNamed(routeName,
        pathParameters: params, queryParameters: queryParams);
  }

  void go(String path) {
    this.context.go(path);
  }

  void pushNamed(String routeName, Map<String, String> params,
      Map<String, dynamic> queryParams) {
    this.context.pushNamed(routeName,
        pathParameters: params, queryParameters: queryParams);
  }

  void push(String path) {
    this.context.push(path);
  }

  void replaceNamed(String routeName, Map<String, String> params,
      Map<String, dynamic> queryParams) {
    this.context.replaceNamed(routeName,
        pathParameters: params, queryParameters: queryParams);
  }

  void replace(String path) {
    this.context.replace(path);
  }

  void pushReplacementNamed(String routeName, Map<String, String> params,
      Map<String, dynamic> queryParams) {
    this.context.pushReplacementNamed(routeName,
        pathParameters: params, queryParameters: queryParams);
  }

  void pushReplacement(String path) {
    this.context.pushReplacement(path);
  }
}
