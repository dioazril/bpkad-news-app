import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Reference get firebaseStorage => FirebaseStorage.instance.ref();

final firestore = FirebaseFirestore.instance;
final userRF = firestore.collection('users');
final newsContents = firestore.collection('berita');

DocumentReference newsContent ({
  required String newsID,
  required String newsField,
}) => newsContents.doc(newsID).collection('title').doc(newsField);

