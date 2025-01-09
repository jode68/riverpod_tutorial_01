import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appModel = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 100,
          width: 240,
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
              title: Text(appModel.title),
              subtitle: Text(appModel.description),
              trailing: Checkbox(
                value: appModel.isDone,
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
