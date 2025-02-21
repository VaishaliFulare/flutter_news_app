import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace with your video news logic
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video News'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Video News Content Goes Here'),
      ),
    );
  }
}
