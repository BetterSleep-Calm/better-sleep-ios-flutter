// ---------------------------------------------------------
// ✅ Custom Function: getNextIndex
// Author: Cherie Allardice
// Last updated: 17 July 2025
// Description:
//   Returns the next index in a looping sequence of 3.
//   Useful for rotating UI elements, playlist tracks, etc.
// Usage:
//   Takes current index (e.g., 0, 1, 2) and returns (1, 2, 0)
// ---------------------------------------------------------

import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:convert';

String generateUUID() {
  /// MODIFY CODE ONLY BELOW THIS LINE

  final now = DateTime.now();
  final timestampHex = now.millisecondsSinceEpoch.toRadixString(16);
  final microHex = now.microsecond.toRadixString(16).padLeft(4, '0');
  return 'uuid-$timestampHex-$microHex';

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
