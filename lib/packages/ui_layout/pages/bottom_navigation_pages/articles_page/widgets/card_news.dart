import 'dart:typed_data';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/articles_page/pages/about_article_page/about_article_page.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/style_app/lib/src/consts_app.dart';
import 'package:aa_clinic/packages/style_app/lib/src/card_style.dart';
import 'package:aa_clinic/packages/style_app/lib/src/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

class CardNews extends StatelessWidget {
  CardNews({Key? key, required this.indexArticle}) : super(key: key);
  final int indexArticle;

  UserMinifiedDataIdModel? myArticleAuthor;

  @override
  Widget build(BuildContext context) {
    ArticleModel? article = ArticlesControllerGetxState
                .instance.isSearchingArticles &&
            ArticlesControllerGetxState.instance.searchingArticlesText != null
        ? ArticlesControllerGetxState
            .instance
            .mapNameSearchAndArticlesPageModel[
                ArticlesControllerGetxState.instance.searchingArticlesText]
            ?.docs[indexArticle]
        : ArticlesControllerGetxState
            .instance
            .mapIndexCategoryAndArticlesPageModel[
                ArticlesControllerGetxState.instance.indexCategorySelected]
            ?.docs[indexArticle];
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        AboutArticlePage.goToAboutArticlePage(
          context: context,
          title: article?.title,
          indexArticle: indexArticle,
          articleAuthor: myArticleAuthor,
        );
      },
      child: Container(
        decoration: myStyleContainer(context: context),
        clipBehavior: Clip.antiAlias,
        height: 308,
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Container(
                color: Theme.of(context).backgroundColor,
                child: ContainerForPhotoFuture(
                  coverFileId: article?.coverFileId,
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child:
                  _buttonWidget(context: context, indexArticle: indexArticle),
            ),
          ],
        ),
      ),
    );
  }

  _buttonWidget({required BuildContext context, required int indexArticle}) {
    ArticleModel? article = ArticlesControllerGetxState
                .instance.isSearchingArticles &&
            ArticlesControllerGetxState.instance.searchingArticlesText != null
        ? ArticlesControllerGetxState
            .instance
            .mapNameSearchAndArticlesPageModel[
                ArticlesControllerGetxState.instance.searchingArticlesText]
            ?.docs[indexArticle]
        : ArticlesControllerGetxState
            .instance
            .mapIndexCategoryAndArticlesPageModel[
                ArticlesControllerGetxState.instance.indexCategorySelected]
            ?.docs[indexArticle];
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article?.title ?? "Статья",
                  style: myTextStyleFontUbuntu(
                    context: context,
                    fontSize: 14,
                    newFontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
                SizedBox(height: 3),
                Flexible(
                  child: Text(
                    article?.body ?? "нет данных",
                    style: myTextStyleFontUbuntu(
                      context: context,
                      fontSize: 14,
                      newFontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  "${article?.rate?.toStringAsPrecision(2) ?? '0.0'}",
                  style: myTextStyleFontUbuntu(
                    textColor: myColorIsActive,
                    context: context,
                    newFontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              FutureBuilder<UserMinifiedDataIdModel?>(
                future: ImplementSettingGetXController.instance
                    .getDataUserMinified(idUser: article!.userId!),
                builder: (BuildContext context,
                    AsyncSnapshot<UserMinifiedDataIdModel?> snapshot) {
                  TextStyle _textStyle = myTextStyleFontUbuntu(
                    textColor: Theme.of(context).textTheme.headline3!.color,
                    newFontWeight: FontWeight.w300,
                    fontSize: 12,
                    context: context,
                  ).copyWith(fontStyle: FontStyle.italic);

                  if (snapshot.data != null && snapshot.hasData) {
                    final UserMinifiedDataIdModel articleAuthor =
                        snapshot.data!;
                    myArticleAuthor = articleAuthor;
                    return Text(
                      "Автор: ${articleAuthor.firstName?.capitalize ?? ''} ${articleAuthor.middleName?[0].capitalize ?? ''}.${articleAuthor.lastName?[0].capitalize ?? ''}",
                      style: _textStyle,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                    );
                  } else {
                    return Text(
                      "Неизвестен",
                      style: _textStyle,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
