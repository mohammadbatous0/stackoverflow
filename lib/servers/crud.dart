import 'dart:convert';
import 'package:http/http.dart' as http;

class CrudData {
  static Future<Map> getdatafromapi({required String urlapi}) async {
    Map data = {};
    try {
      http.Response response = await http.get(Uri.parse(urlapi));
      if (response.statusCode == 200) {
        data.addAll(json.decode(response.body) ?? 'لايوجد بيانات للأسف');
      }
    } catch (messageerror) {
      //?  handle error || print(messageerror.toString());
    }
    return data;
  }
}
