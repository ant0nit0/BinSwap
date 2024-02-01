import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:recycling_master/models/bin.dart';
import 'package:recycling_master/models/item.dart';
import 'package:recycling_master/utils/bin_enums.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

const defaultLife = 1;

const kNumberOfStoredScores = 5;

final allBins = [
  Bin(
    category: BinCategory.organics,
    color: BinColor.green,
    description: translate('game.infos.bins.organics.description'),
    title: translate('game.infos.bins.organics.title'),
  ),
  Bin(
    category: BinCategory.plastics,
    color: BinColor.blue,
    description: translate('game.infos.bins.plastics.description'),
    title: translate('game.infos.bins.plastics.title'),
  ),
  Bin(
    category: BinCategory.glass,
    color: BinColor.gray,
    description: translate('game.infos.bins.glass.description'),
    title: translate('game.infos.bins.glass.title'),
  ),
  Bin(
    category: BinCategory.papers,
    color: BinColor.orange,
    description: translate('game.infos.bins.papers.description'),
    title: translate('game.infos.bins.papers.title'),
  ),
  Bin(
    category: BinCategory.textiles,
    color: BinColor.purple,
    description: translate('game.infos.bins.textiles.description'),
    title: translate('game.infos.bins.textiles.title'),
  ),
  Bin(
    category: BinCategory.electronics,
    color: BinColor.red,
    description: translate('game.infos.bins.electronics.description'),
    title: translate('game.infos.bins.electronics.title'),
  ),
];

final electronicsItems = [
  Item(name: 'charger', category: BinCategory.electronics),
  Item(name: 'console', category: BinCategory.electronics),
  Item(name: 'desktop', category: BinCategory.electronics),
  Item(name: 'keyboard', category: BinCategory.electronics),
  Item(name: 'printer', category: BinCategory.electronics),
  Item(name: 'smartphone', category: BinCategory.electronics),
  Item(name: 'toaster', category: BinCategory.electronics),
];

final glassesItems = [
  Item(name: 'beer', category: BinCategory.glass),
  Item(name: 'broken-glass', category: BinCategory.glass),
  Item(name: 'chocolate', category: BinCategory.glass),
  Item(name: 'jar', category: BinCategory.glass),
  Item(name: 'mirror', category: BinCategory.glass),
  Item(name: 'sparkling-wine', category: BinCategory.glass),
  Item(name: 'window', category: BinCategory.glass),
];

final organicsItems = [
  Item(name: 'apple', category: BinCategory.organics),
  Item(name: 'autumn', category: BinCategory.organics),
  Item(name: 'bread', category: BinCategory.organics),
  Item(name: 'coffee-filter', category: BinCategory.organics),
  Item(name: 'food', category: BinCategory.organics),
  Item(name: 'grass', category: BinCategory.organics),
  Item(name: 'tea-bag', category: BinCategory.organics),
];

final papersItems = [
  Item(name: 'eggs', category: BinCategory.papers),
  Item(name: 'email', category: BinCategory.papers),
  Item(name: 'magazine', category: BinCategory.papers),
  Item(name: 'newspaper', category: BinCategory.papers),
  Item(name: 'open-box', category: BinCategory.papers),
  Item(name: 'paper-bag', category: BinCategory.papers),
  Item(name: 'pizza', category: BinCategory.papers),
];

final plasticsItems = [
  Item(name: 'bag', category: BinCategory.plastics),
  Item(name: 'container', category: BinCategory.plastics),
  Item(name: 'drink', category: BinCategory.plastics),
  Item(name: 'plastic-bottle', category: BinCategory.plastics),
  Item(name: 'plastic', category: BinCategory.plastics),
  Item(name: 'shampoo', category: BinCategory.plastics),
  Item(name: 'yogurt', category: BinCategory.plastics),
];

final textilesItems = [
  Item(name: 'blanket', category: BinCategory.textiles),
  Item(name: 'gloves', category: BinCategory.textiles),
  Item(name: 'jacket', category: BinCategory.textiles),
  Item(name: 'jeans', category: BinCategory.textiles),
  Item(name: 'polo-shirt', category: BinCategory.textiles),
  Item(name: 'shoes', category: BinCategory.textiles),
  Item(name: 'winter-scarf', category: BinCategory.textiles),
];

final allItems = [
  ...electronicsItems,
  ...glassesItems,
  ...organicsItems,
  ...papersItems,
  ...plasticsItems,
  ...textilesItems,
];
