import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:joseph_prueba/app/constants.dart';
import 'package:joseph_prueba/app/utils/utils.dart';
import 'package:joseph_prueba/home/models/post_model.dart';

class CardPost extends StatelessWidget {
  const CardPost({
    Key? key,
    required this.post,
    required this.onPressed,
  }) : super(key: key);
  final PostModel post;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(
          left: UtilSize.width(20, context),
          right: UtilSize.width(20, context),
          top: UtilSize.width(20, context),
          bottom: UtilSize.width(10, context),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            UtilSize.width(5, context),
          ),
          color: Constants.cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                          top: UtilSize.height(10, context),
                        ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Constants.grayColor),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(UtilSize.width(14, context)),
                      bottomRight: Radius.circular(UtilSize.width(5, context)),
                      topLeft: Radius.circular(UtilSize.width(5, context)),
                      topRight: Radius.circular(UtilSize.width(5, context)),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(UtilSize.width(14, context)),
                      bottomRight: Radius.circular(UtilSize.width(5, context)),
                      topLeft: Radius.circular(UtilSize.width(5, context)),
                      topRight: Radius.circular(UtilSize.width(5, context)),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: post.image,
                      height: UtilSize.height(106, context),
                      width: UtilSize.width(208, context),
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      UtilSize.width(14, context),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: post.user['avatar'],
                      height: UtilSize.height(28, context),
                      width: UtilSize.width(28, context),
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: UtilSize.height(10, context),
                bottom: UtilSize.height(7, context),
              ),
              child: Text(
                post.title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Constants.textColor,
                      fontSize: UtilSize.height(14, context),
                      height: UtilSize.height(21, context) / UtilSize.height(14, context),
                    ),
              ),
            ),
            Text(
              post.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w300,
                    color: Constants.textColor,
                    fontSize: UtilSize.height(12, context),
                    height: UtilSize.height(18, context) / UtilSize.height(12, context),
                  ),
            ),
            SizedBox(height: UtilSize.height(20, context)),
          ],
        ),
      ),
    );
  }
}
