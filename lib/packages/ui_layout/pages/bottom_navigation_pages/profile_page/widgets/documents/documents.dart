import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/pages/bottom_sheet_calendar_documents/bottom_sheet_calendar_documents.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/profile_page/pages/add_new_document_page/add_new_document_page.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/app_bars/widgetsRightAppBar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'documents_list.dart';
import 'search_documents_widget.dart';

class Documents extends StatelessWidget {
  const Documents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myStyleContainer(context: context),
      // height: 365,
      child: Padding(
        padding: const EdgeInsets.all(myTopPaddingForContent),
        child: GetBuilder<ProfileControllerGetxState>(
          builder: (controllerProfile) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controllerProfile.isSearchingDocument
                  ? SearchDocumentsWidget()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Документы",
                            style: myTextStyleFontUbuntu(
                                context: context,
                                fontSize: 21,
                                newFontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(child: _rowWithIconsButton(context: context)),
                      ],
                    ),
              DocumentsList(),
            ],
          ),
        ),
      ),
    );
  }

  _rowWithIconsButton({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => ProfileControllerGetxState.instance
              .changeIsSearchingDocument(isSearching: true),
          child: myIconSearchForAppBar(context: context),
        ),
        GestureDetector(
          onTap: () {
            BottomSheetCalendarDocumentsProfilePage
                .showBottomSheetWidgetBodyCalendarDocumentsProfilePage(
                    context: context);
          },
          child: SvgPicture.asset(
            Get.isDarkMode
                ? 'assets/icons/menu_icons_otherPage/calendar.svg'
                : 'assets/icons/for_light_theme/calendar_light.svg',
            semanticsLabel: 'calendar',
            fit: BoxFit.contain,
          ),
        ),
        GestureDetector(
          onTap: () {
            AddNewDocumentProfilePage.addPageNewDocumentProfilePage(
                context: context);
          },
          child: SvgPicture.asset(
            Get.isDarkMode
                ? 'assets/icons/menu_icons_otherPage/add-circle.svg'
                : 'assets/icons/for_light_theme/add-circle_light.svg',
            semanticsLabel: 'search',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
