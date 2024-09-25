import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuilderShimmer extends StatelessWidget {
  final bool state;
  final Widget child;

  const BuilderShimmer({
    super.key,
    required this.state,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final width = context.width;

    return Container();
  }
}
