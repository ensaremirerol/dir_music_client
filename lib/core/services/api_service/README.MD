# Api Service

Responsible for all the requests to the API.

## How to use

```dart
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

final ResponseObject response =
        await apiService.call(const TodoGet(), const TodoGetArgs(id: 1));

```

## Notes

-   ApiCall and ApiCallArgs must be immutable and named same. If not, it will throw an error.
