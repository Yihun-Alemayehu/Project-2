import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:project_2/features/post/model/place.dart';

class Post extends Equatable {
  final String id;
  final String type;
  final String content;
  final List<String>? images;
  final int likes;
  final int saves;
  final int shares;
  final List<String>? commentIDs;
  final String createdAt;
  final String updatedAt;
  final String userId;
  final Place? place;
  
  const Post({
    required this.id,
    required this.type,
    required this.content,
    this.images,
    required this.likes,
    required this.saves,
    required this.shares,
    this.commentIDs,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    this.place,
  });

  Post copyWith({
    String? id,
    String? type,
    String? content,
    List<String>? images,
    int? likes,
    int? saves,
    int? shares,
    List<String>? commentIDs,
    String? createdAt,
    String? updatedAt,
    String? userId,
    Place? place,
  }) {
    return Post(
      id: id ?? this.id,
      type: type ?? this.type,
      content: content ?? this.content,
      images: images ?? this.images,
      likes: likes ?? this.likes,
      saves: saves ?? this.saves,
      shares: shares ?? this.shares,
      commentIDs: commentIDs ?? this.commentIDs,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userId: userId ?? this.userId,
      place: place ?? this.place,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'content': content,
      'images': images,
      'likes': likes,
      'saves': saves,
      'shares': shares,
      'commentIDs': commentIDs,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'userId': userId,
      'place': place?.toMap(),
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as String,
      type: map['type'] as String,
      content: map['content'] as String,
      images: map['images'] != null ? List<String>.from((map['images'] as List<String>)) : null,
      likes: map['likes'] as int,
      saves: map['saves'] as int,
      shares: map['shares'] as int,
      commentIDs: map['commentIDs'] != null ? List<String>.from((map['commentIDs'] as List<String>)) : null,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      userId: map['userId'] as String,
      place: map['place'] != null ? Place.fromMap(map['place'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      type,
      content,
      images,
      likes,
      saves,
      shares,
      commentIDs,
      createdAt,
      updatedAt,
      userId,
      place,
    ];
  }
}

