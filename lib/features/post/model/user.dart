// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String fullName;
  final String email;
  final String bio;
  final String createdAt;
  final String profilePic;
  final List<String> followers;
  final List<String> followings;
  final List<String> savedPosts;
  final List<String> myBookings;
  final String lastSeen;
  final String deviceId;
  final String location;
  final String language;
  final String modeSettings;
  final String referral;

  const User({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.bio,
    required this.createdAt,
    required this.profilePic,
    required this.followers,
    required this.followings,
    required this.savedPosts,
    required this.myBookings,
    required this.lastSeen,
    required this.deviceId,
    required this.location,
    required this.language,
    required this.modeSettings,
    required this.referral,
  });

  User copyWith({
    String? uid,
    String? fullName,
    String? email,
    String? bio,
    String? createdAt,
    String? profilePic,
    List<String>? followers,
    List<String>? followings,
    List<String>? savedPosts,
    List<String>? myBookings,
    String? lastSeen,
    String? deviceId,
    String? location,
    String? language,
    String? modeSettings,
    String? referral,
  }) {
    return User(
      uid: uid ?? this.uid,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      createdAt: createdAt ?? this.createdAt,
      profilePic: profilePic ?? this.profilePic,
      followers: followers ?? this.followers,
      followings: followings ?? this.followings,
      savedPosts: savedPosts ?? this.savedPosts,
      myBookings: myBookings ?? this.myBookings,
      lastSeen: lastSeen ?? this.lastSeen,
      deviceId: deviceId ?? this.deviceId,
      location: location ?? this.location,
      language: language ?? this.language,
      modeSettings: modeSettings ?? this.modeSettings,
      referral: referral ?? this.referral,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'bio': bio,
      'createdAt': createdAt,
      'profilePic': profilePic,
      'followers': followers,
      'followings': followings,
      'savedPosts': savedPosts,
      'myBookings': myBookings,
      'lastSeen': lastSeen,
      'deviceId': deviceId,
      'location': location,
      'language': language,
      'modeSettings': modeSettings,
      'referral': referral,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      bio: map['bio'] as String,
      createdAt: map['createdAt'] as String,
      profilePic: map['profilePic'] as String,
      followers: List<String>.from((map['followers'] ?? [])),
      followings: List<String>.from((map['followings'] ?? [])),
      savedPosts: List<String>.from((map['savedPosts'] ?? [])),
      myBookings: List<String>.from((map['myBookings'] ?? [])),
      lastSeen: map['lastSeen'] as String,
      deviceId: map['deviceId'] as String,
      location: map['location'] as String,
      language: map['language'] as String,
      modeSettings: map['modeSettings'] as String,
      referral: map['referral'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      uid,
      fullName,
      email,
      bio,
      createdAt,
      profilePic,
      followers,
      followings,
      savedPosts,
      myBookings,
      lastSeen,
      deviceId,
      location,
      language,
      modeSettings,
      referral,
    ];
  }
}
