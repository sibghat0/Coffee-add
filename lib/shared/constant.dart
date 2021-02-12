import 'package:flutter/material.dart';


const textInput = InputDecoration(
  hintText: 'Email',
  fillColor: Colors.grey,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 0.5),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 0.5),
  ),
);