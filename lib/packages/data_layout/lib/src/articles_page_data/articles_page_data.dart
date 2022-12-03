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
  }) async {
    try {
      final queryParameters = {
        'page': "$page",
        'perPage': '$perPage',
      };
      Uri url = Uri.http(urlMainApiConst, 'api/articles', queryParameters);
      log(' runtimeType runtimeType runtimeType runtimeType runtimeType runtimeType ${queryParameters.runtimeType}');
      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print('Response status from getArticlesData: ${response.statusCode}');

      if (response.statusCode == 200) {
        return ArticlesPageModel.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getArticlesData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('getArticlesData ArticlesPageModel ${response.body}');
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
      Uri url = Uri.http(urlMainApiConst, 'api/articleCategories');
      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print(
          'Response status from getArticleCategoriesData: ${response.statusCode}');
      if (response.statusCode == 200) {
        return ArticleCategoriesModel.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getArticleCategoriesData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('getArticleCategoriesData ArticleCategoriesModel ${response.body}');
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
      Uri url = Uri.http(urlMainApiConst, 'api/articles/rate/$idArticle');
      var response = await http.post(
        url,
        headers: {'Authorization': 'Bearer ${accessToken}'},
        body: {"rating": '$rating'},
      );
      print(
          'Response status from postArticleRateWithIdData: ${response.statusCode}');
      if (response.statusCode == 200) {
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request postArticleRateWithIdData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
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
