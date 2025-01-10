import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template68/models/app_model.dart';
import 'package:template68/provider/app_provider.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appModel = ref.watch(appProvider);
    final index = Get.arguments;
    final appMyList = appModel[index];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 120,
          width: 320,
          child: Card(
            color: Colors.yellowAccent,
            shadowColor: Colors.black,
            elevation: 16,
            child: ListTile(
              textColor: Colors.black,
              titleTextStyle: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              title: Text(appMyList.title),
              subtitle: Text(appMyList.description),
              trailing: Checkbox(
                value: appMyList.isDone,
                onChanged: (_) => ref.read(appProvider.notifier).isDone(index),
              ),
              leading: IconButton(
                onPressed: () => ref.read(appProvider.notifier).editItem(
                    AppModel(
                        title: 'Paolo', description: 'Xumerle', isDone: true),
                    index),
                icon: const Icon(Icons.edit, color: Colors.blueAccent),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
