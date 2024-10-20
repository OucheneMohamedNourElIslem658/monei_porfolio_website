import 'package:flutter/material.dart';

class VerticalScroller extends StatelessWidget {
  const VerticalScroller({
    super.key, 
    this.controller,
    required this.child
  });

  final ScrollController? controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          controller: controller,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: child
            ),
          ),
        );
      },
    );
  }
}