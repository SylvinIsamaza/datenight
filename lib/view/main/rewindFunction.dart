import 'package:flutter/material.dart';

class RewindButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Pop the current route and go back to the previous screen
        Navigator.of(context).pop();
      },
      child: Text('Rewind'),
    );
  }
}
