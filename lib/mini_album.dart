import 'package:flutter/material.dart';
import 'package:flutter_practice_1/rounded_image.dart';

class MiniAlbum extends StatelessWidget {
  const MiniAlbum({
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
    return Row(
      children: [
        // 가로 세로 동일한 크기로 쓸 때!
        SizedBox.square(dimension: 60, child: RoundedImage(imageUrl: imageUrl)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
        ),
        Icon(Icons.more_horiz),
      ],
    );
  }
}
