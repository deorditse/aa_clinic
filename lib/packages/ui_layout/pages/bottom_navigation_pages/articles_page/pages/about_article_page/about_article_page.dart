import 'dart:convert';

import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/rating_widget/rating_widget.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:business_layout/business_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:model/model.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/app_bars/sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aa_clinic/packages/style_app/lib/style_app.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:http/http.dart' as http;

class AboutArticlePage extends StatefulWidget {
  static const String id = '/aboutArticlePage';

  AboutArticlePage({Key? key, this.indexArticle, this.articleAuthor})
      : super(key: key);
  int? indexArticle;
  UserMinifiedDataIdModel? articleAuthor;

  static goToAboutArticlePage(
          {required BuildContext context,
          required int indexArticle,
          required UserMinifiedDataIdModel? articleAuthor}) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: const RouteSettings(name: AboutArticlePage.id),
        screen: AboutArticlePage(
          indexArticle: indexArticle,
          articleAuthor: articleAuthor,
        ),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );

  @override
  State<AboutArticlePage> createState() => _AboutArticlePageState();
}

class _AboutArticlePageState extends State<AboutArticlePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MySliverNewPageWithoutBorder(
      titleAppBar: ArticlesControllerGetxState
              .instance
              .mapIndexCategoryAndArticlesPageModel[
                  ArticlesControllerGetxState.instance.indexCategorySelected]!
              .docs[widget.indexArticle!]
              ?.category ??
          "Статья",
      onlyBack: true,
      widgetBody: _BodyAboutArticlePage(
        indexArticle: widget.indexArticle!,
        articleAuthor: widget.articleAuthor,
      ),
    );
  }
}

class _BodyAboutArticlePage extends StatelessWidget {
  const _BodyAboutArticlePage({
    Key? key,
    required this.indexArticle,
    required this.articleAuthor,
  }) : super(key: key);
  final int indexArticle;
  final UserMinifiedDataIdModel? articleAuthor;

  @override
  Widget build(BuildContext context) {
    ArticleModel? article = ArticlesControllerGetxState
        .instance
        .mapIndexCategoryAndArticlesPageModel[
            ArticlesControllerGetxState.instance.indexCategorySelected]!
        .docs[indexArticle];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mySizedHeightBetweenContainer,
        Container(
          clipBehavior: Clip.antiAlias,
          height: article?.coverFileId != null
              ? MediaQuery.of(context).size.height / 3.3
              : 40,
          width: double.infinity,
          decoration: myStyleContainer(context: context).copyWith(
            color: Theme.of(context).backgroundColor,
          ),
          child: article?.coverFileId != null
              ? ContainerForPhotoFuture(
                  coverFileId: article!.coverFileId!,
                  openView: true,
                )
              : Center(
                  child: Text(
                    'no photo',
                    style: myTextStyleFontUbuntu(
                      context: context,
                      textColor: Theme.of(context).textTheme.headline3!.color,
                    ),
                  ),
                ),
        ),
        mySizedHeightBetweenContainer,
        Text(
          article?.title ?? '',
          style: myTextStyleFontUbuntu(
            context: context,
            newFontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.justify,
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
        ),
        mySizedHeightBetweenContainer,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              article?.body ?? '',
              style: myTextStyleFontUbuntu(
                newFontWeight: FontWeight.w300,
                context: context,
                textColor: Theme.of(context)
                    .textTheme
                    .headline1!
                    .color!
                    .withOpacity(0.75),
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 40,
            ),
            _ratingAndAuthor(
                author: articleAuthor,
                idArticle: article?.id,
                rating: article?.rate,
                context: context),
          ],
        ),
      ],
    );
  }

  _ratingAndAuthor({
    required UserMinifiedDataIdModel? author,
    required double? rating,
    required String? idArticle,
    required BuildContext context,
  }) {
    Rx<double> _rating = (rating ?? 0).obs;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "~ Автор: ${articleAuthor != null ? ("${articleAuthor!.firstName?.capitalize ?? ''} ${articleAuthor!.middleName?[0].capitalize ?? ''}.${articleAuthor!.lastName?[0].capitalize ?? ''}") : "Неизвестен"}",
          style: myTextStyleFontUbuntu(
            newFontWeight: FontWeight.w300,
            context: context,
            textColor: Theme.of(context).textTheme.headline3!.color,
          ).copyWith(fontStyle: FontStyle.italic),
          textAlign: TextAlign.justify,
        ),
        // _ratingRow(rate: rating),
        Obx(
          () => StarRating(
            rating: _rating.value,
            onRatingChanged: (newRating) async {
              if (rating != null) {
                _rating.value = rating;
                if (idArticle != null) {
                  await ArticlesControllerGetxState.instance
                      .postArticleRateWithId(
                    idArticle: idArticle,
                    rating: newRating,
                  );
                }
              }
            },
          ),
        ),
      ],
    );
  }
}
