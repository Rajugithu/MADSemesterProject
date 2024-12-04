// albums_screen.dart
import 'package:flutter/material.dart';

import 'albums_detail_screen.dart';

class AlbumsScreen extends StatelessWidget {
  // List of images with their respective captions
  final List<Map<String, String>> images = [
    {'imagePath': 'assets/images/image1.jpg', 'caption': 'Nature'},
    {'imagePath': 'assets/images/image2.jpg', 'caption': 'Vehicles'},
    {'imagePath': 'assets/images/bike.jpeg', 'caption': 'Vehicles'},
    {'imagePath': 'assets/images/spot1.jpg', 'caption': 'Nature'},
    {'imagePath': 'assets/images/building.jpeg', 'caption': 'Buildings'},
    {'imagePath': 'assets/images/spot2.jpg', 'caption': 'Nature'},
  ];

  @override
  Widget build(BuildContext context) {
    // Group images by their captions
    Map<String, List<String>> albums = {};

    for (var image in images) {
      String caption = image['caption']!;
      String path = image['imagePath']!;

      if (albums.containsKey(caption)) {
        albums[caption]!.add(path);
      } else {
        albums[caption] = [path];
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Albums')),
      body: ListView.builder(
        itemCount: albums.keys.length,
        itemBuilder: (context, index) {
          String albumName = albums.keys.elementAt(index);
          return ListTile(
            title: Text(albumName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlbumDetailScreen(
                    albumName: albumName,
                    imagePaths: albums[albumName]!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

