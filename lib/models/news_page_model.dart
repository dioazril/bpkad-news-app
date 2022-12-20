import 'package:cloud_firestore/cloud_firestore.dart';

class NewsPageModel {
  String? title;
  String? image;
  String? content;

  NewsPageModel(
      {required this.title, required this.image, required this.content});

  NewsPageModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> data)
      : title = data['title'] as String,
        image = data['image'] as String,
        content = data['content'] as String;
}
