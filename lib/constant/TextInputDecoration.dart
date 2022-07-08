import 'package:flutter/material.dart';
import 'package:proximitystore/constant/ProxColors.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.transparent,
  filled: true,
  errorStyle: TextStyle(
    color: ProxColors.pink,
    fontWeight: FontWeight.bold,
    fontSize: 13,
  ),
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: ProxColors.grey,
      width: 1.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: ProxColors.deepblue,
      width: 2.0,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: ProxColors.pink,
      width: 2.0,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: ProxColors.pink,
      width: 2.0,
    ),
  ),
);
