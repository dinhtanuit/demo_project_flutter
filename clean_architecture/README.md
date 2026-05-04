# Clean Architecture Template with GetX

Template Mason để tự động sinh code Clean Architecture với GetX state management.

## Cấu trúc sinh ra

```
lib/features/<module_name>/
├── presentation/
│   ├── controllers/         # GetX Controllers
│   ├── views/              # Flutter Views/Screens
│   └── bindings/           # GetX Bindings (DI)
├── domain/
│   ├── entities/           # Business Entities
│   ├── usecases/           # Business Logic
│   └── repositories/       # Repository Interfaces
└── data/
    ├── models/             # Data Models (JSON mapping)
    ├── repositories/       # Repository Implementations
    └── datasources/        # API/Local Data Sources
```

## Cách sử dụng

### 1. Tạo module mới

```bash
mason make clean-architecture --name user
```

hoặc

```bash
mason make clean-architecture
# Nhập tên module khi được hỏi: user_profile
```

### 2. Thêm route vào app

Trong `main.dart` hoặc file routes:

```dart
import 'features/user/presentation/views/user_view.dart';
import 'features/user/presentation/bindings/user_binding.dart';

GetPage(
  name: '/user',
  page: () => const UserView(),
  binding: UserBinding(),
),
```

### 3. Dependencies cần có

Thêm vào `pubspec.yaml`:

```yaml
dependencies:
  get: ^4.6.5
  dartz: ^0.10.1
  equatable: ^2.0.5
```

## Quy tắc Clean Architecture

1. **Presentation** - Chỉ xử lý UI và user interaction
2. **Domain** - Business logic thuần túy, không phụ thuộc framework
3. **Data** - Xử lý data từ API/DB, mapping model ↔ entity

## Customization

Sau khi generate, bạn cần:
- [ ] Cập nhật Entity fields trong `domain/entities/`
- [ ] Cập nhật Model fields và JSON mapping trong `data/models/`
- [ ] Implement API call trong `data/datasources/`
- [ ] Customize UI trong `presentation/views/`
- [ ] Add thêm UseCases nếu cần trong `domain/usecases/`

## Example Usage

```dart
// Navigate to generated screen
Get.toNamed('/user');

// Or use directly
Get.to(() => const UserView(), binding: UserBinding());
```
