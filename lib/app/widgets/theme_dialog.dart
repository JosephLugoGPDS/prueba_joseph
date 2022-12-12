import 'package:flutter/material.dart';
import 'package:joseph_prueba/app/constants.dart';
import 'package:joseph_prueba/app/utils/utils.dart';

class ThemeDialog extends StatelessWidget {
  const ThemeDialog({
    Key? key,
    required this.child,
    this.onTap,
    this.onTapClosed,
    this.showIconClose = true,
    this.contentPadding,
  }) : super(key: key);

  final Widget child;
  final void Function()? onTap;
  final void Function()? onTapClosed;
  final bool showIconClose;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      buttonPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(UtilSize.width(5, context)))),
      contentPadding: contentPadding ?? EdgeInsets.all(UtilSize.width(10, context)),
      content: Stack(
        children: <Widget>[
          showIconClose
            ? Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                onPressed: onTapClosed ?? () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.close,
                  color: Constants.blackColor,
                ),
              ),
            )
            : const SizedBox(),
          child,
        ],
      ),
    );
  }
}
