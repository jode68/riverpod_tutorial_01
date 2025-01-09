import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template68/models/app_model.dart';
import 'package:template68/provider/app_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(appProvider.notifier).addItem(
                AppModel(
                  title: 'title',
                  description: 'description',
                  isDone: false,
                ),
              );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: appState.length,
        itemBuilder: (context, index) {
          final appModel = appState[index];
          return ListTile(
            onTap: () => Get.toNamed('/detailPage', arguments: appModel),
            title: Text(appModel.title),
            subtitle: Text(appModel.description),
            trailing: Checkbox(
              value: appModel.isDone,
              onChanged: (_) {
                ref.read(appProvider.notifier).isDone(index);
              },
            ),
            leading: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                ref.read(appProvider.notifier).removeItem(index);
              },
            ),
          );
        },
      ),
    );
  }
}
