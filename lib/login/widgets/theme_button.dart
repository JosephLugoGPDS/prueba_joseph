import 'package:flutter/material.dart';
import 'package:joseph_prueba/app/constants.dart';
import 'package:joseph_prueba/app/utils/utils.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: UtilSize.height(20, context),
      ),
      width: UtilSize.width(248, context),
      height: UtilSize.height(32, context),
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: Constants.yellowColor,
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: Constants.redColor,
              fontSize: UtilSize.height(12, context),
              height: UtilSize.height(18, context) / UtilSize.height(12, context),
            ),
      ),
    );
  }
}
