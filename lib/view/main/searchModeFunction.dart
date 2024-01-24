import 'package:flutter/material.dart';

class SearchSettingModal extends StatefulWidget {
  @override
  _SearchSettingModalState createState() => _SearchSettingModalState();
}

class _SearchSettingModalState extends State<SearchSettingModal> {
  // Add your search settings here
  String selectedCategory = 'All';
  bool includeLocation = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Search Settings'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text('Category'),
              SizedBox(width: 10),
              DropdownButton<String>(
                value: selectedCategory,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
                items: ['All', 'Technology', 'Fashion', 'Sports', 'Food']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            children: [
              Text('Include Location'),
              Switch(
                value: includeLocation,
                onChanged: (value) {
                  setState(() {
                    includeLocation = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Save the search settings and close the dialog
            // You can pass the settings back to the calling widget if needed
            Navigator.of(context).pop();
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}


