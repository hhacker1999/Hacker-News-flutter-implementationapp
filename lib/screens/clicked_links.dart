import 'package:flutter/material.dart';

class ClickedLinks extends StatelessWidget {
  final List<String> links;
  ClickedLinks({this.links});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harsh New'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: links.length,
          itemBuilder: (_, index) {
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                links[index],
                style: TextStyle(fontSize: 20.0),
              ),
            );
          },
        ),
      ),
    );
  }
}
