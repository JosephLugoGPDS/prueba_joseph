part of 'posts_cubit.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object?> get props => [];
}

class PostsInitialState extends PostsState {
  const PostsInitialState();
}
class PostsLoadingState extends PostsState {
  const PostsLoadingState();
}
class PostLoadedState extends PostsState {
  const PostLoadedState({
    required this.posts,
  });
  final List<PostModel> posts;
}
