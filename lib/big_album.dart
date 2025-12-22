import 'package:flutter/material.dart';
import 'package:flutter_practice_1/rounded_image.dart';

class BigAlbum extends StatelessWidget {
  const BigAlbum({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.artist,
  });

  final String imageUrl;
  final String title;
  final String artist;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoundedImage(imageUrl: imageUrl),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              //
            ),
          ),
          Text(
            artist,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              height: 1,
              //
            ),
          ),
        ],
      ),
    );
  }
}
