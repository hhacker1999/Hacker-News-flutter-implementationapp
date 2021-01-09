import 'package:flutter/material.dart';

import 'screens/feed_screen.dart';

void main() {
  runApp(News());
}

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: FeedScreen(),
    );
  }
}
