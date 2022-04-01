import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(
      {Key? key,
      required this.propertyType,
      required this.bedroom,
      required this.rentPrice,
      required this.furnitureType,
      required this.reporterName,
      required this.notes})
      : super(key: key);

  final String propertyType;
  final String bedroom;
  final double rentPrice;
  final String furnitureType;
  final String reporterName;
  final String notes;

  @override
  Widget build(BuildContext context) {
    final property = ModalRoute.of(context)!.settings.arguments as DetailScreen;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Property Detail'),
      ),
    );
  }
}
