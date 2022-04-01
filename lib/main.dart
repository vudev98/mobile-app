import 'package:flutter/material.dart';
import 'form_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'RentalZ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
          primarySwatch: Colors.purple
      ),
      home: const MyStatefulForm()
    );
  }
}


