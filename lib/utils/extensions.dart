// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

extension SeparatedColumn on Column {
  Column separated({
    required Widget separator,
    bool addLastSeparator = false,
  }) {
    final List<Widget> _children = [];
    for (int i = 0; i < children.length; i++) {
      _children.add(children[i]);
      if (i != children.length - 1 || addLastSeparator) {
        _children.add(separator);
      }
    }
    return Column(
      children: _children,
    );
  }
}
