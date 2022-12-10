import 'package:business_layout/business_layout.dart';
import 'package:data_layout/data_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class ArticlesControllerGetxState extends GetxController {
  static ArticlesControllerGetxState instance =
      Get.find<ArticlesControllerGetxState>();
  final ArticlesPageData _services = ArticlesPageData();

  @override
  Future<void> onInit() async {
    await _initializedDataArticlePage();
    super.onInit();
  }

  String? searchingArticlesText;
  bool isSearchingArticles = false;

  void changeIsSearchingArticles({
    bool isSearching = false,
  }) {
    isSearchingArticles = isSearching;
    if (!isSearchingArticles) {
      searchingArticlesText = null;
    }
    update();
  }

  final int perPage = 6;

  ///для поиска статей
  Map<String, ArticlesPageModel?> mapNameSearchAndArticlesPageModel = {};

  Future<void> _initializedDataArticlePage() async {
    await getArticleCategories();
    await getArticles(articlePage: 1);
  }

  ///Роут для получения списка статей +
  // ArticlesPageModel? articlesDataList;
  int indexCategorySelected = (-1);

  void changeSearchCategory({int? indexCategory}) {
    if (indexCategory == null) {
      indexCategorySelected = (-1);
      update();
    } else {
      indexCategorySelected = indexCategory;
      update();
      getArticles(articlePage: 1);
    }
  }

  ///для статей

  Map<int, ArticlesPageModel?> mapIndexCategoryAndArticlesPageModel = {};

  Future<void> getArticles({
    required int articlePage,
    String? searchText,
    bool isUpdate = false,
  }) async {
    if (mapIndexCategoryAndArticlesPageModel[indexCategorySelected] == null ||
        isUpdate) {
      mapIndexCategoryAndArticlesPageModel[indexCategorySelected] =
          await _services.getArticlesData(
        accessToken:
            ImplementAuthController.instance.userAuthorizedData!.accessToken,
        page: articlePage,
        perPage: perPage,
        categoryId: indexCategorySelected != (-1)
            ? categoryHorizontalList?.docs[indexCategorySelected].id
            : null,
      );
      update();
    } else if (searchText != null) {
      searchingArticlesText = searchText;

      if (mapNameSearchAndArticlesPageModel[searchText] == null || isUpdate) {
        mapNameSearchAndArticlesPageModel[searchText] =
            await _services.getArticlesData(
          accessToken:
              ImplementAuthController.instance.userAuthorizedData!.accessToken,
          page: articlePage,
          perPage: perPage,
          searchText: searchText,
          categoryId: indexCategorySelected != (-1)
              ? categoryHorizontalList?.docs[indexCategorySelected].id
              : null,
        );
      }
      update();
    }
  }

  ArticleCategoriesModel? categoryHorizontalList;

  ///Роут для получения списка категорий для статей +
  Future<void> getArticleCategories({bool isUpdate = false}) async {
    categoryHorizontalList = await _services.getArticleCategoriesData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
    );
    update();
  }

  ///Роут для оценки статьи по ее id +
  Future<void> postArticleRateWithId({
    required String idArticle,
    required double rating,
  }) async {
    await _services.postArticleRateWithIdData(
      accessToken:
          ImplementAuthController.instance.userAuthorizedData!.accessToken,
      idArticle: idArticle,
      rating: rating,
    );

    // //обновим рейтинг этой статьи в листе
    // for (var element in articlesDataList!.docs) {
    //   if (element?.id == idArticle) {
    //     articlesDataList!.docs[articlesDataList!.docs.indexOf(element)]!.rate =
    //         rating;
    //     update();
    //     return;
    //   }
    // }
  }
}
