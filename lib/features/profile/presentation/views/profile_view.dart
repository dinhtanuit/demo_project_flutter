import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../widgets/profile_card_widget.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Profile Card'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: Colors.red),
        ),
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
                const SizedBox(height: 16),
                Text(controller.errorMessage),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.loadProfile,
                  child: const Text('Thử lại'),
                ),
              ],
            ),
          );
        }

        final profile = controller.profile;
        if (profile == null) {
          return const Center(child: Text('Không có dữ liệu'));
        }

        return Container(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          alignment: Alignment.topCenter,
          margin: const EdgeInsetsDirectional.fromSTEB(16, 32, 16, 16),
          color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(width: 200, height: 20, color: Colors.red),
              const SizedBox(width: 16, height: 20),
              ProfileCardWidget(
                name: profile.name,
                title: profile.title,
                avatarUrl: profile.avatarUrl,
              ),
            ],
          ),
        );
      }),
    );
  }
}
