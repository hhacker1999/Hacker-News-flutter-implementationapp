import 'package:harsh_news/web/URL.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class Onlinework {
  Future<List<http.Response>> getTopStories() async {
    final response = await http.get(URL.urlTopStories());
    if (response.statusCode == 200) {
      Iterable storyIds = jsonDecode(response.body);
      return Future.wait(storyIds.take(15).map((storyId) {
        return _getStory(storyId);
      }));
    } else {
      throw Exception('unable to fetch Data');
    }
  }

  Future<http.Response> _getStory(int storyId) {
    return http.get(URL.urlForStory(storyId));
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
