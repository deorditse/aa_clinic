// const String urlMainApiConst = 'aaclinic-dev.glavstudio.pro';

const String urlMainApiConst = 'api.aaclinic.online';

Uri urlMain({Map<String, dynamic>? queryParameters, required String urlPath}) =>
    Uri.https(urlMainApiConst, urlPath, queryParameters);

String makeQuery(Map<String, dynamic>? data) {
  var result = [];

  if (data != null) {
    data.forEach(
      (key, value) {
        if (value != null && (value is! String || value.trim().isNotEmpty)) {
          result.add('$key=${value.toString()}');
        }
      },
    );
  }

  return result.join('&');
}
