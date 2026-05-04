import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/{{name.snakeCase()}}_controller.dart';

class {{name.pascalCase()}}View extends GetView<{{name.pascalCase()}}Controller> {
  const {{name.pascalCase()}}View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{name.titleCase()}}'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Error: ${controller.errorMessage}',
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.refresh,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (controller.data == null) {
          return const Center(
            child: Text('No data available'),
          );
        }

        // TODO: Implement your UI with controller.data
        return RefreshIndicator(
          onRefresh: controller.refresh,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                'Data loaded successfully!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Text('ID: ${controller.data!.id}'),
              // Add more fields from your entity here
            ],
          ),
        );
      }),
    );
  }
}
