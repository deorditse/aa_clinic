import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:data_layout/data_layout.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:model/model.dart';
import 'package:http_parser/http_parser.dart';

class ProfilePageData {
  ///Роут для загрузки файлов в создании документов (только картинки)
  Future<String?> postAttachmentsAndGetIdImageData({
    required File fileImage,
    required String accessToken,
  }) async {
    try {
      Uri url = Uri.http(urlMainApiConst, '/api/attachments');

      var request = http.MultipartRequest("POST", url)
        ..headers.addAll({"Authorization": "Bearer ${accessToken}"})
        ..files.add(
          await http.MultipartFile.fromPath(
            "file",
            fileImage.path,
            contentType: MediaType('image', 'jpeg'),
          ),
        );

      http.StreamedResponse response = await request.send();

      print(
          'Response status from postAttachmentsAndGetIdImageData: ${response.statusCode}');
      if (response.statusCode == 201) {
        var responseData = await response.stream.toBytes();
        Map<String, dynamic> responseString =
            json.decode(String.fromCharCodes(responseData));
        return responseString['id'];
      } else {
        Get.snackbar(
          'Exception',
          'Response status postAttachmentsAndGetIdImageData: ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('postAttachmentsAndGetIdImageData ${response.reasonPhrase}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error from postAttachmentsAndGetIdImageData:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from postAttachmentsAndGetIdImageData $error');
      return null;
    }
  }

  ///Роут для загрузки аватара пользователя +
  Future<String?> postSetAvatarData(
      {required File avatar, required String accessToken}) async {
    try {
      Uri url = Uri.http(urlMainApiConst, '/api/users/setAvatar');

      var request = http.MultipartRequest("POST", url)
        ..headers.addAll({"Authorization": "Bearer ${accessToken}"})
        ..files.add(
          await http.MultipartFile.fromPath(
            "avatar",
            avatar.path,
            contentType: MediaType('image', 'jpeg'),
          ),
        );

      http.StreamedResponse response = await request.send();

      print('Response status from postSetAvatarData: ${response.statusCode}');
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        Map responseString = json.decode(String.fromCharCodes(responseData));
        return responseString['avatar'];
      } else {
        Get.snackbar(
          'Exception',
          'Response status postSetAvatarData: ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('postSetAvatarData ${response.reasonPhrase}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error from postSetAvatarData:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from postSetAvatarData $error');
      return null;
    }
  }

  ///Роут для получения списка документов по userId
  Future<DocumentsListModel?> getPatientDocumentsByUserIdData(
      {required String accessToken, required String userId}) async {
    try {
      Uri url =
          Uri.http(urlMainApiConst, 'api/patientDocuments/byUserId/$userId');
      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print(
          'Response status from getPatientDocumentsByUserIdData: ${response.statusCode}');
      if (response.statusCode == 200) {
        return DocumentsListModel.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getPatientDocumentsByUserIdData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('getPatientDocumentsByUserIdData DocumentsListModel ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error getPatientDocumentsByUserIdData: $error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getPatientDocumentsByUserIdData $error ');
    }
    return null;
  }

  ///Роут для получения списка достижений +
  Future<AchievementsModel?> getAchievementsData(
      {required String accessToken}) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/achievements');
      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print('Response status from getAchievementsData: ${response.statusCode}');
      if (response.statusCode == 200) {
        return AchievementsModel.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getAchievementsData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('getAchievementsData AchievementsModel ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'actions error getAchievementsData:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getAchievementsData $error ');
    }
    return null;
  }

  ///Роут для получения достижения по его id +
  Future<Achievement?> getAchievementsWithIdData(
      {required String accessToken, required String idAchievement}) async {
    try {
      final queryParameters = {'extends': "1"};

      Uri url = Uri.http(
          urlMainApiConst, 'api/achievements/$idAchievement', queryParameters);
      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });
      if (response.statusCode == 200) {
        return Achievement.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getAchievementsWithIdData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('getAchievementsWithIdData Achievement ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'actions error getAchievementsWithIdData:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getAchievementsWithIdData $error ');
    }
    return null;
  }

  ///Роут для создания документа пациента +
  Future<DocumentForIdModel?> postPatientDocumentsData({
    required String accessToken,
    required String category,
    required String title,
    required String? description,
    required List<String> attachmentsIds, //Массив с id вложений
  }) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/patientDocuments');

      Map<String, dynamic> _json = {
        "category": category,
        "title": title,
        "description": '$description',
        "attachmentsIds": attachmentsIds,
      };

      print('вот что уходит на сервер ${jsonEncode(_json)}');

      var response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer ${accessToken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(_json),
      );
      print(
          'Response status from postPatientDocumentsData: ${response.statusCode}');
      if (response.statusCode == 201) {
        print(DocumentForIdModel.fromJson(jsonDecode(response.body)));
        return DocumentForIdModel.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request postPatientDocumentsData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log(response.body);
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error postPatientDocumentsData:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from postPatientDocumentsData $error ');
    }
  }
}
