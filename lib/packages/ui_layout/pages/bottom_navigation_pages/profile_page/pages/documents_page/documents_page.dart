import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:business_layout/business_layout.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'widgets/grid_with_photo.dart';

class DocumentsProfilePage extends StatelessWidget {
  static const String id = '/documentsProfilePage';
  final int? indexDocument;

  const DocumentsProfilePage({Key? key, this.indexDocument}) : super(key: key);

  static openDocumentProfilePage(
          {required context, required int indexDocument}) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: const RouteSettings(name: DocumentsProfilePage.id),
        screen: DocumentsProfilePage(indexDocument: indexDocument),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    return MySliverNewPageWithoutBorder(
      titleAppBar: 'Документы',
      widgetBody: _BodyDocumentsProfilePage(indexDocument: indexDocument!),
      widgetAfterBody: SliverPadding(
        padding: const EdgeInsets.symmetric(
            horizontal: myHorizontalPaddingForContainer),
        sliver: gridWithPhoto(indexDocument: indexDocument!),
      ),
    );
  }
}

class _BodyDocumentsProfilePage extends StatelessWidget {
  const _BodyDocumentsProfilePage({Key? key, required this.indexDocument})
      : super(key: key);
  final int indexDocument;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileControllerGetxState>(
      builder: (controllerProfile) {
        final document = controllerProfile.documentList!.docs[indexDocument];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mySizedHeightBetweenContainer,
            Text(
              document.title ?? 'no title',
              style: myTextStyleFontUbuntu(context: context),
            ),
            SizedBox(height: 5),
            Text(
              document.createdAt ?? 'время не задано',
              style: myTextStyleFontUbuntu(
                context: context,
                textColor: Theme.of(context).textTheme.headline3!.color,
                fontSize: 14,
                newFontWeight: FontWeight.w300,
              ),
            ),
            mySizedHeightBetweenContainer,
            mySizedHeightBetweenContainer,
            Text(
              'Комментрарий',
              style: myTextStyleFontUbuntu(
                context: context,
              ),
            ),
            SizedBox(height: 5),
            Text(
              document.description ?? 'нет комментария',
              style: myTextStyleFontUbuntu(
                context: context,
                textColor: Theme.of(context).textTheme.headline3!.color,
                fontSize: 14,
                newFontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.justify,
            ),
            mySizedHeightBetweenContainer,
          ],
        );
      },
    );
  }
}
