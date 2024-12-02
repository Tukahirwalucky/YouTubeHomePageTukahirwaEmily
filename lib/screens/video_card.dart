import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final String imagePath; // Image path for the thumbnail
  final String title; // Video title
  final String channelName; // Channel name
  final String views; // Number of views
  final String timeAgo; // Time since published

  const VideoCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.channelName,
    required this.views,
    required this.timeAgo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.grey[800],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            title, // Use dynamic title
            style: const TextStyle(color: Colors.white, fontSize: 16),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "$channelName • $views • $timeAgo", // Use dynamic data
            style: TextStyle(color: Colors.grey[400], fontSize: 12),
          ),
        ],
      ),
    );
  }
}
