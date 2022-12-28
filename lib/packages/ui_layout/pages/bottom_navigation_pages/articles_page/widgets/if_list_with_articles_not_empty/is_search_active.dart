import 'package:model/model.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/articles_page/widgets/card_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:style_app/style_app.dart';

class GridViewIfSearchActive extends StatefulWidget {
  const GridViewIfSearchActive({Key? key}) : super(key: key);

  @override
  State<GridViewIfSearchActive> createState() => _GridViewIfSearchActiveState();
}

class _GridViewIfSearchActiveState extends State<GridViewIfSearchActive> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        _fetchOnServerForArticles();
      }
    });
  }

  Future<void> _fetchOnServerForArticles() async {
    final articlesPageSearch =
        ArticlesControllerGetxState.instance.mapNameSearchAndArticlesPageModel[
            ArticlesControllerGetxState.instance.searchingArticlesText];
    if (articlesPageSearch!.page < articlesPageSearch.totalPages) {
      await ArticlesControllerGetxState.instance.getArticles(
        articlePage: articlesPageSearch.nextPage ?? articlesPageSearch.page + 1,
        searchText: ArticlesControllerGetxState.instance.searchingArticlesText,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticlesControllerGetxState>(
      builder: (controllerArticle) {
        ArticlesPageModel? articleSearch =
            controllerArticle.mapNameSearchAndArticlesPageModel[
                controllerArticle.searchingArticlesText];
        int length = articleSearch?.docs.length ?? 4;

        return (articleSearch?.docs.length != 0)
            ? articleSearch != null
                ? GridView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: myHorizontalPaddingForContainer,
                      crossAxisSpacing: myHorizontalPaddingForContainer,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: length + 2,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < length) {
                        return CardNews(indexArticle: index);
                      } else if ((articleSearch.page <
                              articleSearch.totalPages) &&
                          index > 6) {
                        return myShimmerEffectContainer(
                            context: context, newHeight: 308);
                      } else {
                        return SizedBox();
                      }
                    },
                  )
                : Padding(
                    padding: EdgeInsets.only(
                      top: Get.height / 3,
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 40,
                        child: CircularProgressIndicator(
                          color: myColorIsActive,
                        ),
                      ),
                    ),
                  )
            : Padding(
                padding: EdgeInsets.only(
                  top: Get.height / 3,
                ),
                child: Center(
                  child: Text(
                    'По данному запросу ничего не найдено',
                    style: myTextStyleFontUbuntu(
                        context: context, newFontWeight: FontWeight.w300),
                  ),
                ),
              );
      },
    );
  }
}
