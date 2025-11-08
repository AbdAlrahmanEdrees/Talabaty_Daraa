import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:talabat_daraa/model/back_url.dart';

class ApiTest extends StatelessWidget {
  const ApiTest({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController urlController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('API Test Page'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: urlController,
              decoration: InputDecoration(labelText: 'Enter url'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement API call logic here
                BackUrl.url = urlController.text;
                print('API Call to: ${BackUrl.url}');
              },
              child: Text('Set url'),
            ),
          ],
        ),
      ),
    );
  }
}
