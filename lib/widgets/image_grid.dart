import 'package:flutter/material.dart';

import '../screens/full_screen_image_screen.dart';

class ImageGrid extends StatelessWidget {
  final List<String> imagePaths;

  ImageGrid({required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullScreenImage(
                  imagePath: imagePaths[index],
                ),
              ),
            );
          },
          child: Image.asset(
            imagePaths[index],
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
        );
      },
    );
  }
}
