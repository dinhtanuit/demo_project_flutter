# Example: Tạo User Management Module

## Bước 1: Generate module

```bash
mason make clean_architecture
# Nhập: user_management
```

## Bước 2: Customize Entity

`lib/features/user_management/domain/entities/user_management_entity.dart`

```dart
import 'package:equatable/equatable.dart';

class UserManagementEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? avatar;
  final DateTime createdAt;
  final bool isActive;

  const UserManagementEntity({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    required this.createdAt,
    required this.isActive,
  });

  @override
  List<Object?> get props => [id, name, email, avatar, createdAt, isActive];
}
```

## Bước 3: Update Model

`lib/features/user_management/data/models/user_management_model.dart`

```dart
class UserManagementModel {
  final String id;
  final String name;
  final String email;
  final String? avatar;
  final DateTime createdAt;
  final bool isActive;

  UserManagementModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    required this.createdAt,
    required this.isActive,
  });

  factory UserManagementModel.fromJson(Map<String, dynamic> json) {
    return UserManagementModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      isActive: json['is_active'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'created_at': createdAt.toIso8601String(),
      'is_active': isActive,
    };
  }

  UserManagementEntity toEntity() {
    return UserManagementEntity(
      id: id,
      name: name,
      email: email,
      avatar: avatar,
      createdAt: createdAt,
      isActive: isActive,
    );
  }
}
```

## Bước 4: Implement API DataSource

`lib/features/user_management/data/datasources/user_management_remote_datasource.dart`

```dart
import 'package:dio/dio.dart';
import '../models/user_management_model.dart';

abstract class UserManagementRemoteDataSource {
  Future<UserManagementModel> getUserManagement();
  Future<List<UserManagementModel>> getAllUsers();
  Future<UserManagementModel> createUser(UserManagementModel model);
}

class UserManagementRemoteDataSourceImpl implements UserManagementRemoteDataSource {
  final Dio dio;

  UserManagementRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserManagementModel> getUserManagement() async {
    try {
      final response = await dio.get('/api/users/me');
      return UserManagementModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to fetch user: ${e.message}');
    }
  }

  @override
  Future<List<UserManagementModel>> getAllUsers() async {
    try {
      final response = await dio.get('/api/users');
      final List<dynamic> data = response.data['data'];
      return data.map((json) => UserManagementModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch users: ${e.message}');
    }
  }

  @override
  Future<UserManagementModel> createUser(UserManagementModel model) async {
    try {
      final response = await dio.post('/api/users', data: model.toJson());
      return UserManagementModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to create user: ${e.message}');
    }
  }
}
```

## Bước 5: Add more UseCases

`lib/features/user_management/domain/usecases/create_user_usecase.dart`

```dart
import 'package:dartz/dartz.dart';
import '../entities/user_management_entity.dart';
import '../repositories/user_management_repository.dart';
import '../../../../core/errors/failures.dart';

class CreateUserUseCase {
  final UserManagementRepository repository;

  CreateUserUseCase({required this.repository});

  Future<Either<Failure, UserManagementEntity>> execute({
    required String name,
    required String email,
  }) async {
    // Add validation logic here
    if (name.isEmpty) {
      return const Left(ServerFailure('Name cannot be empty'));
    }
    
    if (!_isValidEmail(email)) {
      return const Left(ServerFailure('Invalid email format'));
    }

    return await repository.createUserManagement(name: name, email: email);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
```

## Bước 6: Update Controller

`lib/features/user_management/presentation/controllers/user_management_controller.dart`

```dart
import 'package:get/get.dart';
import '../../domain/usecases/get_user_management_usecase.dart';
import '../../domain/usecases/create_user_usecase.dart';
import '../../domain/entities/user_management_entity.dart';

class UserManagementController extends GetxController {
  final GetUserManagementUseCase getUserManagementUseCase;
  final CreateUserUseCase createUserUseCase;

  UserManagementController({
    required this.getUserManagementUseCase,
    required this.createUserUseCase,
  });

  // Observable state
  final _isLoading = false.obs;
  final _errorMessage = ''.obs;
  final _currentUser = Rx<UserManagementEntity?>(null);
  final _users = <UserManagementEntity>[].obs;

  // Getters
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;
  UserManagementEntity? get currentUser => _currentUser.value;
  List<UserManagementEntity> get users => _users;

  @override
  void onInit() {
    super.onInit();
    loadCurrentUser();
  }

  Future<void> loadCurrentUser() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final result = await getUserManagementUseCase.execute();

      result.fold(
        (failure) => _errorMessage.value = failure.message,
        (user) => _currentUser.value = user,
      );
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> createUser(String name, String email) async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final result = await createUserUseCase.execute(
        name: name,
        email: email,
      );

      result.fold(
        (failure) {
          _errorMessage.value = failure.message;
          Get.snackbar('Error', failure.message);
        },
        (user) {
          _users.add(user);
          Get.snackbar('Success', 'User created successfully');
        },
      );
    } finally {
      _isLoading.value = false;
    }
  }
}
```

## Bước 7: Customize View

`lib/features/user_management/presentation/views/user_management_view.dart`

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_management_controller.dart';

class UserManagementView extends GetView<UserManagementController> {
  const UserManagementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showCreateUserDialog,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: Colors.red),
                SizedBox(height: 16),
                Text(controller.errorMessage),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.loadCurrentUser,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (controller.currentUser == null) {
          return const Center(child: Text('No user data'));
        }

        final user = controller.currentUser!;
        
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User profile card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: user.avatar != null
                            ? NetworkImage(user.avatar!)
                            : null,
                        child: user.avatar == null
                            ? Text(user.name[0].toUpperCase())
                            : null,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(user.email),
                            const SizedBox(height: 4),
                            Chip(
                              label: Text(user.isActive ? 'Active' : 'Inactive'),
                              backgroundColor: user.isActive
                                  ? Colors.green.shade100
                                  : Colors.grey.shade300,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Users list
              Text(
                'All Users',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  final user = controller.users[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text(user.name[0])),
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    trailing: Icon(
                      user.isActive ? Icons.check_circle : Icons.cancel,
                      color: user.isActive ? Colors.green : Colors.grey,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  void _showCreateUserDialog() {
    final nameController = TextEditingController();
    final emailController = TextEditingController();

    Get.dialog(
      AlertDialog(
        title: const Text('Create User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.createUser(
                nameController.text,
                emailController.text,
              );
              Get.back();
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}
```

## Bước 8: Setup Routes

`lib/main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/user_management/presentation/views/user_management_view.dart';
import 'features/user_management/presentation/bindings/user_management_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Clean Architecture Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/user-management',
      getPages: [
        GetPage(
          name: '/user-management',
          page: () => const UserManagementView(),
          binding: UserManagementBinding(),
        ),
      ],
    );
  }
}
```

## Kết quả

✅ Clean Architecture với 3 layers rõ ràng  
✅ GetX state management  
✅ Dependency Injection qua Binding  
✅ Error handling với Either/Failure  
✅ Testable code (mỗi layer độc lập)  
✅ Scalable & Maintainable  

🎉 **Happy Coding!**
