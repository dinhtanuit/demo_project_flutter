import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/browzzin_controller.dart';
import '../widgets/browzzin_logo_widget.dart';

class BrowzzinView extends GetView<BrowzzinController> {
  const BrowzzinView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Browzzin Discovery')),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 88),
              const BrowzzinLogoWidget(),
              const SizedBox(height: 24),
              Obx(
                () => Text(
                  controller.caption,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                    letterSpacing: 2.1,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
