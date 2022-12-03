import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/articles_page/widgets/card_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:style_app/style_app.dart';

class IfListNotEmpty extends StatefulWidget {
  const IfListNotEmpty({Key? key}) : super(key: key);

  @override
  State<IfListNotEmpty> createState() => _IfListNotEmptyState();
}

class _IfListNotEmptyState extends State<IfListNotEmpty> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        _fetchOnServer();
      }
    });
  }

  Future<void> _fetchOnServer() async {
    if (ArticlesControllerGetxState.instance.articlesDataList!.page <
        ArticlesControllerGetxState.instance.articlesDataList!.totalPages) {
      await ArticlesControllerGetxState.instance.getArticles(
        articlePage:
            ArticlesControllerGetxState.instance.articlesDataList!.nextPage ??
                ArticlesControllerGetxState.instance.articlesDataList!.page + 1,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GetBuilder<ArticlesControllerGetxState>(
        builder: (controllerArticle) {
          int length = controllerArticle.articlesDataList!.docs.length;

          return GridView.builder(
            controller: scrollController,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            primary: false,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: myHorizontalPaddingForContainer,
              crossAxisSpacing: myHorizontalPaddingForContainer,
              childAspectRatio: 0.8,
            ),
            itemCount: length + 2,
            itemBuilder: (BuildContext context, int index) {
              if (index < length) {
                return CardNews(indexArticle: index);
              } else if ((controllerArticle.articlesDataList!.page <
                      controllerArticle.articlesDataList!.totalPages) &&
                  index > 6) {
                return myShimmerEffectContainer(
                    context: context, newHeight: 308);
              }else {
                return const SizedBox();
              }
            },
          );
        },
      ),
    );
  }
}
