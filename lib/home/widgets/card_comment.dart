import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joseph_prueba/app/constants.dart';
import 'package:joseph_prueba/app/utils/utils.dart';
import 'package:joseph_prueba/home/cubit/posts_cubit.dart';

class CardComment extends StatelessWidget {
  const CardComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${context.read<PostsCubit>().post!.user['firstName']} ${context.read<PostsCubit>().post!.user['firstName']}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Constants.textColor,
                        fontSize: UtilSize.height(12, context),
                        height: UtilSize.height(18, context) / UtilSize.height(12, context),
                      ),
                ),
                SizedBox(height: UtilSize.height(6, context)),
                Expanded(
                  child: Text(
                    'Muchas gracias Indra, realmente me ayudaste con la compra de ese producto. Estoy muy feliz con la nueva tele para mi casa :3',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w300,
                          color: Constants.textColor,
                          fontSize: UtilSize.height(10, context),
                          height: UtilSize.height(15, context) / UtilSize.height(10, context),
                        ),
                  ),
                ),
                SizedBox(height: UtilSize.height(10, context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
