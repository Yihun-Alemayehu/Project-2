import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_2/features/post/repo/post_repo.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepo repo;
  PostBloc(this.repo) : super(PostInitial()) {
    on<AddPostEvent>((event, emit) async{
      emit(PostInitial());
      try {
        final imageUrls = await repo.addImage(images: event.images);
        await repo.createImagePost(content: event.content, imageUrls: imageUrls);
        emit(PostAddedState());
      } catch (e) {
        emit(PostErrorState(message: e.toString()));
      }
    });
  }
}
