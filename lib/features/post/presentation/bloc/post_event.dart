part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends PostEvent {
  final String content;
  final List<File> images;

  const AddPostEvent({required this.content, required this.images});

  @override
  List<Object> get props => [content, images];
}
