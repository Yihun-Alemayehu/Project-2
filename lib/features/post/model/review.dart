
import 'package:project_2/features/post/model/user.dart';

class Reviews {
  User? user;
  int? rating;
  String? comment;

  Reviews({this.user, this.rating, this.comment});

  Reviews.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    rating = json['rating'];
    comment = json['comment'];
  }

  Reviews.fromMap(Map<String, dynamic> map){
    user = map['user'] != null ? User.fromMap(map['user']) : null;
    rating = map['rating'];
    comment = map['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['rating'] = rating;
    data['comment'] = comment;
    return data;
  }

  Map<String, dynamic> toMap(){
    return {
      'user': user!.toMap(),
      'rating': rating,
      'comment': comment,
    };
  }
}