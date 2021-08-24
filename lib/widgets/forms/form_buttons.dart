import 'package:flutter/material.dart';

Widget formButtons({
  String title,
  onTap,
  isSelected,
  Color color,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          border: Border.all(
            width: 5,
            color: isSelected ? Colors.black : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    ),
  );
}
