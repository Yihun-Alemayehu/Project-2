import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class PostRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _cloud = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

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
          'userId': _auth.currentUser!.uid,
          'place': null,
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
      final uid = _auth.currentUser!.uid;
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
