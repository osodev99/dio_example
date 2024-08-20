import 'package:dio_example/network/dio_client.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DIO Example'),
        ),
        body: ListView(
          children: [
            ElevatedButton(
              child: const Text('GET user id: 1'),
              onPressed: () {
                DioClient.instance.client.get('');
              },
            ),
            ElevatedButton(
              child: const Text('GET user id: 25'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
// gofile