import '../models/photo_detail_model.dart';

/// DataSource interface
abstract class PhotoDetailLocalDataSource {
  Future<PhotoDetailModel> getPhotoDetail();
}

/// Mock implementation - dùng local data
class PhotoDetailLocalDataSourceImpl implements PhotoDetailLocalDataSource {
  @override
  Future<PhotoDetailModel> getPhotoDetail() async {
    // Data tĩnh - có thể thay bằng API hoặc database
    return PhotoDetailModel(
      name: 'Oeschinen Lake Campground',
      location: 'Kandersteg, Switzerland',
      description:
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
          'Bernese Alps. Situated 1,578 meters above sea level, it '
          'is one of the larger Alpine Lakes. A gondola ride from '
          'Kandersteg, followed by a half-hour walk through pastures '
          'and pine forest, leads you to the lake, which warms to 20 '
          'degrees Celsius in the summer. Activities enjoyed here '
          'include rowing, and riding the summer toboggan run.',
      imagePath: 'assets/images/lake.jpg',
    );
  }
}
