import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joseph_prueba/app/constants.dart';
import 'package:joseph_prueba/app/router/router.dart';
import 'package:joseph_prueba/app/utils/utils.dart';
import 'package:joseph_prueba/home/cubit/posts_cubit.dart';
import 'package:joseph_prueba/home/widgets/card_post.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (_) {
        context.read<PostsCubit>().getPosts(1);
        return const HomeView();
      },
      // create: (_) => PostsCubit()..,
      
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whiteColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: UtilSize.width(35, context)),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: UtilSize.height(4, context),
                    bottom: UtilSize.height(20, context),
                  ),
                  child: Image.asset(
                    'assets/images/plaza_vea.png',
                    height: UtilSize.height(29, context),
                    width: UtilSize.height(87, context),
                  ),
                ),
              ),
              SizedBox(
                height: UtilSize.height(23, context),
                child: Stack(
                  children: [
                    Positioned(
                      left: UtilSize.width(45, context),
                      child: Text(
                        'Todas las promociones'.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Constants.redColor,
                              fontSize: UtilSize.height(12, context),
                              height: UtilSize.height(18, context) / UtilSize.height(12, context),
                            ),
                      ),
                    ),
                    Positioned(
                      top: UtilSize.height(22, context),
                      left: UtilSize.width(91, context),
                      child: Container(
                        color: Constants.redColor,
                        height: UtilSize.height(1, context),
                        width: UtilSize.width(67, context),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: UtilSize.height(28, context),
                  bottom: UtilSize.height(15, context),
                ),
                child: Text(
                  'Últimas promociones',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Constants.textColor,
                        fontSize: UtilSize.height(16, context),
                        height: UtilSize.height(24, context) / UtilSize.height(16, context),
                      ),
                ),
              ),
              BlocBuilder<PostsCubit, PostsState>(
              builder: (context, state) {
                if (state is PostsLoadingState || state is PostsInitialState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: List.generate(
                      context.read<PostsCubit>().posts.length,
                      (index) => CardPost(
                        onPressed: () async {
                          await Future.delayed(Duration.zero).then((_) => context.read<PostsCubit>().currentPost(context.read<PostsCubit>().posts[index]));
                          await Navigator.pushNamed(context, Routes.post);
                        },
                        post: context.watch<PostsCubit>().posts[index],
                      ),
                    ),
                  ),
                );
              }),
              // CardPost(),
            ],
          ),
        ),
      ),
    );
  }
}
