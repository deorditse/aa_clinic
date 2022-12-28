import 'dart:convert';
import 'dart:developer';
import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:model/model.dart';

class ArticlesPageData {
  ///роут для получения списка статей
  Future<ArticlesPageModel?> getArticlesData({
    required String accessToken,
    required int page,
    required int perPage,
    String? searchText,
    required String? categoryId, //null
  }) async {
    try {
      final queryParameters = {
        'page': "$page",
        'perPage': '$perPage',
      };
      if (categoryId != null) {
        queryParameters
            .addAll({...queryParameters, "filter[category]": "$categoryId"});
      } else if (searchText != null) {
        queryParameters.addAll({...queryParameters, "search": "$searchText"});
      }

      Uri url =
          urlMain(urlPath: 'api/articles', queryParameters: queryParameters);

      log(url.path);
      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print('Response status from getArticlesData: ${response.statusCode}');
      log('getArticlesData ArticlesPageModel ${response.body}');

      if (response.statusCode == 200) {
        return ArticlesPageModel.fromJson(jsonDecode(response.body));
      }
    } catch (error) {
      Get.snackbar(
        'Exception',
        'get articles error:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getArticlesData $error ');
    }
    return null;
  }

  ///Роут для получения списка категорий для статей +
  Future<ArticleCategoriesModel?> getArticleCategoriesData(
      {required String accessToken}) async {
    try {
      Uri url = urlMain(urlPath: 'api/articleCategories');
      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print(
          'Response status from getArticleCategoriesData: ${response.statusCode}');
      log('getArticleCategoriesData ArticleCategoriesModel ${response.body}');

      if (response.statusCode == 200) {
        return ArticleCategoriesModel.fromJson(jsonDecode(response.body));
      }
    } catch (error) {
      Get.snackbar(
        'Exception',
        'categories error:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getArticleCategoriesData $error ');
    }
    return null;
  }

  ///Роут для оценки статьи по ее id +
  Future<void> postArticleRateWithIdData({
    required String accessToken,
    required String idArticle,
    required double rating,
  }) async {
    try {
      Uri url = urlMain(urlPath: 'api/articles/rate/$idArticle');
      var response = await http.post(
        url,
        headers: {'Authorization': 'Bearer ${accessToken}'},
        body: {"rating": '$rating'},
      );
      print(
          'Response status from postArticleRateWithIdData: ${response.statusCode}');
      log('postArticleRateWithIdData ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error postArticleRateWithIdData:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from postArticleRateWithIdData $error ');
    }
  }
}
