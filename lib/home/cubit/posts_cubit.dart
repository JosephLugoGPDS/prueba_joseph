import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:joseph_prueba/app/env.dart';
import 'package:joseph_prueba/app/utils/request_functions.dart';
import 'package:joseph_prueba/home/models/post_model.dart';
import 'package:http/http.dart' as http;

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(const PostsInitialState());
  void getPosts(int page) async {
    emit(const PostsLoadingState());
    try {
      final http.Response response = await RequestFunctions.getFunction('${Env.uriBase}/posts/?page=$page&limit=10', {
        'Content-Type': 'application/json',
        'Charset': 'utf-8',
      });
      if (response.statusCode != 200) {
        log('Error status code get post', name: '[SERVER EXCEPTION]');
        emit(const PostLoadedState(posts: []));
      } else {
        log('[GET POST]', name: '[SUCCESS]');
        final responseJson = json.decode(utf8.decode(response.bodyBytes));
        List<PostModel> postResponseList = <PostModel>[];
        if (responseJson != null && responseJson['items'] != null) {
          final postList = responseJson['items'];
          for (var i = 0; i < postList.length; i++) {
            PostModel post = postModelFromMap(postList[i]);
            postResponseList.add(post);
          }
        }
        posts = postResponseList;
        emit(PostLoadedState(posts: postResponseList));
      }
    } catch (e) {
      log(e.toString());
      emit(const PostsInitialState());
    }
  }
  List<PostModel> posts = <PostModel>[];
}
