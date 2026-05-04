import '../models/{{name.snakeCase()}}_model.dart';

abstract class {{name.pascalCase()}}RemoteDataSource {
  Future<{{name.pascalCase()}}Model> get{{name.pascalCase()}}();
  
  // Add more methods as needed
  // Future<List<{{name.pascalCase()}}Model>> getAll{{name.pascalCase()}}s();
  // Future<{{name.pascalCase()}}Model> create{{name.pascalCase()}}({{name.pascalCase()}}Model model);
  // Future<{{name.pascalCase()}}Model> update{{name.pascalCase()}}({{name.pascalCase()}}Model model);
  // Future<void> delete{{name.pascalCase()}}(String id);
}

class {{name.pascalCase()}}RemoteDataSourceImpl implements {{name.pascalCase()}}RemoteDataSource {
  // TODO: Inject your HTTP client (Dio, http, etc.)
  // final Dio dio;
  // {{name.pascalCase()}}RemoteDataSourceImpl({required this.dio});

  @override
  Future<{{name.pascalCase()}}Model> get{{name.pascalCase()}}() async {
    try {
      // TODO: Implement API call
      // final response = await dio.get('/api/{{name.paramCase()}}');
      // return {{name.pascalCase()}}Model.fromJson(response.data);

      // Mock data for now
      await Future.delayed(const Duration(seconds: 2));
      return {{name.pascalCase()}}Model(
        id: '1',
        name: 'Sample {{name.titleCase()}}',
      );
    } catch (e) {
      throw Exception('Failed to fetch {{name.sentenceCase()}}: $e');
    }
  }
}
