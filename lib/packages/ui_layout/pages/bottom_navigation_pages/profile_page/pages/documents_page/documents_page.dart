import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:business_layout/business_layout.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DocumentsProfilePage extends StatelessWidget {
  static const String id = '/documentsProfilePage';
  final DocumentForIdModel? document;

  const DocumentsProfilePage({Key? key, this.document}) : super(key: key);

  static openDocumentProfilePage(
          {required context, required DocumentForIdModel document}) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: const RouteSettings(name: DocumentsProfilePage.id),
        screen: DocumentsProfilePage(document: document),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  Widget build(BuildContext context) {
    return MySliverNewPageWithoutBorder(
      titleAppBar: 'Документы',
      widgetBody: _BodyDocumentsProfilePage(document: document!),
      widgetAfterBody: SliverPadding(
        padding: const EdgeInsets.symmetric(
            horizontal: myHorizontalPaddingForContainer),
        sliver: _gridWithPhoto(attachments: document!.attachments),
      ),
    );
  }
}

class _BodyDocumentsProfilePage extends StatelessWidget {
  const _BodyDocumentsProfilePage({Key? key, required this.document})
      : super(key: key);
  final DocumentForIdModel document;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileControllerGetxState>(
      builder: (controllerProfile) {
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
              document.createdAt != null
                  ? '${DateFormat.Hm().format(DateTime.parse(document.createdAt!))}  ${DateFormat('d MMM').format(DateTime.parse(document.createdAt!))}'
                  : 'время не задано',
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

_gridWithPhoto({required List<Attachment?> attachments}) {
  return SliverGrid(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisSpacing: myHorizontalPaddingForContainer,
      crossAxisSpacing: myHorizontalPaddingForContainer,
      childAspectRatio: 1,
    ),
    delegate: SliverChildBuilderDelegate(
      childCount: attachments.length,
      (context, index) {
        return Container(
          decoration: myStyleContainer(context: context),
          clipBehavior: Clip.hardEdge,
          child: ContainerForPhotoFuture(
            coverFileId: attachments[index]!.fileId!,
            openView: true,
          ),
        );
      },
    ),
  );
}
