import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

bool checkForNull(String? token) {
  if (token == null) {
    print(token);
    return false;
  }

  return true;
}

bool validateLogin(
  String emailId,
  String password,
) {
  if (emailId == "" || password == "") {
    return false;
  }
  return true;
}

bool validateEmail(String email) {
  if (email.isEmpty) {
    return false;
  } else if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email)) {
    return false;
  } else {
    return true;
  }
}
