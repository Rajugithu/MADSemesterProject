import 'package:flutter/material.dart';
import 'full_screen_image_screen.dart'; // Ensure this file exists

class PhotosScreen extends StatelessWidget {
  // List of images with captions
  final List<Map<String, String>> images = [
    {'imagePath': 'assets/images/image1.jpg', 'caption': 'Nature'},
    {'imagePath': 'assets/images/image2.jpg', 'caption': 'Nature'},
    {'imagePath': 'assets/images/bike.jpeg', 'caption': 'Vehicles'},
    {'imagePath': 'assets/images/spot1.jpg', 'caption': 'Nature'},
    {'imagePath': 'assets/images/building.jpeg', 'caption': 'Buildings'},
    {'imagePath': 'assets/images/spot2.jpg', 'caption': 'Buildings'},
    {'imagePath': 'assets/images/spot1.jpg', 'caption': 'Nature'},
    {'imagePath': 'assets/images/spot3.jpg', 'caption': 'Nature'},
    {'imagePath': 'assets/images/spot4.jpeg', 'caption': 'Lake'},
    {'imagePath': 'assets/images/spot5.jpeg', 'caption': 'Nature'},
    {'imagePath': 'assets/images/spot6.jpeg', 'caption': 'Lake'},
    {'imagePath': 'assets/images/spot7.jpeg', 'caption': 'Building'},
    {'imagePath': 'assets/images/spot8.jpeg', 'caption': 'Building'},
    {'imagePath': 'assets/images/spot9.jpeg', 'caption': 'Lake'},
    {'imagePath': 'assets/images/toycar.jpg', 'caption': 'Vehicles'},
    {'imagePath': 'assets/images/city.jpeg', 'caption': 'Vehicles'},
    {'imagePath': 'assets/images/hill.jpeg', 'caption': 'Nature'},
    {'imagePath': 'assets/images/hillView.jpeg', 'caption': 'Nature'},
    {'imagePath': 'assets/images/image3.jpg', 'caption': 'Vehicles'},
    {'imagePath': 'assets/images/toycar.jpg', 'caption': 'Vehicles'},
    {'imagePath': 'assets/images/spot2.jpg', 'caption': 'Vehicles'},
    {'imagePath': 'assets/images/spot2.jpg', 'caption': 'Vehicles'},
    {'imagePath': 'assets/images/spot2.jpg', 'caption': 'Vehicles'},



  ];

  @override
  Widget build(BuildContext context) {
    // Group images by their captions
    Map<String, List<String>> categorizedPhotos = {};

    for (var image in images) {
      String caption = image['caption']!;
      String path = image['imagePath']!;

      // Add image to the corresponding category
      if (categorizedPhotos.containsKey(caption)) {
        categorizedPhotos[caption]!.add(path);
      } else {
        categorizedPhotos[caption] = [path];
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('All Photos')),
      body: ListView.builder(
        itemCount: categorizedPhotos.keys.length,
        itemBuilder: (context, index) {
          String category = categorizedPhotos.keys.elementAt(index);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  category,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              GridView.builder(
                padding: EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // You can adjust this value based on your layout
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: categorizedPhotos[category]!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  String imagePath = categorizedPhotos[category]![index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to FullScreenImageScreen on tap
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenImage(
                            imagePath: imagePath,
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        height: 200, // Adjust height for better display
                        width: double.infinity,
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
