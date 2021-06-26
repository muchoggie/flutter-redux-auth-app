import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PasswordInputStyle {
  static InputDecoration textFieldStyle(
      {String labelTextStr = "",
      String hintTextStr = "",
      required ValueListenable<bool> showPassword,
      required void Function() onPressed}) {
    return InputDecoration(
        contentPadding: EdgeInsets.all(12),
        labelText: labelTextStr,
        hintText: hintTextStr,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: ValueListenableBuilder(
          valueListenable: showPassword,
          builder: (_, value, __) {
            return IconButton(
                icon: Icon(
                    value == false ? Icons.visibility : Icons.visibility_off),
                onPressed: onPressed);
          },
        ));
  }
}
