import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/articles_page/widgets/horizontal_card_category.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:style_app/style_app.dart';

import 'widgets/app_bar_article_sliver/app_bar_article_sliver.dart';
import 'widgets/if_list_not_empty.dart';

class ArticlesPage extends StatelessWidget {
  static const String id = '/articlesPage';

  const ArticlesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MySliverNewPageWithoutBorder(
      callbackTopRefreshIndicator: _updateDataPage,
      titleAppBar: 'Статьи',
      primary: true,
      myNewSliverAppBar:
          ArticleSliverAppBar(title: 'Статьи', myContext: context),
      imageBackgroundName:
          Get.isDarkMode ? 'fon_2.png' : 'light_theme/fon_1_light.png',
      widgetBody: MainBodyArticlesPage(),
      widgetAfterBody: _ListSliverGridArticles(),
    );
  }

  Future<void> _updateDataPage() async {
    await ArticlesControllerGetxState.instance.getArticles(articlePage: 1);
  }
}

class MainBodyArticlesPage extends StatelessWidget {
  const MainBodyArticlesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: myHorizontalPaddingForContainer),
      child: GetBuilder<ArticlesControllerGetxState>(
        builder: (controllerArticles) {
          bool isCategories = controllerArticles.categoryHorizontalList != null;
          Rx<int?> indexSelected = (-1).obs;
          return SizedBox(
            height: 35,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              primary: true,
              scrollDirection: Axis.horizontal,
              itemCount: isCategories
                  ? controllerArticles.categoryHorizontalList!.docs.length
                  : 4,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      right: myHorizontalPaddingForContainer),
                  child: isCategories
                      ? TextButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero)),
                          onPressed: () {
                            indexSelected.value = index;
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: Obx(
                            () => Container(
                              decoration: myStyleContainer(
                                  context: context,
                                  color: indexSelected.value == index
                                      ? myColorIsActive
                                      : Theme.of(context).cardColor),
                              child: CardHorizontal(
                                  title: controllerArticles
                                      .categoryHorizontalList!
                                      .docs[index]
                                      .title),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: Get.width / 4,
                          child: myShimmerEffectContainer(
                              context: context, newHeight: 35),
                        ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _ListSliverGridArticles extends StatelessWidget {
  const _ListSliverGridArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
          horizontal: myHorizontalPaddingForContainer),
      sliver: GetBuilder<ArticlesControllerGetxState>(
        builder: (controllerArticle) {
          if (controllerArticle.articlesDataList == null) {
            return ifArticlesDataListNull();
          } else {
            return controllerArticle.articlesDataList!.docs.isNotEmpty
                ? const IfListNotEmpty()
                : _ifListEmpty(context: context);
          }
        },
      ),
    );
  }

  Widget _ifListEmpty({required BuildContext context}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: Get.height / 3),
        child: Center(
          child: Text(
            'Статьи не добавлены',
            style: myTextStyleFontUbuntu(
                context: context,
                textColor: Theme.of(context).textTheme.headline3!.color,
                newFontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }

  Widget ifArticlesDataListNull() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: myHorizontalPaddingForContainer,
        crossAxisSpacing: myHorizontalPaddingForContainer,
        childAspectRatio: 0.8,
        //infinity list
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: 6,
        (BuildContext context, int index) {
          return myShimmerEffectContainer(context: context, newHeight: 308);
        },
      ),
    );
  }
}
