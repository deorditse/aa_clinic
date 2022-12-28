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
import 'package:flutter_markdown/flutter_markdown.dart';

class AboutArticlePage extends StatefulWidget {
  static const String id = '/aboutArticlePage';

  AboutArticlePage(
      {Key? key, this.indexArticle, this.articleAuthor, this.title})
      : super(key: key);
  int? indexArticle;
  final String? title;
  UserMinifiedDataIdModel? articleAuthor;

  static goToAboutArticlePage(
          {required BuildContext context,
          required int indexArticle,
          required String? title,
          required UserMinifiedDataIdModel? articleAuthor}) =>
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: const RouteSettings(name: AboutArticlePage.id),
        screen: AboutArticlePage(
          indexArticle: indexArticle,
          title: title,
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
      titleAppBar: widget.title ?? "Статья",
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
        ContainerForPhotoFuture(
          coverFileId: article?.coverFileId,
          openView: true,
          borderRadius: 20,
        ),
        mySizedHeightBetweenContainer,
        Container(
          child: Markdown(
            data: article!.title ?? ' ',
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            styleSheet: MarkdownStyleSheet(
              p: TextStyle(
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        mySizedHeightBetweenContainer,
        Container(
          child: Markdown(
            data: article!.body ?? '',
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            styleSheet: MarkdownStyleSheet(
              p: TextStyle(
                fontWeight: FontWeight.w300,
                color: Theme.of(context)
                    .textTheme
                    .headline1!
                    .color!
                    .withOpacity(0.75),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        mySizedHeightBetweenContainer,
        _ratingAndAuthor(
          author: articleAuthor,
          rating: article?.rate,
          idArticle: article?.id,
          context: context,
        ),
        mySizedHeightBetweenContainer,
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
