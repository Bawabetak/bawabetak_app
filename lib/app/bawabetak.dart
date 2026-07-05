import 'package:flutter/material.dart';

class Bawabetak extends StatelessWidget {
  const Bawabetak({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bawabetak',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(body: Center(child: Text('Welcome to Bawabetak!'))),
    );
  }
}
