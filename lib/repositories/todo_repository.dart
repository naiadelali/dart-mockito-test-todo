import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:todo_flutter_mockito/models/todo_model.dart';

class TodoRepository {
  DioForNative dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';
  TodoRepository(this.dio);

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);
    var result = (response.data as List).map((item) {
      return TodoModel.fromJson(item);
    }).toList();

    return result;
  }
}
