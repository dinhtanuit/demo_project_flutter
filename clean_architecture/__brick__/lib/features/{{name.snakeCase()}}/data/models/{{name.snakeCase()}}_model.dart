import '../../domain/entities/{{name.snakeCase()}}_entity.dart';

class {{name.pascalCase()}}Model {
  final String id;
  final String name;
  // Add more fields as needed

  {{name.pascalCase()}}Model({
    required this.id,
    required this.name,
  });

  /// From JSON
  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {
    return {{name.pascalCase()}}Model(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  /// To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  /// To Entity
  {{name.pascalCase()}}Entity toEntity() {
    return {{name.pascalCase()}}Entity(
      id: id,
      name: name,
    );
  }

  /// From Entity
  factory {{name.pascalCase()}}Model.fromEntity({{name.pascalCase()}}Entity entity) {
    return {{name.pascalCase()}}Model(
      id: entity.id,
      name: entity.name,
    );
  }

  @override
  String toString() => '{{name.pascalCase()}}Model(id: $id, name: $name)';
}
