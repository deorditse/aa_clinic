import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:model/model.dart';
import 'package:business_layout/business_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'widget_list_view_builder.dart';

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
        itemCount: 3,
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
        if (controllerProfile.searchResultDocumentList != null) {
          return WidgetListViewBuilder(
            documentList: controllerProfile.searchResultDocumentList!,
            onTapNext: () {
              controllerProfile.getDocumentsList(
                searchText: controllerProfile.searchDocumentsListText,
                currentDocsPage:
                    controllerProfile.searchResultDocumentList!.page + 1,
                updateSearchResultDocumentList: true,
              );
            },
          );
        } else if (controllerProfile.documentList != null) {
          return WidgetListViewBuilder(
            documentList: controllerProfile.documentList!,
            onTapNext: () {
              controllerProfile.getDocumentsList(
                currentDocsPage: controllerProfile.documentList!.page + 1,
              );
            },
          );
        } else if (controllerProfile.rangeFromCalendarDocumentList != null) {
          return WidgetListViewBuilder(
            documentList: controllerProfile.rangeFromCalendarDocumentList!,
            onTapNext: () {
              controllerProfile.getDocumentsList(
                currentDocsPage:
                    controllerProfile.rangeFromCalendarDocumentList!.page + 1,
                updateRangeFromCalendarDocumentList: true,
              );
            },
          );
        } else {
          return _myListWithShimmerEffect();
        }
      },
    );
  }
}
