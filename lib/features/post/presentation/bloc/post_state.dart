part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
  
  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostAddedState extends PostState {}

class PostErrorState extends PostState {
  final String message;

  const PostErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

