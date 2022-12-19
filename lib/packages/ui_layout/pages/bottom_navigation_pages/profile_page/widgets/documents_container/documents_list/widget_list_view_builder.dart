import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/pages/documents_page/documents_page.dart';
import 'package:intl/intl.dart';
import 'package:model/model.dart';
import 'package:business_layout/business_layout.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WidgetListViewBuilder extends StatelessWidget {
  const WidgetListViewBuilder(
      {Key? key, required this.documentList, required this.onTapNext})
      : super(key: key);
  final DocumentsListModel documentList;
  final VoidCallback onTapNext;

  @override
  Widget build(BuildContext context) {
    Rx<int> itemCount = documentList.docs.length.obs;

    return Obx(
      () => Column(
        key: key,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          itemCount.value == 0
              ? _ifLDocsEmpty(context: context)
              : Padding(
                  padding:
                      const EdgeInsets.only(top: myTopPaddingForContent / 2),
                  child: ListView.builder(
                    shrinkWrap: true,
                    //для динамического изменения высоты
                    padding: EdgeInsets.zero,
                    primary: false,
                    // //чтобы последние доки были сверху
                    // reverse: true,
                    itemCount: itemCount.value,
                    itemBuilder: (context, index) {
                      return TextButton(
                        style: ButtonStyle().copyWith(
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                        ),
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();

                          DocumentsProfilePage.openDocumentProfilePage(
                            context: context,
                            document: documentList.docs.elementAt(index),
                          );
                        },
                        child: _rowTileDocument(
                          context: context,
                          document: documentList.docs.elementAt(index),
                        ),
                      );
                    },
                  ),
                ),
          // if (_documentsList.page <= _documentsList.totalPages! &&
          //     _documentsList.totalPages != 1)
          if (documentList.totalPages != 1 &&
              itemCount <= documentList.totalDocs)
            TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
              onPressed: itemCount >= documentList.totalDocs
                  ? () => itemCount.value = 6
                  : onTapNext,
              child: Text(
                itemCount == documentList.totalDocs
                    ? 'Скрыть список...'
                    : 'Смотреть больше...',
                style: myTextStyleFontUbuntu(
                    newFontWeight: FontWeight.w300,
                    textColor: Theme.of(context).textTheme.headline3!.color,
                    context: context),
              ),
            ),
        ],
      ),
    );
  }

  _ifLDocsEmpty({required BuildContext context}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: myTopPaddingForContent),
        child: Text(
          'Документы не добавлены',
          style: myTextStyleFontUbuntu(
              newFontWeight: FontWeight.w300,
              textColor: Theme.of(context).textTheme.headline3!.color,
              fontSize: 20,
              context: context),
        ),
      ),
    );
  }
}

_rowTileDocument({
  required BuildContext context,
  required DocumentForIdModel document,
}) {
  return Row(
    children: [
      Expanded(
        child: Text(
          '${document.title!}',
          style: myTextStyleFontUbuntu(
              context: context, fontSize: 16, newFontWeight: FontWeight.w400),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
        ),
      ),
      Flexible(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                document.description ?? '...',
                style: myTextStyleFontUbuntu(
                  context: context,
                  fontSize: 14,
                  newFontWeight: FontWeight.w300,
                  textColor: Theme.of(context).textTheme.headline3!.color,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              "${document.createdAt != null ? "${DateFormat.Hm().format(DateTime.parse(document.createdAt!))}  ${DateFormat('d MMM').format(DateTime.parse(document.createdAt!))}" : '...'} ",
              style: myTextStyleFontUbuntu(
                context: context,
                fontSize: 14,
                newFontWeight: FontWeight.w300,
                textColor: Theme.of(context).textTheme.headline3!.color,
              ),
              textAlign: TextAlign.right,
              maxLines: 1,
            ),
          ],
        ),
      ),
    ],
  );
}
