import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:harsh_news/screens/clicked_links.dart';
import 'package:harsh_news/web/online_work.dart';
import '../components/reddit_card.dart';
import '../model/story.dart';

List<String> links = [];

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int taps = 0;
  List<Story> _stories = List<Story>();

  @override
  void initState() {
    super.initState();
    _feedTopStories();
  }

  void _feedTopStories() async {
    final responses = await Onlinework().getTopStories();
    final stories = responses.map((response) {
      final json = jsonDecode(response.body);
      return Story.fromJson(json);
    }).toList();
    setState(() {
      _stories = stories;
    });
  }

  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Harsh News'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ClickedLinks(links: links,)));
                  },
                  child: Text(
                    'No. of Taps is $taps',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    setState(() {
                      taps = 0;
                      links.clear();
                    });
                  },
                  child: Text(
                    'Reset',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.black,),
          Expanded(
            child: SizedBox(
              height: height,
              child: ListView.builder(
                  itemCount: _stories.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          taps = taps + 1;
                          links.add(_stories[index].url);
                          Onlinework().launchURL(_stories[index].url);
                        });
                      },
                      child: RedditLikeCard(
                        title: _stories[index].title,
                        user: _stories[index].by,
                        comments: _stories[index].comments == null
                            ? 0
                            : _stories[index].comments,
                        url: _stories[index].url,
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
