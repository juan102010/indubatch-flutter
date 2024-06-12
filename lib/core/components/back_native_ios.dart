import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BackNativeIOS extends StatefulWidget {
  const BackNativeIOS({super.key, required this.child, this.endHorizontalDrag});

  final Widget child;
  final VoidCallback? endHorizontalDrag;

  @override
  State<BackNativeIOS> createState() => _BackNativeIOSState();
}

class _BackNativeIOSState extends State<BackNativeIOS> {
  double _initialHorizontalDragPosition = 0;
  double _distanceHorizontalScrolled = 0;
  double _velocityHorizontalScroll = 0;

  final double _minVelocityScrollBack = 50;
  final double _minDistanceScrollBack = 1.w;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      dragStartBehavior: DragStartBehavior.start,
      onHorizontalDragStart: (details) {
        if (!Platform.isIOS) return;
        if (details.globalPosition.dx <= 20.w) {
          _initialHorizontalDragPosition = details.globalPosition.dx;
        }
      },
      onHorizontalDragUpdate: (details) {
        if (_initialHorizontalDragPosition > 0) {
          _distanceHorizontalScrolled =
              details.globalPosition.dx - _initialHorizontalDragPosition;
        }
      },
      onHorizontalDragEnd: (details) async {
        if (_initialHorizontalDragPosition > 0) {
          _velocityHorizontalScroll = details.primaryVelocity!;
          if (_velocityHorizontalScroll.abs() > _minVelocityScrollBack &&
              _distanceHorizontalScrolled.abs() > _minDistanceScrollBack) {
            if (widget.endHorizontalDrag != null) widget.endHorizontalDrag!();
          }
        }
        _initialHorizontalDragPosition = 0;
      },
      child: widget.child,
    );
  }
}
