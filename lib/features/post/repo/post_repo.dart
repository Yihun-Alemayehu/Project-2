import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project_2/features/post/model/place.dart';
import 'package:uuid/uuid.dart';

class PostRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _cloud = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final uid = "e2Z1ytoUxtUAHL6vmrgR6Fbt9u13";

  Future<void> createImagePost(
      {required String content, required List<String> imageUrls}) async {
    try {
      final postId = await _cloud.collection('posts').add(
        {
          'id': '',
          'type': 'post_with_image',
          'content': content,
          'images': imageUrls,
          'likes': 0,
          'saves': 0,
          'shares': 0,
          'commentIDs': [],
          'createdAt': DateTime.now().toString().substring(0, 10),
          'updatedAt': DateTime.now().toString().substring(0, 10),
          'userId': uid,
          'place': null,
        },
      );
      await _cloud.collection('posts').doc(postId.id).update({'id': postId.id});
    } catch (e) {
      print("An Error has occured while creating image post $e");
    }
  }

  Future<void> createPanoramaPost(
      {required String content, required List<String> imageUrls}) async {
    try {
      final postId = await _cloud.collection('posts').add(
        {
          'id': '',
          'type': 'post_with_panorama',
          'content': content,
          'images': imageUrls,
          'likes': 0,
          'saves': 0,
          'shares': 0,
          'commentIDs': [],
          'createdAt': DateTime.now().toString().substring(0, 10),
          'updatedAt': DateTime.now().toString().substring(0, 10),
          'userId': uid,
          'place': null,
        },
      );
      await _cloud.collection('posts').doc(postId.id).update({'id': postId.id});
    } catch (e) {
      print("An Error has occured while creating image post $e");
    }
  }

  Future<void> createTextPost(
      {required String content}) async {
    try {
      final postId = await _cloud.collection('posts').add(
        {
          'id': '',
          'type': 'post_with_text',
          'content': content,
          'images': [],
          'likes': 0,
          'saves': 0,
          'shares': 0,
          'commentIDs': [],
          'createdAt': DateTime.now().toString().substring(0, 10),
          'updatedAt': DateTime.now().toString().substring(0, 10),
          'userId': uid,
          'place': null,
        },
      );
      await _cloud.collection('posts').doc(postId.id).update({'id': postId.id});
    } catch (e) {
      print("An Error has occured while creating image post $e");
    }
  }

  Future<void> createPlacePost(
      {required String content, required Place place, required List<String> imageUrls}) async {
    try {
      final postId = await _cloud.collection('posts').add(
        {
          'id': '',
          'type': 'post_with_place',
          'content': content,
          'images': imageUrls,
          'likes': 0,
          'saves': 0,
          'shares': 0,
          'commentIDs': [],
          'createdAt': DateTime.now().toString().substring(0, 10),
          'updatedAt': DateTime.now().toString().substring(0, 10),
          'userId': uid,
          'place': place,
        },
      );
      await _cloud.collection('posts').doc(postId.id).update({'id': postId.id});
    } catch (e) {
      print("An Error has occured while creating image post $e");
    }
  }

  // Add Image
  Future<List<String>> addImage({required List<File> images}) async {
    try {
      final List<String> imagesUrl = [];
      for (File image in images) {
        final String randomImageName = '${const Uuid().v4()}.jpg';
        final storageRef = _storage.ref().child('$uid/posts/$randomImageName');
        UploadTask uploadTask = storageRef.putFile(image);
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
        String imageUrl = await taskSnapshot.ref.getDownloadURL();
        imagesUrl.add(imageUrl);
      }
      return imagesUrl;
    } catch (e) {
      print('Error while adding image ${e.toString()}');
      return [];
    }
  }
}
