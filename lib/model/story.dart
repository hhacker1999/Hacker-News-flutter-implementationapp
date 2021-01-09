class Story {
  final String by;
  final String text;
  final int id;
  final String title;
  final String url;
  final int comments;
  

  Story({this.by, this.text, this.id, this.title, this.url, this.comments});
  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      by: json['by'],
      id: json['id'],
      text: json['text'],
      title: json['title'],
      url: json['url'],
      comments: json['descendants']
      
    );
  }
}
