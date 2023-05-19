import 'package:dio/src/response.dart';
import 'package:ensar_starter/core/services/api_service/api_service.dart';
import 'package:ensar_starter/core/utils/instance_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        userId: json['userId'] as int,
        id: json['id'] as int,
        title: json['title'] as String,
        completed: json['completed'] as bool,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'completed': completed,
      };
}

class TodoGet extends IApiCall<Todo> {
  const TodoGet()
      : super(
          name: 'TodoGet',
          path: 'todos/{id}',
          method: HttpMethods.GET,
          requiresArgs: true,
        );

  @override
  ResponseObject<Todo>? parse(Response response) {
    return ResponseObject<Todo>(
      data: Todo.fromJson(response.data),
      statusCode: response.statusCode ?? 200,
    );
  }
}

class TodoGetArgs extends IApiCallArgs {
  final int id;

  const TodoGetArgs({required this.id}) : super(name: 'TodoGet');

  @override
  String pathFormat(String path) {
    return path.replaceAll('{id}', id.toString());
  }
}

void main() {
  setUpAll(() {
    InstanceController().addInstance(Logger, Logger());
  });

  test('Api Service Not initialized', () async {
    final ApiService apiService =
        ApiService(baseUrl: 'https://jsonplaceholder.typicode.com');
    final ResponseObject response =
        await apiService.call(const TodoGet(), const TodoGetArgs(id: 1));
    expect(response.error_code, 'INTERNAL_API_SERVICE_NOT_INITIALIZED');
  });

  test('Api Service Error', () async {
    final ApiService apiService =
        ApiService(baseUrl: 'https://jsonplaceholder.typicode.com');
    apiService.init();
    final ResponseObject response =
        await apiService.call(const TodoGet(), const TodoGetArgs(id: 1));
    expect(response.error_code, 'API_CALL_ERROR');
  });
}
