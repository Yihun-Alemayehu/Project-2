import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:project_2/features/post/model/post.dart';
import 'package:uuid/uuid.dart';

class PostRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _cloud = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> createImagePost({required Post post, required List<String> imageUrls}) async {
    try {
      final postId = await _cloud.collection('posts').add(
        {
          'id': '',
          'type': post.type,
          'content': post.content,
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
  Future<String> addImage(File image) async {
    try {
      final uid = _auth.currentUser!.uid;
      final String randomImageName = '${const Uuid().v4()}.jpg';
      final storageRef = _storage.ref().child('$uid/posts/$randomImageName');
      UploadTask uploadTask = storageRef.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String imageUrl = await taskSnapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print('Error while adding image ${e.toString()}');
      return '';
    }
  }
}
