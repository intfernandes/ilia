import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get mQuery => MediaQuery.of(this);
  double get screenWidth => mQuery.size.width;
  double get screenHeight => mQuery.size.height;
  ThemeData get theme => Theme.of(this);

  void dismissFocus() {
    final currentFocus = FocusScope.of(this);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  bool isVisible() {
    final object = findRenderObject();

    final viewport = RenderAbstractViewport.maybeOf(object);

    if (viewport == null) {
      return false;
    }

    final scrollableState = Scrollable.maybeOf(this);

    if (scrollableState == null) {
      return false;
    }

    final position = scrollableState.position;

    if (position.pixels > viewport.getOffsetToReveal(object!, 0.0).offset) {
      return false;
    } else if (position.pixels <
        viewport.getOffsetToReveal(object, 1.0).offset) {
      return false;
    } else {
      return true;
    }
  }
}
