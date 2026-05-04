import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/photo_detail_controller.dart';
import '../widgets/detail_image_section.dart';
import '../widgets/detail_title_section.dart';
import '../widgets/detail_button_section.dart';
import '../widgets/detail_text_section.dart';

class PhotoDetailView extends GetView<PhotoDetailController> {
  const PhotoDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Photo View')),
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
                const SizedBox(height: 16),
                Text(controller.errorMessage),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.loadPhotoDetail,
                  child: const Text('Thử lại'),
                ),
              ],
            ),
          );
        }

        final detail = controller.photoDetail;
        if (detail == null) {
          return const Center(child: Text('Không có dữ liệu'));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              DetailImageSection(imagePath: detail.imagePath),
              DetailTitleSection(
                name: detail.name,
                location: detail.location,
                isFavorite: detail.isFavorite,
                favoriteCount: detail.favoriteCount,
                onFavoriteToggle: controller.toggleFavorite,
              ),
              const DetailButtonSection(),
              DetailTextSection(description: detail.description),
            ],
          ),
        );
      }),
    );
  }
}
