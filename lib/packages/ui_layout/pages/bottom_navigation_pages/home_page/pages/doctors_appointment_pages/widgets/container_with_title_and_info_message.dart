import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:flutter/material.dart';

class ContainerWithTitleAndInfoMessage extends StatelessWidget {
  const ContainerWithTitleAndInfoMessage(
      {Key? key,
      required this.message,
      this.title,
      this.newHeightShimmerEffect})
      : super(key: key);
  final String? title;
  final newHeightShimmerEffect;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: myTextStyleFontUbuntu(
                context: context, newFontWeight: FontWeight.w500),
          ),
        mySizedHeightBetweenContainer,
        Container(
          width: double.infinity,
          decoration: myStyleContainer(
              color: Theme.of(context).backgroundColor, context: context),
          child: message != null
              ? Padding(
                  padding: const EdgeInsets.all(myTopPaddingForContent),
                  child: Text(
                    message!,
                    style: myTextStyleFontUbuntu(
                      newFontWeight: FontWeight.w300,
                      context: context,
                      textColor: Theme.of(context).textTheme.headline2!.color,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                )
              : myShimmerEffectContainer(
                  context: context,
                  newHeight: newHeightShimmerEffect ?? 45,
                ),
        ),
      ],
    );
  }
}
