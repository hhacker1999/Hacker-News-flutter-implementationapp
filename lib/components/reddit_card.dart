import 'package:flutter/material.dart';

class RedditLikeCard extends StatefulWidget {
  RedditLikeCard({this.user, this.title, this.comments, this.url});
  final int comments;
  final String user;
  final String title;
  final String url;

  @override
  _RedditLikeCardState createState() => _RedditLikeCardState();
}

class _RedditLikeCardState extends State<RedditLikeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Container(
        width: double.infinity,
        // height: height / 10,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  maxRadius: 15.0,
                  backgroundImage:
                      AssetImage('images/85b931ab8073420dee2720564a486cd0.png'),
                ),
                Text(
                  '   ${widget.user}',
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              child: Text(
                '${widget.title}',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            Row(
              children: [
                Icon(Icons.comment),
                Text(
                  '${widget.comments}',
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(
                  width: 35.0,
                ),
                Icon(Icons.share),
                SizedBox(
                  width: 35.0,
                ),
                Icon(Icons.bookmark)
              ],
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
