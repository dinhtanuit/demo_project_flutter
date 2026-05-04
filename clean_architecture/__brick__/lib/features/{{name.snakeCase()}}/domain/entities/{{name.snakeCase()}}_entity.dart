import 'package:equatable/equatable.dart';

class {{name.pascalCase()}}Entity extends Equatable {
  final String id;
  final String name;
  // Add more fields as needed

  const {{name.pascalCase()}}Entity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];

  @override
  String toString() => '{{name.pascalCase()}}Entity(id: $id, name: $name)';
}
