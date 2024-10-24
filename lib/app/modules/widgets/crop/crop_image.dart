// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';

class CropImage extends StatelessWidget {
  final CropController controller;
  final Uint8List image;
  final void Function(Uint8List) onCropped;

  const CropImage({
    super.key,
    required this.controller,
    required this.image,
    required this.onCropped,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final maxHeight = constraints.maxHeight;

        print('maxWidth = $maxWidth');
        print('maxHeight = $maxHeight');

        return Container(
          width: maxWidth,
          height: 200,
          child: Center(
            child: Crop(
              image: image,
              onCropped: onCropped,
              initialSize: 0.5,
              progressIndicator: const CircularProgressIndicator.adaptive(),
              initialRectBuilder: (viewportRect, imageRect) {
                return Rect.fromLTRB(
                  viewportRect.left + 24,
                  viewportRect.top + 24,
                  viewportRect.right - 24,
                  viewportRect.bottom - 24,
                );
              },
              // willUpdateScale: (newScale) => newScale < 5,
              onStatusChanged: (status) {
                print('crop onStatusChanged = $status');
              },
            ),
          ),
        );
      },
    );
    // return Scaffold(
    //   body:
    // );
  }
}
