import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:flutter/material.dart';

List listHistory = [];

class ListWithHistory extends StatelessWidget {
  const ListWithHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 14,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding:
              const EdgeInsets.only(bottom: myHorizontalPaddingForContainer),
          child: rowWithHistory(context: context),
        );
      },
    );
  }

  Widget rowWithHistory({required BuildContext context}) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: FittedBox(
            child: Text(
              '20кг 10 раз',
              style: myTextStyleFontUbuntu(
                fontSize: 14,
                context: context,
                newFontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 9,
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: myTopPaddingForContent),
              child: Text(
                'Комментарий!Комментарий!Ко...',
                style: myTextStyleFontUbuntu(
                  fontSize: 14,
                  textColor: Theme.of(context).textTheme.headline3!.color,
                  context: context,
                  newFontWeight: FontWeight.w300,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        FittedBox(
          child: Text(
            '13:10',
            style: myTextStyleFontUbuntu(
              fontSize: 14,
              context: context,
              newFontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
