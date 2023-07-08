import 'dart:ui';

import 'package:flutter/material.dart';

class BgBlur extends StatelessWidget {
  const BgBlur({
    Key? key,
    required this.child,
    this.padding = 10.0,
  }) : super(key: key);
  final Widget child;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(1000),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(41, 255, 255, 255)),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: child,
          ),
        ),
      ),
    );
  }
}
