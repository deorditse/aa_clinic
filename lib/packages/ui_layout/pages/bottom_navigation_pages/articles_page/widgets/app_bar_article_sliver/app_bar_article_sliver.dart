import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/app_bars/widgetsRightAppBar.dart';
import 'package:business_layout/business_layout.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';
import 'package:flutter/material.dart';

import 'search_articles_widget.dart';

class ArticleSliverAppBar extends StatelessWidget {
  ArticleSliverAppBar({
    Key? key,
    required this.title,
    required this.myContext,
    this.isSearchWidget,
    this.widgetRight,
    this.onlyBack = false,
    this.fontSizeAppBar,
    this.subTitle,
  }) : super(key: key);
  final bool? isSearchWidget;
  final BuildContext myContext;
  final String title;
  final Widget? widgetRight;
  final bool onlyBack;
  final double? fontSizeAppBar;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticlesControllerGetxState>(
      builder: (controllerArticle) => SliverAppBar(
        backgroundColor: Theme.of(myContext).cardColor,
        leadingWidth: 40,
        leading: controllerArticle.isSearchingArticles ? null : Container(),
        toolbarHeight: myToolbarHeight,
        floating: false,
        pinned: true,
        //что эпп бар будет зафиксен после скролла
        title: Center(
          child: controllerArticle.isSearchingArticles
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: SearchArticlesWidget(),
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: FittedBox(
                      child: Text(
                        title,
                        style: myTextStyleFontUbuntu(
                          fontSize: fontSizeAppBar ?? 20,
                          context: myContext,
                          newFontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
        ),
        actions: !controllerArticle.isSearchingArticles
            ? [
                SizedBox(
                  width: 40,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8.0, right: 12, top: 2),
                    child: GestureDetector(
                        onTap: () {
                          ArticlesControllerGetxState.instance
                              .changeIsSearchingArticles(isSearching: true);
                        },
                        child: myIconSearchForAppBar(context: context)),
                  ),
                ),
              ]
            : null,
      ),
    );
  }
}
