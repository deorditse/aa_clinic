import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:data_layout/data_layout.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:model/model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SettingPageData {
  static IO.Socket? socket;
  static bool socketIOAvailable = false;

  ///инициирую сокет для всего приложения из init setting на слое бизнес логики
  void socketConnect({
    required String? accessToken,
  }) {
    socket = IO.io(
      urlForSocket,
      IO.OptionBuilder()
          .setTransports(['websocket']).setAuth({"token": accessToken}).build(),
    );
    socket?.on(
      'connected',
      (data) => {print(data), socketIOAvailable = true},
    );
    socket?.onConnectError((data) {
      print(data);
    });
    socket?.onError((data) => {
          print(data),
          socketIOAvailable = false,
        });
    socket?.onDisconnect((data) => {
          socketIOAvailable = false,
        });
  }

  ///Роут для удаления  файла (только картинки)
  Future<void> deleteStaticFilesAndGetIdImageData({
    required String coverId,
    required String accessToken,
  }) async {
    try {
      Uri url = urlMain(urlPath: 'api/staticFiles/$coverId');

      var response = await http.delete(
        url,
        headers: {'Authorization': 'Bearer $accessToken'},
        // body: {'cancelReason': cancelReason},
      );
      print(
        'Response status from deleteStaticFilesAndGetIdImage: ${response.statusCode}',
      );
      log("deleteStaticFilesAndGetIdImageData ${response.body}");
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error deleteStaticFilesAndGetIdImage:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from deleteStaticFilesAndGetIdImage $error ');
    }
  }

  ///Роут для загрузки файлов(только картинки)
  Future<String?> postStaticFilesAndGetIdImageData({
    required String filePath,
    required String accessToken,
    required String? category,
    required bool isAttachmentsRoute,
  }) async {
    try {
      Uri url = urlMain(
          urlPath: isAttachmentsRoute ? 'api/attachments' : 'api/staticFiles');

      String? mimeType = lookupMimeType(filePath);
      if (mimeType != null) {
        var request = await http.MultipartRequest("POST", url)
          ..headers.addAll({"Authorization": "Bearer $accessToken"})
          ..fields['category'] = category ?? ""
          ..files.add(
            await http.MultipartFile.fromPath(
              "file",
              filePath,
              contentType: MediaType(
                mimeType.split('/').first,
                mimeType.split('/').last,
              ),
            ),
          );
        http.StreamedResponse response = await request.send();
        print(
            'Response status from postAttachmentsAndGetIdImageData: ${response.statusCode} mimeType: $mimeType');
        log('postAttachmentsAndGetIdImageData ${response.reasonPhrase}');

        if (response.statusCode == 201) {
          var responseData = await response.stream.toBytes();
          Map<String, dynamic> responseString =
              json.decode(String.fromCharCodes(responseData));
          return responseString['id'];
        }
      } else {
        Get.snackbar(
          'Формат не поддерживается',
          '${filePath.split('/').last.capitalizeFirst} файл нельзя загрузить',
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error from postAttachmentsAndGetIdImageData:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from postAttachmentsAndGetIdImageData $error');
      return null;
    }
    return null;
  }

  ///обновление данных пользователя +
  Future<void> updateMeData({
    required UserDataModel userEdit,
    required String accessToken,
  }) async {
    try {
      Uri url = urlMain(urlPath: 'api/users/updateMe');

      var response = await http.put(
        url,
        headers: {
          'Authorization': 'Bearer ${accessToken}',
        },
        body: {
          'lastName': userEdit.lastName,
          'firstName': userEdit.firstName,
          'middleName': userEdit.middleName ?? '',
          'gender': userEdit.gender.toString(),
          'bio': userEdit.bio ?? '',
          'bdate': userEdit.bdate ?? '',
          'phoneNumber': userEdit.phoneNumber ?? '',
        },
      );

      print('Response status from updateMeData: ${response.statusCode}');
      log('updateMeData ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error updateMeData:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from updateMeData $error ');
    }
  }

  ///Роут для поиска пользователя этого сеанса
  //возможно нужно будет перенести в контроллер home page
  Future<Map<int, Map<String, dynamic>>?> getFindMeData(
      {required String accessToken}) async {
    try {
      Uri url = urlMain(urlPath: 'api/users/findMe');

      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print('Response status from getFindMeData: ${response.statusCode}');
      log('getFindMeData UserDataModel ${response.body}');

      return {response.statusCode: jsonDecode(response.body)};
    } catch (error) {
      Get.snackbar(
        'Exception',
        'get user info error:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getFindMeData $error ');
    }
    return null;
  }

  ///Роут для получения минимальной информации о пользователе по ID +
  Future<UserMinifiedDataIdModel?> getDataUserMinifiedData(
      {required String accessToken, required String idUser}) async {
    try {
      Uri url = urlMain(urlPath: 'api/users/minified/$idUser');

      var response = await http.get(url, headers: {
        "Authorization": "Bearer $accessToken",
      });

      print(
          'Response status from getDataUserMinifiedData: ${response.statusCode}');
      log('getDataUserMinifiedData UserMinifiedDataIdModel ${response.body}');

      if (response.statusCode == 200) {
        return UserMinifiedDataIdModel.fromJson(jsonDecode(response.body));
      }
    } catch (error) {
      print('я в ошибке from getDataUserMinifiedData $error ');
    }
    return null;
  }

  ///Роут для получения файла по его id
  Future<StaticFileModel?> getStaticFileData(
      {required String accessToken, required String coverFileId}) async {
    try {
      Uri url = urlMain(urlPath: 'api/staticFiles/$coverFileId');

      var response = await http
          .get(url, headers: {"Authorization": "Bearer $accessToken"});

      print('Response status from getStaticFileData: ${response.statusCode}');
      log('getStaticFileData ${response.body}');

      if (response.statusCode == 200) {
        return StaticFileModel.fromJson(jsonDecode(response.body));
      }
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error getStaticFileData Storage: $error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getStaticFileData $error ');
    }
    return null;
  }

  ///Роут для получения файла по id из статического хранилища файлов +
  Future<Map<int, Uint8List?>?> getStaticFilesStorageData(
      {required String accessToken, required String coverFileId}) async {
    try {
      Uri url = urlMain(urlPath: 'api/staticFilesStorage/$coverFileId');

      var response = await http.get(url, headers: {
        "Authorization": "Bearer $accessToken",
      });

      print(
          'Response status from getStaticFilesStorageData: ${response.statusCode}');
      // log('getStaticFilesStorageData ${response.body}');
      if (response.statusCode == 200) {
        List<int> list = response.body.codeUnits;
        Uint8List bytes = Uint8List.fromList(list);
        return {200: bytes};
      }
      return {response.statusCode: null};
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error get Static Files Storage: $error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getStaticFilesStorageData $error ');
    }
    return null;
  }

  ///Роут для получения файла по его id
  Future<AttachmentModel?> getAttachmentInfoData(
      {required String accessToken, required String idAttachment}) async {
    try {
      Uri url = urlMain(urlPath: 'api/attachments/$idAttachment');

      var response = await http
          .get(url, headers: {"Authorization": "Bearer $accessToken"});

      print(
          'Response status from getAttachmentInfoData: ${response.statusCode}');
      log('getAttachmentInfoData ${response.body}');

      if (response.statusCode == 200) {
        return AttachmentModel.fromJson(jsonDecode(response.body));
      }
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error getAttachmentInfoData Storage: $error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getAttachmentInfoData $error ');
    }
    return null;
  }
}
