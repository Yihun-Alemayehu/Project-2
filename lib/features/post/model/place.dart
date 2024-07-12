
import 'package:project_2/features/post/model/review.dart';

class Place {
  String? title;
  String? tag;
  String? location;
  double? rating;
  List<String>? gallery;
  String? about;
  List<String>? services;
  List<Reviews>? reviews;

  Place(
      {this.title,
      this.tag,
      this.location,
      this.rating,
      this.gallery,
      this.about,
      this.services,
      this.reviews});

  Place.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    tag = json['tag'];
    location = json['location'];
    rating = json['rating'];
    gallery = json['gallery'].cast<String>();
    about = json['about'];
    services = json['services'].cast<String>();
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
  }

  Place.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    tag = map['tag'];
    location = map['location'];
    rating = map['rating'];
    gallery = map['gallery'].cast<String>();
    about = map['about'];
    services = map['services'].cast<String>();
    if (map['reviews'] != null) {
      reviews = <Reviews>[];
      map['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['tag'] = this.tag;
    data['location'] = this.location;
    data['rating'] = this.rating;
    data['gallery'] = this.gallery;
    data['about'] = this.about;
    data['services'] = this.services;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'tag': tag,
      'location': location,
      'rating': rating,
      'gallery': gallery,
      'about': about,
      'services': services,
      'reviews': reviews!.map((x) => x.toMap()).toList(),
    };
  }
}