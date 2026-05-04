# Mason Clean Architecture Template - Quick Start Guide

## ✅ Setup hoàn tất!

Template đã được cài đặt và sẵn sàng sử dụng.

## 📦 Cấu trúc Template

```
clean_architecture/
├── brick.yaml                    # Config template
├── README.md                     # Hướng dẫn chi tiết
├── VSCODE_INTEGRATION.md         # Tích hợp VS Code
└── __brick__/                    # Template files
    ├── lib/
    │   ├── core/errors/          # Shared error handling
    │   └── features/{{name}}/
    │       ├── presentation/     # UI Layer (GetX)
    │       │   ├── controllers/  # GetX Controllers
    │       │   ├── views/        # Flutter Views
    │       │   └── bindings/     # Dependency Injection
    │       ├── domain/           # Business Logic
    │       │   ├── entities/     # Domain Models
    │       │   ├── usecases/     # Use Cases
    │       │   └── repositories/ # Repository Interfaces
    │       └── data/             # Data Access
    │           ├── models/       # DTOs + Mappers
    │           ├── repositories/ # Repo Implementation
    │           └── datasources/  # API/DB Access
```

## 🚀 Cách sử dụng

### 1. Tạo module mới

```bash
mason make clean_architecture
# Nhập tên: user_profile
```

### 2. Dependencies cần có

Thêm vào `pubspec.yaml`:

```yaml
dependencies:
  get: ^4.6.5           # State management
  dartz: ^0.10.1        # Functional programming (Either)
  equatable: ^2.0.5     # Value equality
  
dev_dependencies:
  build_runner: ^2.4.0  # (Optional) For code generation
  injectable: ^2.1.0    # (Optional) Better DI
```

Chạy:
```bash
flutter pub get
```

### 3. Thêm route

Trong `main.dart`:

```dart
import 'features/user_profile/presentation/views/user_profile_view.dart';
import 'features/user_profile/presentation/bindings/user_profile_binding.dart';

GetMaterialApp(
  getPages: [
    GetPage(
      name: '/user-profile',
      page: () => const UserProfileView(),
      binding: UserProfileBinding(),
    ),
  ],
)
```

### 4. Navigate

```dart
Get.toNamed('/user-profile');
```

## 📝 Workflow sau khi generate

1. **Update Entity** (`domain/entities/`)
   - Thêm/sửa fields theo business logic

2. **Update Model** (`data/models/`)
   - Sync fields với Entity
   - Implement `fromJson()` / `toJson()`

3. **Implement API** (`data/datasources/`)
   - Replace mock data với real API call
   - Inject HTTP client (Dio/http)

4. **Customize UI** (`presentation/views/`)
   - Design theo mockup
   - Wire với controller state

5. **Add Use Cases** (nếu cần)
   - Create, Update, Delete operations
   - Complex business logic

## 🎯 Best Practices

### ✅ DO:
- Giữ View thuần túy (chỉ render UI)
- Business logic ở UseCase
- State management ở Controller
- Dùng Binding cho DI
- Entity immutable (final fields)
- Repository trả về `Either<Failure, T>`

### ❌ DON'T:
- Gọi API trực tiếp trong Controller
- Logic phức tạp trong View
- Hardcode strings/configs
- Skip error handling
- Mix concerns giữa layers

## 🔥 Pro Tips

### 1. Alias cho nhanh

```bash
# Thêm vào ~/.zshrc
alias mca='mason make clean_architecture'
alias mls='mason list'
```

### 2. Auto format sau generate

```bash
mason make clean_architecture && dart format lib/
```

### 3. VS Code Task

Nhấn `Cmd+Shift+P` → "Tasks: Run Task" → "Mason: Generate Clean Architecture"

(Xem chi tiết trong `VSCODE_INTEGRATION.md`)

## 📚 Tài liệu tham khảo

- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) by Uncle Bob
- [GetX Documentation](https://github.com/jonataslaw/getx)
- [Mason Documentation](https://docs.brickhub.dev)
- [Dartz (Functional Programming)](https://pub.dev/packages/dartz)

## 🐛 Common Issues

### Import errors
```bash
flutter pub get
dart fix --apply
```

### Mason not found
```bash
export PATH="$PATH":"$HOME/.pub-cache/bin"
source ~/.zshrc
```

### Brick not found
```bash
mason get
mason list
```

## 📞 Next Steps

1. ✅ Generate your first module: `mason make clean_architecture`
2. ✅ Add dependencies to `pubspec.yaml`
3. ✅ Setup routes in `main.dart`
4. ✅ Implement your feature!

---

**Happy Coding! 🎉**

Questions? Check `README.md` and `VSCODE_INTEGRATION.md` for detailed guides.
