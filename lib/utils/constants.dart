import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:recycling_master/models/bin.dart';
import 'package:recycling_master/models/item.dart';
import 'package:recycling_master/utils/bin_enums.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

const defaultLife = 3.0;

const kNumberOfStoredScores = 10;

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
  Item(name: 'charger', category: BinCategory.electronics, score: 5),
  Item(name: 'console', category: BinCategory.electronics, score: 4),
  Item(name: 'desktop', category: BinCategory.electronics, score: 3),
  Item(name: 'keyboard', category: BinCategory.electronics, score: 6),
  Item(name: 'printer', category: BinCategory.electronics, score: 7),
  Item(name: 'smartphone', category: BinCategory.electronics, score: 4),
  Item(name: 'toaster', category: BinCategory.electronics, score: 6),
];

final glassesItems = [
  Item(name: 'beer', category: BinCategory.glass, score: 7),
  Item(name: 'broken-glass', category: BinCategory.glass, score: 6),
  Item(name: 'chocolate', category: BinCategory.glass, score: 4),
  Item(name: 'jar', category: BinCategory.glass, score: 3),
  Item(name: 'mirror', category: BinCategory.glass, score: 4),
  Item(name: 'sparkling-wine', category: BinCategory.glass, score: 6),
  Item(name: 'window', category: BinCategory.glass, score: 5),
];

final organicsItems = [
  Item(name: 'apple', category: BinCategory.organics, score: 7),
  Item(name: 'autumn', category: BinCategory.organics, score: 4),
  Item(name: 'bread', category: BinCategory.organics, score: 6),
  Item(name: 'coffee-filter', category: BinCategory.organics, score: 5),
  Item(name: 'food', category: BinCategory.organics, score: 3),
  Item(name: 'grass', category: BinCategory.organics, score: 4),
  Item(name: 'tea-bag', category: BinCategory.organics, score: 6),
];

final papersItems = [
  Item(name: 'eggs', category: BinCategory.papers, score: 5),
  Item(name: 'email', category: BinCategory.papers, score: 6),
  Item(name: 'magazine', category: BinCategory.papers, score: 6),
  Item(name: 'newspaper', category: BinCategory.papers, score: 7),
  Item(name: 'open-box', category: BinCategory.papers, score: 4),
  Item(name: 'paper-bag', category: BinCategory.papers, score: 4),
  Item(name: 'pizza', category: BinCategory.papers, score: 3),
];

final plasticsItems = [
  Item(name: 'bag', category: BinCategory.plastics, score: 7),
  Item(name: 'container', category: BinCategory.plastics, score: 4),
  Item(name: 'drink', category: BinCategory.plastics, score: 6),
  Item(name: 'plastic-bottle', category: BinCategory.plastics, score: 5),
  Item(name: 'plastic', category: BinCategory.plastics, score: 4),
  Item(name: 'shampoo', category: BinCategory.plastics, score: 6),
  Item(name: 'yogurt', category: BinCategory.plastics, score: 3),
];

final textilesItems = [
  Item(name: 'blanket', category: BinCategory.textiles, score: 3),
  Item(name: 'gloves', category: BinCategory.textiles, score: 6),
  Item(name: 'jacket', category: BinCategory.textiles, score: 5),
  Item(name: 'jeans', category: BinCategory.textiles, score: 4),
  Item(name: 'polo-shirt', category: BinCategory.textiles, score: 6),
  Item(name: 'shoes', category: BinCategory.textiles, score: 7),
  Item(name: 'winter-scarf', category: BinCategory.textiles, score: 4),
];

final allItems = [
  ...electronicsItems,
  ...glassesItems,
  ...organicsItems,
  ...papersItems,
  ...plasticsItems,
  ...textilesItems,
];
