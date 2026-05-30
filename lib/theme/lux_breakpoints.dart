import 'dart:math' as math;

import 'package:flutter/widgets.dart';

/// Width at which phone layouts switch to tablet treatment (iPad portrait, etc.).
const kLuxTabletBreakpoint = 600.0;

/// Large tablet / iPad landscape.
const kLuxWideTabletBreakpoint = 900.0;

/// Primary scroll content width on tablet — keeps cards phone-proportioned.
const kLuxContentMaxWidth = 680.0;

/// Slightly wider frame for landscape tablets.
const kLuxWideContentMaxWidth = 760.0;

bool luxIsTablet(BuildContext context) =>
    MediaQuery.sizeOf(context).width >= kLuxTabletBreakpoint;

bool luxIsWideTablet(BuildContext context) =>
    MediaQuery.sizeOf(context).width >= kLuxWideTabletBreakpoint;

/// Effective content column width after applying [kLuxContentMaxWidth] on tablet.
double luxEffectiveContentWidth(BuildContext context) {
  final screenWidth = MediaQuery.sizeOf(context).width;
  if (!luxIsTablet(context)) return screenWidth;
  final cap = luxIsWideTablet(context)
      ? kLuxWideContentMaxWidth
      : kLuxContentMaxWidth;
  return math.min(screenWidth, cap);
}

double luxContentMaxWidth(BuildContext context) {
  if (!luxIsTablet(context)) {
    return MediaQuery.sizeOf(context).width;
  }
  return luxIsWideTablet(context)
      ? kLuxWideContentMaxWidth
      : kLuxContentMaxWidth;
}

/// More hub grid — extra column on tablet so tiles do not balloon.
int luxMoreGridCrossAxisCount(double contentWidth) =>
    contentWidth >= 620 ? 3 : 2;

double luxMoreGridChildAspectRatio(double contentWidth) =>
    contentWidth >= 620 ? 0.96 : 0.88;
