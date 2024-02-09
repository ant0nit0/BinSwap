import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recycling_master/utils/bin_enums.dart';
import 'package:recycling_master/utils/colors.dart';

/// Transform an int [nbSeconds] into a String with the format mm:ss
String formatTime(int nbSeconds) {
  final minutes = (nbSeconds / 60).floor();
  final seconds = nbSeconds % 60;
  return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}

/// Return a list of size [size] with random [BinCategory]
/// Each item in the list is unique
List<BinCategory> getRandomBinsCategories(int size) {
  final random = Random();
  final binsCategories = <BinCategory>[];
  while (binsCategories.length < size) {
    final binCategory =
        BinCategory.values[random.nextInt(BinCategory.values.length)];
    if (!binsCategories.contains(binCategory)) {
      binsCategories.add(binCategory);
    }
  }
  return binsCategories;
}

/// Returns a color in a string form 'red' according to the [BinCategory] given
String getColorStringFromBin(BinCategory binCategory) {
  switch (binCategory) {
    case BinCategory.electronics:
      return 'red';
    case BinCategory.glass:
      return 'gray';
    case BinCategory.papers:
      return 'orange';
    case BinCategory.plastics:
      return 'blue';
    case BinCategory.textiles:
      return 'purple';
    case BinCategory.organics:
      return 'green';
    default:
      return 'red';
  }
}

/// Returns a [Color] according to the [BinCategory] given
Color getColorFromBin(BinCategory binCategory) {
  switch (binCategory) {
    case BinCategory.electronics:
      return binRedColor;
    case BinCategory.glass:
      return binGrayColor;
    case BinCategory.papers:
      return binOrangeColor;
    case BinCategory.plastics:
      return binBlueColor;
    case BinCategory.textiles:
      return binPurpleColor;
    case BinCategory.organics:
      return binGreenColor;
    default:
      return binRedColor;
  }
}

/// Returns a [Color] according to the [BinCategory] given
Color getColorFromBinColor(BinColor binColor) {
  switch (binColor) {
    case BinColor.red:
      return binRedColor;
    case BinColor.gray:
      return binGrayColor;
    case BinColor.orange:
      return binOrangeColor;
    case BinColor.blue:
      return binBlueColor;
    case BinColor.purple:
      return binPurpleColor;
    case BinColor.green:
      return binGreenColor;
    default:
      return binRedColor;
  }
}
