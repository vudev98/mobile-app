import 'dart:core';
import 'package:flutter/material.dart';
import 'package:rental_z/detail_screen.dart';

class MyStatefulForm extends StatefulWidget {
  const MyStatefulForm({Key? key}) : super(key: key);

  @override
  State<MyStatefulForm> createState() => MyStatefulFormState();
}

class MyStatefulFormState extends State<MyStatefulForm> {
  late String _propertyDropdownValue;
  late String _bedroomDropdownValue;

  // String _dateTime;
  late double _rentPrice;
  late String _furnitureType;
  late String _notes;
  late String _reporterName;

  final propertyItems = ["Flat", "House", "Bungalow"];
  final bedroomItems = ["Studio", "1 Bedroom", "2 Bedrooms"];
  final furnitureItems = ["Furnished", "Unfurnished", "Part Furnished"];

  Widget _buildPropertyType() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
        validator: (value) {
          if (value == null || value == "") {
            return 'This field is required!';
          }
        },
        decoration: const InputDecoration(
            hintText: 'Property Type', border: OutlineInputBorder()),
        onChanged: (String? value) {
          setState(() {
            _propertyDropdownValue = value!;
          });
        },
        items: propertyItems
            .map((property) =>
            DropdownMenuItem(value: property, child: Text(property)))
            .toList(),
      ),
    );
  }

  Widget _buildBedroom() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
        validator: (value) {
          if (value == null || value == "") {
            return 'This field is required!';
          }
        },
        decoration: const InputDecoration(
            hintText: 'Bedroom', border: OutlineInputBorder()),
        onChanged: (String? value) {
          setState(() {
            _bedroomDropdownValue = value!;
          });
        },
        items: bedroomItems
            .map((property) =>
            DropdownMenuItem(value: property, child: Text(property)))
            .toList(),
      ),
    );
  }

  Widget _buildRentPrice() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'Monthly Rent Price',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          value!.replaceAll(' ', '');
          if (value.isEmpty) {
            return 'This field is required';
          }
          final price = double.parse(value.replaceAll(" ", ""));
          if (price < 0) {
            return 'Price must be bigger than 0';
          }
          return null;
        },
        onSaved: (value) {
          _rentPrice = double.parse(value!);
        },
      ),
    );
  }

  Widget _buildFurnitureType() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
        validator: (value) {
          if (value == null || value == "") {
            return 'This field is required!';
          }
        },
        decoration: const InputDecoration(
            hintText: 'Furniture Type', border: OutlineInputBorder()),
        onChanged: (String? value) {
          setState(() {
            _furnitureType = value!;
          });
        },
        items: furnitureItems
            .map((property) =>
            DropdownMenuItem(value: property, child: Text(property)))
            .toList(),
      ),
    );
  }

  Widget _buildNotes() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        minLines: 2,
        maxLines: 8,
        keyboardType: TextInputType.multiline,
        decoration: const InputDecoration(
          labelText: 'Notes',
          border: OutlineInputBorder(),
        ),
        // validator: (value) {
        //   if (value!.isEmpty) {
        //     return 'This field is required';
        //   }
        //   return null;
        // },
        onSaved: (value) {
          _notes = value!;
        },
      ),
    );
  }

  Widget _buildReporterName() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'Reporter',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is required';
          } else if (!RegExp("[A-Z][a-z]*").hasMatch(value)) {
            return 'Please enter a valid name';
          }
          return null;
        },
        onSaved: (value) {
          _reporterName = value!;
        },
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // build a form widget using the _formKey created above
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text("Add apartment")),
        body: SingleChildScrollView(
          reverse: true,
          child: Container(
              margin: const EdgeInsets.all(12),
              child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _buildPropertyType(),
                        _buildBedroom(),
                        // _buildDateTime(),
                        _buildRentPrice(),
                        _buildFurnitureType(),
                        _buildReporterName(),
                        _buildNotes(),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // showDialog(context: context, builder: (BuildContext context) => const AlertDialog(
                                //   title: Text('Confirm property details?'),
                                //   content: ,
                                //
                                // ));
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder:(context) => DetailScreen(propertyType: propertyType, bedroom: bedroom, rentPrice: rentPrice, furnitureType: furnitureType, reporterName: reporterName, notes: notes) ));
                                // save data
                                _formKey.currentState?.save();
                              },
                              child: const Text('Proceed'),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                MediaQuery
                                    .of(context)
                                    .viewInsets
                                    .bottom))
                      ]))),
        ),
      ),
    );
  }
}
