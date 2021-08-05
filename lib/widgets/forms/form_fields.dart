import 'package:flutter/material.dart';

Widget customField({onSaved, hint, isMandatory}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 10),
        hintMaxLines: 2,
      ),
      onSaved: onSaved,
      validator: (String input) {
        if (isMandatory ?? false) {
          if (input.isEmpty) {
            return "This is compulsory";
          } else {
            return null;
          }
        } else {
          return null;
        }
      },
    ),
  );
}
