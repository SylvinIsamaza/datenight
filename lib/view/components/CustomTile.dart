import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomExpansionTile({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFD1939B),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.black),
            ),
            Icon(CupertinoIcons.right_chevron, size: 20),
          ],
        ),
      ),
    );
  }
}
