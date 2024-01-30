import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void postFrameCallback(Function postFrameCallback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    postFrameCallback();
  });
}

/// runs [onFirstBuild] wrapped in a [postFrameCallback] to avoid providers
/// being called during widget builds
void onFirstBuild(Function onFirstBuild, {Function? onDispose}) {
  useEffect(() {
    // run this action once
    postFrameCallback(onFirstBuild);
    // run this callback on widget disposal
    return () {
      if (onDispose != null) onDispose();
    };
  }, [true]);
}
