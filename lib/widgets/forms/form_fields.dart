import 'package:flutter/material.dart';

Widget customField({
  onSaved,
  hint,
  isMandatory,
  isHidden,
  int minLength,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 15),
        hintMaxLines: 2,
      ),
      onSaved: onSaved,
      obscureText: isHidden ?? false,
      validator: (String input) {
        if ((minLength ?? 0) <= input.length) {
          if (isMandatory ?? false) {
            if (input.isEmpty) {
              return "This is compulsory";
            } else {
              return null;
            }
          } else {
            return null;
          }
        } else {
          return "There should be minimum $minLength characters";
        }
      },
    ),
  );
}
