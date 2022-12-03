import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/pages/documents_page/documents_page.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:intl/intl.dart';
import 'package:model/model.dart';
import 'package:business_layout/business_layout.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DocumentsList extends StatelessWidget {
  const DocumentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementSettingGetXController>(
      builder: (controllerSetting) {
        if (controllerSetting.userAllData != null) {
          return _loadingDocumentsList(context: context);
        } else {
          return _myListWithShimmerEffect();
        }
      },
    );
  }

  Widget _myListWithShimmerEffect() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: ListView.builder(
        shrinkWrap: true,
        //для динамического изменения высоты
        padding: EdgeInsets.zero,
        primary: false,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: myShimmerEffectContainer(context: context, newHeight: 40),
          );
        },
      ),
    );
  }

  Widget _loadingDocumentsList({required BuildContext context}) {
    return GetBuilder<ProfileControllerGetxState>(
      builder: (controllerProfile) {
        final bool isUserData = controllerProfile.documentList != null;
        if (isUserData) {
          DocumentsListModel documentsList = controllerProfile.documentList!;
          //реальный размер списка который приходит
          int itemCountLength = documentsList.docs.length;
          const int barrierItemCount = 10;
          Rx<int> itemCountAll = ((itemCountLength < barrierItemCount)
                  ? itemCountLength
                  : barrierItemCount)
              .obs;

          return Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                itemCountAll.value == 0
                    ? _ifLDocsEmpty(context: context)
                    : Padding(
                        padding: const EdgeInsets.only(
                            top: myTopPaddingForContent / 2),
                        child: ListView.builder(
                          shrinkWrap: true,
                          //для динамического изменения высоты
                          padding: EdgeInsets.zero,
                          primary: false,
                          // //чтобы последние доки были сверху
                          // reverse: true,
                          itemCount: itemCountAll.value,
                          itemBuilder: (context, index) {
                            return TextButton(
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero),
                                ),
                                onPressed: () {
                                  FocusManager.instance.primaryFocus?.unfocus();

                                  DocumentsProfilePage.openDocumentProfilePage(
                                    context: context,
                                    indexDocument: index,
                                  );
                                },
                                child: _rowTileDocument(
                                    context: context, indexDocument: index));
                          },
                        ),
                      ),
                if (itemCountLength > barrierItemCount)
                  TextButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      // minimumSize: MaterialStatePropertyAll(
                      //   Size(0, 0),
                      // ),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      itemCountAll.value >= itemCountLength
                          ? itemCountAll.value = barrierItemCount
                          : itemCountAll.value += 10;
                    },
                    child: Obx(
                      () => Text(
                        itemCountAll.value >= itemCountLength
                            ? 'Скрыть список...'
                            : 'Смотреть больше...',
                        style: myTextStyleFontUbuntu(
                            newFontWeight: FontWeight.w300,
                            textColor:
                                Theme.of(context).textTheme.headline3!.color,
                            context: context),
                      ),
                    ),
                  ),
              ],
            ),
          );
        } else {
          return _myListWithShimmerEffect();
        }
      },
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

_rowTileDocument({required BuildContext context, required int indexDocument}) {
  final document =
      ProfileControllerGetxState.instance.documentList!.docs[indexDocument];
  return Row(
    children: [
      Expanded(
        child: Text(
          document.title!,
          style: myTextStyleFontUbuntu(
              context: context, fontSize: 16, newFontWeight: FontWeight.w400),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
        ),
      ),
      Expanded(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              '${document.description} akeqnboqwnepbionwpbnqw' ?? '',
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
            "${document.createdAt != null ? DateFormat('d MMMM').format(DateTime.parse(document.createdAt!)) : '1234 34'} ",
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
      )),
    ],
  );
}
