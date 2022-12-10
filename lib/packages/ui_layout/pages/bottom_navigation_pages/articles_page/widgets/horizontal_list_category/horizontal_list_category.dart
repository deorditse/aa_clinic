import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/my_shimmer_effect_container.dart';
import 'package:aa_clinic/packages/ui_layout/widgets_for_all_pages/sceleton_pages/sliver_sceleton_pages/sliver_sceleton_without_borders.dart';
import 'package:business_layout/business_layout.dart';
import 'package:aa_clinic/packages/ui_layout/pages/bottom_navigation_pages/articles_page/widgets/horizontal_card_category.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:style_app/style_app.dart';

class HorizontalCategoriesArticlesPage extends StatelessWidget {
  const HorizontalCategoriesArticlesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: myHorizontalPaddingForContainer),
      child: GetBuilder<ArticlesControllerGetxState>(
        builder: (controllerArticles) {
          bool isCategories = controllerArticles.categoryHorizontalList != null;
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
                            FocusManager.instance.primaryFocus?.unfocus();

                            controllerArticles.changeIsSearchingArticles();

                            if (controllerArticles.indexCategorySelected ==
                                index) {
                              controllerArticles.changeSearchCategory();
                            } else {
                              controllerArticles.changeSearchCategory(
                                  indexCategory: index);
                            }
                          },
                          child: Container(
                            decoration: myStyleContainer(
                                context: context,
                                color:
                                    controllerArticles.indexCategorySelected ==
                                            index
                                        ? myColorIsActive
                                        : Theme.of(context).cardColor),
                            child: CardHorizontal(
                              title: controllerArticles
                                  .categoryHorizontalList!.docs[index].title,
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
