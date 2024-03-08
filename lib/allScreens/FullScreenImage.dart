import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  FullScreenImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        // Use GestureDetector to detect taps on the screen

        child: Center(
          child: PhotoView(
            imageProvider: NetworkImage(imageUrl), // Load the image from network
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 2,
            initialScale: PhotoViewComputedScale.contained,
            enableRotation: true,
          ),
        ),
      ),
    );
  }
}