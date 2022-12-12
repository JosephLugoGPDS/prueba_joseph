import 'package:flutter/material.dart';
import 'package:joseph_prueba/app/constants.dart';
import 'package:joseph_prueba/app/utils/utils.dart';

class ThemeTextFormField extends StatelessWidget {
  const ThemeTextFormField({Key? key, required this.title, required this.textFormField}) : super(key: key);
  final Widget textFormField;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: UtilSize.height(10, context),
            bottom: UtilSize.height(10, context),
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: UtilSize.height(12, context),
                  height: UtilSize.height(18, context) / UtilSize.height(12, context),
                ),
          ),
        ),
        Container(
          width: UtilSize.width(248, context),
          height: UtilSize.height(30, context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              UtilSize.width(5, context),
            ),
            color: Constants.grayColor,
          ),
          padding: EdgeInsets.only(left: UtilSize.width(20, context)),
          child: textFormField,
        ),
      ],
    );
  }
}
