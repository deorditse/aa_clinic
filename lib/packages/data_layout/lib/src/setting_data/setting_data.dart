import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:data_layout/data_layout.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
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
        'http://$urlMainApiConst',
        IO.OptionBuilder().setTransports(['websocket']).setAuth(
            {"token": accessToken}).build());
    socket?.on(
        'connected',
        (data) => {
              print("Socket for RTC connected successfully"),
              print(data),
              socketIOAvailable = true
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
      Uri url = Uri.http(urlMainApiConst, 'api/staticFiles/$coverId');
      var response = await http.delete(
        url,
        headers: {'Authorization': 'Bearer $accessToken'},
        // body: {'cancelReason': cancelReason},
      );
      if (response.statusCode == 200) {
        print(
          'Response status from deleteStaticFilesAndGetIdImage: ${response.statusCode}',
        );
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request deleteStaticFilesAndGetIdImage: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log(response.body);
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
  Future<String?> postStaticFilesAndGetIdImageData(
      {required File fileImage,
      required String accessToken,
      required String category}) async {
    try {
      Uri url = Uri.http(urlMainApiConst, '/api/staticFiles');

      var request = http.MultipartRequest("POST", url)
        ..headers.addAll({"Authorization": "Bearer ${accessToken}"})
        ..fields['category'] = category
        ..files.add(
          await http.MultipartFile.fromPath(
            "file",
            fileImage.path,
            contentType: MediaType('image', 'jpeg'),
          ),
        );

      http.StreamedResponse response = await request.send();

      print(
          'Response status from postStaticFilesAndGetIdImageData: ${response.statusCode}');
      if (response.statusCode == 201) {
        var responseData = await response.stream.toBytes();
        Map responseString = json.decode(String.fromCharCodes(responseData));
        return responseString['id'];
      } else {
        Get.snackbar(
          'Exception',
          'Response status postStaticFilesImageData: ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('postStaticFilesImageData ${response.reasonPhrase}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'error from postStaticFilesImageData:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from postStaticFilesImageData $error');
      return null;
    }
  }

  ///обновление данных пользователя +
  Future<void> updateMeData({
    required UserDataModel userEdit,
    required String accessToken,
  }) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/users/updateMe');
      var response = await http.put(
        url,
        headers: {
          'Authorization': 'Bearer ${accessToken}',
        },

        body: {
          // 'username': '',
          'lastName': userEdit.lastName,
          'firstName': userEdit.firstName,
          'middleName': userEdit.middleName ?? '',
          'gender': userEdit.gender.toString(),
          'email': userEdit.email,
          'bio': userEdit.bio ?? '',
          'bdate': userEdit.bdate ?? '',
          'phoneNumber': userEdit.phoneNumber ?? '',
          // 'address': 'test ${userEdit.address}',
          'avatar': '${userEdit.avatar}',
          // 'avatarThumbnail': '${userEdit.avatarThumbnail} test avatarThumbnail',
        },
        // jsonEncode(userEdit),
      );
      print('Response status from updateMeData: ${response.statusCode}');

      if (response.statusCode == 200) {
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request updateMeData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
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
  Future<UserDataModel?> getFindMeData({required String accessToken}) async {
    try {
      Uri url = Uri.http(urlMainApiConst, 'api/users/findMe');
      var response = await http.get(url, headers: {
        "Authorization": "Bearer ${accessToken}",
      });

      print('Response status from getFindMeData: ${response.statusCode}');
      print('GET FIND ME 1');
      if (response.statusCode == 200) {
        return UserDataModel.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getFindMeData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('getFindMeData UserDataModel ${response.body}');
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
      Uri url = Uri.http(urlMainApiConst, 'api/users/minified/$idUser');
      var response = await http.get(url, headers: {
        "Authorization": "Bearer $accessToken",
      });

      print(
          'Response status from getDataUserMinifiedData: ${response.statusCode}');
      if (response.statusCode == 200) {
        return UserMinifiedDataIdModel.fromJson(jsonDecode(response.body));
      } else {
        // Get.snackbar(
        //   'Exception',
        //   'Bad Request getDataUserMinifiedData: status ${response.statusCode}',
        //   snackPosition: SnackPosition.TOP,
        // );
      }
      log('getDataUserMinifiedData UserMinifiedDataIdModel ${response.body}');
    } catch (error) {
      Get.snackbar(
        'Exception',
        'get user minified error:$error}',
        snackPosition: SnackPosition.TOP,
      );
      print('я в ошибке from getDataUserMinifiedData $error ');
    }
    return null;
  }

  ///Роут для получения файла по id из статического хранилища файлов +
  Future<Uint8List?> getStaticFilesStorageData(
      {required String accessToken, required String coverFileId}) async {
    try {
      Uri url =
          Uri.http(urlMainApiConst, 'api/staticFilesStorage/$coverFileId');
      var response = await http.get(url, headers: {
        "Authorization": "Bearer $accessToken",
      });

      print(
          'Response status from getStaticFilesStorageData: ${response.statusCode}');
      if (response.statusCode == 200) {
        List<int> list = response.body.codeUnits;
        Uint8List bytes = Uint8List.fromList(list);
        return bytes;
      } else {
        Get.snackbar(
          'Exception',
          'Bad Request getStaticFilesStorageData: status ${response.statusCode}',
          snackPosition: SnackPosition.TOP,
        );
      }
      log('getStaticFilesStorageData ${response.body}');
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
}
