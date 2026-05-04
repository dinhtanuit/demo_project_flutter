# Login Feature - Clean Architecture Implementation

## 📁 Cấu trúc

```
lib/features/login/
├── presentation/           # UI Layer
│   ├── controllers/       # LoginController (MVVM ViewModel)
│   ├── views/            # LoginView (UI)
│   └── bindings/         # LoginBinding (DI)
├── domain/                # Business Logic Layer
│   ├── entities/         # LoginEntity
│   ├── usecases/         # LoginUseCase (business logic + validation)
│   └── repositories/     # LoginRepository interface
└── data/                  # Data Access Layer
    ├── models/           # LoginModel (DTO)
    ├── repositories/     # LoginRepositoryImpl
    └── datasources/      # LoginRemoteDataSource (API call)
```

## 🚀 Cách sử dụng

### 1. Thêm route trong main.dart

```dart
import 'package:get/get.dart';
import 'features/login/presentation/views/login_view.dart';
import 'features/login/presentation/bindings/login_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Login Demo',
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => const LoginView(),
          binding: LoginBinding(),
        ),
      ],
    );
  }
}
```

### 2. Navigate tới Login

```dart
Get.toNamed('/login');
```

### 3. Demo Credentials

Để test login, sử dụng:
- **Email**: `demo@example.com`
- **Password**: `123456`

## 🎯 Features Implemented

### ✅ Clean Architecture
- **3 layers** rõ ràng: Presentation / Domain / Data
- **Separation of concerns**: mỗi layer có responsibility riêng
- **Dependency Rule**: Domain không phụ thuộc vào Data/Presentation

### ✅ MVVM Pattern với GetX
- **ViewModel (Controller)**: xử lý logic, state management
- **View**: chỉ render UI, không có business logic
- **Reactive UI**: Obx() để update UI tự động

### ✅ Form Validation
- Email validation (regex)
- Password validation (min 6 characters)
- Empty field validation
- Error messages hiển thị inline

### ✅ State Management
- Loading state
- Error state
- Success state
- Password visibility toggle

### ✅ UI/UX
- Modern Material Design
- Form với TextFields styled
- Loading indicator
- Error/Success messages
- Demo credentials helper
- Logged-in user info display

### ✅ Error Handling
- Try-catch trong mọi layer
- Either<Failure, Success> pattern (dartz)
- Custom Failure types (ServerFailure, CacheFailure)
- User-friendly error messages

## 🔧 Technical Details

### Entity (Domain)
```dart
class LoginEntity {
  final String userId;
  final String email;
  final String name;
  final String token;
  final String? avatarUrl;
  final DateTime loginAt;
}
```

### Model (Data)
```dart
class LoginModel {
  // Same fields as Entity
  factory LoginModel.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
  LoginEntity toEntity();
}
```

### UseCase (Domain)
```dart
class LoginUseCase {
  Future<Either<Failure, LoginEntity>> execute({
    required String email,
    required String password,
  });
}
```

### Controller (Presentation)
```dart
class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  Future<void> login();
  void togglePasswordVisibility();
  void clearForm();
}
```

## 🔄 Flow Login

```
User Input (View)
    ↓
Controller.login()
    ↓
LoginUseCase.execute()
    ↓
(Validation)
    ↓
LoginRepository.login()
    ↓
LoginRemoteDataSource.login()
    ↓
(Mock API call - 2s delay)
    ↓
LoginModel → LoginEntity
    ↓
Controller updates State
    ↓
View re-renders (Obx)
```

## 📝 TODO / Next Steps

### Real API Integration
1. Replace mock DataSource với Dio/http
2. Update `LoginRemoteDataSourceImpl`:
```dart
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Dio dio;
  
  LoginRemoteDataSourceImpl({required this.dio});
  
  @override
  Future<LoginModel> login(String email, String password) async {
    final response = await dio.post(
      '/api/auth/login',
      data: {'email': email, 'password': password},
    );
    return LoginModel.fromJson(response.data);
  }
}
```

### Secure Storage
3. Add `flutter_secure_storage` package
4. Save/Load token từ secure storage
5. Update Repository để persist token

### Auto-login
6. Check token on app start
7. Navigate to home if logged in

### Logout
8. Implement logout feature
9. Clear token & navigate to login

### Tests
10. Unit tests cho UseCase
11. Unit tests cho Repository
12. Widget tests cho View

## 📚 Dependencies Required

Add to `pubspec.yaml`:

```yaml
dependencies:
  get: ^4.6.5           # State management & DI
  dartz: ^0.10.1        # Either/Functional programming
  equatable: ^2.0.5     # Value equality

  # Optional (for real API)
  dio: ^5.3.0           # HTTP client
  flutter_secure_storage: ^9.0.0  # Secure token storage
```

Run:
```bash
flutter pub get
```

## 🎨 Customization

### Change API endpoint
Update `LoginRemoteDataSourceImpl`:
```dart
final response = await dio.post('YOUR_API_ENDPOINT', ...);
```

### Add more fields
1. Update `LoginEntity`
2. Update `LoginModel`
3. Update API response parsing

### Customize UI
Edit `LoginView` để match design của bạn.

## ✨ Generated by Mason

Module này được generate bằng Mason template:
```bash
mason make clean_architecture --name login
```

Sau đó implement đầy đủ tính năng login với:
- Form validation
- API integration (mock)
- Error handling
- State management
- Modern UI

---

**Happy Coding! 🎉**
