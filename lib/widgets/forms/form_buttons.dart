import 'package:flutter/material.dart';

Widget formButtons({
  String title,
  onTap,
  isSelected,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: isSelected ? Colors.orange[600] : Colors.grey[300],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            textScaleFactor: 0.7,
          ),
        ),
      ),
    ),
  );
}
