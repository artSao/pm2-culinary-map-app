import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String? _selectedCategory;

  final List<String> categories = ['All', 'Italian', 'Japanese', 'Chinese', 'Mexican'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter Restaurants')),
      body: Column(
        children: [
          DropdownButton<String>(
            value: _selectedCategory,
            hint: const Text('Select Category'),
            items: categories
                .map((category) => DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              // Apply filter and return to home
              Navigator.pop(context, _selectedCategory);
            },
            child: const Text('Apply Filter'),
          ),
        ],
      ),
    );
  }
}
