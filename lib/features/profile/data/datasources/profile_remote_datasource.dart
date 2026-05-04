import '../models/profile_model.dart';

/// DataSource interface
abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
}

/// Mock implementation - thay bằng API thật khi cần
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<ProfileModel> getProfile() async {
    // TODO: Thay bằng API call thật
    await Future.delayed(const Duration(milliseconds: 500));

    return ProfileModel(
      name: 'John Doe',
      title: 'Software Engineer',
      avatarUrl: 'https://i.pravatar.cc/300',
    );
  }
}
