import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joseph_prueba/app/constants.dart';
import 'package:joseph_prueba/app/utils/date_formats_to_view.dart';
import 'package:joseph_prueba/app/utils/utils.dart';
import 'package:joseph_prueba/home/cubit/posts_cubit.dart';
import 'package:joseph_prueba/home/widgets/card_comment.dart';
import 'package:joseph_prueba/home/widgets/section_bottom.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whiteColor,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: UtilSize.height(4, context),
                  bottom: UtilSize.height(20, context),
                  left: UtilSize.width(35, context),
                  right: UtilSize.width(35, context),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: SvgPicture.asset(
                        'assets/images/left_arrow.svg',
                        height: UtilSize.height(13.41, context),
                        width: UtilSize.height(23.41, context),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: UtilSize.width(41, context)),
                    Image.asset(
                      'assets/images/plaza_vea.png',
                      fit: BoxFit.cover,
                      height: UtilSize.height(29, context),
                      width: UtilSize.height(87, context),
                    ),
                  ],
                ),
              ),
              BlocBuilder<PostsCubit, PostsState>(builder: (context, state) {
                if (state is PostsLoadingState || state is PostsInitialState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: UtilSize.height(28, context),
                          bottom: UtilSize.height(15, context),
                          left: UtilSize.width(35, context),
                          right: UtilSize.width(35, context),
                        ),
                        child: Text(
                          context.read<PostsCubit>().post!.title,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Constants.textColor,
                                fontSize: UtilSize.height(16, context),
                                height: UtilSize.height(24, context) / UtilSize.height(16, context),
                              ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: UtilSize.width(35, context),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Constants.grayColor),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(UtilSize.width(5, context)),
                            bottomRight: Radius.circular(UtilSize.width(5, context)),
                            topLeft: Radius.circular(UtilSize.width(5, context)),
                            topRight: Radius.circular(UtilSize.width(5, context)),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(UtilSize.width(5, context)),
                            bottomRight: Radius.circular(UtilSize.width(5, context)),
                            topLeft: Radius.circular(UtilSize.width(5, context)),
                            topRight: Radius.circular(UtilSize.width(5, context)),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: context.read<PostsCubit>().post!.image,
                            height: UtilSize.height(106, context),
                            width: UtilSize.width(208, context),
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                      ),
                      SizedBox(height: UtilSize.height(10, context)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: UtilSize.width(35, context),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: UtilSize.width(28, context),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  UtilSize.width(14, context),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: context.read<PostsCubit>().post!.user['avatar'],
                                  height: UtilSize.height(28, context),
                                  width: UtilSize.width(28, context),
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                              ),
                            ),
                            SizedBox(width: UtilSize.width(10, context)),
                            Expanded(
                              child: Text(
                                context.read<PostsCubit>().post!.title,
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Constants.textColor,
                                      fontSize: UtilSize.height(12, context),
                                      height: UtilSize.height(18, context) / UtilSize.height(12, context),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: UtilSize.height(20, context)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: UtilSize.width(35, context),
                        ),
                        child: Text(
                          context.read<PostsCubit>().post!.title,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w300,
                                color: Constants.textColor,
                                fontSize: UtilSize.height(12, context),
                                height: UtilSize.height(18, context) / UtilSize.height(12, context),
                              ),
                        ),
                      ),
                      SizedBox(height: UtilSize.height(10, context)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: UtilSize.width(35, context),
                        ),
                        child: Text(
                          'Publicado a las ${DateFormatsToView.dateHourWithMeridian(context.read<PostsCubit>().post!.createdAt, 'es')}',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w300,
                                color: Constants.textColor,
                                fontSize: UtilSize.height(8, context),
                                height: UtilSize.height(12, context) / UtilSize.height(8, context),
                              ),
                        ),
                      ),
                      SizedBox(height: UtilSize.height(34, context)),
                      // Comments section
                      Container(
                        color: Constants.cardCommentColor.withOpacity(0.5),
                        padding: EdgeInsets.symmetric(
                          horizontal: UtilSize.width(35, context),
                          vertical: UtilSize.width(20, context),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Comentarios',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Constants.textColor,
                                    fontSize: UtilSize.height(16, context),
                                    height: UtilSize.height(24, context) / UtilSize.height(16, context),
                                  ),
                            ),
                            SizedBox(height: UtilSize.height(15, context)),
                            ...List.generate(2, (index) => const CardComment()),
                            SizedBox(height: UtilSize.height(10, context)),
                            Container(
                              decoration: const ShapeDecoration(
                                shape: StadiumBorder(),
                                color: Constants.whiteColor,
                              ),
                              padding: EdgeInsets.only(left: UtilSize.width(15, context)),
                              child: TextFormField(
                                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                      color: Constants.textColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: UtilSize.height(12, context),
                                      height: UtilSize.height(18, context) / UtilSize.height(12, context),
                                    ),
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Escribe un comentario...',
                                  hintStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                                        color: Constants.blackColor.withOpacity(0.4),
                                        fontWeight: FontWeight.w400,
                                        fontSize: UtilSize.height(12, context),
                                        height: UtilSize.height(18, context) / UtilSize.height(12, context),
                                      ),
                                  alignLabelWithHint: true,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: UtilSize.height(10, context)),
                          ],
                        ),
                      ),
                      SizedBox(height: UtilSize.height(10, context)),
                      //Section bottom
                      const SectionBottom(),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
