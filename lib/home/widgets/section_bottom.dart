import 'package:flutter/material.dart';
import 'package:joseph_prueba/app/constants.dart';
import 'package:joseph_prueba/app/utils/utils.dart';
import 'package:joseph_prueba/app/widgets/theme_dialog.dart';

class SectionBottom extends StatelessWidget {
  const SectionBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showDialog(
            context: context,
            builder: (context) {
              return ThemeDialog(
                showIconClose: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: UtilSize.height(20, context)),
                    Text(
                      'Proximammente',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Constants.textColor,
                            fontSize: UtilSize.height(14, context),
                            height: UtilSize.height(21, context) / UtilSize.height(14, context),
                          ),
                    ),
                  ],
                ),
              );
            });
      },
      child: Container(
        height: UtilSize.height(66, context),
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(UtilSize.width(30, context)),
            topRight: Radius.circular(UtilSize.width(30, context)),
          ),
          color: Constants.cardCommentColor.withOpacity(0.1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: UtilSize.width(12, context),
                vertical: UtilSize.height(6, context),
              ),
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                color: Constants.grayColor,
              ),
              child: Row(
                children: [
                  Text(
                    '16',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Constants.textColor,
                          fontSize: UtilSize.height(14, context),
                          height: UtilSize.height(21, context) / UtilSize.height(14, context),
                        ),
                  ),
                  SizedBox(
                    width: UtilSize.width(5, context),
                  ),
                  Icon(
                    Icons.favorite_outline_rounded,
                    size: UtilSize.width(20, context),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: UtilSize.width(8, context),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: UtilSize.width(55, context),
                vertical: UtilSize.height(6, context),
              ),
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                color: Constants.redColor,
              ),
              child: Text(
                'Reservar',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Constants.whiteColor,
                      fontSize: UtilSize.height(14, context),
                      height: UtilSize.height(21, context) / UtilSize.height(14, context),
                    ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
